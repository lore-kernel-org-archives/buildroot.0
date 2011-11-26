From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Nov 2011 21:02:28 +0100
Subject: [Buildroot] [git commit branch/next] htop: Bump version to 1.0
Message-ID: <20111126200519.34D6E8F656@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d7299194c7107fa295c4fdbc6aef96324700aa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

htop 1.0 was released 11-2011.  Bumping version in BuildRoot
from 0.9 to 1.0.

[Peter: Don't use old-style AUTOTARGETS]
Signed-off-by:  Andy Kennedy <Andy.Kennedy@Adtran.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/htop/htop.mk    |    3 +-
 package/htop/htop.patch |   88 ++++++++++------------------------------------
 2 files changed, 21 insertions(+), 70 deletions(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 5a8eb0d..07b750c 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,10 +4,11 @@
 #
 #############################################################
 
-HTOP_VERSION = 0.9
+HTOP_VERSION = 1.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
 HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
+HTOP_CONF_OPT += --disable-unicode
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/htop/htop.patch b/package/htop/htop.patch
index 7765614..bf68e53 100644
--- a/package/htop/htop.patch
+++ b/package/htop/htop.patch
@@ -1,75 +1,25 @@
-# This patch removes the hard dependency on backtrace by checking for
-# it at compile time and adds a cross-compile /proc check.
-# Patch given to me by Hisham <hisham.hm@gmail.com> (htop-general)
-#
-# This patch is taken from upstream svn (r213, r215)
+# This patch removes the check for native_affinity for cross compiling.
+# This patch has been pushed to htop on 23 November 2011, however, is
+# not in the 1.0 release and may not be exactly what Hisham puts into
+# the official build.
 #
 # Signed-off-by: Andy Kennedy <Andy.Kennedy@adtran.com>
-diff -Naur a/CRT.c b/CRT.c
---- a/CRT.c    2010-11-23 09:56:32.000000000 -0600
-+++ b/CRT.c    2011-03-21 17:08:21.000000000 -0500
-@@ -11,7 +11,9 @@
- #include <signal.h>
- #include <stdlib.h>
- #include <stdbool.h>
-+#ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
-+#endif
-
- #include "String.h"
-
-@@ -125,12 +127,14 @@
-    CRT_done();
-    #if __linux
-    fprintf(stderr, "\n\nhtop " VERSION " aborting. Please report bug at http://htop.sf.net\n");
--   #else
--   fprintf(stderr, "\n\nhtop " VERSION " aborting. Unsupported platform.\n");
--   #endif
-+   #ifdef HAVE_EXECINFO_H
-    size_t size = backtrace(backtraceArray, sizeof(backtraceArray));
-    fprintf(stderr, "Backtrace: \n");
-    backtrace_symbols_fd(backtraceArray, size, 2);
-+   #endif
-+   #else
-+   fprintf(stderr, "\n\nhtop " VERSION " aborting. Unsupported platform.\n");
-+   #endif
-    abort();
- }
-
-diff -Naur a/CRT.h b/CRT.h
---- a/CRT.h    2010-11-23 09:56:32.000000000 -0600
-+++ b/CRT.h    2011-03-21 17:06:16.000000000 -0500
-@@ -14,7 +14,9 @@
- #include <signal.h>
- #include <stdlib.h>
- #include <stdbool.h>
-+#ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
-+#endif
-
- #include "String.h"
-
 diff -Naur a/configure.ac b/configure.ac
---- a/configure.ac    2010-11-23 09:56:32.000000000 -0600
-+++ b/configure.ac    2011-03-21 17:06:16.000000000 -0500
-@@ -25,6 +25,7 @@
- AC_CHECK_HEADERS([stdlib.h string.h strings.h sys/param.h sys/time.h unistd.h curses.h],[:],[
-   missing_headers="$missing_headers $ac_header"
- ])
-+AC_CHECK_HEADERS([execinfo.h],[:],[:])
-
- # Checks for typedefs, structures, and compiler characteristics.
- AC_HEADER_STDBOOL
-@@ -99,10 +100,10 @@
-   AC_MSG_ERROR([missing headers: $missing_headers])
- fi
-
--
--
-+if test "$cross_compiling" = "no"; then
+--- a/configure.ac     2011-11-20 20:46:48.000000000 -0600
++++ b/configure.ac     2011-11-23 10:41:44.000000000 -0600
+@@ -111,7 +111,6 @@
+ if test "$cross_compiling" = "no"; then
  AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find /proc/stat. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
  AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
+-fi
+ 
+ AC_ARG_ENABLE(native_affinity, [AC_HELP_STRING([--enable-native-affinity], [enable native sched_setaffinity and sched_getaffinity for affinity support, disables hwloc])], ,enable_native_affinity="yes")
+ if test "x$enable_native_affinity" = xyes; then
+@@ -130,6 +129,7 @@
+       AC_MSG_RESULT([yes])],
+      [AC_MSG_RESULT([no])])
+ fi
 +fi
-
- AC_ARG_ENABLE(plpa, [AC_HELP_STRING([--enable-plpa], [enable PLPA support for CPU affinity])], ,enable_plpa="yes")
- PLPA_INCLUDED
+ 
+ AC_ARG_ENABLE(hwloc, [AC_HELP_STRING([--enable-hwloc], [enable hwloc support for CPU affinity])],, enable_hwloc="no")
+ if test "x$enable_hwloc" = xyes
