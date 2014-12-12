From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:15:59 +0100
Subject: [Buildroot] [PATCH 02/14] boot/uboot: Add support for Kconfig build
	system
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2014.10 U-Boots uses a Kconfig build system. The boards.cfg
has been converted to Kconfig and is not used anymore. Configuration by
Kconfig is done with a <board>_defconfig file now, which is now the entry
point of the build. Building U-Boot can be done with a default board
defconfig file located in the configs directory of the U-Boot source tree
or with a custom defconfig file.

The Kconfig configuration of the package is based on the Linux and Barebox
package infrastructure.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/Config.in | 32 +++++++++++++++++++++++++-------
 boot/uboot/uboot.mk  | 25 +++++++++++++++++++++----
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f7c4374..8a5bebc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -4,13 +4,6 @@ config BR2_TARGET_UBOOT
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
-config BR2_TARGET_UBOOT_BOARDNAME
-	string "U-Boot board name"
-	help
-	  One of U-Boot supported boards to be built.
-	  This will be suffixed with _config to meet U-Boot standard naming.
-	  See boards.cfg in U-Boot source code for the list of available
-	  configurations.
 
 choice
 	prompt "U-Boot Version"
@@ -80,6 +73,31 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	  Most users may leave this empty
 
 choice
+	prompt "U-Boot configuration"
+	default BR2_TARGET_UBOOT_USE_DEFCONFIG
+
+config BR2_TARGET_UBOOT_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+endchoice
+
+config BR2_TARGET_UBOOT_BOARD_DEFCONFIG
+	string "Board defconfig"
+	depends on BR2_TARGET_UBOOT_USE_DEFCONFIG
+	help
+	  Name of the board defconfig file to use, without the trailing
+	  _defconfig. The defconfig file is located in the directory
+	  configs in the U-Boot source tree.
+
+config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
+	string "Custom defconfig file path"
+	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	help
+	  Path to the custom board defconfig file.
+
+choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1f8818c..17565e4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -94,10 +94,18 @@ endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
+UBOOT_SOURCE_CONFIG = $(UBOOT_DIR)/configs/$(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+UBOOT_SOURCE_CONFIG = $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)
+endif
+
 define UBOOT_CONFIGURE_CMDS
+	$(INSTALL) -m 0644 $(UBOOT_SOURCE_CONFIG) $(UBOOT_DIR)/configs/buildroot_defconfig
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
-		$(UBOOT_BOARD_NAME)_config
+		buildroot_config
+	rm $(UBOOT_DIR)/configs/buildroot_defconfig
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
@@ -169,10 +177,19 @@ endif
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
-# we NEED a board name unless we're at make source
+# Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-ifeq ($(UBOOT_BOARD_NAME),)
-$(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
+
+ifeq ($(BR2_TARGET_UBOOT_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG)),)
+$(error No board defconfig name specified, check your BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)),)
+$(error No kernel configuration file specified, check your BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE setting)
+endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
-- 
2.1.3
