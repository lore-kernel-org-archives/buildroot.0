From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:18:46 +0200
Subject: [Buildroot] [git commit branch/next] util-linux: use a patch from
	upstream to fix ncursesw support
Message-ID: <20170824211356.1CFFE81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b0d5aab6785c8d069223e804771d462923d851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch is much smaller the the previous one and will unlikely cause
a conflict with some forthcoming 2.30.x release.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Revert-build-sys-ncurses-headers-cleanup.patch | 191 ---------------------
 ...upport-ncursesw-without-headers-in-ncurse.patch |  58 +++++++
 2 files changed, 58 insertions(+), 191 deletions(-)

diff --git a/package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch b/package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
deleted file mode 100644
index a344ee9..0000000
--- a/package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From 51157b7416cd9d09cb21ee8cebf5750b48f44201 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Thu, 22 Jun 2017 20:53:55 -0300
-Subject: [PATCH] Revert "build-sys: ncurses headers cleanup"
-
-This reverts commit 3947ca4ca9737d830f54658ef353f5626c0d0282.
----
- configure.ac         |  8 +++++---
- lib/colors.c         | 15 ++++-----------
- misc-utils/cal.c     |  8 ++++----
- term-utils/setterm.c |  8 ++++----
- text-utils/more.c    |  8 ++++----
- text-utils/pg.c      | 16 +++++++++-------
- text-utils/ul.c      |  8 ++++----
- 7 files changed, 34 insertions(+), 37 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 53d25b8ab..3512162df 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -803,8 +803,9 @@ have_ncursesw_header=no
- AS_IF([test "x$with_ncursesw" != xno], [
-   UL_NCURSES_CHECK([ncursesw])
-   AS_IF([test "x$have_ncursesw" = xyes], [
--    AC_CHECK_HEADERS([ncursesw/ncurses.h], [have_ncursesw_header=yes])
--    AC_CHECK_HEADERS([ncursesw/term.h])
-+    AC_CHECK_HEADERS([ncursesw/ncurses.h ncurses.h],
-+		     [have_ncursesw_header=yes])
-+    AC_CHECK_HEADERS([ncursesw/term.h term.h])
-     AS_IF([test "x$have_ncursesw_header" = xno], [have_ncursesw=no])
-   ])
-   AS_IF([test "x$have_ncursesw" = xyes], [
-@@ -829,7 +830,8 @@ AS_CASE([$with_ncurses:$build_widechar],
- AS_IF([test "x$have_ncursesw" = xno -a "x$with_ncurses" != xno ], [
-   UL_NCURSES_CHECK([ncurses])
-   AS_IF([test "x$have_ncurses" = xyes], [
--    AC_CHECK_HEADERS([ncurses/ncurses.h ncurses.h], [have_ncurses_header=yes])
-+    AC_CHECK_HEADERS([ncurses/ncurses.h ncurses.h],
-+		     [have_ncurses_header=yes])
-     AC_CHECK_HEADERS([ncurses/term.h term.h])
-     AS_IF([test "x$have_ncurses_header" = xno], [have_ncurses=no])
-   ])
-diff --git a/lib/colors.c b/lib/colors.c
-index f82496d7a..72c5158cb 100644
---- a/lib/colors.c
-+++ b/lib/colors.c
-@@ -12,19 +12,12 @@
- #include <ctype.h>
- 
- #if defined(HAVE_LIBNCURSES) || defined(HAVE_LIBNCURSESW)
--# if defined(HAVE_NCURSESW_NCURSES_H)
--#  include <ncursesw/ncurses.h>
--# elif defined(HAVE_NCURSES_NCURSES_H)
--#  include <ncurses/ncurses.h>
--# elif defined(HAVE_NCURSES_H)
--#  include <ncurses.h>
--# endif
--# if defined(HAVE_NCURSESW_TERM_H)
--#  include <ncursesw/term.h>
-+# ifdef HAVE_TERM_H
-+#  include <term.h>
- # elif defined(HAVE_NCURSES_TERM_H)
- #  include <ncurses/term.h>
--# elif defined(HAVE_TERM_H)
--#  include <term.h>
-+# elif defined(HAVE_NCURSESW_TERM_H)
-+#  include <ncursesw/term.h>
- # endif
- #endif
- 
-diff --git a/misc-utils/cal.c b/misc-utils/cal.c
-index 604eb26a7..2b16979db 100644
---- a/misc-utils/cal.c
-+++ b/misc-utils/cal.c
-@@ -80,12 +80,12 @@ static int has_term = 0;
- static const char *Senter = "", *Sexit = "";	/* enter and exit standout mode */
- 
- #if defined(HAVE_LIBNCURSES) || defined(HAVE_LIBNCURSESW)
--# if defined(HAVE_NCURSESW_TERM_H)
--#  include <ncursesw/term.h>
-+# ifdef HAVE_TERM_H
-+#  include <term.h>
- # elif defined(HAVE_NCURSES_TERM_H)
- #  include <ncurses/term.h>
--# elif defined(HAVE_TERM_H)
--#  include <term.h>
-+# elif defined(HAVE_NCURSESW_TERM_H)
-+#  include <ncursesw/term.h>
- # endif
- #endif
- 
-diff --git a/term-utils/setterm.c b/term-utils/setterm.c
-index 9f60e5693..53826f954 100644
---- a/term-utils/setterm.c
-+++ b/term-utils/setterm.c
-@@ -60,12 +60,12 @@
- #include <termios.h>
- #include <unistd.h>
- 
--#if defined(HAVE_NCURSESW_TERM_H)
--# include <ncursesw/term.h>
-+#ifdef HAVE_TERM_H
-+# include <term.h>
- #elif defined(HAVE_NCURSES_TERM_H)
- # include <ncurses/term.h>
--#elif defined(HAVE_TERM_H)
--# include <term.h>
-+#elif defined(HAVE_NCURSESW_TERM_H)
-+# include <ncursesw/term.h>
- #endif
- 
- #ifdef HAVE_LINUX_TIOCL_H
-diff --git a/text-utils/more.c b/text-utils/more.c
-index 72dd96bf4..cc53075f6 100644
---- a/text-utils/more.c
-+++ b/text-utils/more.c
-@@ -190,12 +190,12 @@ static struct {
- } context, screen_start;
- extern char PC;			/* pad character */
- 
--#if defined(HAVE_NCURSESW_TERM_H)
--# include <ncursesw/term.h>
-+#ifdef HAVE_TERM_H
-+# include <term.h>
- #elif defined(HAVE_NCURSES_TERM_H)
- # include <ncurses/term.h>
--#elif defined(HAVE_TERM_H)
--# include <term.h>
-+#elif defined(HAVE_NCURSESW_TERM_H)
-+#  include <ncursesw/term.h>
- #endif
- 
- #define TERM_AUTO_RIGHT_MARGIN    "am"
-diff --git a/text-utils/pg.c b/text-utils/pg.c
-index 1b9b8d7dd..bc485e2fe 100644
---- a/text-utils/pg.c
-+++ b/text-utils/pg.c
-@@ -59,20 +59,22 @@
- #include <signal.h>
- #include <setjmp.h>
- 
--#if defined(HAVE_NCURSESW_NCURSES_H)
-+#ifdef HAVE_NCURSESW_H
-+# include <ncursesw.h>
-+#elif defined(HAVE_NCURSES_H)
-+# include <ncurses.h>
-+#elif defined(HAVE_NCURSESW_NCURSES_H)
- # include <ncursesw/ncurses.h>
- #elif defined(HAVE_NCURSES_NCURSES_H)
- # include <ncurses/ncurses.h>
--#elif defined(HAVE_NCURSES_H)
--# include <ncurses.h>
- #endif
- 
--#if defined(HAVE_NCURSESW_TERM_H)
--# include <ncursesw/term.h>
-+#ifdef HAVE_TERM_H
-+# include <term.h>
- #elif defined(HAVE_NCURSES_TERM_H)
- # include <ncurses/term.h>
--#elif defined(HAVE_TERM_H)
--# include <term.h>
-+#elif defined(HAVE_NCURSESW_TERM_H)
-+# include <ncursesw/term.h>
- #endif
- 
- #include "nls.h"
-diff --git a/text-utils/ul.c b/text-utils/ul.c
-index 3986b4206..3d1518cea 100644
---- a/text-utils/ul.c
-+++ b/text-utils/ul.c
-@@ -49,12 +49,12 @@
- #include <errno.h>
- #include <getopt.h>
- 
--#if defined(HAVE_NCURSESW_TERM_H)
--# include <ncursesw/term.h>
-+#ifdef HAVE_TERM_H
-+# include <term.h>
- #elif defined(HAVE_NCURSES_TERM_H)
- # include <ncurses/term.h>
--#elif defined(HAVE_TERM_H)
--# include <term.h>
-+#elif defined(HAVE_NCURSESW_TERM_H)
-+# include <ncursesw/term.h>
- #endif
- 
- #include "nls.h"
--- 
-2.11.0
-
diff --git a/package/util-linux/0001-build-sys-support-ncursesw-without-headers-in-ncurse.patch b/package/util-linux/0001-build-sys-support-ncursesw-without-headers-in-ncurse.patch
new file mode 100644
index 0000000..062ac67
--- /dev/null
+++ b/package/util-linux/0001-build-sys-support-ncursesw-without-headers-in-ncurse.patch
@@ -0,0 +1,58 @@
+From 87c26ce5b689abe1b52181f98ef3c9eb1b1a5165 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 1 Aug 2017 14:36:25 +0200
+Subject: [PATCH] build-sys: support ncursesw without headers in ncursesw/
+ directory
+
+Let's check always for alone ncurses.h and term.h if the preferred
+variant with ncursesw/ subdirectory is not available.
+
+The patch also minimize number of HAVE_...NCURSES_H macros in
+config.h. We don't need to check for ncurses.h if ncurses/ncurses.h is
+available.
+
+Reported-by: Carlos Santos <casantos@datacom.ind.br>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ configure.ac | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b204ec11e..592bd587e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -810,6 +810,13 @@ AS_IF([test "x$with_ncursesw" != xno], [
+   AS_IF([test "x$have_ncursesw" = xyes], [
+     AC_CHECK_HEADERS([ncursesw/ncurses.h], [have_ncursesw_header=yes])
+     AC_CHECK_HEADERS([ncursesw/term.h])
++
++    # Define HAVE_NCURSES_H only if check for HAVE_NCURSESW_NCURSES_H is
++    # unsuccessful to avoid too many *_H permitations in config.h
++    AS_IF([test "x$have_ncursesw_header" = xno], [
++	   AC_CHECK_HEADERS([ncurses.h], [have_ncursesw_header=yes])
++	   AC_CHECK_HEADERS([term.h])
++    ])
+     AS_IF([test "x$have_ncursesw_header" = xno], [have_ncursesw=no])
+   ])
+   AS_IF([test "x$have_ncursesw" = xyes], [
+@@ -834,8 +841,15 @@ AS_CASE([$with_ncurses:$build_widechar],
+ AS_IF([test "x$have_ncursesw" = xno -a "x$with_ncurses" != xno ], [
+   UL_NCURSES_CHECK([ncurses])
+   AS_IF([test "x$have_ncurses" = xyes], [
+-    AC_CHECK_HEADERS([ncurses/ncurses.h ncurses.h], [have_ncurses_header=yes])
+-    AC_CHECK_HEADERS([ncurses/term.h term.h])
++    AC_CHECK_HEADERS([ncurses/ncurses.h], [have_ncurses_header=yes])
++    AC_CHECK_HEADERS([ncurses/term.h])
++
++    # Define HAVE_NCURSES_H only if check for HAVE_NCURSES_NCURSES_H is
++    # unsuccessful to avoid too many *_H permitations in config.h
++    AS_IF([test "x$have_ncurses_header" = xno], [
++	   AC_CHECK_HEADERS([ncurses.h], [have_ncurses_header=yes])
++	   AC_CHECK_HEADERS([term.h])
++    ])
+     AS_IF([test "x$have_ncurses_header" = xno], [have_ncurses=no])
+   ])
+   AS_IF([test "x$have_ncurses" = xyes], [
+-- 
+2.13.5
+
