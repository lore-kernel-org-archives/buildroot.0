From: jean.sorgemoel at laposte.net <jean.sorgemoel@laposte.net>
Date: Sat,  1 Mar 2014 22:00:56 +0100
Subject: [Buildroot] [PATCH v5 2/2] add bootloader option for iso9660
	filesystem image (isolinux)
In-Reply-To: <1393707656-29664-1-git-send-email-jean.sorgemoel@laposte.net>
References: <1393707656-29664-1-git-send-email-jean.sorgemoel@laposte.net>
Message-ID: <1393707656-29664-2-git-send-email-jean.sorgemoel@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerome Sagnole <jean.sorgemoel@laposte.net>


Changelog :

patch v1 : new branch to generate iso with bootloader isolinux

patch v2 : add bootloader option for iso9660 filesystem image (isolinux)
        addon to include comment Arnout Vandecappelle
        simplify code
          1/ I suppress redundant comment
          2/ Suppress menu and use conditional (replace 'depends on' by 'if/end$
          3/ Modify comment
          4/ suppress option (keyboard, ...)
          5/ replace 8 x space by tabulation
                File : fs/isolinux/isolinux.mk
          6/ suppress extension 'BR2_'
          7/ use variable 'ISOLINUX_DIR'
          8/ suppress keyboard option
          9/ I can't use command '$(INSTALL) -D' beacause I don't define filena$
         10/ Hide command genisoimage (with option $@)

patch v3 : add bootloader option for iso9660 filesystem image (isolinux)
        addon to include comment Thomas Petazzoni & Arnout Vandecappelle
        modify comment
        default generate iso with grub bootloader
        you can select isolinux bootloader
        detail : (module fs/iso9660)
          option to select bootloader (grub/isolinux)
          file(s) bootloader configuration
          option to copy file(s) on iso (only for isolinux)
          option to create iso with long filenames (Joliet format)
          option to create iso with POSIX file system (file mode, uid, gid, ...)
          define volume label
          define parameter input charset
          can use initramfs (if activate), also cpio (like initrd)

patch v4 : add bootloader option for iso9660 filesystem image (isolinux)
        addon to include comment Arnout Vandecappelle & Thomas Petazzoni
        add choise to select bootloader in iso9660 menu
        modify comment
        seperate code in two patch
          1st patch : update iso9660 with grub
          2nd patch : add new bootloader isolinux

patch v5 part 1: modify bootloader option for iso9660 filesystem image (grub)
        addon to include comment Arnout Vandecappelle & Martin Bark
        modify option to include files and directories in iso image
          suppress option BR2_TARGET_ROOTFS_ISOLINUX_EXTRA_FILES
          add option BR2_TARGET_ROOTFS_ISO9660_OVERLAY
          modify code to include this new option
        modify comment
        modify signed-off-by (use real name)
        keep default option for BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE
          in old code, it defined by default (keep for compatibility)
        modify default option for BR2_TARGET_ROOTFS_ISO9660_NAME
        modify default option for BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
        modify variable name to add prefix 'ISO9660_'
        "qstrip" each variable
          BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
          BR2_TARGET_ROOTFS_ISO9660_NAME
        modify command INITRD_SED_CMD
        modify kernel launch for this iso
          use LINUX_IMAGE_NAME
          add command sed to replace __LINUX_IMAGE_NAME__ in configuration

patch v5 part 2: add bootloader option for iso9660 filesystem image (isolinux)
        addon to include comment Arnout Vandecappelle & Martin Bark
        modify comment
        suppress bootmsg.txt in isolinux.cfg if is empty (bootloader isolinux)


Signed-off-by: Jerome Sagnole <jean.sorgemoel@laposte.net>
---
 fs/iso9660/Config.in    |   40 ++++++++++++++++++++++++++++++++++++++--
 fs/iso9660/bootmsg.txt  |    4 ++++
 fs/iso9660/iso9660.mk   |   40 +++++++++++++++++++++++++++++++++++-----
 fs/iso9660/isolinux.cfg |   10 ++++++++++
 fs/iso9660/menu.lst     |    2 +-
 5 files changed, 88 insertions(+), 8 deletions(-)
 create mode 100644 fs/iso9660/bootmsg.txt
 create mode 100644 fs/iso9660/isolinux.cfg

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 8020bd8..a055f2d 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -3,12 +3,30 @@ config BR2_TARGET_ROOTFS_ISO9660
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
 	select BR2_TARGET_ROOTFS_CPIO
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
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	bool "isolinux"
+	select BR2_TARGET_SYSLINUX
+	select BR2_TARGET_SYSLINUX_ISOLINUX
+
+endchoice
+
+if BR2_TARGET_ROOTFS_ISO9660_GRUB
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
@@ -17,6 +35,24 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
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
+	  Displays the contents of this file on the screen at boot time
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_CONFIG_FILE
+	string "Configuration file"
+	default "fs/iso9660/isolinux.cfg"
+	help
+	  This file defines all options to start isolinux
+
+endif # BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+
 config BR2_TARGET_ROOTFS_ISO9660_OVERLAY
 	string "iso9660 filesystem overlay directories"
 	default ""
diff --git a/fs/iso9660/bootmsg.txt b/fs/iso9660/bootmsg.txt
new file mode 100644
index 0000000..efc9dfc
--- /dev/null
+++ b/fs/iso9660/bootmsg.txt
@@ -0,0 +1,4 @@
+Buildroot isolinux boot
+  buildroot) Launch linux from the CD-ROM
+  harddrive) Hard Drive (first partition)
+
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index fdba96c..d948ad8 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -8,33 +8,63 @@
 ################################################################################
 
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
-ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
+ISO9660_INITRD_SED_CMD = '/initrd/Id'
 ISO9660_CHARSET = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET))
 ISO9660_NAME = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_NAME))
