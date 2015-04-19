From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 19 Apr 2015 23:06:45 +0200
Subject: [Buildroot] [PATCH v5 1/1] Added linux drivers backports project
Message-ID: <1429477605-9329-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://backports.wiki.kernel.org

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v4->v5:
* Added changes made by Thomas Petazzoni in Sun, 19 Apr 2015 11:03:26 +0200.

Changes v3->v4:
* Define LINUX_BACKPORTS_MAKE_ENV instead of LINUX_BACKPORTS_MAKE_OPTS, remove TARGET_MAKE_ENV from it.
* Add nconfig to LINUX_BACKPORTS_KCONFIG_EDITORS.
* Clean formating of build commands.
---
 package/Config.in                            |  1 +
 package/linux-backports/Config.in            | 40 +++++++++++++++++++++
 package/linux-backports/linux-backports.hash |  2 ++
 package/linux-backports/linux-backports.mk   | 54 ++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 package/linux-backports/Config.in
 create mode 100644 package/linux-backports/linux-backports.hash
 create mode 100644 package/linux-backports/linux-backports.mk

diff --git a/package/Config.in b/package/Config.in
index 319f01a..cdd946c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
new file mode 100644
index 0000000..7853ba6
--- /dev/null
+++ b/package/linux-backports/Config.in
@@ -0,0 +1,40 @@
+comment "linux-backports needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_LINUX_BACKPORTS
+	bool "linux-backports"
+	depends on BR2_LINUX_KERNEL
+	help
+	  The backports package includes many Linux drivers from recent
+	  kernels, backported to older ones.
+
+	  https://backports.wiki.kernel.org
+
+if BR2_PACKAGE_LINUX_BACKPORTS
+
+choice
+	prompt "Linux kernel driver backports configuration"
+	default BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+
+config BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
+	help
+          Name of the backports defconfig file to use. The defconfig is located
+          in defconfigs/ directory in the backports tree.
+
+config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
+	help
+	  Path to the backports configuration file
+
+endif
diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
new file mode 100644
index 0000000..42ea0b3
--- /dev/null
+++ b/package/linux-backports/linux-backports.hash
@@ -0,0 +1,2 @@
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v3.18.1/sha256sums.asc
+sha256 ff3d4d5192c4d57d7415dfcd60e02ea4fa21e0de224ae0ce2b5b9f2e9c815783  backports-3.18.1-1.tar.xz
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
new file mode 100644
index 0000000..73179a6
--- /dev/null
+++ b/package/linux-backports/linux-backports.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# linux-backports
+#
+################################################################################
+
+LINUX_BACKPORTS_VERSION_MAJOR = 3.18.1
+LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
+LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
+LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
+LINUX_BACKPORTS_DEPENDENCIES = linux
+
+LINUX_BACKPORTS_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KLIB_BUILD=$(LINUX_DIR) \
+	KLIB=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
+LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
+else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
+LINUX_BACKPORTS_KCONFIG_FILE = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
+endif
+
+define LINUX_BACKPORTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
+endef
+
+define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
+		-C $(LINUX_DIR) M=$(@D) \
+		INSTALL_MOD_DIR=backports \
+		modules_install
+endef
+
+LINUX_BACKPORTS_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
+
+$(eval $(kconfig-package))
+
+# Checks to give errors that the user can understand
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
+$(error No linux-backports defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
+$(error No linux-backports configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+
+endif
-- 
1.8.0
