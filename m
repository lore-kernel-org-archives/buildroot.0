From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:18:31 +0200
Subject: [Buildroot] [git commit] fs/iso9660: rename all variables to use
	the ROOTFS_ISO9660 prefix
Message-ID: <20150614212541.EE09C81957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cfc57a8b3bcabf687280b7c0458d2f11a5f34c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency reasons, this commit renames all internal variables of
iso9660.mk to use the ROOTFS_ISO9660 prefix.

While we're at it, replace a useless ':=' by '='.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b2f00fd..54b1653 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -4,41 +4,41 @@
 #
 ################################################################################
 
-ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
-ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
+ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
+ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
 ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
 
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define ROOTFS_ISO9660_SPLASHSCREEN
 	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
-		$(ISO9660_TARGET_DIR)/splash.xpm.gz
+		$(ROOTFS_ISO9660_TARGET_DIR)/splash.xpm.gz
 endef
 else
 define ROOTFS_ISO9660_SPLASHSCREEN
-	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 define ROOTFS_ISO9660_INITRD
-	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(SED) '/initrd/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
 endef
 else
 define ROOTFS_ISO9660_INITRD
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
-		$(ISO9660_TARGET_DIR)/initrd
+		$(ROOTFS_ISO9660_TARGET_DIR)/initrd
 endef
 endif
 
 define ROOTFS_ISO9660_PREPARATION
-	$(RM) -rf $(ISO9660_TARGET_DIR)
-	mkdir -p $(ISO9660_TARGET_DIR)
+	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
+	mkdir -p $(ROOTFS_ISO9660_TARGET_DIR)
 	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
-		$(ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
-	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_MENU) \
-		$(ISO9660_TARGET_DIR)/boot/grub/menu.lst
-	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
+	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
+		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ROOTFS_ISO9660_TARGET_DIR)/kernel
 	$(ROOTFS_ISO9660_SPLASHSCREEN)
 	$(ROOTFS_ISO9660_INITRD)
 endef
@@ -48,7 +48,7 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
-		-o $@ $(ISO9660_TARGET_DIR)
+		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 
 $(eval $(call ROOTFS_TARGET,iso9660))
