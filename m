From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Feb 2013 23:52:07 +0100
Subject: [Buildroot] [PATCH 1/3] util-linux: add numbers to patches
Message-ID: <1360018329-3911-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are going to add an Xtensa related patch that needs to be
applied *after* the AArch64 patch, let's first add a number to each
util-linux patch file name, so that we know they will be applied in
the right order.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../util-linux-001-sscanf-no-ms-as.patch           |   87 ++++++++++++++++++++
 .../util-linux-002-uclibc-build-fix.patch          |   16 ++++
 .../util-linux-003-fdisk-aarch64-support.patch     |   22 +++++
 .../util-linux-fdisk-aarch64-support.patch         |   22 -----
 .../util-linux/util-linux-sscanf-no-ms-as.patch    |   87 --------------------
 .../util-linux/util-linux-uclibc-build-fix.patch   |   16 ----
 6 files changed, 125 insertions(+), 125 deletions(-)
 create mode 100644 package/util-linux/util-linux-001-sscanf-no-ms-as.patch
 create mode 100644 package/util-linux/util-linux-002-uclibc-build-fix.patch
 create mode 100644 package/util-linux/util-linux-003-fdisk-aarch64-support.patch
 delete mode 100644 package/util-linux/util-linux-fdisk-aarch64-support.patch
 delete mode 100644 package/util-linux/util-linux-sscanf-no-ms-as.patch
 delete mode 100644 package/util-linux/util-linux-uclibc-build-fix.patch

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
new file mode 100644
index 0000000..5b0ac36
--- /dev/null
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -0,0 +1,87 @@
+[PATCH] Fix libmount build under uClibc
+
+Taken from gentoo-hardened:
+http://git.overlays.gentoo.org/gitweb/?p=proj/hardened-dev.git;a=commit;h=91879751
+
+For details, see https://bugs.gentoo.org/show_bug.cgi?id=406303
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/libmount/src/tab_parse.c
+--- util-linux-2.20.1.orig/libmount/src/tab_parse.c	2011-12-12 20:51:06.646614964 -0500
++++ util-linux-2.20.1/libmount/src/tab_parse.c	2011-12-12 21:02:03.587865010 -0500
+@@ -51,19 +51,21 @@
+  */
+ static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
+ {
+-	int rc, n = 0;
+-	char *src, *fstype, *optstr;
+-
+-	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
+-			UL_SCNsA" "	/* (2) target */
+-			UL_SCNsA" "	/* (3) FS type */
+-			UL_SCNsA" "	/* (4) options */
++	int rc, n = 0, len = strlen (s) + 1;
++	char *src     = malloc (sizeof *src * len);
++  char *fstype  = malloc (sizeof *fstype * len);
++  char *optstr  = malloc (sizeof *optstr * len);
++
++	rc = sscanf(s,	"%s"" "	/* (1) source */
++			"%s"" "	/* (2) target */
++			"%s"" "	/* (3) FS type */
++			"%s"" "	/* (4) options */
+ 			"%n",		/* byte count */
+ 
+-			&src,
+-			&fs->target,
+-			&fstype,
+-			&optstr,
++			src,
++			fs->target,
++			fstype,
++			optstr,
+ 			&n);
+ 
+ 	if (rc == 4) {
+@@ -108,16 +110,20 @@
+  */
+ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
+ {
+-	int rc, end = 0;
++	int rc, end = 0, len = strlen (s) + 1;
+ 	unsigned int maj, min;
+ 	char *fstype, *src, *p;
+ 
++  fs->root        = malloc (sizeof *fs->root * len);
++  fs->target      = malloc (sizeof *fs->target * len);
++  fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
++
+ 	rc = sscanf(s,	"%u "		/* (1) id */
+ 			"%u "		/* (2) parent */
+ 			"%u:%u "	/* (3) maj:min */
+-			UL_SCNsA" "	/* (4) mountroot */
+-			UL_SCNsA" "	/* (5) target */
+-			UL_SCNsA	/* (6) vfs options (fs-independent) */
++			"%s"" "	/* (4) mountroot */
++			"%s"" "	/* (5) target */
++			"%s"	/* (6) vfs options (fs-independent) */
+ 			"%n",		/* number of read bytes */
+ 
+ 			&fs->id,
+@@ -139,9 +145,14 @@
+ 	}
+ 	s = p + 3;
+ 
+-	rc += sscanf(s,	UL_SCNsA" "	/* (8) FS type */
+-			UL_SCNsA" "	/* (9) source */
+-			UL_SCNsA,	/* (10) fs options (fs specific) */
++  len           = strlen (s) + 1;
++	fstype        = malloc (sizeof *fstype * len);
++  src           = malloc (sizeof *src * len);
++  fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
++
++	rc += sscanf(s,	"%s"" "	/* (8) FS type */
++			"%s"" "	/* (9) source */
++			"%s",	/* (10) fs options (fs specific) */
+ 
+ 			&fstype,
+ 			&src,
diff --git a/package/util-linux/util-linux-002-uclibc-build-fix.patch b/package/util-linux/util-linux-002-uclibc-build-fix.patch
new file mode 100644
index 0000000..f9da863
--- /dev/null
+++ b/package/util-linux/util-linux-002-uclibc-build-fix.patch
@@ -0,0 +1,16 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: util-linux-2.19.1/configure.ac
+===================================================================
+--- util-linux-2.19.1.orig/configure.ac
++++ util-linux-2.19.1/configure.ac
+@@ -250,7 +250,7 @@ esac
+
+
+ AC_MSG_CHECKING(whether program_invocation_short_name is defined)
+-AC_TRY_COMPILE([#include <argp.h>],
++AC_TRY_COMPILE([#include <errno.h>],
+                [program_invocation_short_name = "test";],
+                AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
+                          [Define if program_invocation_short_name is defined])
+
diff --git a/package/util-linux/util-linux-003-fdisk-aarch64-support.patch b/package/util-linux/util-linux-003-fdisk-aarch64-support.patch
new file mode 100644
index 0000000..825e82c
--- /dev/null
+++ b/package/util-linux/util-linux-003-fdisk-aarch64-support.patch
@@ -0,0 +1,22 @@
+Add case for the aarch64 architecture
+
+Taken from https://bugs.launchpad.net/ubuntu/+source/util-linux/+bug/1061609
+
+Code written by Wookey.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/fdisk/fdiskbsdlabel.h
+===================================================================
+--- a/fdisk/fdiskbsdlabel.h
++++ b/fdisk/fdiskbsdlabel.h
+@@ -48,7 +48,8 @@
+ 
+ #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
+     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
+-    defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
++    defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
++    defined(__aarch64__)
+ #define BSD_LABELSECTOR   1
+ #define BSD_LABELOFFSET   0
+ #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
diff --git a/package/util-linux/util-linux-fdisk-aarch64-support.patch b/package/util-linux/util-linux-fdisk-aarch64-support.patch
deleted file mode 100644
index 825e82c..0000000
--- a/package/util-linux/util-linux-fdisk-aarch64-support.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Add case for the aarch64 architecture
-
-Taken from https://bugs.launchpad.net/ubuntu/+source/util-linux/+bug/1061609
-
-Code written by Wookey.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/fdisk/fdiskbsdlabel.h
-===================================================================
---- a/fdisk/fdiskbsdlabel.h
-+++ b/fdisk/fdiskbsdlabel.h
-@@ -48,7 +48,8 @@
- 
- #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
-     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
--    defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
-+    defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
-+    defined(__aarch64__)
- #define BSD_LABELSECTOR   1
- #define BSD_LABELOFFSET   0
- #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
diff --git a/package/util-linux/util-linux-sscanf-no-ms-as.patch b/package/util-linux/util-linux-sscanf-no-ms-as.patch
deleted file mode 100644
index 5b0ac36..0000000
--- a/package/util-linux/util-linux-sscanf-no-ms-as.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-[PATCH] Fix libmount build under uClibc
-
-Taken from gentoo-hardened:
-http://git.overlays.gentoo.org/gitweb/?p=proj/hardened-dev.git;a=commit;h=91879751
-
-For details, see https://bugs.gentoo.org/show_bug.cgi?id=406303
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/libmount/src/tab_parse.c
---- util-linux-2.20.1.orig/libmount/src/tab_parse.c	2011-12-12 20:51:06.646614964 -0500
-+++ util-linux-2.20.1/libmount/src/tab_parse.c	2011-12-12 21:02:03.587865010 -0500
-@@ -51,19 +51,21 @@
-  */
- static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
- {
--	int rc, n = 0;
--	char *src, *fstype, *optstr;
--
--	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
--			UL_SCNsA" "	/* (2) target */
--			UL_SCNsA" "	/* (3) FS type */
--			UL_SCNsA" "	/* (4) options */
-+	int rc, n = 0, len = strlen (s) + 1;
-+	char *src     = malloc (sizeof *src * len);
-+  char *fstype  = malloc (sizeof *fstype * len);
-+  char *optstr  = malloc (sizeof *optstr * len);
-+
-+	rc = sscanf(s,	"%s"" "	/* (1) source */
-+			"%s"" "	/* (2) target */
-+			"%s"" "	/* (3) FS type */
-+			"%s"" "	/* (4) options */
- 			"%n",		/* byte count */
- 
--			&src,
--			&fs->target,
--			&fstype,
--			&optstr,
-+			src,
-+			fs->target,
-+			fstype,
-+			optstr,
- 			&n);
- 
- 	if (rc == 4) {
-@@ -108,16 +110,20 @@
-  */
- static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
- {
--	int rc, end = 0;
-+	int rc, end = 0, len = strlen (s) + 1;
- 	unsigned int maj, min;
- 	char *fstype, *src, *p;
- 
-+  fs->root        = malloc (sizeof *fs->root * len);
-+  fs->target      = malloc (sizeof *fs->target * len);
-+  fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
-+
- 	rc = sscanf(s,	"%u "		/* (1) id */
- 			"%u "		/* (2) parent */
- 			"%u:%u "	/* (3) maj:min */
--			UL_SCNsA" "	/* (4) mountroot */
--			UL_SCNsA" "	/* (5) target */
--			UL_SCNsA	/* (6) vfs options (fs-independent) */
-+			"%s"" "	/* (4) mountroot */
-+			"%s"" "	/* (5) target */
-+			"%s"	/* (6) vfs options (fs-independent) */
- 			"%n",		/* number of read bytes */
- 
- 			&fs->id,
-@@ -139,9 +145,14 @@
- 	}
- 	s = p + 3;
- 
--	rc += sscanf(s,	UL_SCNsA" "	/* (8) FS type */
--			UL_SCNsA" "	/* (9) source */
--			UL_SCNsA,	/* (10) fs options (fs specific) */
-+  len           = strlen (s) + 1;
-+	fstype        = malloc (sizeof *fstype * len);
-+  src           = malloc (sizeof *src * len);
-+  fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
-+
-+	rc += sscanf(s,	"%s"" "	/* (8) FS type */
-+			"%s"" "	/* (9) source */
-+			"%s",	/* (10) fs options (fs specific) */
- 
- 			&fstype,
- 			&src,
diff --git a/package/util-linux/util-linux-uclibc-build-fix.patch b/package/util-linux/util-linux-uclibc-build-fix.patch
deleted file mode 100644
index f9da863..0000000
--- a/package/util-linux/util-linux-uclibc-build-fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: util-linux-2.19.1/configure.ac
-===================================================================
---- util-linux-2.19.1.orig/configure.ac
-+++ util-linux-2.19.1/configure.ac
-@@ -250,7 +250,7 @@ esac
-
-
- AC_MSG_CHECKING(whether program_invocation_short_name is defined)
--AC_TRY_COMPILE([#include <argp.h>],
-+AC_TRY_COMPILE([#include <errno.h>],
-                [program_invocation_short_name = "test";],
-                AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
-                          [Define if program_invocation_short_name is defined])
-
-- 
1.7.9.5
