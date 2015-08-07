From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  7 Aug 2015 15:29:01 +0200
Subject: [Buildroot] [PATCHv3 2/4] package/openpowerlink-kernel-drivers: new
	package
In-Reply-To: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
References: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438954143-23533-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: Rename to openpowerlink-kernel-drivers
    Fix typos in Config.in
    Provide a hash file via a symlink to
    openpowerlink.hash
    Fix driver build issue due to mussing ARCH and
    CROSS_COMPILE options
    fix typo for i210 dirver (s/I210/i210)
    Don't use $(OPENPOWERLINK_*) since they will not
    be set in openpowerlink-kernel-drivers.mk
    move openpowerlink-kernel-drivers to package
    directory.
---
 package/Config.in                                  |  1 +
 package/openpowerlink-kernel-drivers/Config.in     | 33 +++++++++++++
 .../openpowerlink-kernel-drivers.hash              |  1 +
 .../openpowerlink-kernel-drivers.mk                | 54 ++++++++++++++++++++++
 package/openpowerlink/Config.in                    |  1 +
 5 files changed, 90 insertions(+)
 create mode 100644 package/openpowerlink-kernel-drivers/Config.in
 create mode 120000 package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.hash
 create mode 100644 package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..47f7da1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ endif
 	source "package/openipmi/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
+	source "package/openpowerlink-kernel-drivers/Config.in"
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
diff --git a/package/openpowerlink-kernel-drivers/Config.in b/package/openpowerlink-kernel-drivers/Config.in
new file mode 100644
index 0000000..bc1e408
--- /dev/null
+++ b/package/openpowerlink-kernel-drivers/Config.in
@@ -0,0 +1,33 @@
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS
+	bool "openpowerlink kernel drivers"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
+	help
+	  The openPOWERLINK stack is implemented as Linux kernel module.
+	  This solution provides the best performance, but is limited to
+	  the available openPOWERLINK network drivers.
+
+if BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS
+
+choice
+	prompt "select Ethernet Powerlink Driver"
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_82573
+	bool "Intel 82573"
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_8255x
+	bool "Intel 8255x"
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_I210
+	bool "Intel I210"
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8111
+	bool "Realtek RTL-8111/8168"
+
+config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8139
+	bool "Realtek RTL-8139"
+
+endchoice
+
+endif # BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS
diff --git a/package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.hash b/package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.hash
new file mode 120000
index 0000000..cbbc194
--- /dev/null
+++ b/package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.hash
@@ -0,0 +1 @@
+../openpowerlink/openpowerlink.hash
\ No newline at end of file
diff --git a/package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.mk b/package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.mk
new file mode 100644
index 0000000..3f1f420
--- /dev/null
+++ b/package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# openpowerlink-kernel-drivers
+#
+################################################################################
+
+OPENPOWERLINK_KERNEL_DRIVERS_VERSION = V2.2.0
+OPENPOWERLINK_KERNEL_DRIVERS_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_KERNEL_DRIVERS_VERSION)
+OPENPOWERLINK_KERNEL_DRIVERS_SOURCE = openPOWERLINK-$(OPENPOWERLINK_KERNEL_DRIVERS_VERSION).tar.gz
+OPENPOWERLINK_KERNEL_DRIVERS_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK_KERNEL_DRIVERS_LICENSE_FILES = license.md
+
+OPENPOWERLINK_KERNEL_DRIVERS_DEPENDENCIES = linux openpowerlink
+
+define OPENPOWERLINK_KERNEL_DRIVERS_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+define OPENPOWERLINK_KERNEL_DRIVERS_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/openpowerlink \*.patch
+endef
+
+OPENPOWERLINK_KERNEL_DRIVERS_POST_PATCH_HOOKS += \
+	OPENPOWERLINK_KERNEL_DRIVERS_APPLY_PATCHES
+
+OPENPOWERLINK_KERNEL_DRIVERS_SUBDIR = drivers/linux/drv_kernelmod_edrv
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))"
+endif
+
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS += \
+	-DCFG_KERNEL_DIR="$(LINUX_DIR)" \
+	-DCMAKE_SYSTEM_VERSION="$(LINUX_VERSION)" \
+	-DCFG_OPLK_MN="$(OPENPOWERLINK_MN_ONOFF)" \
+	-DMAKE_KERNEL_ARCH="$(KERNEL_ARCH)" \
+	-DMAKE_KERNEL_CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_82573),y)
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_8255x),y)
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_I210),y)
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=i210
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8139),y)
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS_RTL8111),y)
+OPENPOWERLINK_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8111
+endif
+
+$(eval $(cmake-package))
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 713fb83..93e66d2 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -60,6 +60,7 @@ config BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 config BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 	bool "build EPL stack as linux kernelspace module."
 	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
+	select BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVERS
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux kernel space driver. This will also build
-- 
2.4.3
