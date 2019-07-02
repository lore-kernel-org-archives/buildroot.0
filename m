From: Carlo Caione <ccaione@baylibre.com>
Date: Tue,  2 Jul 2019 10:58:39 +0100
Subject: [Buildroot] [PATCH v2] package/jailhouse: new package
Message-ID: <20190702095839.26701-1-ccaione@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jailhouse is a partitioning Hypervisor based on Linux. It is able to run
bare-metal applications or (adapted) operating systems besides Linux.
For this purpose, it configures CPU and device virtualization features
of the hardware platform in a way that none of these domains, called
"cells" here, can interfere with each other in an unacceptable way.

https://github.com/siemens/jailhouse

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changelog:
  v2:
    - Embed the python-jailhouse package into one single jailhouse 
      package.
---
 package/Config.in                |  1 +
 package/jailhouse/Config.in      | 29 +++++++++++++++++++
 package/jailhouse/jailhouse.hash |  2 ++
 package/jailhouse/jailhouse.mk   | 48 ++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 package/jailhouse/Config.in
 create mode 100644 package/jailhouse/jailhouse.hash
 create mode 100644 package/jailhouse/jailhouse.mk

diff --git a/package/Config.in b/package/Config.in
index bc529e0b56..bd68944636 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2198,6 +2198,7 @@ menu "System tools"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
+	source "package/jailhouse/Config.in"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
new file mode 100644
index 0000000000..7029c93b68
--- /dev/null
+++ b/package/jailhouse/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_JAILHOUSE
+	bool "Jailhouse"
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64
+	depends on BR2_LINUX_KERNEL
+	help
+	  The Jailhouse partitioning Hypervisor based on Linux.
+
+	  https://github.com/siemens/jailhouse
+
+comment "Jailhouse needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "Jailhouse only supports X86_64, ARMv8 or ARMv7 with virtualization extensions"
+	depends on !(BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64)
+
+if BR2_PACKAGE_JAILHOUSE
+
+config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
+	bool "Jailhouse helper scripts"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python-based helpers for the Jailhouse Hypervison".
+
+	  https://github.com/siemens/jailhouse
+
+comment "Jailhouse helper scripts require Python"
+	depends on !BR2_PACKAGE_PYTHON
+
+endif
diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
new file mode 100644
index 0000000000..6deb184d58
--- /dev/null
+++ b/package/jailhouse/jailhouse.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 27fb262a3b42ba263f2a5a815127d2a9275f2f81e00e782591babb69d4f0465a  jailhouse-0.10.tar.gz
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
new file mode 100644
index 0000000000..d08eedfc71
--- /dev/null
+++ b/package/jailhouse/jailhouse.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# jailhouse
+#
+################################################################################
+
+JAILHOUSE_VERSION = 0.10
+JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+JAILHOUSE_LICENSE = GPL-2.0
+JAILHOUSE_LICENSE_FILES = COPYING
+JAILHOUSE_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS), host-python-setuptools) \
+	linux
+
+JAILHOUSE_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	ARCH="$(KERNEL_ARCH)" \
+	KDIR="$(LINUX_DIR)" \
+	DESTDIR="$(TARGET_DIR)"
+
+ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
+JAILHOUSE_MAKE_OPTS += PYTHON_PIP_USABLE="yes"
+else
+JAILHOUSE_MAKE_OPTS += PYTHON_PIP_USABLE="no"
+endif
+
+define JAILHOUSE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)
+
+	$(if $(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS), \
+		cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python setup.py build)
+endef
+
+define JAILHOUSE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D) modules_install firmware_install tool_inmates_install
+	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)/tools src=$(@D)/tools install
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/jailhouse
+	$(INSTALL) -D -m 0644 $(@D)/configs/*/*.cell $(TARGET_DIR)/etc/jailhouse
+
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
+	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
+
+	$(if $(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS), \
+		cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python setup.py install --no-compile $(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS))
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
