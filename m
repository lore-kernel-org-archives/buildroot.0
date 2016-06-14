From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:17 +0200
Subject: [Buildroot] [PATCH 09/12] reproducibility/fs/cpio: generate archive
	with host-cpio
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-9-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the --reproducible option to generate a reproducible archive.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 fs/cpio/cpio.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index e82167e..4da6648 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -27,9 +27,17 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+ifneq ($(BR2_REPRODUCIBLE),y)
 define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
+else
+ROOTFS_CPIO_DEPENDENCIES += host-cpio
+
+define ROOTFS_CPIO_CMD
+	cd $(TARGET_DIR) && find . | $(CPIO_REPRODUCIBLE) --quiet -o -H newc > $@
+endef
+endif
 
 $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
 	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
-- 
2.8.2
