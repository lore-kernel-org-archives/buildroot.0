From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:24 +0200
Subject: [Buildroot] [PATCH 28/34] reproducibility/fs/cpio: generate archive
	with host-cpio
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-28-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the --reproducible option to generate a reproducible archive.
---
 fs/cpio/cpio.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 07be2a8..e0e925d 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -27,19 +27,19 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
-ifeq ($(BR2_REPRODUCIBLE),y)
-define ROOTFS_CPIO_REPRODUCIBLE_TOUCH
-	find $(TARGET_DIR) -print0 | xargs -0 touch -h -d @$(SOURCE_DATE_EPOCH)
+ifneq ($(BR2_REPRODUCIBLE),y)
+define ROOTFS_CPIO_CMD
+	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
 else
-define ROOTFS_CPIO_REPRODUCIBLE_TOUCH
-	true
-endef
-endif
+ROOTFS_CPIO_DEPENDENCIES += host-cpio
 
 define ROOTFS_CPIO_CMD
-	$(ROOTFS_CPIO_REPRODUCIBLE_TOUCH) && cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
+	find $(TARGET_DIR) -print0 | \
+	xargs -0 touch -h -d @$(SOURCE_DATE_EPOCH) && \
+	cd $(TARGET_DIR) && find . | $(CPIO_REPRODUCIBLE) --quiet -o -H newc > $@
 endef
+endif
 
 $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
 	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
-- 
2.7.4
