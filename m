From: jean.sorgemoel at laposte.net <jean.sorgemoel@laposte.net>
Date: Wed,  5 Feb 2014 00:49:20 +0100
Subject: [Buildroot] [PATCH v4 2/2] add bootloader option for iso9660
	filesystem image (isolinux)
In-Reply-To: <1391557760-22893-1-git-send-email-jean.sorgemoel@laposte.net>
References: <1391557760-22893-1-git-send-email-jean.sorgemoel@laposte.net>
Message-ID: <1391557760-22893-2-git-send-email-jean.sorgemoel@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: jean <jean.sorgemoel@laposte.net>

default generate iso with grub bootloader
you can select isolinux bootloader

detail : (module fs/iso9660)
  option to select bootloader (grub/isolinux)
  can use initramfs (if activate), also cpio (like initrd)

Signed-off-by: jean <jean.sorgemoel@laposte.net>
---
 fs/iso9660/Config.in    |   47 ++++++++++++++++++++++++++++++++++++++++++++---
 fs/iso9660/bootmsg.txt  |    4 ++++
 fs/iso9660/iso9660.mk   |   26 ++++++++++++++++++++++++--
 fs/iso9660/isolinux.cfg |   10 ++++++++++
 4 files changed, 82 insertions(+), 5 deletions(-)
 create mode 100644 fs/iso9660/bootmsg.txt
 create mode 100644 fs/iso9660/isolinux.cfg

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 9faa93f..f2b9d2f 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -1,14 +1,37 @@
 config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
+	select BR2_TARGET_ROOTFS_CPIO
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	select BR2_TARGET_ROOTFS_CPIO
-	select BR2_TARGET_GRUB
-	select BR2_TARGET_GRUB_FS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
 if BR2_TARGET_ROOTFS_ISO9660
+choice
+	prompt "Bootloader"
+	default BR2_TARGET_ROOTFS_ISO9660_GRUB
+	help
+	  Select the bootloader that should be used for the bootable
+	  ISO9660 image.
+
+config BR2_TARGET_ROOTFS_ISO9660_GRUB
+	bool "grub"
+	select BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_ISO9660
+	help
+	  Use the Grub bootloader for the bootable ISO9660 image.
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	bool "isolinux"
+	select BR2_TARGET_SYSLINUX
+	select BR2_TARGET_SYSLINUX_ISOLINUX
+	help
+	  Use the Isolinux bootloader from the syslinux project as the
+	  ISO9660 bootable image bootloader.
+
+endchoice
+
+if BR2_TARGET_ROOTFS_ISO9660_GRUB
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
@@ -17,6 +40,24 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	  Grub configuration
 	  Define menu, commands and options for grub
 
+endif # BR2_TARGET_ROOTFS_ISO9660_GRUB
+
+if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_BOOT_MESSAGE
+	string "Boot message"
+	default "fs/iso9660/bootmsg.txt"
+	help
+	  Displays this filename on the screen at boot time
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_CONFIG_FILE
+	string "Configuration file"
+	default "fs/iso9660/isolinux.cfg"
+	help
+	  This file define all options to start isolinux
+
+endif # BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+
 config BR2_TARGET_ROOTFS_ISO9660_EXTRA_FILES
 	string "Extra files copy on image"
 	default ""
diff --git a/fs/iso9660/bootmsg.txt b/fs/iso9660/bootmsg.txt
new file mode 100644
index 0000000..e67951b
--- /dev/null
+++ b/fs/iso9660/bootmsg.txt
@@ -0,0 +1,4 @@
+Buildroot isolinux boot
+  buildroot) launch linux
+  harddrive) Hard Drive (first partition)
+
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 2f20f5b..66fd1ee 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -12,14 +12,29 @@ ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 ISO9660_TARGET_DIR_EXTRA = $(ISO9660_TARGET_DIR)/extra
 ISO9660_LIST_EXTRA = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_EXTRA_FILES))
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
+BOOTLOADER_PACKAGE = grub
 BOOTLOADER_BIN = $(GRUB_DIR)/stage2/stage2_eltorito
 BOOTLOADER_DIR = $(ISO9660_TARGET_DIR)/boot/grub/
 BOOTLOADER_SRC_CFG = $(ISO9660_BOOT_MENU)
 BOOTLOADER_DST_CFG = $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 KERNEL_DST = $(ISO9660_TARGET_DIR)/kernel
 ELTORITO_BOOT = boot/grub/stage2_eltorito
+INITRD_SED_CMD = '/initrd/d'
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+BOOTLOADER_PACKAGE = syslinux
+BOOTLOADER_BIN = $(BINARIES_DIR)/isolinux.bin
+BOOTLOADER_DIR = $(ISO9660_TARGET_DIR)
+BOOTLOADER_SRC_CFG = $(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_CONFIG_FILE)
+BOOTLOADER_DST_CFG = $(ISO9660_TARGET_DIR)/isolinux.cfg
+KERNEL_DST = $(ISO9660_TARGET_DIR)/bzImage
+ELTORITO_BOOT = isolinux.bin
+INITRD_SED_CMD = '/INITRD/d'
+endif
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio $(BOOTLOADER_PACKAGE)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	@mkdir -p $(ISO9660_TARGET_DIR)
 	@mkdir -p $(BOOTLOADER_DIR)
@@ -29,14 +44,21 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	@cp $(BOOTLOADER_SRC_CFG) $(BOOTLOADER_DST_CFG)
 	@cp $(LINUX_IMAGE_PATH) $(KERNEL_DST)
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
 	@$(SED) '/^splashimage/d' $(BOOTLOADER_DST_CFG)
 else
 	@cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
 endif # BR2_TARGET_GRUB_SPLASH
+endif # BR2_TARGET_ROOTFS_ISO9660_GRUB
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+	@cp $(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_BOOT_MESSAGE) \
+		$(ISO9660_TARGET_DIR)
+endif
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	@$(SED) '/initrd/d'  $(BOOTLOADER_DST_CFG)
+	@$(SED) $(INITRD_SED_CMD)  $(BOOTLOADER_DST_CFG)
 else
 	@cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
 		$(ISO9660_TARGET_DIR)/initrd
diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
new file mode 100644
index 0000000..f4887e4
--- /dev/null
+++ b/fs/iso9660/isolinux.cfg
@@ -0,0 +1,10 @@
+display bootmsg.txt
+default buildroot
+timeout 20
+prompt 1
+LABEL buildroot
+  KERNEL bzImage
+  INITRD initrd
+
+LABEL harddrive
+  LOCALBOOT 0x80
-- 
1.7.10.4