-ISO9660_KERNEL_DST = $(ISO9660_TARGET_DIR)/kernel
+ISO9660_KERNEL_DST = $(ISO9660_TARGET_DIR)/$(LINUX_IMAGE_NAME)
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
+ISO9660_BOOTLOADER_PACKAGE = grub
 ISO9660_BOOTLOADER_BIN = $(GRUB_DIR)/stage2/stage2_eltorito
 ISO9660_BOOTLOADER_DIR = $(ISO9660_TARGET_DIR)/boot/grub/
+ISO9660_BOOTLOADER_SRC_CFG = $(call qstrip, \
+		$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 ISO9660_BOOTLOADER_DST_CFG = $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 ISO9660_ELTORITO_BOOT = boot/grub/stage2_eltorito
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+ISO9660_BOOTLOADER_PACKAGE = syslinux
+ISO9660_BOOTLOADER_BIN = $(BINARIES_DIR)/isolinux.bin
+ISO9660_BOOTLOADER_DIR = $(ISO9660_TARGET_DIR)
+ISO9660_BOOTLOADER_SRC_CFG = $(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_CONFIG_FILE)
+ISO9660_BOOTLOADER_DST_CFG = $(ISO9660_TARGET_DIR)/isolinux.cfg
+ISO9660_ELTORITO_BOOT = isolinux.bin
+ISO9660_BOOT_MESSAGE = $(call qstrip, \
+		$(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_BOOT_MESSAGE))
+endif
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio $(ISO9660_BOOTLOADER_PACKAGE)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	@mkdir -p $(ISO9660_TARGET_DIR)
 	@mkdir -p $(ISO9660_BOOTLOADER_DIR)
 
 	@cp $(ISO9660_BOOTLOADER_BIN) $(ISO9660_BOOTLOADER_DIR)
-	@cp $(ISO9660_BOOT_MENU) $(ISO9660_BOOTLOADER_DST_CFG)
+	@cp $(ISO9660_BOOTLOADER_SRC_CFG) $(ISO9660_BOOTLOADER_DST_CFG)
 	@cp $(LINUX_IMAGE_PATH) $(ISO9660_KERNEL_DST)
 
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
 	@$(SED) '/^splashimage/d' $(ISO9660_BOOTLOADER_DST_CFG)
 else
 	@cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
 endif # BR2_TARGET_GRUB_SPLASH
+endif # BR2_TARGET_ROOTFS_ISO9660_GRUB
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+ifeq ($(ISO9660_BOOT_MESSAGE),)
+	@$(SED) '/display bootmsg.txt/d' $(ISO9660_BOOTLOADER_DST_CFG)
+else
+	@cp $(ISO9660_BOOT_MESSAGE) \
+		$(ISO9660_TARGET_DIR)
+endif  # ISO9660_BOOT_MESSAGE
+endif  # BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+
+	@$(SED) 's/__LINUX_IMAGE_NAME__/'$(LINUX_IMAGE_NAME)'/g' \
+		$(ISO9660_BOOTLOADER_DST_CFG)
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	@$(SED) '/initrd/d'  $(ISO9660_BOOTLOADER_DST_CFG)
+	@$(SED) $(ISO9660_INITRD_SED_CMD)  $(ISO9660_BOOTLOADER_DST_CFG)
 else
 	@cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
 		$(ISO9660_TARGET_DIR)/initrd
diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
new file mode 100644
index 0000000..947d441
--- /dev/null
+++ b/fs/iso9660/isolinux.cfg
@@ -0,0 +1,10 @@
+display bootmsg.txt
+default buildroot
+timeout 10
+prompt 1
+LABEL buildroot
+  KERNEL __LINUX_IMAGE_NAME__
+  INITRD initrd
+
+LABEL harddrive
+  LOCALBOOT 0x80
diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
index c0bbff6..8cfb5e0 100644
--- a/fs/iso9660/menu.lst
+++ b/fs/iso9660/menu.lst
@@ -12,7 +12,7 @@ foreground 	000000
 background 	cccccc
 
 title		Buildroot ISO9660 image
-kernel		/kernel
+kernel		/__LINUX_IMAGE_NAME__
 initrd		/initrd
 
 title		Hard Drive (first partition)
-- 
1.7.10.4
