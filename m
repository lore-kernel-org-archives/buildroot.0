From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:43:01 +0200
Subject: [Buildroot] [PATCHv3 17/18] packages: refactor checks using
	BR_BUILDING
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of manually testing MAKECMDGOALS, use the newly introduced
BR_BUILDING variable to know if we're building or not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk   |  5 +----
 boot/at91bootstrap3/at91bootstrap3.mk |  2 +-
 boot/barebox/barebox.mk               |  5 +----
 boot/uboot/uboot.mk                   | 13 ++++---------
 boot/xloader/xloader.mk               |  6 +-----
 linux/linux.mk                        |  2 +-
 package/sunxi-boards/sunxi-boards.mk  |  4 +---
 7 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 802e85e..f655058 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -40,11 +40,8 @@ endef
 
 $(eval $(generic-package))
 
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
-# we NEED a board name unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP)$(BR_BUILDING),yy)
 ifeq ($(AT91BOOTSTRAP_BOARD),)
 $(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
 endif
 endif
-endif
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 3e3b78e..ff49e14 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -43,7 +43,7 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 $(eval $(kconfig-package))
 
 # Checks to give errors that the user can understand
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR_BUILDING),y)
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
 $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 98cb04e..54f52bb 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -106,11 +106,8 @@ endif
 
 $(eval $(kconfig-package))
 
-ifeq ($(BR2_TARGET_BAREBOX),y)
-# we NEED a board defconfig file unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
 ifeq ($(BAREBOX_SOURCE_CONFIG),)
 $(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
-endif
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1526177..01aaf2c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -164,8 +164,7 @@ define UBOOT_INSTALL_OMAP_IFT_IMAGE
 endef
 
 ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
-# we NEED a config file unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG)),)
 $(error No gpsign config file. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
 endif
@@ -179,8 +178,7 @@ UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
-# we NEED a environment settings unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
 $(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
 endif
@@ -193,9 +191,7 @@ endif
 
 $(eval $(generic-package))
 
-ifeq ($(BR2_TARGET_UBOOT),y)
-# we NEED a board name unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
 ifeq ($(UBOOT_BOARD_NAME),)
 $(error No U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
@@ -221,5 +217,4 @@ $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_C
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
-endif # filter source
-endif # BR2_TARGET_UBOOT
+endif # BR2_TARGET_UBOOT && BR_BUILDING
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index 90d5fa2..a07a190 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -25,12 +25,8 @@ endef
 
 $(eval $(generic-package))
 
-ifeq ($(BR2_TARGET_XLOADER),y)
-# we NEED a board name unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_TARGET_XLOADER)$(BR_BUILDING),y)
 ifeq ($(XLOADER_BOARD_NAME),)
 $(error NO x-loader board name set. Check your BR2_BOOT_XLOADER_BOARDNAME setting)
 endif
 endif
-
-endif
diff --git a/linux/linux.mk b/linux/linux.mk
index deed073..0c348da 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -354,7 +354,7 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
 # Checks to give errors that the user can understand
-ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR_BUILDING),y)
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
 $(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index 1a2bb4c..cacf824 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -16,13 +16,11 @@ define SUNXI_BOARDS_INSTALL_IMAGES_CMDS
 		$(BINARIES_DIR)/script.bin
 endef
 
-ifeq ($(BR2_PACKAGE_SUNXI_BOARDS),y)
+ifeq ($(BR2_PACKAGE_SUNXI_BOARDS)$(BR_BUILDING),yy)
 # we NEED a board name
-ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(SUNXI_BOARDS_FEX_FILE),)
 $(error No sunxi .fex file specified. Check your BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE settings)
 endif
 endif
-endif
 
 $(eval $(generic-package))
-- 
2.1.0
