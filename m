From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:29 +0100
Subject: [Buildroot] [PATCH 1/7] rootfs-ext2: make the symlink as a
	_POST_TARGET
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to remove the unused ROOTFS_$(FSTYPE)_POST_GEN_HOOKS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
- Initial revision. This patch was introduced to enable the U-Boot image
  of the cpio rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk    | 2 +-
 fs/ext2/ext2.mk | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 4dab7ea..01d2c00 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -17,7 +17,7 @@
 #  generating the filesystem image
 #
 #  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
-#  generating the filesystem image
+#  generating and compressing the filesystem image
 #
 #  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
 #  run after running the main filesystem target. This is useful for
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index cad5b42..b4280aa 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -27,11 +27,11 @@ define ROOTFS_EXT2_CMD
 	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
-define ROOTFS_EXT2_HOOK_SYMLINK
+rootfs-ext2-symlink:
 	ln -sf rootfs.ext2 $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)
-endef
+
 ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
-ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_HOOK_SYMLINK
+ROOTFS_EXT2_POST_TARGETS += rootfs-ext2-symlink
 endif
 
 $(eval $(call ROOTFS_TARGET,ext2))
-- 
1.8.4.rc3
