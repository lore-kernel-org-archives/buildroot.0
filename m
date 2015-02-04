From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  4 Feb 2015 23:29:40 +0100
Subject: [Buildroot] [PATCH v3 2/3] boot/uboot: Add support for Kbuild &
	Kconfig build system
In-Reply-To: <1423088981-13255-1-git-send-email-joerg.krause@embedded.rocks>
References: <1423088981-13255-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1423088981-13255-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2014.10 U-Boots uses a Kbuild & Kconfig build system. The
formerly used configuration file boards.cfg has been converted to Kconfig
and is not used anymore. Since this version, configuration is done with a
<board>_defconfig file, which is now the entry point of the build.

Using the new Kconfig build system a target can be build using a default
<board>_defconfig file located in the configs directory of the U-Boot source
tree or with a set of custom config files.

The configuration with Kconfig between Linux and U-Boot is different as
U-Boot has to configure multiple boot images per board: Normal, SPL, and TPL.
Therefore, the defconfig file format in U-Boot is extended and has a special
syntax.

From the defconfig file, up to three seperate configuration set are generated
and used for creating .config, spl/.config, and tpl/.config.

Despite of using a Kconfig based configuration, using Buildroots kconfig-
package infrastructure is not possible. The kconfig-package requires that a
defconfig file is a minimal set of a .config file which is not the case for
the U-Boot configuration file as described above.

For providing backward compatibility with older U-Boot version a user choice
between the new Kconfig and the legacy build system is introduced.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
--- 
Changes v2 -> v3: 
  - Add choice between legacy and Kconfig build system (Thomas)
  - Rewrite of commit log
Changes v1 -> v2: 
  - Retain backward compatibility to versions before 2014.10 (Thomas Petazzoni)
  - Rewrite of commit log
---
 boot/uboot/Config.in | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 03e6acc..ad50174 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -4,6 +4,27 @@ config BR2_TARGET_UBOOT
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
+
+choice
+	prompt "Build system"
+	default BR2_TARGET_UBOOT_BUILD_SYSTEM_KBUILD
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
+	bool "legacy"
+	help
+	  Select this option if you use an old U-Boot (older than 2014.10),
+	  so that we use the old build system.
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	bool "kconfig"
+	help
+	  Select this option if you use a recent U-Boot (more recent
+	  than 2014.10), so that we use the Kbuild & Kconfig build system.
+
+endchoice
+
+if BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
+
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "U-Boot board name"
 	help
@@ -11,6 +32,36 @@ config BR2_TARGET_UBOOT_BOARDNAME
 	  This will be suffixed with _config to meet U-Boot standard naming.
 	  See boards.cfg in U-Boot source code for the list of available
 	  configurations.
+endif
+
+if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+choice
+	prompt "Kconfig configuration"
+	default BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_DEFCONFIG
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_DEFCONFIG
+	bool "Using a board defconfig file"
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_CUSTOM_DEFCONFIG
+	bool "Using a custom defconfig file"
+endchoice
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_BOARD_DEFCONFIG
+	string "board defconfig file name"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_DEFCONFIG
+	help
+	  Name of the <board>_defconfig file to use, without the trailing
+	  _defconfig.
+
+	  All supported boards are located in the directory configs in the
+	  U-Boot source tree.
+
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_CUSTOM_DEFCONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_CUSTOM_DEFCONFIG
+	help
+	  Full path to the custom <board>_defconfig file.
+endif
 
 choice
 	prompt "U-Boot Version"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d18ad87..2ea9c86 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -93,8 +93,29 @@ endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_CUSTOM_DEFCONFIG),y)
+UBOOT_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_CUSTOM_DEFCONFIG_FILE))
+define UBOOT_CONFIGURE_BOARD
+	$(INSTALL) -m 0644 $(UBOOT_SOURCE_CONFIG) $(UBOOT_DIR)/configs/buildroot_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) buildroot_defconfig
+	rm $(UBOOT_DIR)/configs/buildroot_defconfig
+endef
+else
+UBOOT_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_BOARD_DEFCONFIG))
+define UBOOT_CONFIGURE_BOARD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_SOURCE_CONFIG)_defconfig
+endef
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_CUSTOM_DEFCONFIG
+else
+UBOOT_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
+define UBOOT_CONFIGURE_BOARD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_SOURCE_CONFIG)_config
+endef
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_BOARD_NAME)_config
+	$(UBOOT_CONFIGURE_BOARD)
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
@@ -166,9 +187,22 @@ $(eval $(generic-package))
 ifeq ($(BR2_TARGET_UBOOT),y)
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
+
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 ifeq ($(UBOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
+else
+ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_BOARD_DEFCONFIG)),)
+$(error No board defconfig file specified, check your BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_BOARD_DEFCONFIG setting)
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_BOARD_DEFCONFIG
+else
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_CUSTOM_DEFCONFIG_FILE)),)
+$(error No custom config file specified, check your BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_CUSTOM_DEFCONFIG_FILE setting)
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_CUSTOM_DEFCONFIG_FILE
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_DEFCONFIG
+endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE)),)
-- 
2.2.2
