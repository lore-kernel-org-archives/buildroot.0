From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:01:27 +0100
Subject: [Buildroot] [git commit branch/next] fs/iso9660: use install
	instead of cp
Message-ID: <20141122180134.0B69D7FE45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4273d4d9ff5b9c104d7447d96199e2cadbf790e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This way we don't depend on the permissions of files under boot/ or fs/,
which aren't tracked.

While we're at it, change all 'cp' usages into 'install' with the
correct mode for each file.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

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
