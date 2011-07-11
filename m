From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:53:48 +0200
Subject: [Buildroot] [PATCH 04/12] u-boot: rename to uboot
In-Reply-To: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d0394385552afc9fcde531db2f67d534c3fdb114.1310392269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow to match the currently Config.in option
BR2_TARGET_UBOOT, in order to make it easy to integrate U-Boot into
the package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in                                     |    2 +-
 boot/{u-boot => uboot}/Config.in                   |    0
 .../uboot-2010.03-fix-avr32.patch}                 |    0
 boot/{u-boot/u-boot.mk => uboot/uboot.mk}          |   78 ++++++++++----------
 4 files changed, 40 insertions(+), 40 deletions(-)
 rename boot/{u-boot => uboot}/Config.in (100%)
 rename boot/{u-boot/u-boot-2010.03-fix-avr32.patch => uboot/uboot-2010.03-fix-avr32.patch} (100%)
 rename boot/{u-boot/u-boot.mk => uboot/uboot.mk} (62%)

diff --git a/boot/Config.in b/boot/Config.in
index 67ab8ac..67adae8 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -3,7 +3,7 @@ menu "Bootloaders"
 source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
 source "boot/syslinux/Config.in"
-source "boot/u-boot/Config.in"
+source "boot/uboot/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91dataflashboot/Config.in"
 
diff --git a/boot/u-boot/Config.in b/boot/uboot/Config.in
similarity index 100%
rename from boot/u-boot/Config.in
rename to boot/uboot/Config.in
diff --git a/boot/u-boot/u-boot-2010.03-fix-avr32.patch b/boot/uboot/uboot-2010.03-fix-avr32.patch
similarity index 100%
rename from boot/u-boot/u-boot-2010.03-fix-avr32.patch
rename to boot/uboot/uboot-2010.03-fix-avr32.patch
diff --git a/boot/u-boot/u-boot.mk b/boot/uboot/uboot.mk
similarity index 62%
rename from boot/u-boot/u-boot.mk
rename to boot/uboot/uboot.mk
index 215b1c7..3e945c7 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/uboot/uboot.mk
@@ -3,42 +3,42 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
-U_BOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
+UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
+UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
-U_BOOT_INSTALL_IMAGES = YES
+UBOOT_INSTALL_IMAGES = YES
 
-ifeq ($(U_BOOT_VERSION),custom)
+ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
-U_BOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
-U_BOOT_SITE    = $(dir $(U_BOOT_TARBALL))
-U_BOOT_SOURCE  = $(notdir $(U_BOOT_TARBALL))
+UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
+UBOOT_SITE    = $(dir $(UBOOT_TARBALL))
+UBOOT_SOURCE  = $(notdir $(UBOOT_TARBALL))
 else
 # Handle stable official U-Boot versions
-U_BOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
-U_BOOT_SOURCE  = u-boot-$(U_BOOT_VERSION).tar.bz2
+UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
+UBOOT_SOURCE  = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
-U_BOOT_BIN          = u-boot.kwb
-U_BOOT_MAKE_TARGET  = $(U_BOOT_BIN)
+UBOOT_BIN          = u-boot.kwb
+UBOOT_MAKE_TARGET  = $(U_BOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
-U_BOOT_BIN          = u-boot.ldr
+UBOOT_BIN          = u-boot.ldr
 else
-U_BOOT_BIN          = u-boot.bin
+UBOOT_BIN          = u-boot.bin
 endif
 
-U_BOOT_ARCH=$(KERNEL_ARCH)
+UBOOT_ARCH=$(KERNEL_ARCH)
 
 # u-boot in the past used arch=ppc for powerpc
-ifneq ($(findstring x2010.03,x$(U_BOOT_VERSION)),)
-U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
+ifneq ($(findstring x2010.03,x$(UBOOT_VERSION)),)
+UBOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 endif
 
-U_BOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
-U_BOOT_MAKE_OPTS += \
+UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
+UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	ARCH=$(U_BOOT_ARCH)
+	ARCH=$(UBOOT_ARCH)
 
 # Helper function to fill the U-Boot config.h file.
 # Argument 1: option name
@@ -53,18 +53,18 @@ $(if $(call qstrip,$(2)),
 endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
-define U_BOOT_APPLY_CUSTOM_PATCHES
+define UBOOT_APPLY_CUSTOM_PATCHES
 	toolchain/patch-kernel.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
-		u-boot-$(U_BOOT_VERSION)-\*.patch
+		uboot-$(UBOOT_VERSION)-\*.patch
 endef
 
-U_BOOT_POST_PATCH_HOOKS += U_BOOT_APPLY_CUSTOM_PATCHES
+UBOOT_POST_PATCH_HOOKS += U_BOOT_APPLY_CUSTOM_PATCHES
 endif
 
-define U_BOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(U_BOOT_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(U_BOOT_MAKE_OPTS)		\
-		$(U_BOOT_BOARD_NAME)_config
+define UBOOT_CONFIGURE_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
+		$(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
@@ -81,35 +81,35 @@ define U_BOOT_CONFIGURE_CMDS
 endef
 
 ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
-define U_BOOT_BUILD_TARGET_ENV_UTILS
+define UBOOT_BUILD_TARGET_ENV_UTILS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) HOSTCC="$(TARGET_CC)" -C $(@D) env
 endef
 endif
 
-define U_BOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(U_BOOT_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(U_BOOT_MAKE_OPTS) 		\
-		$(U_BOOT_MAKE_TARGET)
-	$(U_BOOT_BUILD_TARGET_ENV_UTILS)
+define UBOOT_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
+		$(UBOOT_MAKE_TARGET)
+	$(UBOOT_BUILD_TARGET_ENV_UTILS)
 endef
 
-define U_BOOT_INSTALL_IMAGES_CMDS
-	cp -dpf $(@D)/$(U_BOOT_BIN) $(BINARIES_DIR)/
+define UBOOT_INSTALL_IMAGES_CMDS
+	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 endef
 
 ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
-define U_BOOT_INSTALL_TARGET_ENV_UTILS
+define UBOOT_INSTALL_TARGET_ENV_UTILS
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv \
 		$(TARGET_DIR)/usr/sbin/fw_printenv
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 endef
 endif
 
-define U_BOOT_INSTALL_TARGET_CMDS
-	$(U_BOOT_INSTALL_TARGET_ENV_UTILS)
+define UBOOT_INSTALL_TARGET_CMDS
+	$(UBOOT_INSTALL_TARGET_ENV_UTILS)
 endef
 
-$(eval $(call GENTARGETS,boot,u-boot))
+$(eval $(call GENTARGETS,boot,uboot))
 
 #############################################################
 #
@@ -121,7 +121,7 @@ TARGETS+=u-boot
 
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-ifeq ($(U_BOOT_BOARD_NAME),)
+ifeq ($(UBOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
 endif
-- 
1.7.4.1
