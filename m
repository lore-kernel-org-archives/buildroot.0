From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Feb 2018 09:42:21 +0100
Subject: [Buildroot] [PATCH 03/15 v2] fs/iso9660: rename internal variable
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <f5e7f4f3516711340d75c0025c3d4c1613aa1d4a.1517820133.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're soon to introduce a generic variable with that name, i.e.
$(FS_NAME)_TARGET_DIR, so our internal, temporary variable would
clash with it.

Just rename it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/iso9660/iso9660.mk | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 207c6aa39f..b33cf4cd8a 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -35,47 +35,47 @@ ROOTFS_ISO9660_USE_INITRD = YES
 endif
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
-ROOTFS_ISO9660_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
+ROOTFS_ISO9660_TMP_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
 define ROOTFS_ISO9660_CREATE_TEMPDIR
-	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
-	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
+	$(RM) -rf $(ROOTFS_ISO9660_TMP_TARGET_DIR)
+	mkdir -p $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_CREATE_TEMPDIR
 else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION),y)
 ROOTFS_ISO9660_DEPENDENCIES += host-zisofs-tools
-ROOTFS_ISO9660_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
+ROOTFS_ISO9660_TMP_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
 # This must be early, before we copy the bootloader files.
 define ROOTFS_ISO9660_MKZFTREE
-	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
+	$(RM) -rf $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 	$(HOST_DIR)/bin/mkzftree -X -z 9 -p $(PARALLEL_JOBS) \
 		$(TARGET_DIR) \
-		$(ROOTFS_ISO9660_TARGET_DIR)
+		$(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_MKZFTREE
 ROOTFS_ISO9660_GENISOIMAGE_OPTS += -z
 else
-ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
+ROOTFS_ISO9660_TMP_TARGET_DIR = $(TARGET_DIR)
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
 ROOTFS_ISO9660_DEPENDENCIES += grub2
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
-	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub.cfg
+	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub.cfg
 ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/grub-eltorito.img
 define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/grub-eltorito.img \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub-eltorito.img
+		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/grub/grub-eltorito.img
 endef
 else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
 ROOTFS_ISO9660_DEPENDENCIES += syslinux
 ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
-	$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
+	$(ROOTFS_ISO9660_TMP_TARGET_DIR)/isolinux/isolinux.cfg
 ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
 define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
-		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/
+		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/isolinux/
 	$(INSTALL) -D -m 0644 $(HOST_DIR)/share/syslinux/ldlinux.c32 \
-		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
+		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/isolinux/ldlinux.c32
 endef
 endif
 
@@ -96,7 +96,7 @@ endef
 # Copy the kernel to temporary filesystem
 define ROOTFS_ISO9660_COPY_KERNEL
 	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
 endef
 
 ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
@@ -111,7 +111,7 @@ else
 ROOTFS_ISO9660_DEPENDENCIES += rootfs-cpio
 define ROOTFS_ISO9660_COPY_INITRD
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
-		$(ROOTFS_ISO9660_TARGET_DIR)/boot/initrd
+		$(ROOTFS_ISO9660_TMP_TARGET_DIR)/boot/initrd
 	$(SED) "s%__INITRD_PATH__%/boot/initrd%" \
 		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
@@ -133,7 +133,7 @@ define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		$(ROOTFS_ISO9660_GENISOIMAGE_OPTS) \
-		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
+		-o $@ $(ROOTFS_ISO9660_TMP_TARGET_DIR)
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
-- 
2.14.1
