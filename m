From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 18:08:52 +0200
Subject: [Buildroot] [PATCH] util-linux: use upstream patch to fix uClibc
	build issue
Message-ID: <20160731160852.GA5227@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream has this patch a while and other projects are using
it already. So better switch to this.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 .../0001-Fix-libmount-build-under-uClibc.patch     | 153 ---------------------
 .../0001-build-sys-fix-uClibc-ng-scanf-check.patch |  34 +++++
 package/util-linux/util-linux.mk                   |   2 +-
 3 files changed, 35 insertions(+), 154 deletions(-)
 delete mode 100644 package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
 create mode 100644 package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch

diff --git a/package/util-linux/0001-Fix-libmount-build-under-uClibc.patch b/package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
deleted file mode 100644
index 10cc3a5..0000000
--- a/package/util-linux/0001-Fix-libmount-build-under-uClibc.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 44d733203637666926964957af7af23429ddcecf Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 18 Apr 2016 09:58:56 -0300
-Subject: [PATCH] Fix libmount build under uClibc
-
-See https://bugs.gentoo.org/show_bug.cgi?id=406303
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
-
-[Gustavo: converted to git format for 2.28]
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac             |  1 -
- libmount/src/tab_parse.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 52 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5a00403..3422f11 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -948,7 +948,6 @@ AC_ARG_ENABLE([libmount],
- )
- UL_BUILD_INIT([libmount])
- UL_REQUIRES_BUILD([libmount], [libblkid])
--UL_REQUIRES_HAVE([libmount], [scanf_alloc_modifier], [scanf string alloc modifier])
- AM_CONDITIONAL([BUILD_LIBMOUNT], [test "x$build_libmount" = xyes])
- AM_CONDITIONAL([BUILD_LIBMOUNT_TESTS], [test "x$build_libmount" = xyes -a "x$enable_static" = xyes])
- AS_IF([test "x$build_libmount" = xyes], [
-diff --git a/libmount/src/tab_parse.c b/libmount/src/tab_parse.c
-index 3f5e14a..2ff1795 100644
---- a/libmount/src/tab_parse.c
-+++ b/libmount/src/tab_parse.c
-@@ -39,6 +39,10 @@ static void parser_cleanup(struct libmnt_parser *pa)
- 	memset(pa, 0, sizeof(*pa));
- }
- 
-+#ifndef HAVE_SCANF_MS_MODIFIER
-+# define UL_SCNsA "%s"
-+#endif
-+
- static int next_number(char **s, int *num)
- {
- 	char *end = NULL;
-@@ -69,16 +73,31 @@ static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
- 	int rc, n = 0, xrc;
- 	char *src = NULL, *fstype = NULL, *optstr = NULL;
- 
-+#ifndef HAVE_SCANF_MS_MODIFIER
-+	size_t len = strlen(s) + 1;
-+	src = malloc(len);
-+	fstype = malloc(len);
-+	fs->target = malloc(len);
-+	optstr = malloc(len);
-+#endif
-+
- 	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
- 			UL_SCNsA" "	/* (2) target */
- 			UL_SCNsA" "	/* (3) FS type */
- 			UL_SCNsA" "	/* (4) options */
- 			"%n",		/* byte count */
- 
-+#ifdef HAVE_SCANF_MS_MODIFIER
- 			&src,
- 			&fs->target,
- 			&fstype,
- 			&optstr,
-+#else
-+			src,
-+			fs->target,
-+			fstype,
-+			optstr,
-+#endif
- 			&n);
- 	xrc = rc;
- 
-@@ -144,6 +163,16 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
- 	unsigned int maj, min;
- 	char *fstype = NULL, *src = NULL, *p;
- 
-+#ifndef HAVE_SCANF_MS_MODIFIER
-+	size_t len = strlen(s) + 1;
-+	fs->root = malloc(len);
-+	fs->target = malloc(len);
-+	fs->vfs_optstr = malloc(len);
-+	fs->fs_optstr = malloc(len);
-+	fstype = malloc(len);
-+	src = malloc(len);
-+#endif
-+
- 	rc = sscanf(s,	"%d "		/* (1) id */
- 			"%d "		/* (2) parent */
- 			"%u:%u "	/* (3) maj:min */
-@@ -155,9 +184,15 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
- 			&fs->id,
- 			&fs->parent,
- 			&maj, &min,
-+#ifdef HAVE_SCANF_MS_MODIFIER
- 			&fs->root,
- 			&fs->target,
- 			&fs->vfs_optstr,
-+#else
-+			fs->root,
-+			fs->target,
-+			fs->vfs_optstr,
-+#endif
- 			&end);
- 
- 	if (rc >= 7 && end > 0)
-@@ -177,9 +212,15 @@ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
- 			UL_SCNsA" "	/* (9) source */
- 			UL_SCNsA,	/* (10) fs options (fs specific) */
- 
-+#ifdef HAVE_SCANF_MS_MODIFIER
- 			&fstype,
- 			&src,
- 			&fs->fs_optstr);
-+#else
-+			fstype,
-+			src,
-+			fs->fs_optstr);
-+#endif
- 
- 	if (rc >= 10) {
- 		size_t sz;
-@@ -298,14 +339,25 @@ static int mnt_parse_swaps_line(struct libmnt_fs *fs, char *s)
- 	int rc;
- 	char *src = NULL;
- 
-+#ifndef HAVE_SCANF_MS_MODIFIER
-+	size_t len = strlen(s) + 1;
-+	src = malloc(len);
-+	fs->swaptype = malloc(len);
-+#endif
-+
- 	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
- 			UL_SCNsA" "	/* (2) type */
- 			"%ju"		/* (3) size */
- 			"%ju"		/* (4) used */
- 			"%d",		/* priority */
- 
-+#ifdef HAVE_SCANF_MS_MODIFIER
- 			&src,
- 			&fs->swaptype,
-+#else
-+			src,
-+			fs->swaptype,
-+#endif
- 			&fsz,
- 			&usz,
- 			&fs->priority);
--- 
-2.7.3
-
diff --git a/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch b/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch
new file mode 100644
index 0000000..801b72b
--- /dev/null
+++ b/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch
@@ -0,0 +1,34 @@
+From bac7fbdb2d141879526ca4342d56d2c749ba8af5 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Fri, 3 Jun 2016 04:23:28 +0200
+Subject: [PATCH] build-sys: fix uClibc-ng scanf check
+
+uClibc-ng tries to be compatible with GNU libc and defines
+__GLIBC__ and pretend to be version 2.2.
+We once changed it to 2.10, but then some hard to fix problems
+in different software packages (gcc) occured.
+It would be better if we disable the special GNU libc checks
+for uClibc-ng here. uClibc-ng implements the required scanf
+functionality.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3ba723f..ec197ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -581,7 +581,7 @@ AC_CACHE_VAL([scanf_cv_alloc_modifier],
+      #include <stdio.h>
+      #include <unistd.h>
+ 
+-     #ifdef __GLIBC__
++     #if defined(__GLIBC__) && !defined(__UCLIBC__)
+ 
+      #if !(__GLIBC_PREREQ(2, 7))
+      #error %m is not available
+-- 
+2.1.4
+
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 93f45c2..9c7bd87 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -12,7 +12,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2.1+, libuuid BSD-3c
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
-# For 0001-Fix-libmount-build-under-uClibc.patch
+# For 0001-build-sys-fix-uClibc-ng-scanf-check.patch
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
-- 
2.1.4
