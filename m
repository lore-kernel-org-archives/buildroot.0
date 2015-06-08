From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 00:21:48 +0200
Subject: [Buildroot] [PATCHv2 15/15] fs/iso9660: add support for grub2
In-Reply-To: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433802108-14351-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After having extended the iso9660 support to allow isolinux as an
alternative to grub, this commit adds grub2 as a third
alternative. With the previous work done to support isolinux, adding
support for grub2 is fairly trivial.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  | 18 +++++++++++++++---
 fs/iso9660/grub.cfg   |  7 +++++++
 fs/iso9660/iso9660.mk |  9 +++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 fs/iso9660/grub.cfg

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 6f057ea..7e1ddd6 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,7 +2,9 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_TARGET_GRUB || BR2_TARGET_SYSLINUX_ISOLINUX
+	depends on BR2_TARGET_GRUB || \
+		BR2_TARGET_GRUB2 || \
+		BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
 	help
@@ -29,6 +31,15 @@ config BR2_TARGET_ROOTFS_ISO9660_GRUB
 	depends on BR2_TARGET_GRUB
 	select BR2_TARGET_GRUB_FS_ISO9660
 
+config BR2_TARGET_ROOTFS_ISO9660_GRUB2
+	bool "grub2"
+	depends on BR2_TARGET_GRUB2
+	help
+	  Use Grub 2 as the bootloader for the ISO9660 image. Make
+	  sure to enable the 'iso9660' module in
+	  BR2_TARGET_GRUB2_BUILTIN_MODULES and to use 'cd' as the boot
+	  partition in BR2_TARGET_GRUB2_BOOT_PARTITION=.
+
 config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	bool "isolinux"
 	depends on BR2_TARGET_SYSLINUX_ISOLINUX
@@ -38,6 +49,7 @@ endchoice
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
+	default "fs/iso9660/grub.cfg" if BR2_TARGET_ROOTFS_ISO9660_GRUB2
 	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	help
 	  Use this option to provide a custom bootloader configuration
@@ -69,7 +81,7 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
 
 endif
 
-comment "iso image needs a Linux kernel and one of grub or isolinux to be built"
+comment "iso image needs a Linux kernel and one of grub, grub2 or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL || \
-		!(BR2_TARGET_GRUB || BR2_TARGET_SYSLINUX_ISOLINUX)
+		!(BR2_TARGET_GRUB || BR2_TARGET_GRUB2 || BR2_TARGET_SYSLINUX_ISOLINUX)
diff --git a/fs/iso9660/grub.cfg b/fs/iso9660/grub.cfg
new file mode 100644
index 0000000..90e1039
--- /dev/null
+++ b/fs/iso9660/grub.cfg
@@ -0,0 +1,7 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux __KERNEL_PATH__ root=/dev/sr0
+	initrd __INITRD_PATH__
+}
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 4f4abea..6ed979c 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -53,6 +53,15 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
 endef
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
+ROOTFS_ISO9660_DEPENDENCIES += grub2
+ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
+	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub.cfg
+ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/grub-eltorito.img
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/grub-eltorito.img \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub-eltorito.img
+endef
 else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
 ROOTFS_ISO9660_DEPENDENCIES += syslinux
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
-- 
2.1.0
