From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] iso9660: take into account the
	linux changes
Message-ID: <20100623092835.B1DD481886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c7ee5853a0d54a32aa69a4e4065e6ecdd63c4a4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  |    6 +++---
 fs/iso9660/iso9660.mk |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 7830581..4c00583 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
-	depends on BR2_i386
-	depends on !BR2_KERNEL_none
+	depends on (BR2_i386 || BR2_x86_64)
+	depends on BR2_LINUX_KERNEL
 	select BR2_TARGET_ROOTFS_EXT2
 	select BR2_TARGET_GRUB
 	help
@@ -13,4 +13,4 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	default "fs/iso9660/menu.lst"
 
 comment "iso image requires a Linux kernel to be built"
-	depends on BR2_i386 && BR2_KERNEL_none
+	depends on (BR2_i386 || BR2_x86_64) && !BR2_LINUX_KERNEL
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 66e2de2..6f60893 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -15,14 +15,14 @@ ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot $(LINUX_KERNEL) $(BINARIES_DIR)/rootfs.ext2 grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 ext2-root grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
-	cp $(LINUX_KERNEL) $(ISO9660_TARGET_DIR)/kernel
-	cp $(EXT2_TARGET) $(ISO9660_TARGET_DIR)/initrd
+	cp $(LINUX26_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+	cp $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
 	touch $(BUILD_DIR)/.fakeroot.00000
-- 
1.7.1
