From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  3 Jul 2017 17:51:52 +0200
Subject: [Buildroot] [PATCH v2 4/6] fs/ext2: Add
	BR2_TARGET_ROOTFS_EXT2_FEATURES option
In-Reply-To: <20170703155154.24104-1-s.martin49@gmail.com>
References: <20170703155154.24104-1-s.martin49@gmail.com>
Message-ID: <20170703155154.24104-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

This option lets the user specify ext2/3/4 features.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- rebase
---
 fs/ext2/Config.in | 10 ++++++++++
 fs/ext2/ext2.mk   |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index d3e9d16a44..1b0ccf1395 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -63,6 +63,16 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	  Traditionally, this has been 5%, and all ext-related tools still
 	  default to reserving 5% when creating a new ext filesystem.
 
+config BR2_TARGET_ROOTFS_EXT2_FEATURES
+	string "Filesystem features"
+	default "^64bit"
+	help
+	  Specify a comma-separated list of ext2/3/4 features.
+	  For more information about this option, see the mkefs' -O option in
+	  the manual page mke2fs(8).
+	  For more information about the features which can be set, see then
+	  manual page ext4(5).
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 5269e99a29..7ab2b5cf8f 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -12,6 +12,11 @@ endif
 EXT2_OPTS = -d $(TARGET_DIR)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
 
+EXT2_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_FEATURES))
+ifneq ($(EXT2_FEATURES),)
+EXT2_OPTS += -O "$(EXT2_FEATURES)"
+endif
+
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 
 # qstrip results in stripping consecutive spaces into a single one. So the
-- 
2.13.2
