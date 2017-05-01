From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:44 +0200
Subject: [Buildroot] [PATCH 9/9] fs/ext2: add option to specify block size
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <c85507a4104956f6597a910e729118309f3ff432.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/Config.in | 28 ++++++++++++++++++++++++++--
 fs/ext2/ext2.mk   |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 09ec87786f..627294e17f 100644
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
+# 61440 block od 1024 bytes = 60MB, i.e usually small enough to fit
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
2.11.0
