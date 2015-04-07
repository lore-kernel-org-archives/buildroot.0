From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 19:50:06 -0300
Subject: [Buildroot] [PATCH] procps-ng: fix/patch wrong ncursesw headers
	assumption
Message-ID: <1428447006-6279-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script/code assumes ncursesw headers live in
/usr/include/ncursesw.
That's a distribution-ism where they want to have both versions for
ABI/API compatibility, but not the case for embedded where that's not a
concern.
Hence kill the hard-coding and use pkg-config to find this out instead
of the half-made effort about it.
Fixes:
http://autobuild.buildroot.net/results/97d/97dc7f238457609c861c24f81b556973f5dec9c1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0002-use-pkgconfig-for-ncursesw-cflags.patch   | 56 ++++++++++++++++++++++
 package/procps-ng/procps-ng.mk                     |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch

diff --git a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
new file mode 100644
index 0000000..973c4e5
--- /dev/null
+++ b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
@@ -0,0 +1,56 @@
+Don't assume ncursesw headers are in ../usr/include/ncursesw/..
+On a pure build/system without legacy ncurses that may not be true.
+Since we're using pkg-config let it provide the correct include path.
+
+Status: contacted one of the maintainers on sf.net
+(ticket submission closed to the public, no other way of contacting them).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura procps-ng-3.3.10.orig/configure.ac procps-ng-3.3.10/configure.ac
+--- procps-ng-3.3.10.orig/configure.ac	2015-04-07 19:21:55.729819952 -0300
++++ procps-ng-3.3.10/configure.ac	2015-04-07 19:32:09.511706653 -0300
+@@ -138,7 +138,8 @@
+   ])
+   AM_CONDITIONAL(WITH_NCURSES, true)
+   if test "$enable_watch8bit" = yes; then
+-    PKG_CHECK_MODULES([NCURSESW], [ncursesw], [WATCH_NCURSES_LIBS="$NCURSESW_LIBS"], [
++    PKG_CHECK_MODULES([NCURSESW], [ncursesw], [WATCH_NCURSES_LIBS="$NCURSESW_LIBS"]
++    [WATCH_NCURSES_CFLAGS="$NCURSESW_CFLAGS"], [
+       AC_CHECK_LIB([ncursesw], [addwstr], [WATCH_NCURSES_LIBS=-lncursesw],
+                    [AC_MSG_ERROR([Cannot find ncurses wide library ncursesw with --enable-watch8bit])])
+     ])
+@@ -148,6 +149,7 @@
+ fi
+ AC_SUBST([NCURSES_LIBS])
+ AC_SUBST([WATCH_NCURSES_LIBS])
++AC_SUBST([WATCH_NCURSES_CFLAGS])
+ 
+ AC_ARG_WITH([systemd],
+   [AS_HELP_STRING([--with-systemd], [enable systemd support])],
+diff -Nura procps-ng-3.3.10.orig/Makefile.am procps-ng-3.3.10/Makefile.am
+--- procps-ng-3.3.10.orig/Makefile.am	2015-04-07 19:21:55.655817434 -0300
++++ procps-ng-3.3.10/Makefile.am	2015-04-07 19:32:54.516238136 -0300
+@@ -83,6 +83,7 @@
+ slabtop_LDADD = @NCURSES_LIBS@
+ watch_SOURCES = watch.c $(top_srcdir)/lib/strutils.c $(top_srcdir)/lib/fileutils.c
+ watch_LDADD = @WATCH_NCURSES_LIBS@
++watch_CFLAGS = @WATCH_NCURSES_CFLAGS@
+ endif
+ 
+ if BUILD_SKILL
+diff -Nura procps-ng-3.3.10.orig/watch.c procps-ng-3.3.10/watch.c
+--- procps-ng-3.3.10.orig/watch.c	2015-04-07 19:21:55.707819203 -0300
++++ procps-ng-3.3.10/watch.c	2015-04-07 19:22:27.323895083 -0300
+@@ -51,10 +51,8 @@
+ #ifdef WITH_WATCH8BIT
+ # include <wchar.h>
+ # include <wctype.h>
+-# include <ncursesw/ncurses.h>
+-#else
+-# include <ncurses.h>
+ #endif	/* WITH_WATCH8BIT */
++#include <ncurses.h>
+ 
+ #ifdef FORCE_8BIT
+ # undef isprint
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index f9c1082..4ee60f3 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -10,8 +10,9 @@ PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
-
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
+# For 0002-use-pkgconfig-for-ncursesw-cflags.patch
+PROCPS_NG_AUTORECONF = YES
 
 # If both procps-ng and busybox are selected, make certain procps-ng
 # wins the fight over who gets to have their utils actually installed.
-- 
2.0.5
