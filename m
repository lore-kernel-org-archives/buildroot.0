From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 11 Jul 2019 22:38:47 +0200
Subject: [Buildroot] [git commit] package/jailhouse: new package
Message-ID: <20190711204450.96B8E8147C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee4990721c14c624c99295598fde29e395647fb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Jailhouse is a partitioning Hypervisor based on Linux. It is able to run
bare-metal applications or (adapted) operating systems besides Linux.
For this purpose, it configures CPU and device virtualization features
of the hardware platform in a way that none of these domains, called
"cells" here, can interfere with each other in an unacceptable way.

For 32-bit ARM, it uses instructions from the armv7ve ISA. Since we
don't have a Config.in symbol to represent this yet, exclude 32-bit ARM
for now.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
[Arnout:
 - remove arm as supported architecture;
 - add architecture dependency to comment;
 - remove architecture comment;
 - move python dependencies to the condition.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                |  1 +
 package/jailhouse/Config.in      | 27 ++++++++++++++++++++++
 package/jailhouse/jailhouse.hash |  2 ++
 package/jailhouse/jailhouse.mk   | 48 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d501b5a65b..657f28d9d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2199,6 +2199,7 @@ menu "System tools"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
+	source "package/jailhouse/Config.in"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
new file mode 100644
index 0000000000..5b9ecc7b7b
--- /dev/null
+++ b/package/jailhouse/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_JAILHOUSE
+	bool "Jailhouse"
+	depends on BR2_aarch64 || BR2_x86_64
+	depends on BR2_LINUX_KERNEL
+	help
+	  The Jailhouse partitioning Hypervisor based on Linux.
+
+	  https://github.com/siemens/jailhouse
+
+comment "Jailhouse needs a Linux kernel to be built"
+	depends on BR2_aarch64 || BR2_x86_64
+	depends on !BR2_LINUX_KERNEL
+
+if BR2_PACKAGE_JAILHOUSE
+
+config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
+	bool "Jailhouse helper scripts"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python-based helpers for the Jailhouse Hypervisor.
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
index 0000000000..fa74f9e8c4
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
+	linux
+
+JAILHOUSE_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	ARCH="$(KERNEL_ARCH)" \
+	KDIR="$(LINUX_DIR)" \
+	DESTDIR="$(TARGET_DIR)"
+
+ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
+JAILHOUSE_DEPENDENCIES += host-python-setuptools
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
