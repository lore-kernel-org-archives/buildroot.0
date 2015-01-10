From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:22 +0100
Subject: [Buildroot] [PATCH v2 3/8] boot/uboot: Add support for Kbuild &
	Kconfig build system
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-4-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2014.10 U-Boots uses a Kbuild & Kconfig build system. The
formerly used configuration file boards.cfg has been converted to Kconfig
and is not used anymore. Now, configuration is done with a <board>_defconfig
file, which is the entry point of the build.

Building U-Boot can be done with a default <board>_defconfig file located in
the configs directory of the U-Boot source tree or with a custom defconfig
file.
  
To use the Kbuild & Kconfig build system for custom U-Boot versions this
option has to be enabled by the user.
 
The Kconfig configuration of the package is based on the Linux and Barebox
package infrastructure.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
--- 
Changes v1 -> v2: 
  - Retain backward compatibility to versions before 2014.10 (Thomas Petazzoni)
  - Rewrite of commit log
---
 boot/uboot/Config.in | 38 +++++++++++++++++++++++++++++++++++---
 boot/uboot/uboot.mk  | 27 ++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f3e1778..fe62e34 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -4,13 +4,22 @@ config BR2_TARGET_UBOOT
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
+if !BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "U-Boot board name"
 	help
 	  One of U-Boot supported boards to be built.
-	  This will be suffixed with _config to meet U-Boot standard naming.
-	  See boards.cfg in U-Boot source code for the list of available
-	  configurations.
+
+	  Since U-Boot version 2014.10 the board configuration files are
+	  located in the directory configs in the U-Boot source tree.
+	  For U-Boot versions before version 2014.10 see boards.cfg in U-Boot
+	  source code for the list of available configurations.
+
+	  The board name will be suffixed with _defconfig in case of building
+	  the target with the Kbuild and Kconfig build system (only available
+	  for U-Boot 2014.10 or newer) or with _config in case of building with
+	  the legacy build system (before U-Boot 2014.10).
+endif
 
 choice
 	prompt "U-Boot Version"
@@ -70,6 +79,29 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
+config BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
+	bool "Use Kbuild & Kconfig build system"
+	default y if BR2_TARGET_UBOOT_VERSION = "2014.10"
+	help
+	  Use the Kbuild & Kconfig build system for building the target.
+
+	  The Kbuild & Kconfig build system is introduced in U-Boot version
+	  2014.10. The configuration file boards.cfg used in versions before
+	  2014.10 has been converted to Kconfig and is not used anymore.
+	  Instead, the configuration is done with a <board>_defconfig file,
+	  which is the entry point of the build process.
+
+if BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
+config BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	bool "Use a custom config file"
+
+config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
+	string "Custom config file path"
+	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	help
+	  Path to the custom <board>_defconfig file.
+endif
+
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d18ad87..aa2936f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -93,8 +93,26 @@ endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
-define UBOOT_CONFIGURE_CMDS
+ifeq ($(BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG),y)
+ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+define UBOOT_CONFIGURE_BOARD
+	$(INSTALL) -m 0644 $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE) $(UBOOT_DIR)/configs/buildroot_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) buildroot_defconfig
+	rm $(UBOOT_DIR)/configs/buildroot_defconfig
+endef
+else
+define UBOOT_CONFIGURE_BOARD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_BOARD_NAME)_defconfig
+endef
+endif # BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+else
+define UBOOT_CONFIGURE_BOARD
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_BOARD_NAME)_config
+endef
+endif # BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
+
+define UBOOT_CONFIGURE_CMDS
+	$(UBOOT_CONFIGURE_BOARD)
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
@@ -166,9 +184,16 @@ $(eval $(generic-package))
 ifeq ($(BR2_TARGET_UBOOT),y)
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
+
+ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),)
 ifeq ($(UBOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
+else
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)),)
+$(error No board configuration file specified, check your BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE setting)
+endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE)),)
-- 
2.2.1
