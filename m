From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:58:34 +0200
Subject: [Buildroot] [git commit] procps-ng: bump to version 3.3.14
Message-ID: <20180425210139.9DA3C88DD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=603a4922c30d3c1f9603df857065205b803fe93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Add secure SHA256 hash.

Add license files hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/procps-ng/0001-remove-index.patch          | 16 ------
 .../0002-use-pkgconfig-for-ncursesw-cflags.patch   | 57 ----------------------
 ...put.c-include-dlfcn.h-only-when-necessary.patch | 32 ------------
 package/procps-ng/procps-ng.hash                   |  9 +++-
 package/procps-ng/procps-ng.mk                     |  5 +-
 5 files changed, 8 insertions(+), 111 deletions(-)

diff --git a/package/procps-ng/0001-remove-index.patch b/package/procps-ng/0001-remove-index.patch
deleted file mode 100644
index 1d85b31cb5..0000000000
--- a/package/procps-ng/0001-remove-index.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-sysctl: remove use of legacy index()
-
-[yann.morin.1998 at free.fr: adapt to procps-ng]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-diff -durN procps-v3.3.9.orig/sysctl.c procps-v3.3.9/sysctl.c
---- procps-v3.3.9.orig/sysctl.c	2013-12-03 12:16:18.000000000 +0100
-+++ procps-v3.3.9/sysctl.c	2014-05-31 00:45:00.869748741 +0200
-@@ -794,7 +794,7 @@
- 		      program_invocation_short_name);
- 
- 	for ( ; *argv; argv++) {
--		if (WriteMode || index(*argv, '='))
-+		if (WriteMode || strchr(*argv, '='))
- 			ReturnCode += WriteSetting(*argv);
- 		else
- 			ReturnCode += ReadSetting(*argv);
diff --git a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
deleted file mode 100644
index 1329ac4bbd..0000000000
--- a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Don't assume ncursesw headers are in ../usr/include/ncursesw/..
-On a pure build/system without legacy ncurses that may not be true.
-Since we're using pkg-config let it provide the correct include path.
-
-Status: contacted one of the maintainers on sf.net
-(ticket submission closed to the public, no other way of contacting them).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Bernd: Rebased for version 3.3.11]
-
-diff -Nura procps-ng-3.3.10.orig/configure.ac procps-ng-3.3.10/configure.ac
---- procps-ng-3.3.10.orig/configure.ac	2015-04-07 19:21:55.729819952 -0300
-+++ procps-ng-3.3.10/configure.ac	2015-04-07 19:32:09.511706653 -0300
-@@ -138,7 +138,8 @@
-   ])
-   AM_CONDITIONAL(WITH_NCURSES, true)
-   if test "$enable_watch8bit" = yes; then
--    PKG_CHECK_MODULES([NCURSESW], [ncursesw], [WATCH_NCURSES_LIBS="$NCURSESW_LIBS"], [
-+    PKG_CHECK_MODULES([NCURSESW], [ncursesw], [WATCH_NCURSES_LIBS="$NCURSESW_LIBS"]
-+    [WATCH_NCURSES_CFLAGS="$NCURSESW_CFLAGS"], [
-       AC_CHECK_LIB([ncursesw], [addwstr], [WATCH_NCURSES_LIBS=-lncursesw],
-                    [AC_MSG_ERROR([Cannot find ncurses wide library ncursesw with --enable-watch8bit])])
-     ])
-@@ -148,6 +149,7 @@
- fi
- AC_SUBST([NCURSES_LIBS])
- AC_SUBST([WATCH_NCURSES_LIBS])
-+AC_SUBST([WATCH_NCURSES_CFLAGS])
- 
- AC_ARG_WITH([systemd],
-   [AS_HELP_STRING([--with-systemd], [enable systemd support])],
-diff -Nura procps-ng-3.3.10.orig/Makefile.am procps-ng-3.3.10/Makefile.am
---- procps-ng-3.3.10.orig/Makefile.am	2015-04-07 19:21:55.655817434 -0300
-+++ procps-ng-3.3.10/Makefile.am	2015-04-07 19:32:54.516238136 -0300
-@@ -97,6 +97,7 @@
- slabtop_LDADD = $(LDADD) @NCURSES_LIBS@
- watch_SOURCES = watch.c lib/strutils.c lib/fileutils.c
- watch_LDADD = @WATCH_NCURSES_LIBS@ $(CYGWINFLAGS)
-+watch_CFLAGS = @WATCH_NCURSES_CFLAGS@
- top_top_SOURCES = \
- 	top/top.h \
- 	top/top.c \
-diff -Nura procps-ng-3.3.10.orig/watch.c procps-ng-3.3.10/watch.c
---- procps-ng-3.3.10.orig/watch.c	2015-04-07 19:21:55.707819203 -0300
-+++ procps-ng-3.3.10/watch.c	2015-04-07 19:22:27.323895083 -0300
-@@ -51,10 +51,8 @@
- #ifdef WITH_WATCH8BIT
- # include <wchar.h>
- # include <wctype.h>
--# include <ncursesw/ncurses.h>
--#else
--# include <ncurses.h>
- #endif	/* WITH_WATCH8BIT */
-+#include <ncurses.h>
- 
- #ifdef FORCE_8BIT
- # undef isprint
diff --git a/package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch b/package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch
deleted file mode 100644
index dca28fab14..0000000000
--- a/package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4fc9a348026a945aec8eddffc7613de9cb10b10c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Aug 2016 11:08:26 +0200
-Subject: [PATCH] ps/output.c: include <dlfcn.h> only when necessary
-
-dlopen() functionality is only used when SELinux support is enabled, so
-<dlfcn.h> only needs to be included when ENABLE_LIBSELINUX is
-defined. This fixes the build in configurations where <dlfcn.h> is not
-available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- ps/output.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ps/output.c b/ps/output.c
-index 42c04cf..f540832 100644
---- a/ps/output.c
-+++ b/ps/output.c
-@@ -46,7 +46,9 @@
-  */
- 
- #include <ctype.h>
-+#if ENABLE_LIBSELINUX
- #include <dlfcn.h>
-+#endif
- #include <fcntl.h>
- #include <grp.h>
- #include <limits.h>
--- 
-2.7.4
-
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 62d61727b1..9488af2d9f 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,3 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5	957e42e8b193490b2111252e4a2b443c	procps-ng-3.3.12.tar.xz
-sha1	82c0745f150f1385ca01fe7d24f05f74e31c94c6	procps-ng-3.3.12.tar.xz
+md5	fce371ccc1c15a67af9d85e4057e559d	procps-ng-3.3.14.tar.xz
+sha1	fcc4631b1185f7250daecee2fcebe15efbbe0d65	procps-ng-3.3.14.tar.xz
+# Locally calculated after checking signature
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.14.tar.xz.asc
+sha256 5eda0253999b7d786e690edfa73301b3113c7a67058478866e98e9ff6736726c  procps-ng-3.3.14.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 22ebc1a8fd..a6cf774d7b 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.12
+PROCPS_NG_VERSION = 3.3.14
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
@@ -12,9 +12,6 @@ PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
-# For 0002-use-pkgconfig-for-ncursesw-cflags.patch
-PROCPS_NG_AUTORECONF = YES
-PROCPS_NG_GETTEXTIZE = YES
 
 # If both procps-ng and busybox are selected, make certain procps-ng
 # wins the fight over who gets to have their utils actually installed.
