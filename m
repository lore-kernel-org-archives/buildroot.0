From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 13:21:16 +0200
Subject: [Buildroot] [PATCH v4 1/5] fs/ext2: add option to specify block size
In-Reply-To: <20170704112120.27977-1-s.martin49@gmail.com>
References: <20170704112120.27977-1-s.martin49@gmail.com>
Message-ID: <20170704112120.27977-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v3->v4:
- fix typos (Arnout)

changes v2->v3:
- reintroduce change from Yann' series
---
 fs/ext2/Config.in | 28 ++++++++++++++++++++++++++--
 fs/ext2/ext2.mk   |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 6f16dde17f..ec69f05cb7 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -44,12 +44,36 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 
-# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
+choice
+	bool "block size"
+	help
+	  The size, in bytes, of a block.
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCK_1024
+	bool "1024"
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCK_2048
+	bool "2048"
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCK_4096
+	bool "4096"
+
+endchoice
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE
+	int
+	default 1024 if BR2_TARGET_ROOTFS_EXT2_BLOCK_1024
+	default 2048 if BR2_TARGET_ROOTFS_EXT2_BLOCK_2048
+	default 4096 if BR2_TARGET_ROOTFS_EXT2_BLOCK_4096
+
+# 61440 block of 1024 bytes = 60MB, i.e usually small enough to fit
+# on a 64MB media
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "exact size in blocks"
 	default 61440
 	help
-	  Specify the file system size as a number of 1024-byte blocks.
+	  Specify the file system size as a number of blocks, which
+	  size is specified above.
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 0d5fc7f118..ec49caa3a5 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -12,7 +12,7 @@ EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 EXT2_OPTS = \
 	-G $(BR2_TARGET_ROOTFS_EXT2_GEN) \
 	-R $(BR2_TARGET_ROOTFS_EXT2_REV) \
-	-B 1024 \
+	-B $(BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE) \
 	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
 	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES) \
-- 
2.13.2
