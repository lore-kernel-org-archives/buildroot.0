From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 24 Jan 2017 21:10:18 -0600
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: Fix debugfs ls -p option
Message-ID: <1485313818-842-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

The debugfs "ls -p" option can print out invalid characters that the
other ls options do not print out. This patch fixes the issue by
utilizing the same file name print function that the other ls options
use.

Upstream: https://patchwork.ozlabs.org/patch/707942/

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 ...debugfs-ls-p-can-print-invalid-characters.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/e2fsprogs/0003-debugfs-ls-p-can-print-invalid-characters.patch

diff --git a/package/e2fsprogs/0003-debugfs-ls-p-can-print-invalid-characters.patch b/package/e2fsprogs/0003-debugfs-ls-p-can-print-invalid-characters.patch
new file mode 100644
index 0000000..7930d3f
--- /dev/null
+++ b/package/e2fsprogs/0003-debugfs-ls-p-can-print-invalid-characters.patch
@@ -0,0 +1,34 @@
+From bbe22bbb4b46b70cea9eb368fd15b6f651c8ddce Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Thu, 15 Dec 2016 08:40:21 -0600
+Subject: [PATCH] debugfs: ls -p can print invalid characters
+
+The recent modification to the "ls -p" function can print out characters
+that the other ls functions do not print out. Adding a slight change to
+use the same print function for all of the ls options.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ debugfs/ls.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/debugfs/ls.c b/debugfs/ls.c
+index 057e3f6..cb40627 100644
+--- a/debugfs/ls.c
++++ b/debugfs/ls.c
+@@ -122,8 +122,10 @@ static int list_dir_proc(ext2_ino_t dir EXT2FS_ATTR((unused)),
+ 				return 0;
+ 		} else
+ 			memset(&inode, 0, sizeof(struct ext2_inode));
+-		fprintf(ls->f,"/%u/%06o/%d/%d/%*s/", ino, inode.i_mode,
+-			inode.i_uid, inode.i_gid, thislen, dirent->name);
++		fprintf(ls->f,"/%u/%06o/%d/%d/", ino, inode.i_mode,
++			inode.i_uid, inode.i_gid);
++		print_filename(ls->f, dirent, options);
++		fputc('/', ls->f);
+ 		if (LINUX_S_ISDIR(inode.i_mode))
+ 			fprintf(ls->f, "/");
+ 		else
+-- 
+1.9.1
+
-- 
1.9.1
