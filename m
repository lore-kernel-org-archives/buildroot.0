From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Jan 2018 20:34:14 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: fix build for big-endian targets
Message-ID: <3fce58cd3f9cb7a180135ebc04cae4598489a59e.1515868454.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing two issues with big-endian target build.

Fixes:
http://autobuild.buildroot.net/results/33f/33f54b271843f926c94b8261b0d7e708987da407/
http://autobuild.buildroot.net/results/0f0/0f01192b03049f2042d318b3a2589ecc19d1cdd7/
http://autobuild.buildroot.net/results/4d2/4d2c5457a9c9a31d86409ca78fbc6d776fba6248/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ix-build-failure-in-swapfs.c-on-big-endia.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch

diff --git a/package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch b/package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
new file mode 100644
index 000000000000..526157d7e908
--- /dev/null
+++ b/package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
@@ -0,0 +1,41 @@
+From 876d9b0c8eac2fd80dd62bfa1b09adea62aa08f3 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Wed, 3 Jan 2018 01:32:02 -0500
+Subject: [PATCH] libext2fs: fix build failure in swapfs.c on big-endian
+ systems
+
+Addresses-Debian-Bug: #886119
+
+Reported-by: James Clarke <jrtc27@debian.org>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 876d9b0c8eac
+
+ lib/ext2fs/swapfs.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ext2fs/swapfs.c b/lib/ext2fs/swapfs.c
+index 6e5cff97e505..b13dc4229225 100644
+--- a/lib/ext2fs/swapfs.c
++++ b/lib/ext2fs/swapfs.c
+@@ -19,6 +19,7 @@
+ 
+ #include "ext2_fs.h"
+ #include "ext2fs.h"
++#include "ext2fsP.h"
+ #include <ext2fs/ext2_ext_attr.h>
+ 
+ #ifdef WORDS_BIGENDIAN
+@@ -358,7 +359,7 @@ void ext2fs_swap_inode_full(ext2_filsys fs, struct ext2_inode_large *t,
+ 	if (inode_includes(inode_size, i_projid))
+                 t->i_projid = ext2fs_swab16(f->i_projid);
+ 	/* catch new static fields added after i_projid */
+-	EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
++	EXT2FS_BUILD_BUG_ON(sizeof(struct ext2_inode_large) != 160);
+ 
+ 	i = sizeof(struct ext2_inode) + extra_isize + sizeof(__u32);
+ 	if (bufsize < (int) i)
+-- 
+2.15.1
+
-- 
2.15.1
