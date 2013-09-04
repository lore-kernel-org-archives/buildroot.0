From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:26:38 -0500
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.23
Message-ID: <1378337198-29945-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 .../util-linux-001-sscanf-no-ms-as.patch           |  186 +++++++++++---------
 .../util-linux-002-add-missing-rpmatch.patch       |   51 ------
 ...l-linux-003-program-invocation-short-name.patch |   29 ++--
 .../util-linux/util-linux-004-xtensa-support.patch |   16 --
 package/util-linux/util-linux.mk                   |    2 +-
 5 files changed, 117 insertions(+), 167 deletions(-)
 delete mode 100644 package/util-linux/util-linux-002-add-missing-rpmatch.patch
 delete mode 100644 package/util-linux/util-linux-004-xtensa-support.patch

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index 6ba7bab..5d08b9b 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -1,13 +1,12 @@
 Fix libmount build under uClibc
 
 See https://bugs.gentoo.org/show_bug.cgi?id=406303
-Patch from http://repository.timesys.com/buildsources/u/util-linux/util-linux-2.21.2/util-linux-2.21.2-sscanf-no-ms-as.patch ported to util-linux-2.22.2
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
+ported to util-linux-2.23.2
 
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura util-linux-2.22.2/configure.ac util-linux-2.22.2-sscanf-no-ms-as/configure.ac
---- util-linux-2.22.2/configure.ac	2012-12-13 08:16:02.973822890 -0300
-+++ util-linux-2.22.2-sscanf-no-ms-as/configure.ac	2013-03-07 14:50:39.975512873 -0300
+diff -Nura a/configure.ac b/configure.ac
+--- a/configure.ac	2012-12-13 08:16:02.973822890 -0300
++++ b/configure.ac	2013-03-07 14:50:39.975512873 -0300
 @@ -733,7 +733,6 @@
  UL_BUILD_INIT([libmount])
  UL_REQUIRES_LINUX([libmount])
@@ -16,99 +15,124 @@ diff -Nura util-linux-2.22.2/configure.ac util-linux-2.22.2-sscanf-no-ms-as/conf
  AM_CONDITIONAL(BUILD_LIBMOUNT, test "x$build_libmount" = xyes)
  AM_CONDITIONAL(BUILD_LIBMOUNT_TESTS, test "x$build_libmount" = xyes -a "x$enable_static" = xyes)
 
