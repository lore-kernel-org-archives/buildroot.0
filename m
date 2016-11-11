From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 11 Nov 2016 11:13:39 -0600
Subject: [Buildroot] [PATCH] fs/iso9660: md5 checksum boot dir files
Message-ID: <1478884419-22717-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

Generate md5 checksum for all files of boot directory
to allow runtime validation of boot images.

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 fs/iso9660/iso9660.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d1d9cbf..d805465 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -144,6 +144,8 @@ endif # ROOTFS_ISO9660_USE_INITRD
 
 
 define ROOTFS_ISO9660_CMD
+	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)/boot/checksums.md5
+	cd $(ROOTFS_ISO9660_TARGET_DIR)/boot/ && md5sum * > $(ROOTFS_ISO9660_TARGET_DIR)/boot/checksums.md5
 	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
-- 
1.9.1
