From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 22 Aug 2013 08:09:26 +0300
Subject: [Buildroot] [PATCH] iso9660 fs: no need to copy initrd when using
	initramfs
In-Reply-To: <1377148166-21030-1-git-send-email-shmuelzon@gmail.com>
References: <1377148166-21030-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1377148166-21030-2-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 fs/iso9660/iso9660.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 317314a..12ab9eb 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -21,7 +21,9 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
-	cp $(BINARIES_DIR)/rootfs.cpio$(ISO9660_CPIO_EXT-y) $(ISO9660_TARGET_DIR)/initrd
+	if [ "$(BR2_TARGET_ROOTFS_INITRAMFS)" != "y" ]; then \
+	  cp $(BINARIES_DIR)/rootfs.cpio$(ISO9660_CPIO_EXT-y) $(ISO9660_TARGET_DIR)/initrd; \
+	fi
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-- 
1.7.9.5
