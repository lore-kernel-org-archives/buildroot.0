From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 11:20:38 +0100
Subject: [Buildroot] [git commit master 1/1] fs/ext2: remove redundant
	BR2_TARGET_ROOTFS_EXT2_SQUASH option
Message-ID: <20110114102129.443E98B4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acd062778f940e91ae27643b1620e205ecd04816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The generic fs handling does a chmod -R 0:0 $(TARGET_DIR), so there's no
need for a specific option to enforce this when making an ext2fs image.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/Config.in |    5 -----
 fs/ext2/ext2.mk   |    4 ----
 2 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 535fa01..2af44a8 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -18,11 +18,6 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	depends on BR2_TARGET_ROOTFS_EXT2
 	default 0
 
-config BR2_TARGET_ROOTFS_EXT2_SQUASH
-	bool "Make all files be owned by root"
-	depends on  BR2_TARGET_ROOTFS_EXT2
-	default y
-
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 18a6df4..cc8da0e 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -6,10 +6,6 @@
 
 EXT2_OPTS :=
 
-ifeq ($(BR2_TARGET_ROOTFS_EXT2_SQUASH),y)
-EXT2_OPTS += -U
-endif
-
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endif
-- 
1.7.2.2
