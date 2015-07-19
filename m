From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 14:36:30 +0200
Subject: [Buildroot] [git commit] boot/uboot: add support for the kconfig
	infrastructure
Message-ID: <20150719123723.A067D81E3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e0f7ebef9e9f4ac4fcc47ed1bf4240ad39109ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the patchset "kconfig: turnaround into single .config"
[http://lists.denx.de/pipermail/u-boot/2015-February/205490.html]
U-Boot switched to a single .config file for board configuration. This
allows us to use the kconfig-package infrastructure.

For providing backward compatibility with older U-Boot version a user
choice between the new Kconfig and the legacy build system is
introduced.

[Thomas:
  - make use of the legacy build system the default, to not break
    existing configurations.
  - add some comments in the code checking all the configuration
    options, in order to hopefully make it a bit clearer.]

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |   50 +++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 94 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 6d8fa6a..d28d93d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -4,6 +4,25 @@ config BR2_TARGET_UBOOT
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
+choice
+	prompt "Build system"
+	default BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
+	bool "Legacy"
+	help
+	  Select this option if you use an old U-Boot (older than 2015.04),
+	  so that we use the old build system.
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	bool "Kconfig"
+	help
+	  Select this option if you use a recent U-Boot version (2015.04 or
+	  newer), so that we use the Kconfig build system.
+
+endchoice
+
+if BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "U-Boot board name"
 	help
@@ -11,6 +30,7 @@ config BR2_TARGET_UBOOT_BOARDNAME
 	  This will be suffixed with _config to meet U-Boot standard naming.
 	  See boards.cfg in U-Boot source code for the list of available
 	  configurations.
+endif
 
 choice
 	prompt "U-Boot Version"
@@ -92,6 +112,33 @@ config BR2_TARGET_UBOOT_PATCH
 
 	  Most users may leave this empty
 
+if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+choice
+	prompt "U-Boot configuration"
+	default BR2_TARGET_UBOOT_USE_DEFCONFIG
+
+config BR2_TARGET_UBOOT_USE_DEFCONFIG
+	bool "Using an in-tree board defconfig file"
+
+config BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	bool "Using a custom board (def)config file"
+
+endchoice
+
+config BR2_TARGET_UBOOT_BOARD_DEFCONFIG
+	string "Board defconfig"
+	depends on BR2_TARGET_UBOOT_USE_DEFCONFIG
+	help
+	  Name of the board for which U-Boot should be built, without
+	  the _defconfig suffix.
+
+config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	help
+	  Path to the U-Boot configuration file.
+endif
+
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 042e066..8f321ac 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -127,11 +127,24 @@ define UBOOT_APPLY_LOCAL_PATCHES
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		$(UBOOT_BOARD_NAME)_config
 endef
+else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
+ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
+UBOOT_SOURCE_CONFIG = $(UBOOT_DIR)/configs/$(call qstrip,\
+	$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+UBOOT_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
+endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
+
+UBOOT_KCONFIG_FILE = $(UBOOT_SOURCE_CONFIG)
+UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS)
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 define UBOOT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
@@ -204,25 +217,50 @@ endif
 UBOOT_DEPENDENCIES += host-uboot-tools
 endif
 
-$(eval $(generic-package))
-
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
+
+#
+# Check U-Boot board name (for legacy) or the defconfig/custom config
+# file options (for kconfig)
+#
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 ifeq ($(UBOOT_BOARD_NAME),)
 $(error No U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
-endif
+endif # UBOOT_BOARD_NAME
+else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
+ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG)),)
+$(error No board defconfig name specified, check your BR2_TARGET_UBOOT_DEFCONFIG setting)
+endif # qstrip BR2_TARGET_UBOOT_BOARD_DEFCONFIG
+endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
+ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)),)
+$(error No board configuration file specified, check your BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE setting)
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
+endif # BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
+#
+# Check custom version option
+#
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE)),)
 $(error No custom U-Boot version specified. Check your BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE setting)
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
 endif # BR2_TARGET_UBOOT_CUSTOM_VERSION
 
+#
+# Check custom tarball option
+#
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION)),)
 $(error No custom U-Boot tarball specified. Check your BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION setting)
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 endif # BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
+#
+# Check Git/Mercurial repo options
+#
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT)$(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
 $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
@@ -233,3 +271,9 @@ endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 endif # BR2_TARGET_UBOOT && BR_BUILDING
+
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
+$(eval $(generic-package))
+else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
+$(eval $(kconfig-package))
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
