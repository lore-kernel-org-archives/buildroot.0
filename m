From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Feb 2018 22:54:13 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: bump version to 1.43.9
Message-ID: <20180218215413.3656-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch as it
is now upstream.

Only contains minor bugfixes since 1.43.8 and no new features.

From the release notes:

Remove the huge file flag from libe2p (and hence from chattr/lsattr),
since it was never made visible by the kernel.  Remove the description
of some compression related flags, and add a description of the
encrypted file flag, and the project hierarchy flag.

Remove a misplaced "MNP is unsupported" message from debugfs.

Fix a build failure in lib/ext2fs/swapfs.c on big-endian systems.
(Addresses Debian Bug #886119)

Fix various Debian packaging issues.  (Addresses Debian Bug #269569).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-build-failure-in-swapfs.c-on-big-endia.patch | 41 ----------------------
 package/e2fsprogs/e2fsprogs.hash                   |  4 +--
 package/e2fsprogs/e2fsprogs.mk                     |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch

diff --git a/package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch b/package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
deleted file mode 100644
index 526157d7e9..0000000000
--- a/package/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 876d9b0c8eac2fd80dd62bfa1b09adea62aa08f3 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Wed, 3 Jan 2018 01:32:02 -0500
-Subject: [PATCH] libext2fs: fix build failure in swapfs.c on big-endian
- systems
-
-Addresses-Debian-Bug: #886119
-
-Reported-by: James Clarke <jrtc27@debian.org>
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 876d9b0c8eac
-
- lib/ext2fs/swapfs.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/ext2fs/swapfs.c b/lib/ext2fs/swapfs.c
-index 6e5cff97e505..b13dc4229225 100644
---- a/lib/ext2fs/swapfs.c
-+++ b/lib/ext2fs/swapfs.c
-@@ -19,6 +19,7 @@
- 
- #include "ext2_fs.h"
- #include "ext2fs.h"
-+#include "ext2fsP.h"
- #include <ext2fs/ext2_ext_attr.h>
- 
- #ifdef WORDS_BIGENDIAN
-@@ -358,7 +359,7 @@ void ext2fs_swap_inode_full(ext2_filsys fs, struct ext2_inode_large *t,
- 	if (inode_includes(inode_size, i_projid))
-                 t->i_projid = ext2fs_swab16(f->i_projid);
- 	/* catch new static fields added after i_projid */
--	EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
-+	EXT2FS_BUILD_BUG_ON(sizeof(struct ext2_inode_large) != 160);
- 
- 	i = sizeof(struct ext2_inode) + extra_isize + sizeof(__u32);
- 	if (bufsize < (int) i)
--- 
-2.15.1
-
diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index da5d5f4110..3def51f95b 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.8/sha256sums.asc
-sha256 c0841d5fe724d49132158850f3975e886fccfcef642878dca2425a1b5d30b12a  e2fsprogs-1.43.8.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.9/sha256sums.asc
+sha256 926f8e8de1ffba55d791f21b71334e8a32b5227257ad370f2bf7e4396629e97f  e2fsprogs-1.43.9.tar.xz
 # Locally calculated
 sha256 680f852df303874fe9c722283a7da571ae9a0477768df8af1e363298e2adc51e  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e77b10f26d..99019c7317 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.43.8
+E2FSPROGS_VERSION = 1.43.9
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.11.0
