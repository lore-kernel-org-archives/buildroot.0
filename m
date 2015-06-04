From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jun 2015 17:05:27 +0200
Subject: [Buildroot] [PATCH 09/12] fs/iso9660: add support for isolinux
In-Reply-To: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433430330-2166-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the ISO9660 image generation logic was only supporting the
Grub bootloader. This commit adds support to use isolinux (from
syslinux) instead of grub, as an option.

From a Config.in point of view, we switch from having
BR2_TARGET_ROOTFS_ISO9660 select BR2_TARGET_GRUB to using a 'depends
on'. This is because for isolinux, we would need to select
BR2_TARGET_SYSLINUX_ISOLINUX, but BR2_TARGET_SYSLINUX_ISOLINUX is part
of a Kconfig 'choice', so we can't do a select. So instead, the
BR2_TARGET_ROOTFS_ISO9660 now depends on either BR2_TARGET_GRUB or
BR2_TARGET_SYSLINUX_ISOLINUX being available.

The .mk file is re-organized a bit to be a bit more generic:

 - a variable called ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH is
   introduced to reflect the path to the bootloader configuration file
   (which is later modified to replace __KERNEL_PATH__ and
   __INITRD_PATH__ to the appropriate values)

 - a variable called ROOTFS_ISO9660_BOOT_IMAGE is introduced to give
   the path to the bootloader-specific boot image, as needed by
   genisoimage -b option.

 - a variable called ROOTFS_ISO9660_INSTALL_BOOTLOADER is introduced
   with the commands needed to do the bootloader-specific installation
   steps

This patch is based on previous patches submitted by Jerome Sagnole
<jean.sorgemoel@laposte.net> and No? Rubinstein
<nrubinstein@aldebaran.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in    | 35 ++++++++++++++++++++++++++---------
 fs/iso9660/iso9660.mk   | 43 ++++++++++++++++++++++++++++++++++---------
 fs/iso9660/isolinux.cfg |  6 ++++++
 3 files changed, 66 insertions(+), 18 deletions(-)
 create mode 100644 fs/iso9660/isolinux.cfg

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index e300fdb..e7bf3c3 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,10 +2,9 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
+	depends on BR2_TARGET_GRUB || BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
-	select BR2_TARGET_GRUB
-	select BR2_TARGET_GRUB_FS_ISO9660
 	help
 	  Build a bootable ISO9660 image. By default, the root
 	  filesystem is directly packed as the ISO9660 filesystem,
@@ -22,13 +21,30 @@ config BR2_TARGET_ROOTFS_ISO9660
 
 if BR2_TARGET_ROOTFS_ISO9660
 
+choice
+	prompt "Bootloader"
+
+config BR2_TARGET_ROOTFS_ISO9660_GRUB
+	bool "grub"
+	depends on BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_ISO9660
+
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	bool "isolinux"
+	depends on BR2_TARGET_SYSLINUX_ISOLINUX
+
+endchoice
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
-	string "Boot menu.lst file"
-	default "fs/iso9660/menu.lst"
+	string "Bootloader configuration file"
+	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
+	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	help
-	  Use this option to provide a custom Grub menu.lst file. Note
-	  that the strings __KERNEL_PATH__ and __INITRD_PATH__ will
-	  automatically be replaced by the path to the kernel and
+	  Use this option to provide a custom bootloader configuration
+	  file (menu.lst for Grub, isolinux.cfg for Isolinux).
+
+	  Note that the strings __KERNEL_PATH__ and __INITRD_PATH__
+	  will automatically be replaced by the path to the kernel and
 	  initrd images respectively.
 
 config BR2_TARGET_ROOTFS_ISO9660_INITRD
@@ -44,6 +60,7 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
 
 endif
 
-comment "iso image needs a Linux kernel to be built"
+comment "iso image needs a Linux kernel and grub or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_LINUX_KERNEL
+	depends on !BR2_LINUX_KERNEL || \
+		!(BR2_TARGET_GRUB || BR2_TARGET_SYSLINUX_ISOLINUX)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index a3572e2..c95485c 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -40,32 +40,56 @@ else
 ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
 endif
 
-define ROOTFS_ISO9660_PREPARATION
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
+ROOTFS_ISO9660_DEPENDENCIES += grub
+ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
+	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/stage2_eltorito
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
+endef
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+ROOTFS_ISO9660_DEPENDENCIES += syslinux
+ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
+	$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
+ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+	$(INSTALL) -D -m 0644 $(SYSLINUX_DIR)/bios/core/isolinux.bin \
+		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.bin
+	$(INSTALL) -D -m 0644 $(SYSLINUX_DIR)/bios/com32/elflink/ldlinux/ldlinux.c32 \
+		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
+endef
+endif
+
+define ROOTFS_ISO9660_PREPARATION
 	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
+	$(ROOTFS_ISO9660_INSTALL_BOOTLOADER)
 endef
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 
-# Splash screen disabling
+# Grub splash screen disabling
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
 define ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
-	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
 endif
+endif
 
 define ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
-	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
 
-# Copy splashscreen to temporary filesystem
+# Copy Grub splashscreen to temporary filesystem
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
 	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
@@ -73,6 +97,7 @@ define ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
 endif
+endif
 
 # Copy the kernel to temporary filesystem
 define ROOTFS_ISO9660_COPY_KERNEL
@@ -89,7 +114,7 @@ define ROOTFS_ISO9660_COPY_INITRD
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/initrd
 	$(SED) "s%__INITRD_PATH__%/boot/initrd%" \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_INITRD
 else
@@ -104,7 +129,7 @@ endif # BR2_TARGET_ROOTFS_ISO9660_INITRD
 
 
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
+	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
new file mode 100644
index 0000000..2bdf48b
--- /dev/null
+++ b/fs/iso9660/isolinux.cfg
@@ -0,0 +1,6 @@
+default 1
+display sample.msg
+label 1
+      kernel __KERNEL_PATH__
+      append initrd=__INITRD_PATH__
+      append root=/dev/sr0
-- 
2.1.0
