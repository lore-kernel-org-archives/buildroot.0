From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:22 +0200
Subject: [Buildroot] [PATCH 26/34] reproducibility: cpio: avoid embedding
	file dates in archive
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-26-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 fs/cpio/cpio.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index e82167e..07be2a8 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -27,8 +27,18 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define ROOTFS_CPIO_REPRODUCIBLE_TOUCH
+	find $(TARGET_DIR) -print0 | xargs -0 touch -h -d @$(SOURCE_DATE_EPOCH)
+endef
+else
+define ROOTFS_CPIO_REPRODUCIBLE_TOUCH
+	true
+endef
+endif
+
 define ROOTFS_CPIO_CMD
-	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
+	$(ROOTFS_CPIO_REPRODUCIBLE_TOUCH) && cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
 
 $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
-- 
2.7.4
