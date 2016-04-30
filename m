From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:28 +0200
Subject: [Buildroot] [PATCH 32/34] reproducible/iso9660: generate
	reproducible isos
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-32-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sort the files list to get a deterministic file order
---
 fs/iso9660/iso9660.mk | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 899d8e8..bfc056f 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -142,29 +142,30 @@ endif # ROOTFS_ISO9660_USE_INITRD
 
 
 ifneq ($(BR2_REPRODUCIBLE),y)
-define ROOTFS_ISO9660_GENISOIMAGE
-	$(HOST_DIR)/usr/bin/genisoimage -R
+define ROOTFS_ISO9660_CMD
+	$(HOST_DIR)/usr/bin/genisoimage -R -J -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+		-no-emul-boot -boot-load-size 4 -boot-info-table \
+		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 define ROOTFS_ISO9660_ISOHYBRID
 	$(HOST_DIR)/usr/bin/isohybrid
 endef
 else
-define ROOTFS_ISO9660_GENISOIMAGE
-	find $(ROOTFS_ISO9660_TARGET_DIR) -print0 | \
-	xargs -0 touch -h -d @$(SOURCE_DATE_EPOCH) && \
-	$(HOST_DIR)/usr/bin/genisoimage -creation-date $(SOURCE_DATE_EPOCH)
+define ROOTFS_ISO9660_CMD
+	find $(ROOTFS_ISO9660_TARGET_DIR) -print | \
+	xargs touch -h -d @$(SOURCE_DATE_EPOCH) && \
+	find $(ROOTFS_ISO9660_TARGET_DIR) -! -type d -o -empty | sort | \
+	sed "s%$(ROOTFS_ISO9660_TARGET_DIR)"'\\(/.*\\)%\\1=&%' | \
+	$(HOST_DIR)/usr/bin/genisoimage -J -creation-date $(SOURCE_DATE_EPOCH) \
+		-b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+		-no-emul-boot -boot-load-size 4 -boot-info-table \
+		-o $@ -graft-points -path-list -
 endef
 define ROOTFS_ISO9660_ISOHYBRID
 	$(HOST_DIR)/usr/bin/isohybrid -i $(SOURCE_DATE_EPOCH)
 endef
 endif
 
-define ROOTFS_ISO9660_CMD
-	$(ROOTFS_ISO9660_GENISOIMAGE) -J -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
-		-no-emul-boot -boot-load-size 4 -boot-info-table \
-		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
-endef
-
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
 ROOTFS_ISO9660_DEPENDENCIES += host-syslinux
 
-- 
2.7.4
