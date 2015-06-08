From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 00:21:41 +0200
Subject: [Buildroot] [PATCHv2 08/15] fs/iso9660: support building a real
	iso9660 filesystem
In-Reply-To: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433802108-14351-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the iso9660 filesystem handling only supported using an
initrd/initramfs to store the root filesystem, which is very different
from what we do with the other filesystems.

This commit changes the iso9660 logic to also allow using directly an
iso9660 filesystem to store the root filesystem. A new option,
BR2_TARGET_ROOTFS_ISO9660_INITRD, is created to tell the iso9660 that
we want to use an initrd and not directly the root filesystem in
iso9660 format. This option defaults to 'y' to preserve the existing
behavior.

After this commit, we therefore have three possibilities:

 * BR2_TARGET_ROOTFS_ISO9660=y, with BR2_TARGET_ROOTFS_INITRAMFS and
   BR2_TARGET_ROOTFS_ISO9660_INITRD disabled. In this case, the
   iso9660 filesystem is directly the contents of the root filesystem
   (since is possible thanks to the Rockridge extensions that were
   already enabled using the -R option of genisoimage). Obviously, it
   means that the root filesystem is read-only.

 * BR2_TARGET_ROOTFS_ISO9660=y and BR2_TARGET_ROOTFS_INITRAMFS=y (the
   value of BR2_TARGET_ROOTFS_ISO9660_INITRD doesn't matter). In this
   case, the root filesystem is already linked into the kernel image
   itself, as an initramfs. So the iso9660 filesystem doesn't contain
   the root filesystem as is, but just the bootloader and the kernel
   image.

 * BR2_TARGET_ROOTFS_ISO9660=y, BR2_TARGET_ROOTFS_ISO9660_INITRD=y and
   BR2_TARGET_ROOTFS_INITRAMFS disabled. In this case, a separate
   initrd is used. The iso9660 filesystem only contains the
   bootloader, the kernel and the initrd.

In order to support the first case out of the box, root=/dev/sr0 is
added on the kernel command line in the example Grub configuration
file, so that the kernel knows where the root filesystem is
located. This argument is ignored when initrd/initramfs are used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  |  27 ++++++++++++-
 fs/iso9660/iso9660.mk | 109 ++++++++++++++++++++++++++++++++++++++------------
 fs/iso9660/menu.lst   |   2 +-
 3 files changed, 110 insertions(+), 28 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 111158b..e300fdb 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,11 +2,23 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	select BR2_TARGET_ROOTFS_CPIO
+	select BR2_LINUX_KERNEL_INSTALL_TARGET \
+	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
 	select BR2_TARGET_GRUB
 	select BR2_TARGET_GRUB_FS_ISO9660
 	help
-	  Build a bootable iso9660 image
+	  Build a bootable ISO9660 image. By default, the root
+	  filesystem is directly packed as the ISO9660 filesystem,
+	  which means the root filesystem will be read-only. It
+	  requires ISO9660 filesystem support and CDROM support in the
+	  kernel.
+
+	  However, if BR2_TARGET_ROOTFS_INITRAMFS or
+	  BR2_TARGET_ROOTFS_ISO9660_INITRD have been enabled, the
+	  ISO9660 filesystem will only contain a kernel image and
+	  optionally an external initrd image. In this case, the
+	  filesystem being in RAM, it will be read/write. No ISO9660
+	  or CDROM support is needed in the kernel.
 
 if BR2_TARGET_ROOTFS_ISO9660
 
@@ -19,6 +31,17 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	  automatically be replaced by the path to the kernel and
 	  initrd images respectively.
 
+config BR2_TARGET_ROOTFS_ISO9660_INITRD
+	bool "Use initrd"
+	default y
+	select BR2_TARGET_ROOTFS_CPIO
+	help
+	  Enable this option to have the root filesystem bundled as an
+	  initrd/initramfs rather than directly as the ISO9660
+	  filesystem. With this option enabled, the ISO9660 will only
+	  contain a kernel image, an initrd image (unless an initramfs
+	  linked into the kernel is used) and the bootloader.
+
 endif
 
 comment "iso image needs a Linux kernel to be built"
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 035561d..723fe94 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -4,51 +4,110 @@
 #
 ################################################################################
 
-ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
+#
+# We need to handle three cases:
+#
+#  1. The ISO9660 filesystem will really be the real root filesystem
+#     itself. This is when BR2_TARGET_ROOTFS_ISO9660_INITRD is
+#     disabled.
+#
+#  2. The ISO9660 filesystem will be a filesystem with just a kernel
+#     image, initrd and grub. This is when
+#     BR2_TARGET_ROOTFS_ISO9660_INITRD is enabled, but
+#     BR2_TARGET_ROOTFS_INITRAMFS is disabled.
+#
+#  3. The ISO9660 filesystem will be a filesystem with just a kernel
+#     image and grub. This is like (2), except that the initrd is
+#     built into the kernel image. This is when
+#     BR2_TARGET_ROOTFS_INITRAMFS is enabled (regardless of the value
+#     of BR2_TARGET_ROOTFS_ISO9660_INITRD).
+
 ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
+ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux
 
-ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
-define ROOTFS_ISO9660_SPLASHSCREEN
-	$(INSTALL) -D -m 0644 $(TARGET_DIR)/boot/grub/splash.xpm.gz \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/splash.xpm.gz
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+ROOTFS_ISO9660_USE_INITRD = YES
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_INITRD),y)
+ROOTFS_ISO9660_USE_INITRD = YES
+endif
+
+ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
+ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
+define ROOTFS_ISO9660_CREATE_TEMPDIR
+	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
+	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 else
-define ROOTFS_ISO9660_SPLASHSCREEN
+ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
+endif
+
+define ROOTFS_ISO9660_PREPARATION
+	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
+	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+endef
+
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
+
+# Splash screen disabling
+ifeq ($(BR2_TARGET_GRUB_SPLASH),)
+define ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
 	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
 endif
 
-ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-define ROOTFS_ISO9660_INITRD
+define ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
+
+ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
+
+# Copy splashscreen to temporary filesystem
+ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
+define ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
+	$(INSTALL) -D -m 0644 $(TARGET_DIR)/boot/grub/splash.xpm.gz \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/splash.xpm.gz
+endef
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_INSTALL_SPLASHSCREEN
+endif
+
+# Copy the kernel to temporary filesystem
+define ROOTFS_ISO9660_COPY_KERNEL
+	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+endef
+
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_KERNEL
+
+# If initramfs is used, disable loading the initrd as the rootfs is
+# already inside the kernel image. Otherwise, make sure a cpio is
+# generated and use it as the initrd.
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 else
-define ROOTFS_ISO9660_INITRD
+ROOTFS_ISO9660_DEPENDENCIES += rootfs-cpio
+define ROOTFS_ISO9660_COPY_INITRD
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/initrd
 	$(SED) "s%__INITRD_PATH__%/boot/initrd%" \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_INITRD
 endif
 
-define ROOTFS_ISO9660_PREPARATION
-	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
-	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
-	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
-	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
-	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
-	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
-	$(ROOTFS_ISO9660_SPLASHSCREEN)
-	$(ROOTFS_ISO9660_INITRD)
-endef
+else # ROOTFS_ISO9660_USE_INITRD
+
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
+
+endif # ROOTFS_ISO9660_USE_INITRD
 
-ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
index 8e8309f..eb1ecef 100644
--- a/fs/iso9660/menu.lst
+++ b/fs/iso9660/menu.lst
@@ -12,7 +12,7 @@ foreground 	000000
 background 	cccccc
 
 title		Buildroot ISO9660 image
-kernel		__KERNEL_PATH__
+kernel		__KERNEL_PATH__ root=/dev/sr0
 initrd		__INITRD_PATH__
 
 title		Hard Drive (first partition)
-- 
2.1.0
