From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:07 +0200
Subject: [Buildroot] [PATCH 03/10] iso9660: take into account the linux
	changes
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5392121addc957f0723cdb98f5afe89dccaeeb5e.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/Config.in  |    4 ++--
 fs/iso9660/iso9660.mk |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 7830581..5f7cdf4 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on BR2_i386
-	depends on !BR2_KERNEL_none
+	depends on BR2_LINUX_KERNEL
 	select BR2_TARGET_ROOTFS_EXT2
 	select BR2_TARGET_GRUB
 	help
@@ -13,4 +13,4 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	default "fs/iso9660/menu.lst"
 
 comment "iso image requires a Linux kernel to be built"
-	depends on BR2_i386 && BR2_KERNEL_none
+	depends on BR2_i386 && !BR2_LINUX_KERNEL
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
1.7.0.4
