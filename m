From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 May 2015 19:30:58 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.13
Message-ID: <1432679458-15534-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes the security patch so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-fix-potential-buffer-overflow-in-closefs.patch | 59 ----------------------
 package/e2fsprogs/e2fsprogs.hash                   |  4 +-
 package/e2fsprogs/e2fsprogs.mk                     |  2 +-
 3 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch

diff --git a/package/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch b/package/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
deleted file mode 100644
index bcf3083..0000000
--- a/package/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 49d0fe2a14f2a23da2fe299643379b8c1d37df73 Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Fri, 6 Feb 2015 12:46:39 -0500
-Subject: [PATCH] libext2fs: fix potential buffer overflow in closefs()
-
-Upstream commit 49d0fe2a14f2.
-
-The bug fix in f66e6ce4446: "libext2fs: avoid buffer overflow if
-s_first_meta_bg is too big" had a typo in the fix for
-ext2fs_closefs().  In practice most of the security exposure was from
-the openfs path, since this meant if there was a carefully crafted
-file system, buffer overrun would be triggered when the file system was
-opened.
-
-However, if corrupted file system didn't trip over some corruption
-check, and then the file system was modified via tune2fs or debugfs,
-such that the superblock was marked dirty and then written out via the
-closefs() path, it's possible that the buffer overrun could be
-triggered when the file system is closed.
-
-Also clear up a signed vs unsigned warning while we're at it.
-
-Thanks to Nick Kralevich <nnk@google.com> for asking me to look at
-compiler warning in the code in question, which led me to notice the
-bug in f66e6ce4446.
-
-Addresses: CVE-2015-1572
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- lib/ext2fs/closefs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/ext2fs/closefs.c b/lib/ext2fs/closefs.c
-index 1f9911311a1a..ab5b2fb2365e 100644
---- a/lib/ext2fs/closefs.c
-+++ b/lib/ext2fs/closefs.c
-@@ -287,7 +287,7 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
- 	dgrp_t		j;
- #endif
- 	char	*group_ptr;
--	int	old_desc_blocks;
-+	blk64_t	old_desc_blocks;
- 	struct ext2fs_numeric_progress_struct progress;
- 
- 	EXT2_CHECK_MAGIC(fs, EXT2_ET_MAGIC_EXT2FS_FILSYS);
-@@ -346,7 +346,7 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
- 	group_ptr = (char *) group_shadow;
- 	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
- 		old_desc_blocks = fs->super->s_first_meta_bg;
--		if (old_desc_blocks > fs->super->s_first_meta_bg)
-+		if (old_desc_blocks > fs->desc_blocks)
- 			old_desc_blocks = fs->desc_blocks;
- 	} else
- 		old_desc_blocks = fs->desc_blocks;
--- 
-2.1.4
-
diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 8384296..1585037 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.42.12/sha256sums.asc
-sha256 6dadcd3b759195150d20154ab9d6516e3b3cbb35d66d461f55ae94a2854e7de8 e2fsprogs-1.42.12.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.42.13/sha256sums.asc
+sha256 e16474b5a3a30f9197160c4b91bd48d5a463583049c0fcc405b6f0f7075aa0c7 e2fsprogs-1.42.13.tar.xz
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fd77638..e0c4ee2 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.42.12
+E2FSPROGS_VERSION = 1.42.13
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
-- 
2.3.6