-diff -Nura util-linux-2.22.2/libmount/src/tab_parse.c util-linux-2.22.2-sscanf-no-ms-as/libmount/src/tab_parse.c
---- util-linux-2.22.2/libmount/src/tab_parse.c	2012-12-12 17:04:47.906355128 -0300
-+++ util-linux-2.22.2-sscanf-no-ms-as/libmount/src/tab_parse.c	2013-03-07 15:08:29.589503961 -0300
-@@ -58,19 +58,21 @@
-  */
- static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
+diff -Nura a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
+--- a/libmount/src/tab_parse.c	2013-07-30 03:39:26.218738358 -0500
++++ b/libmount/src/tab_parse.c	2013-09-04 11:22:26.332917445 -0500
+@@ -22,6 +22,10 @@
+ #include "pathnames.h"
+ #include "strutils.h"
+ 
++#ifndef HAVE_SCANF_MS_MODIFIER
++# define UL_SCNsA "%s"
++#endif
++
+ static inline char *skip_spaces(char *s)
  {
--	int rc, n = 0, xrc;
--	char *src = NULL, *fstype = NULL, *optstr = NULL;
--
--	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
--			UL_SCNsA" "	/* (2) target */
--			UL_SCNsA" "	/* (3) FS type */
--			UL_SCNsA" "	/* (4) options */
-+	int rc, n = 0, len = strlen (s) + 1, xrc;
-+	char *src     = malloc (sizeof *src * len);
-+	char *fstype  = malloc (sizeof *fstype * len);
-+	char *optstr  = malloc (sizeof *optstr * len);
+ 	assert(s);
+@@ -61,16 +65,31 @@
+ 	int rc, n = 0, xrc;
+ 	char *src = NULL, *fstype = NULL, *optstr = NULL;
+ 
++#ifndef HAVE_SCANF_MS_MODIFIER
++	size_t len = strlen(s) + 1;
++	src = malloc(len);
++	fstype = malloc(len);
++	fs->target = malloc(len);
++	optstr = malloc(len);
++#endif
 +
-+	rc = sscanf(s,	"%s"" "	/* (1) source */
-+			"%s"" "	/* (2) target */
-+			"%s"" "	/* (3) FS type */
-+			"%s"" "	/* (4) options */
+ 	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
+ 			UL_SCNsA" "	/* (2) target */
+ 			UL_SCNsA" "	/* (3) FS type */
+ 			UL_SCNsA" "	/* (4) options */
  			"%n",		/* byte count */
  
--			&src,
--			&fs->target,
--			&fstype,
--			&optstr,
++#ifdef HAVE_SCANF_MS_MODIFIER
+ 			&src,
+ 			&fs->target,
+ 			&fstype,
+ 			&optstr,
++#else
 +			src,
 +			fs->target,
 +			fstype,
 +			optstr,
++#endif
  			&n);
-	xrc = rc;
+ 	xrc = rc;
  
-@@ -132,16 +134,20 @@
-  */
- static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
- {
--	int rc, end = 0;
-+	int rc, end = 0, len = strlen (s) + 1;
+@@ -136,6 +155,16 @@
  	unsigned int maj, min;
-	char *fstype = NULL, *src = NULL, *p;
+ 	char *fstype = NULL, *src = NULL, *p;
  
-+	fs->root        = malloc (sizeof *fs->root * len);
-+	fs->target      = malloc (sizeof *fs->target * len);
-+	fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
++#ifndef HAVE_SCANF_MS_MODIFIER
++	size_t len = strlen(s) + 1;
++	fs->root = malloc(len);
++	fs->target = malloc(len);
++	fs->vfs_optstr = malloc(len);
++	fs->fs_optstr = malloc(len);
++	fstype = malloc(len);
++	src = malloc(len);
++#endif
 +
  	rc = sscanf(s,	"%u "		/* (1) id */
  			"%u "		/* (2) parent */
  			"%u:%u "	/* (3) maj:min */
--			UL_SCNsA" "	/* (4) mountroot */
--			UL_SCNsA" "	/* (5) target */
--			UL_SCNsA	/* (6) vfs options (fs-independent) */
-+			"%s"" "	/* (4) mountroot */
-+			"%s"" "	/* (5) target */
-+			"%s"	/* (6) vfs options (fs-independent) */
- 			"%n",		/* number of read bytes */
- 
+@@ -147,9 +176,15 @@
  			&fs->id,
-@@ -163,9 +169,14 @@
- 	}
- 	s = p + 3;
+ 			&fs->parent,
+ 			&maj, &min,
++#ifdef HAVE_SCANF_MS_MODIFIER
+ 			&fs->root,
+ 			&fs->target,
+ 			&fs->vfs_optstr,
++#else
++			fs->root,
++			fs->target,
++			fs->vfs_optstr,
++#endif
+ 			&end);
  
--	rc += sscanf(s,	UL_SCNsA" "	/* (8) FS type */
--			UL_SCNsA" "	/* (9) source */
--			UL_SCNsA,	/* (10) fs options (fs specific) */
-+	len           = strlen (s) + 1;
-+	fstype        = malloc (sizeof *fstype * len);
-+	src           = malloc (sizeof *src * len);
-+	fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
-+
-+	rc += sscanf(s,	"%s"" "	/* (8) FS type */
-+			"%s"" "	/* (9) source */
-+			"%s",	/* (10) fs options (fs specific) */
+ 	if (rc >= 7 && end > 0)
+@@ -169,9 +204,15 @@
+ 			UL_SCNsA" "	/* (9) source */
+ 			UL_SCNsA,	/* (10) fs options (fs specific) */
  
++#ifdef HAVE_SCANF_MS_MODIFIER
  			&fstype,
  			&src,
-@@ -274,11 +285,12 @@
- static int mnt_parse_swaps_line(struct libmnt_fs *fs, char *s)
- {
-	uintmax_t fsz, usz;
--	int rc;
--	char *src = NULL;
-+	int rc, len = strlen (s) + 1;
-+	char *src = malloc (sizeof *src * len);
-+	fs->swaptype = malloc (sizeof *fs->swaptype * len);
-
--	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
--			UL_SCNsA" "	/* (2) type */
-+	rc = sscanf(s,	"%s"		/* (1) source */
-+			"%s"		/* (2) type */
-			"%jd"		/* (3) size */
-			"%jd"		/* (4) used */
-			"%d",		/* priority */
+ 			&fs->fs_optstr);
++#else
++			fstype,
++			src,
++			fs->fs_optstr);
++#endif
+ 
+ 	if (rc >= 10) {
+ 		fs->flags |= MNT_FS_KERNEL;
+@@ -279,14 +320,25 @@
+ 	int rc;
+ 	char *src = NULL;
+ 
++#ifndef HAVE_SCANF_MS_MODIFIER
++	size_t len = strlen(s) + 1;
++	src = malloc(len);
++	fs->swaptype = malloc(len);
++#endif
++
+ 	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
+ 			UL_SCNsA" "	/* (2) type */
+ 			"%jd"		/* (3) size */
+ 			"%jd"		/* (4) used */
+ 			"%d",		/* priority */
+ 
++#ifndef HAVE_SCANF_MS_MODIFIER
+ 			&src,
+ 			&fs->swaptype,
++#else
++			src,
++			fs->swaptype,
++#endif
+ 			&fsz,
+ 			&usz,
+ 			&fs->priority);
diff --git a/package/util-linux/util-linux-002-add-missing-rpmatch.patch b/package/util-linux/util-linux-002-add-missing-rpmatch.patch
deleted file mode 100644
index d311e3f..0000000
--- a/package/util-linux/util-linux-002-add-missing-rpmatch.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 51924a4ef0dd8f4906729cb6760d1929049c1983 Mon Sep 17 00:00:00 2001
-From: William Pitcock <nenolod@dereferenced.org>
-Date: Wed, 20 Feb 2013 13:04:02 +0100
-Subject: [PATCH] add missing rpmatch.h everywhere it needs to be
-
-Signed-off-by: William Pitcock <nenolod@dereferenced.org>
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/fsck.minix.c | 1 +
- login-utils/vipw.c      | 1 +
- term-utils/mesg.c       | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/disk-utils/fsck.minix.c b/disk-utils/fsck.minix.c
-index 1426950..3482200 100644
---- a/disk-utils/fsck.minix.c
-+++ b/disk-utils/fsck.minix.c
-@@ -111,6 +111,7 @@
- #include "ismounted.h"
- #include "all-io.h"
- #include "closestream.h"
-+#include "rpmatch.h"
-
- #define ROOT_INO 1
- #define YESNO_LENGTH 64
-diff --git a/login-utils/vipw.c b/login-utils/vipw.c
-index 20c05c2..8c47801 100644
---- a/login-utils/vipw.c
-+++ b/login-utils/vipw.c
-@@ -78,6 +78,7 @@
- #include "setpwnam.h"
- #include "strutils.h"
- #include "xalloc.h"
-+#include "rpmatch.h"
-
- #ifdef HAVE_LIBSELINUX
- # include <selinux/selinux.h>
-diff --git a/term-utils/mesg.c b/term-utils/mesg.c
-index 6ac5a2e..430236f 100644
---- a/term-utils/mesg.c
-+++ b/term-utils/mesg.c
-@@ -58,6 +58,7 @@
- #include "closestream.h"
- #include "nls.h"
- #include "c.h"
-+#include "rpmatch.h"
-
- /* exit codes */
-
---
-1.8.1.5
diff --git a/package/util-linux/util-linux-003-program-invocation-short-name.patch b/package/util-linux/util-linux-003-program-invocation-short-name.patch
index 2d2fa5d..5d04e35 100644
--- a/package/util-linux/util-linux-003-program-invocation-short-name.patch
+++ b/package/util-linux/util-linux-003-program-invocation-short-name.patch
@@ -1,18 +1,11 @@
-uClibc build fix: program_invocation_short_name is defined in errno.h
-and not argp.h
-Update to util-linux-2.22.2 from a previous patch by Khem.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura util-linux-2.22.2.orig/configure.ac util-linux-2.22.2/configure.ac
---- util-linux-2.22.2.orig/configure.ac	2013-03-07 15:16:18.912418476 -0300
-+++ util-linux-2.22.2/configure.ac	2013-03-07 15:16:25.909640745 -0300
-@@ -372,7 +372,7 @@
-
-
- AC_MSG_CHECKING(whether program_invocation_short_name is defined)
--AC_TRY_COMPILE([#include <argp.h>],
-+AC_TRY_COMPILE([#include <errno.h>],
-	       [program_invocation_short_name = "test";],
-	       AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
-			 [Define if program_invocation_short_name is defined])
+--- a/configure.ac	2013-07-30 03:39:26.188738061 -0500
++++ b/configure.ac	2013-08-27 16:20:09.882953093 -0500
+@@ -386,7 +386,7 @@
+ 
+ AC_MSG_CHECKING([whether program_invocation_short_name is defined])
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+-	#include <argp.h>
++	#include <errno.h>
+ ]], [[
+ 	program_invocation_short_name = "test";
+ ]])], [
diff --git a/package/util-linux/util-linux-004-xtensa-support.patch b/package/util-linux/util-linux-004-xtensa-support.patch
deleted file mode 100644
index abec5d9..0000000
--- a/package/util-linux/util-linux-004-xtensa-support.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Forward-port of xtensa support patch to util-linux-2.22.2 by ??
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura util-linux-2.22.2/fdisks/fdiskbsdlabel.h util-linux-2.22.2.xtensa/fdisks/fdiskbsdlabel.h
---- util-linux-2.22.2/fdisks/fdiskbsdlabel.h	2012-12-12 17:04:47.898355058 -0300
-+++ util-linux-2.22.2.xtensa/fdisks/fdiskbsdlabel.h	2013-03-07 18:17:32.292723061 -0300
-@@ -48,7 +48,7 @@
-
- #if defined (__i386__) || defined (__sparc__) || defined (__arm__) || \
-     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
--    defined (__aarch64__) || \
-+    defined (__aarch64__) || defined (__xtensa__) || \
-     defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
- #define BSD_LABELSECTOR   1
- #define BSD_LABELOFFSET   0
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c6c8467..6f79e74 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
-UTIL_LINUX_VERSION_MAJOR = 2.22
+UTIL_LINUX_VERSION_MAJOR = 2.23
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
1.7.1
