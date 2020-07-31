From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:26 +0200
Subject: [Buildroot] [PATCH 01/15] package/e2fsprogs: set xattrs for the
 root dir as well
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-2-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mke2fs binary copies the xattrs of the source directory when
creating an image, but this logic did not include the root directory of
the resulting image. A patch was sent upstream to fix this. Include the
patch in Buildroot to allow creating SELinux ready images at build time.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 ...-xattrs-to-the-root-directory-as-wel.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch

diff --git a/package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch b/package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
new file mode 100644
index 000000000000..2e9c3ccef0aa
--- /dev/null
+++ b/package/e2fsprogs/0001-create_inode-set-xattrs-to-the-root-directory-as-wel.patch
@@ -0,0 +1,46 @@
+From 1826d8965057bd84517156a4b75c81bdfdae9ebc Mon Sep 17 00:00:00 2001
+From: Antoine Tenart <antoine.tenart@bootlin.com>
+Date: Wed, 1 Jul 2020 10:06:03 +0200
+Subject: [PATCH] create_inode: set xattrs to the root directory as well
+
+populate_fs do copy the xattrs for all files and directories, but the
+root directory is skipped and as a result its extended attributes aren't
+set. This is an issue when using mkfs to build a full system image that
+can be used with SElinux in enforcing mode without making any runtime
+fix at first boot.
+
+This patch adds logic to set the root directory's extended attributes.
+
+[Uspstream status: sent to the mailing list and has a Reviewed-by tag,
+https://lore.kernel.org/linux-ext4/20200717100846.497546-1-antoine.tenart at bootlin.com/]
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+---
+ misc/create_inode.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index e8d1df6b55a5..fe66faf1b53d 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -1050,9 +1050,17 @@ errcode_t populate_fs2(ext2_filsys fs, ext2_ino_t parent_ino,
+ 	file_info.path_max_len = 255;
+ 	file_info.path = calloc(file_info.path_max_len, 1);
+ 
++	retval = set_inode_xattr(fs, root, source_dir);
++	if (retval) {
++		com_err(__func__, retval,
++			_("while copying xattrs on root directory"));
++		goto out;
++	}
++
+ 	retval = __populate_fs(fs, parent_ino, source_dir, root, &hdlinks,
+ 			       &file_info, fs_callbacks);
+ 
++out:
+ 	free(file_info.path);
+ 	free(hdlinks.hdl);
+ 	return retval;
+-- 
+2.26.2
+
-- 
2.26.2
