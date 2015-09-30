From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2015 23:54:48 +0200
Subject: [Buildroot] [PATCH 5/9] fs/ext2: use a post-gen hook rather than a
	post-target rule
In-Reply-To: <cover.1443650034.git.yann.morin.1998@free.fr>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
Message-ID: <124cffe1b9801519a0c6ee4ac6cfccc40daef3b0.1443650034.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

post-target rules are probably not resilient to parallel builds, given
that they do not depend on the image being generated first.

Beside, we already have a mechanism for running stuff after the
filesystem is generated, and that's called post-gen hooks.

Use those hooks.

Note: this basically reverts 75b6303 (rootfs-ext2: make the symlink as a
_POST_TARGET) since we've now re-introduced post-gen hooks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/ext2/ext2.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index cab66a5..312b7a0 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -32,13 +32,11 @@ define ROOTFS_EXT2_CMD
 	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
 endef
 
-rootfs-ext2-symlink:
-	ln -sf rootfs.ext2$(ROOTFS_EXT2_COMPRESS_EXT) $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)$(ROOTFS_EXT2_COMPRESS_EXT)
-
-.PHONY: rootfs-ext2-symlink
-
 ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
-ROOTFS_EXT2_POST_TARGETS += rootfs-ext2-symlink
+define ROOTFS_EXT2_SYMLINK
+	ln -sf rootfs.ext2$(ROOTFS_EXT2_COMPRESS_EXT) $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)$(ROOTFS_EXT2_COMPRESS_EXT)
+endef
+ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_SYMLINK
 endif
 
 $(eval $(call ROOTFS_TARGET,ext2))
-- 
1.9.1
