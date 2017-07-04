From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 16:47:26 +0200
Subject: [Buildroot] [PATCH v5 2/5] fs/ext2: use mkfs to generate rootfs
	image
In-Reply-To: <20170704144729.19753-1-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
Message-ID: <20170704144729.19753-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

mkfs is now capable of generating rootfs images. Use mkfs instead of
genext2fs.

If not set, we now let mkfs calculate the block size and the number of
inodes needed.

This change also adjusts the options to meet those of mkfs.

Notes:
* Passing a null inode number to mkfs triggers its automatic calculation.
* Passing a fs-size with no unit suffix to mkfs is interpreted as using
  1K block size.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v4->v5:
- remove BR2_TARGET_ROOTFS_EXT2_BLOCKS renaming
- update commit log

changes v3->v4:
- disable the size check when ext* rootfs is disabled
- remove unneeded comment
- introduce a _WRAP symbol to actually select BR2_LEGACY when needed
  (Arnout)

changes v2->v3:
- reword commit log

changes v1->v2:
- rebase
- add default size value
---
 fs/ext2/Config.in |  2 +-
 fs/ext2/ext2.mk   | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index ec1b5f2c55..9c58ac62ed 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2/3/4 root filesystem"
-	select BR2_PACKAGE_HOST_MKE2IMG
+	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  Build an ext2/3/4 root filesystem
 
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 8a648dd66c..bff442ff18 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -10,18 +10,18 @@ EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
 EXT2_OPTS = \
-	-G $(BR2_TARGET_ROOTFS_EXT2_GEN) \
-	-R $(BR2_TARGET_ROOTFS_EXT2_REV) \
-	-B 1024 \
-	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
-	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
-	-r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
-	-l "$(EXT2_LABEL)"
+	-d $(TARGET_DIR) \
+	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
+	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
+	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
+	-L "$(EXT2_LABEL)"
 
-ROOTFS_EXT2_DEPENDENCIES = host-mke2img
+ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
+	rm -f $@
+	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
+		 $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endef
 
 rootfs-ext2-symlink:
-- 
2.13.2
