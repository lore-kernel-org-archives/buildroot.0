From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:53:25 +0100
Subject: [Buildroot] [git commit] iso9660 fs: use cpio initrd instead of ext2
Message-ID: <20121114215353.3213399FD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff3391323a2baa8c1238d795ec82701dacb77c6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ext2 initrd is pretty broken, because it requires an additional
root=/dev/ram0 command line parameter, and a /init to mount
devtmps that isn't there in out ext2 rootfs.  So just use a cpio
instead.

Note that there is no check if the kernel supports initramfs or the
selected compression method.

Also removed a bit of dead code in iso9660.mk.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/iso9660/Config.in  |    2 +-
 fs/iso9660/iso9660.mk |   11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 4c00583..98ff78b 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,7 +2,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	select BR2_TARGET_ROOTFS_EXT2
+	select BR2_TARGET_ROOTFS_CPIO
 	select BR2_TARGET_GRUB
 	help
 	  Build a bootable iso9660 image
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index f51b6ee..029c0dd 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -9,20 +9,19 @@
 
 ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
-ISO9660_OPTS:=
 
-ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
-ISO9660_OPTS+=-U
-endif
+ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_GZIP)  = .gz
+ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_BZIP2) = .bz2
+ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_LZMA)  = .lzma
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-ext2 grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
-	cp $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd
+	cp $(BINARIES_DIR)/rootfs.cpio$(ISO9660_CPIO_EXT-y) $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
