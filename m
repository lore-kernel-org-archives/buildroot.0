From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 00:21:45 +0200
Subject: [Buildroot] [PATCHv2 12/15] fs/iso9660: add isolinux support
In-Reply-To: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433802108-14351-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After all the preparation commits, this commit finally adds the
iso9660 support itself. Besides adding a new Config.in entry, a little
bit of .mk code and the isolinux.cfg default configuration, not much
is needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in    | 20 ++++++++++++++------
 fs/iso9660/iso9660.mk   | 11 +++++++++++
 fs/iso9660/isolinux.cfg |  5 +++++
 3 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 fs/iso9660/isolinux.cfg

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index cd7b175..97925b9 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,7 +2,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_TARGET_GRUB
+	depends on BR2_TARGET_GRUB || BR2_TARGET_SYSLINUX_ISOLINUX
 	select BR2_LINUX_KERNEL_INSTALL_TARGET \
 	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
 	help
@@ -29,15 +29,22 @@ config BR2_TARGET_ROOTFS_ISO9660_GRUB
 	depends on BR2_TARGET_GRUB
 	select BR2_TARGET_GRUB_FS_ISO9660
 
+config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
+	bool "isolinux"
+	depends on BR2_TARGET_SYSLINUX_ISOLINUX
+
 endchoice
 
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	default "fs/iso9660/menu.lst" if BR2_TARGET_ROOTFS_ISO9660_GRUB
+	default "fs/iso9660/isolinux.cfg" if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
 	help
-	  Use this option to provide a custom Grub menu.lst file. Note
-	  that the strings __KERNEL_PATH__ and __INITRD_PATH__ will
-	  automatically be replaced by the path to the kernel and
+	  Use this option to provide a custom bootloader configuration
+	  file (menu.lst for Grub, isolinux.cfg for isolinux).
+
+	  Note that the strings __KERNEL_PATH__ and __INITRD_PATH__
+	  will automatically be replaced by the path to the kernel and
 	  initrd images respectively.
 
 config BR2_TARGET_ROOTFS_ISO9660_INITRD
@@ -53,6 +60,7 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
 
 endif
 
-comment "iso image needs a Linux kernel and grub to be built"
+comment "iso image needs a Linux kernel and one of grub or isolinux to be built"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_LINUX_KERNEL || !BR2_TARGET_GRUB
+	depends on !BR2_LINUX_KERNEL || \
+		!(BR2_TARGET_GRUB || BR2_TARGET_SYSLINUX_ISOLINUX)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 6a1b214..588e07b 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -53,6 +53,17 @@ define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
 endef
+else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
+ROOTFS_ISO9660_DEPENDENCIES += syslinux
+ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
+	$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
+ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
+define ROOTFS_ISO9660_INSTALL_BOOTLOADER
+	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/isolinux.bin \
+		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.bin
+	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
+		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
+endef
 endif
 
 define ROOTFS_ISO9660_PREPARATION
diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
new file mode 100644
index 0000000..28be4fa
--- /dev/null
+++ b/fs/iso9660/isolinux.cfg
@@ -0,0 +1,5 @@
+default 1
+label 1
+      kernel __KERNEL_PATH__
+      initrd __INITRD_PATH__
+      append root=/dev/sr0
-- 
2.1.0
