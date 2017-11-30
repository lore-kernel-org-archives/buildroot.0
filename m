From: Keith Mok <ek9852@gmail.com>
Date: Thu, 30 Nov 2017 12:56:31 -0800
Subject: [Buildroot] [PATCH 2/2] android-tools: upport char, block, fifo,
 socket devices
In-Reply-To: <20171130205631.93251-1-ek9852@gmail.com>
References: <20171130205631.93251-1-ek9852@gmail.com>
Message-ID: <20171130205631.93251-2-ek9852@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pick changes from openwrt to enable support of special
device for make_ext4fs
---
 ...ment-support-for-block-and-char-dev-nodes.patch | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 package/android-tools/0009-PATCH-Implement-support-for-block-and-char-dev-nodes.patch

diff --git a/package/android-tools/0009-PATCH-Implement-support-for-block-and-char-dev-nodes.patch b/package/android-tools/0009-PATCH-Implement-support-for-block-and-char-dev-nodes.patch
new file mode 100644
index 0000000..e86d9c6
--- /dev/null
+++ b/package/android-tools/0009-PATCH-Implement-support-for-block-and-char-dev-nodes.patch
@@ -0,0 +1,109 @@
+From 3258b175c3ea1f76823c6b69b5036ac7efb5599d Mon Sep 17 00:00:00 2001
+From: Jo-Philipp Wich <jow@openwrt.org>
+Date: Thu, 30 Nov 2017 10:10:24 -0800
+Subject: [PATCH] [PATCH] Implement support for block and char dev nodes, fifos
+ and sockets.
+
+Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>
+Signed-off-by: Keith Mok <ek9852@gmail.com>
+---
+ extras/ext4_utils/contents.c    | 45 +++++++++++++++++++++++++++++++++++++++++
+ extras/ext4_utils/contents.h    |  1 +
+ extras/ext4_utils/make_ext4fs.c |  6 +++++-
+ 3 files changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/extras/ext4_utils/contents.c b/extras/ext4_utils/contents.c
+index 6300680..b11ecba 100644
+--- a/extras/ext4_utils/contents.c
++++ b/extras/ext4_utils/contents.c
+@@ -225,6 +225,51 @@ u32 make_link(const char *filename, const char *link)
+ 	return inode_num;
+ }
+ 
++/* Creates a special file on disk.  Returns the inode number of the new file */
++u32 make_special(const char *path)
++{
++	struct ext4_inode *inode;
++	struct stat s;
++	u32 inode_num;
++	u32 devmajor;
++	u32 devminor;
++
++	if (stat(path, &s)) {
++		error("failed to stat file\n");
++		return EXT4_ALLOCATE_FAILED;
++	}
++
++	inode_num = allocate_inode(info);
++	if (inode_num == EXT4_ALLOCATE_FAILED) {
++		error("failed to allocate inode\n");
++		return EXT4_ALLOCATE_FAILED;
++	}
++
++	inode = get_inode(inode_num);
++	if (inode == NULL) {
++		error("failed to get inode %u", inode_num);
++		return EXT4_ALLOCATE_FAILED;
++	}
++
++	inode->i_mode = s.st_mode & S_IFMT;
++	inode->i_links_count = 1;
++	inode->i_flags |= aux_info.default_i_flags;
++
++	devmajor = major(s.st_rdev);
++	devminor = minor(s.st_rdev);
++
++	if ((devmajor < 256) && (devminor < 256)) {
++		inode->i_block[0] = devmajor * 256 + devminor;
++		inode->i_block[1] = 0;
++	} else {
++		inode->i_block[0] = 0;
++		inode->i_block[1] = (devminor & 0xff) | (devmajor << 8) |
++			((devminor & ~0xff) << 12);
++	}
++
++	return inode_num;
++}
++
+ int inode_set_permissions(u32 inode_num, u16 mode, u16 uid, u16 gid, u32 mtime)
+ {
+ 	struct ext4_inode *inode = get_inode(inode_num);
+diff --git a/extras/ext4_utils/contents.h b/extras/ext4_utils/contents.h
+index 35867fd..b155429 100644
+--- a/extras/ext4_utils/contents.h
++++ b/extras/ext4_utils/contents.h
+@@ -36,6 +36,7 @@ u32 make_directory(u32 dir_inode_num, u32 entries, struct dentry *dentries,
+ 	u32 dirs);
+ u32 make_file(const char *filename, u64 len);
+ u32 make_link(const char *filename, const char *link);
++u32 make_special(const char *path);
+ int inode_set_permissions(u32 inode_num, u16 mode, u16 uid, u16 gid, u32 mtime);
+ int inode_set_selinux(u32 inode_num, const char *secon);
+ #endif
+diff --git a/extras/ext4_utils/make_ext4fs.c b/extras/ext4_utils/make_ext4fs.c
+index b2d1426..70c4284 100644
+--- a/extras/ext4_utils/make_ext4fs.c
++++ b/extras/ext4_utils/make_ext4fs.c
+@@ -70,7 +70,6 @@
+ /* TODO: Not implemented:
+    Allocating blocks in the same block group as the file inode
+    Hash or binary tree directories
+-   Special files: sockets, devices, fifos
+  */
+ 
+ static int filter_dot(const struct dirent *d)
+@@ -259,6 +258,11 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+ 			free(subdir_dir_path);
+ 		} else if (dentries[i].file_type == EXT4_FT_SYMLINK) {
+ 			entry_inode = make_link(dentries[i].full_path, dentries[i].link);
++		} else if (dentries[i].file_type == EXT4_FT_CHRDEV ||
++		           dentries[i].file_type == EXT4_FT_BLKDEV ||
++		           dentries[i].file_type == EXT4_FT_SOCK ||
++		           dentries[i].file_type == EXT4_FT_FIFO) {
++			entry_inode = make_special(dentries[i].full_path);
+ 		} else {
+ 			error("unknown file type on %s", dentries[i].path);
+ 			entry_inode = 0;
+-- 
+2.13.6 (Apple Git-96)
+
-- 
2.7.4
