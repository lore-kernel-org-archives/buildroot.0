From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Thu, 30 Jul 2015 16:47:30 +0200
Subject: [Buildroot] [PATCH 1/2] fs/iso9660: fix hybrid image support
Message-ID: <1438267651-16818-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*_POST_GEN_HOOKS was never merged.

Suggested by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 fs/iso9660/iso9660.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d836194..9100547 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -146,15 +146,14 @@ endif # ROOTFS_ISO9660_USE_INITRD
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
-		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
+		-o $@ $(ROOTFS_ISO9660_TARGET_DIR) \
+	$(if $(ROOTFS_ISO9660_GEN_HYBRID), && $(ROOTFS_ISO9660_GEN_HYBRID))
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
 define ROOTFS_ISO9660_GEN_HYBRID
 	$(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
 endef
-
-ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
 endif
 
 $(eval $(call ROOTFS_TARGET,iso9660))
-- 
2.1.4
