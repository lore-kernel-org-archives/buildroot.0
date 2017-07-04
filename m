From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 16:47:28 +0200
Subject: [Buildroot] [PATCH v5 4/5] fs/ext2: Add
	BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
In-Reply-To: <20170704144729.19753-1-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
Message-ID: <20170704144729.19753-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

This option lets the user specify mke2fs options and/or ext2/3/4
features.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v4->v5:
- turn the options to accept any mke2fs options, not only ext2/3/4
  features (Arnout)
- add explaination for the default value for this new option (Arnout)

changes v3->v4:
- none

changes v2->v3:
- none

changes v1->v2:
- rebase
---
 fs/ext2/Config.in | 17 +++++++++++++++++
 fs/ext2/ext2.mk   |  5 ++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index b2363940f0..9bbeb797a5 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -67,6 +67,23 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	  Traditionally, this has been 5%, and all ext-related tools still
 	  default to reserving 5% when creating a new ext filesystem.
 
+config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
+	string "additional mke2fs options"
+	default "-O ^64bit"
+	help
+	  Specify a space-separated list of mke2fs options, including any
+	  ext2/3/4 filesystem features.
+
+	  For more information about the mke2fs option, see the manual page
+	  mke2fs(8).
+
+	  For more information about the ext2/3/4 features which can be set,
+	  see then manual page ext4(5).
+
+	  The defaults disables the 64bit ext2/3/4 filesystem support since
+	  its has been enable lately in 2017 in uboot, so most of the uboot
+	  versions do not support it yet.
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index c8da9c4451..a4c4a7b3d3 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -9,6 +9,8 @@ ifeq ($(BR2_TARGET_ROOTFS_EXT)-$(EXT2_SIZE),y-)
 $(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
 endif
 
+EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
+
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
@@ -19,7 +21,8 @@ EXT2_OPTS = \
 	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
-	-L "$(EXT2_LABEL)"
+	-L "$(EXT2_LABEL)" \
+	$(EXT2_MKFS_OPTS)
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
-- 
2.13.2
