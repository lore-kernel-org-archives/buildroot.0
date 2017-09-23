From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 20:23:12 +0200
Subject: [Buildroot] [git commit] fs/iso9660: remove support for grub
Message-ID: <20170923184645.0E70B8104E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54a76f08fc2101e97dd66529afccef6b2c7a71ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub will be removed soon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/iso9660/Config.in  | 16 ++++------------
 fs/iso9660/iso9660.mk | 32 +-------------------------------
 fs/iso9660/menu.lst   | 20 --------------------
 3 files changed, 5 insertions(+), 63 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index d162586..842c987 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,8 +2,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_TARGET_GRUB || \
-		BR2_TARGET_GRUB2_I386_PC || \
+	depends on BR2_TARGET_GRUB2_I386_PC || \
 		BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
@@ -26,11 +25,6 @@ if BR2_TARGET_ROOTFS_ISO9660
 choice
 	prompt "Bootloader"
 
-config BR2_TARGET_ROOTFS_ISO9660_GRUB
-	bool "grub"
-	depends on BR2_TARGET_GRUB
-	select BR2_TARGET_GRUB_FS_ISO9660
-
 config BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	bool "grub2"
 	depends on BR2_TARGET_GRUB2_I386_PC
@@ -48,13 +42,11 @@ endchoice
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu config file"
-	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
 	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	help
 	  Use this option to provide a custom bootloader configuration
-	  file (menu.lst for Grub, grub.cfg for Grub 2, isolinux.cfg for
-	  isolinux).
+	  file (grub.cfg for Grub 2, isolinux.cfg for isolinux).
 
 	  Note that the strings __KERNEL_PATH__ and __INITRD_PATH__
 	  will automatically be replaced by the path to the kernel and
@@ -82,7 +74,7 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 
 endif
 
-comment "iso image needs a Linux kernel and one of grub, grub2 i386-pc or isolinux to be built"
+comment "iso image needs a Linux kernel and either grub2 i386-pc or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL || \
-		!(BR2_TARGET_GRUB || BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_SYSLINUX_ISOLINUX)
+		!(BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_SYSLINUX_ISOLINUX)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 478cb02..d49d593 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -45,16 +45,7 @@ else
 ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
 endif
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
-ROOTFS_ISO9660_DEPENDENCIES += grub
-ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
-	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
-ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/stage2_eltorito
-define ROOTFS_ISO9660_INSTALL_BOOTLOADER
-	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
-endef
-else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
 ROOTFS_ISO9660_DEPENDENCIES += grub2
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
 	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub.cfg
@@ -86,33 +77,12 @@ endef
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 
-# Grub splash screen disabling
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
-ifeq ($(BR2_TARGET_GRUB_SPLASH),)
-define ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
-	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
-endef
-ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
-endif
-endif
-
 define ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
 
-# Copy Grub splashscreen to temporary filesystem
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
-ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
-define ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
-	$(INSTALL) -D -m 0644 $(TARGET_DIR)/boot/grub/splash.xpm.gz \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/splash.xpm.gz
-endef
-ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
-endif
-endif
-
 # Copy the kernel to temporary filesystem
 define ROOTFS_ISO9660_COPY_KERNEL
 	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) \
diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
deleted file mode 100644
index eb1ecef..0000000
--- a/fs/iso9660/menu.lst
+++ /dev/null
@@ -1,20 +0,0 @@
-default		0
-timeout		10
-
-# Used when no splashimage is used
-color 		cyan/blue white/blue
-
-# Gets enabled/disabled depending on Grub support for splashimage
-splashimage	/boot/grub/splash.xpm.gz
-
-# Used when a splashimage is enabled
-foreground 	000000
-background 	cccccc
-
-title		Buildroot ISO9660 image
-kernel		__KERNEL_PATH__ root=/dev/sr0
-initrd		__INITRD_PATH__
-
-title		Hard Drive (first partition)
-rootnoverify	(hd0)
-chainloader	+1
