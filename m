From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:41:35 +0100
Subject: [Buildroot] [PATCH 6/9 v2] fs/cpio: use a post-gen hook rather than
	a post-target rule
In-Reply-To: <cover.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <181362cf62b072db7ec5340c0a3c173af82afd1f.1457721607.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already have a mechanism for running stuff after the filesystem is
generated, and that's called post-gen hooks.

Use those hooks.

Note: for cpio (and unlike ext2 previously), the dependency chain was
correct, in that the post-target rule correctly depended on the image
rule. Nonetheless, we still want to fix it for consistency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/cpio/cpio.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index e82167e..c68e0bf 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -31,12 +31,13 @@ define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
 
-$(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
-	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
-		-C none -d $<$(ROOTFS_CPIO_COMPRESS_EXT) $@
-
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
-ROOTFS_CPIO_POST_TARGETS += $(BINARIES_DIR)/rootfs.cpio.uboot
+ROOTFS_CPIO_DEPENDENCIES += host-uboot-tools
+define ROOTFS_CPIO_UBOOT_MKIMAGE
+	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
+		-C none -d $@$(ROOTFS_CPIO_COMPRESS_EXT) $@.uboot
+endef
+ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
 endif
 
 $(eval $(call ROOTFS_TARGET,cpio))
-- 
1.9.1
