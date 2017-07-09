From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:35:42 +0200
Subject: [Buildroot] [git commit] fs/ext2: Add
	BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
Message-ID: <20170709133251.6268E7FA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b404b27d419bdca7da15c6bdad2c8a1e48f2cbad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option lets the user specify mke2fs options and/or ext2/3/4
features.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: improve wording a bit, fix typos.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in | 19 +++++++++++++++++++
 fs/ext2/ext2.mk   |  5 ++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 493f6c9..05c9e48 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -68,6 +68,25 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	  Traditionally, this has been 5%, and all ext-related tools still
 	  default to reserving 5% when creating a new ext filesystem.
 
+config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
+	string "additional mke2fs options"
+	default "-O ^64bit"
+	help
+	  Specify a space-separated list of mke2fs options, including any
+	  ext2/3/4 filesystem features.
+
+	  For more information about the mke2fs options, see the manual
+	  page mke2fs(8).
+
+	  For more information about the ext2/3/4 features which can be
+	  set, see the manual page ext4(5).
+
+	  The default is "-O ^64bit", i.e. disable 64-bit filesystem
+	  support. This default value has been chosen because U-Boot
+	  versions before 2017.02 don't support this filesystem
+	  option: using it may make the filesystem unreadable by
+	  U-Boot.
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index fdd4a38..902e663 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -9,6 +9,8 @@ ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(EXT2_SIZE),y-)
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
 
