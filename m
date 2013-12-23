From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Mon, 23 Dec 2013 22:06:08 +0100
Subject: [Buildroot] [PATCH 1/1 v3] Do not use an initrd in iso image when
	using initramfs
Message-ID: <1387832768-24066-1-git-send-email-thierry.bultel@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using initramfs, it is useless to put an initrd in the iso image.
This patch makes the image to only contain the kernel image, and
also removes the initrd line from menu.lst

Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 v2: Followed Yann E. Morin's advise to use positive logic
 v3: Uses $(SED) instead of 'sed -i -e", and added Reviewed-by:
 
 fs/iso9660/iso9660.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 979a0b2..56e87bb 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -17,7 +17,11 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+else
 	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
+endif
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-- 
1.7.9.5
