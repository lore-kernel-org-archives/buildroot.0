From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:19:08 -0300
Subject: [Buildroot] [PATCH v4 9/9] fs/iso9660: use install instead of cp
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1416586748-12936-10-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This way we don't depend on the permissions of files under boot/ or fs/,
which aren't tracked.

While we're at it, change all 'cp' usages into 'install' with the
correct mode for each file.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 fs/iso9660/iso9660.mk | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 908f0e9..5b44ba4 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -14,20 +14,22 @@ ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
 
 $(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
-	mkdir -p $(ISO9660_TARGET_DIR)
-	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
-	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
-	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
+		$(ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
+	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_MENU) \
+		$(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
 	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 else
-	cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
+	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
+		$(ISO9660_TARGET_DIR)/splash.xpm.gz
 endif
-	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 else
-	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
+	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
+		$(ISO9660_TARGET_DIR)/initrd
 endif
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
-- 
2.1.3
