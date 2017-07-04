From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:35:00 +0200
Subject: [Buildroot] [git commit] fs/ext2: deprecate
	BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option
Message-ID: <20170704223652.C4E78817A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=235b6f17a0e38d854245d451bfc55bf82c3bbfc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Soon, the ext{2,3,4} rootfs image will no longer be generated with
genext2fs, but using mke2fs instead which has no support for the extra
inode number option.

So, deprecate the BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option and
recommend, in lieu, to set the total inode number, taking account of
the extra ones if needed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy  | 15 +++++++++++++++
 fs/ext2/Config.in |  8 --------
 fs/ext2/ext2.mk   |  1 -
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f1a1b8a..2b88ddf 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,21 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
+	int "ext2 extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
+	default 0
+	help
+	  Buildroot now uses mkfs.ext2/3/4 to generate ext2/3/4
+	  images. It now automatically selects the number of inodes
+	  based on the image size. The extra number of inodes can no
+	  longer be provided; instead, provide the total number of
+	  inodes needed in BR2_TARGET_ROOTFS_EXT2_INODES.
+
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES != 0
+	select BR2_LEGACY
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE
 	bool "cdxaparse removed"
 	select BR2_LEGACY
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 6f16dde..ec1b5f2 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -55,14 +55,6 @@ config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
 	default 0
 
-config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
-	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
-	default 0
-	help
-	  Enter here the number of extra free inodes you want on
-	  your filesystem. By default, Buildroot will not leave
-	  many free inodes.
-
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
 	default 5
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 0d5fc7f..8a648dd 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -15,7 +15,6 @@ EXT2_OPTS = \
 	-B 1024 \
 	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
 	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
-	-I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES) \
 	-r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-l "$(EXT2_LABEL)"
 
