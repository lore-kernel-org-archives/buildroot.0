From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 10:31:10 +0200
Subject: [Buildroot] [PATCH] package/f2fs-tools: update version
Message-ID: <1467621070-15244-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a tag rather than a sha1, it's more obvious.
Remove the patch, it's been applied upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../0001-configure-add-check-for-fallocate.patch   | 46 ----------------------
 package/f2fs-tools/f2fs-tools.mk                   |  2 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 package/f2fs-tools/0001-configure-add-check-for-fallocate.patch

diff --git a/package/f2fs-tools/0001-configure-add-check-for-fallocate.patch b/package/f2fs-tools/0001-configure-add-check-for-fallocate.patch
deleted file mode 100644
index b7ead76..0000000
--- a/package/f2fs-tools/0001-configure-add-check-for-fallocate.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 265d97d02e8ef373653c76a339869985eb3ba27a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Mar 2015 15:10:35 -0300
-Subject: [PATCH] configure: add check for fallocate
-
-We need to check for fallocate() rather than just linux/falloc.h +
-FALLOC_FL_PUNCH_HOLE since in uClibc we've got both but still not
-fallocate() itself since it's only implemented in newer unreleased
-versions.
-
-Status: sent upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac             | 1 +
- mkfs/f2fs_format_utils.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ae451b8..900b84a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -68,6 +68,7 @@ AC_TYPE_SIZE_T
- # Checks for library functions.
- AC_FUNC_GETMNTENT
- AC_CHECK_FUNCS_ONCE([
-+	fallocate
- 	getmntent
- 	memset
- ])
-diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
-index a0f85f5..ddeafeb 100644
---- a/mkfs/f2fs_format_utils.c
-+++ b/mkfs/f2fs_format_utils.c
-@@ -46,7 +46,7 @@ int f2fs_trim_device()
- #if defined(WITH_BLKDISCARD) && defined(BLKDISCARD)
- 	MSG(0, "Info: Discarding device\n");
- 	if (S_ISREG(stat_buf.st_mode)) {
--#ifdef FALLOC_FL_PUNCH_HOLE
-+#if defined(HAVE_FALLOCATE) && defined(FALLOC_FL_PUNCH_HOLE)
- 		if (fallocate(config.fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
- 				range[0], range[1]) < 0) {
- 			MSG(0, "Info: fallocate(PUNCH_HOLE|KEEP_SIZE) is failed\n");
--- 
-2.0.5
-
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index e5c4a54..d3956c4 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = fd32210229d4ad7d1c916c74a0dfc150aae4c89e
+F2FS_TOOLS_VERSION = v1.6.1
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
-- 
2.7.4
