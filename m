From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 22:31:58 +0200
Subject: [Buildroot] [git commit] util-linux: bump to version 2.25.1
Message-ID: <20140913203648.6E52C9D68A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23781ab782f97a61517ba73a093af866d607f39a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../util-linux-001-sscanf-no-ms-as.patch           |   75 +++++++++++++++-----
 .../util-linux-004-support-static-lib-build.patch  |   57 ---------------
 package/util-linux/util-linux.mk                   |    7 +-
 3 files changed, 61 insertions(+), 78 deletions(-)

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index 918e846..be2b0eb 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -2,11 +2,15 @@ Fix libmount build under uClibc
 
 See https://bugs.gentoo.org/show_bug.cgi?id=406303
 http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
-ported to util-linux-2.24
 
---- a/configure.ac	2013-07-30 03:39:26.188738061 -0500
-+++ b/configure.ac	2013-09-05 15:31:11.460864363 -0500
-@@ -769,7 +769,6 @@ AC_ARG_ENABLE([libmount],
+[Gustavo: Ported to util-linux-2.25.1]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura util-linux-2.25.1.orig/configure.ac util-linux-2.25.1/configure.ac
+--- util-linux-2.25.1.orig/configure.ac	2014-09-05 10:44:45.302080174 -0300
++++ util-linux-2.25.1/configure.ac	2014-09-05 10:45:07.183832640 -0300
+@@ -791,7 +791,6 @@
  UL_BUILD_INIT([libmount])
  UL_REQUIRES_LINUX([libmount])
  UL_REQUIRES_BUILD([libmount], [libblkid])
@@ -14,8 +18,43 @@ ported to util-linux-2.24
  AM_CONDITIONAL([BUILD_LIBMOUNT], [test "x$build_libmount" = xyes])
  AM_CONDITIONAL([BUILD_LIBMOUNT_TESTS], [test "x$build_libmount" = xyes -a "x$enable_static" = xyes])
  
---- a/libmount/src/tab_parse.c	2013-07-30 03:39:26.218738358 -0500
-+++ b/libmount/src/tab_parse.c	2013-09-05 15:31:11.460864363 -0500
+diff -Nura util-linux-2.25.1.orig/lib/colors.c util-linux-2.25.1/lib/colors.c
+--- util-linux-2.25.1.orig/lib/colors.c	2014-09-05 10:44:45.301080140 -0300
++++ util-linux-2.25.1/lib/colors.c	2014-09-05 13:12:00.175205476 -0300
+@@ -16,6 +16,10 @@
+ #include "pathnames.h"
+ #include "strutils.h"
+ 
++#ifndef HAVE_SCANF_MS_MODIFIER
++# define UL_SCNsA "%s"
++#endif
++
+ /*
+  * terminal-colors.d file types
+  */
+@@ -577,9 +581,19 @@
+ 		if (*p == '\0' || *p == '#')
+ 			continue;
+ 
++#ifndef HAVE_SCANF_MS_MODIFIER
++		size_t len = strlen(p) + 1;
++		cn = malloc(len);
++		seq = malloc(len);
++#endif
++
+ 		rc = sscanf(p,  UL_SCNsA" "	/* name */
+ 				UL_SCNsA,	/* color */
++#ifdef HAVE_SCANF_MS_MODIFIER
+ 				&cn, &seq);
++#else
++				cn, seq);
++#endif
+ 		if (rc == 2 && cn && seq)
+ 			rc = colors_add_scheme(cc, cn, seq);	/* set rc=0 on success */
+ 		if (rc) {
+diff -Nura util-linux-2.25.1.orig/libmount/src/tab_parse.c util-linux-2.25.1/libmount/src/tab_parse.c
+--- util-linux-2.25.1.orig/libmount/src/tab_parse.c	2014-09-05 10:44:45.276079280 -0300
++++ util-linux-2.25.1/libmount/src/tab_parse.c	2014-09-05 10:51:22.500738967 -0300
 @@ -22,6 +22,10 @@
  #include "pathnames.h"
  #include "strutils.h"
@@ -24,10 +63,10 @@ ported to util-linux-2.24
 +# define UL_SCNsA "%s"
 +#endif
 +
- static inline char *skip_spaces(char *s)
+ static int next_number(char **s, int *num)
  {
- 	assert(s);
-@@ -61,16 +65,31 @@
+ 	char *end = NULL;
+@@ -52,16 +56,31 @@
  	int rc, n = 0, xrc;
  	char *src = NULL, *fstype = NULL, *optstr = NULL;
  
@@ -59,7 +98,7 @@ ported to util-linux-2.24
  			&n);
  	xrc = rc;
  
-@@ -136,6 +155,16 @@
+@@ -127,6 +146,16 @@
  	unsigned int maj, min;
  	char *fstype = NULL, *src = NULL, *p;
  
@@ -73,10 +112,10 @@ ported to util-linux-2.24
 +	src = malloc(len);
 +#endif
 +
- 	rc = sscanf(s,	"%u "		/* (1) id */
- 			"%u "		/* (2) parent */
+ 	rc = sscanf(s,	"%d "		/* (1) id */
+ 			"%d "		/* (2) parent */
  			"%u:%u "	/* (3) maj:min */
-@@ -147,9 +176,15 @@
+@@ -138,9 +167,15 @@
  			&fs->id,
  			&fs->parent,
  			&maj, &min,
@@ -92,7 +131,7 @@ ported to util-linux-2.24
  			&end);
  
  	if (rc >= 7 && end > 0)
-@@ -169,9 +204,15 @@
+@@ -160,9 +195,15 @@
  			UL_SCNsA" "	/* (9) source */
  			UL_SCNsA,	/* (10) fs options (fs specific) */
  
@@ -107,8 +146,8 @@ ported to util-linux-2.24
 +#endif
  
  	if (rc >= 10) {
- 		fs->flags |= MNT_FS_KERNEL;
-@@ -279,14 +320,25 @@
+ 		size_t sz;
+@@ -281,14 +322,25 @@
  	int rc;
  	char *src = NULL;
  
@@ -120,8 +159,8 @@ ported to util-linux-2.24
 +
  	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
  			UL_SCNsA" "	/* (2) type */
- 			"%jd"		/* (3) size */
- 			"%jd"		/* (4) used */
+ 			"%ju"		/* (3) size */
+ 			"%ju"		/* (4) used */
  			"%d",		/* priority */
  
 +#ifdef HAVE_SCANF_MS_MODIFIER
diff --git a/package/util-linux/util-linux-004-support-static-lib-build.patch b/package/util-linux/util-linux-004-support-static-lib-build.patch
deleted file mode 100644
index f49c6e5..0000000
--- a/package/util-linux/util-linux-004-support-static-lib-build.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Only move shared libraries to /lib if they exists
-
-In several Makemodule.am, there is a install-exec-hook-<library>
-target whose role is to move the shared library from /usr/lib to /lib,
-while keeping a symbolic link /usr/lib/libuuid.so ->
-../../lib/<library>.so.<version>.
-
-However, when util-linux is built with --enable-static
---disable-shared (as is needed on noMMU platforms that don't support
-shared libraries), no <library>.so is built, but the
-install-exec-hook-libuuid creates an invalid /usr/lib/<library>.so
-symbolic link, pointing to ../../lib (yes, the directory). This causes
-troubles later one when other libraries/programs are compiled with
--l<library>, as gcc thinks a shared library is available because
-there's a file named /usr/lib/<library>.so.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libuuid/src/Makemodule.am
-===================================================================
---- a/libuuid/src/Makemodule.am
-+++ b/libuuid/src/Makemodule.am
-@@ -44,7 +44,7 @@
- 
- # move lib from $(usrlib_execdir) to $(libdir) if needed
- install-exec-hook-libuuid:
--	if test "$(usrlib_execdir)" != "$(libdir)"; then \
-+	if test "$(usrlib_execdir)" != "$(libdir)" -a -f "$(DESTDIR)$(usrlib_execdir)/libuuid.so"; then \
- 		mkdir -p $(DESTDIR)$(libdir); \
- 		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so.* $(DESTDIR)$(libdir); \
- 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libuuid.so); \
-Index: b/libmount/src/Makemodule.am
-===================================================================
---- a/libmount/src/Makemodule.am
-+++ b/libmount/src/Makemodule.am
-@@ -123,7 +123,7 @@
- 
- # move lib from $(usrlib_execdir) to $(libdir) if needed
- install-exec-hook-libmount:
--	if test "$(usrlib_execdir)" != "$(libdir)"; then \
-+	if test "$(usrlib_execdir)" != "$(libdir)" -a -f "$(DESTDIR)$(usrlib_execdir)/libmount.so"; then \
- 		mkdir -p $(DESTDIR)$(libdir); \
- 		mv $(DESTDIR)$(usrlib_execdir)/libmount.so.* $(DESTDIR)$(libdir); \
- 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libmount.so); \
-Index: b/libblkid/src/Makemodule.am
-===================================================================
---- a/libblkid/src/Makemodule.am
-+++ b/libblkid/src/Makemodule.am
-@@ -220,7 +220,7 @@
- 
- # move lib from $(usrlib_execdir) to $(libdir) if needed
- install-exec-hook-libblkid:
--	if test "$(usrlib_execdir)" != "$(libdir)"; then \
-+	if test "$(usrlib_execdir)" != "$(libdir)" -a -f "$(DESTDIR)$(usrlib_execdir)/libblkid.so"; then \
- 		mkdir -p $(DESTDIR)$(libdir); \
- 		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so.* $(DESTDIR)$(libdir); \
- 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libblkid.so); \
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 811d8ac..587f57e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
-UTIL_LINUX_VERSION_MAJOR = 2.24
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION_MAJOR = 2.25
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -21,7 +21,8 @@ UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
 UTIL_LINUX_CONF_OPT += \
 	--disable-rpath \
 	--disable-makeinstall-chown \
-	--disable-bash-completion
+	--disable-bash-completion \
+	--without-python
 
 # We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
