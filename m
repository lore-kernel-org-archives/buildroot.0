From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:18:53 +0200
Subject: [Buildroot] [git commit] fs/iso9660: prepare cleaner kernel/initrd
	path handling
Message-ID: <20150614212542.15B3981957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=168cce04969029f0b7365691b4a5ca91c7f5af53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iso9660.mk modifies the menu.lst file from Grub to set the correct
initrd/kernel image locations. However, with the upcoming support of
other bootloaders for iso9660 filesystems, we need to modify a bit
this logic.

Instead of relying on the specific details of the grub menu.lst
syntax, we introduce the __KERNEL_PATH__ and __INITRD_PATH__ magic
keywords, which iso9660.mk will replace by the appropriate
values. They can therefore be used where needed in grub menu.lst, and
in similar configuration files of other bootloaders, as will be
supported in the following commits.

Also, in order to be consistent with the soon to be introduced support
for having the root filesystem itself as iso9660, this commit changes
the installation location of the initrd and kernel. Instead of being
/initrd and /kernel, they become /boot/initrd and
/boot/$(LINUX_IMAGE_NAME).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/Config.in  |    5 +++++
 fs/iso9660/iso9660.mk |   11 ++++++++---
 fs/iso9660/menu.lst   |    4 ++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 9d00ab8..111158b 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -13,6 +13,11 @@ if BR2_TARGET_ROOTFS_ISO9660
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	default "fs/iso9660/menu.lst"
+	help
+	  Use this option to provide a custom Grub menu.lst file. Note
+	  that the strings __KERNEL_PATH__ and __INITRD_PATH__ will
+	  automatically be replaced by the path to the kernel and
+	  initrd images respectively.
 
 endif
 
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b313c65..035561d 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -22,12 +22,14 @@ endif
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 define ROOTFS_ISO9660_INITRD
-	$(SED) '/initrd/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
 else
 define ROOTFS_ISO9660_INITRD
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
-		$(ROOTFS_ISO9660_TARGET_DIR)/initrd
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/initrd
+	$(SED) "s%__INITRD_PATH__%/boot/initrd%" \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
 endif
 
@@ -38,7 +40,10 @@ define ROOTFS_ISO9660_PREPARATION
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
 	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
-	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ROOTFS_ISO9660_TARGET_DIR)/kernel
+	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 	$(ROOTFS_ISO9660_SPLASHSCREEN)
 	$(ROOTFS_ISO9660_INITRD)
 endef
diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
index fd5c76a..8e8309f 100644
--- a/fs/iso9660/menu.lst
+++ b/fs/iso9660/menu.lst
@@ -12,8 +12,8 @@ foreground 	000000
 background 	cccccc
 
 title		Buildroot ISO9660 image
-kernel		/kernel
-initrd		/initrd
+kernel		__KERNEL_PATH__
+initrd		__INITRD_PATH__
 
 title		Hard Drive (first partition)
 rootnoverify	(hd0)
