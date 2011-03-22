From: Andy Kennedy <Andy.Kennedy@adtran.com>
Date: Tue, 22 Mar 2011 10:18:32 -0500
Subject: [Buildroot] Add Package:  htop
Message-ID: <4D88BDC8.6080002@AdTran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds package htop.  This is a resubmit, with corrections.

Signed-off-by:  Andy Kennedy <Andy.Kennedy@AdTran.com>
---
diff -Naur a/package/Config.in b/package/Config.in
--- a/package/Config.in 2011-03-14 10:39:51.000000000 -0500
+++ b/package/Config.in 2011-03-21 17:29:22.000000000 -0500
@@ -476,6 +476,9 @@
 menu "System tools"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
+endif
+source "package/htop/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff -Naur a/package/htop/Config.in b/package/htop/Config.in
--- a/package/htop/Config.in    1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/Config.in    2011-03-21 17:29:22.000000000 -0500
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HTOP
+       bool "htop"
+       select BR2_PACKAGE_NCURSES
+       help
+         htop is an interactive text-mode process viewer for Linux.
+         It aims to be a better top.
+
+         http://sourceforge.net/projects/htop/
diff -Naur a/package/htop/htop-alloc-not-void.patch b/package/htop/htop-alloc-not-void.patch
--- a/package/htop/htop-alloc-not-void.patch    1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/htop-alloc-not-void.patch    2011-03-21 18:09:45.000000000 -0500
@@ -0,0 +1,21 @@
+diff -Naur a/configure b/configure
+--- a/configure        2010-11-23 10:33:53.000000000 -0600
++++ b/configure        2011-03-21 18:05:46.000000000 -0500
+@@ -12363,7 +12363,7 @@
+ #if defined STDC_HEADERS || defined HAVE_STDLIB_H
+ # include <stdlib.h>
+ #else
+-char *malloc ();
++void *malloc ();
+ #endif
+
+ int
+@@ -12598,7 +12598,7 @@
+ #if defined STDC_HEADERS || defined HAVE_STDLIB_H
+ # include <stdlib.h>
+ #else
+-char *realloc ();
++void *realloc ();
+ #endif
+
+ int
diff -Naur a/package/htop/htop-cross-no-proc-check.patch b/package/htop/htop-cross-no-proc-check.patch
--- a/package/htop/htop-cross-no-proc-check.patch       1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/htop-cross-no-proc-check.patch       2011-03-22 09:57:22.000000000 -0500
@@ -0,0 +1,22 @@
+# This patch removes the checks for /proc when cross compiling.
+# We hope you know what you are doing and you have /proc, doesn't everyone?
+# Signed-of-by:  Andy Kennedy <Andy.Kennedy@adtran.com>
+diff -Naur a/configure b/configure
+--- a/configure 2010-11-23 10:33:53.000000000 -0600
++++ b/configure 2011-03-22 09:52:46.000000000 -0500
+@@ -13605,6 +13605,7 @@
+
+
+
++if test "$cross_compiling" = no ; then
+ as_ac_File=`echo "ac_cv_file_$PROCDIR/stat" | $as_tr_sh`
+ { echo "$as_me:$LINENO: checking for $PROCDIR/stat" >&5
+ echo $ECHO_N "checking for $PROCDIR/stat... $ECHO_C" >&6; }
+@@ -13658,6 +13659,7 @@
+ echo "$as_me: error: Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help." >&2;}
+    { (exit 1); exit 1; }; }
+ fi
++fi #cross_compiling = no (Andy Kennedy)
+
+
+ # Check whether --enable-plpa was given.
diff -Naur a/package/htop/htop-make-execinfo-detectable.patch b/package/htop/htop-make-execinfo-detectable.patch
--- a/package/htop/htop-make-execinfo-detectable.patch  1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/htop-make-execinfo-detectable.patch  2011-03-21 17:29:22.000000000 -0500
@@ -0,0 +1,59 @@
+# This patch removes the checks for /proc when cross compiling.
+# We hope you know what you are doing and you have /proc, doesn't everyone?
+# Patch given to me by Hisham <hisham.hm@gmail.com>
+# Signed-of-by:  Andy Kennedy <Andy.Kennedy@adtran.com>
+diff -Naur a/CRT.c b/CRT.c
+--- a/CRT.c    2010-11-23 09:56:32.000000000 -0600
++++ b/CRT.c    2011-03-21 17:08:21.000000000 -0500
+@@ -11,7 +11,9 @@
+ #include <signal.h>
+ #include <stdlib.h>
+ #include <stdbool.h>
++#ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
++#endif
+
+ #include "String.h"
+
+@@ -125,12 +127,14 @@
+    CRT_done();
+    #if __linux
+    fprintf(stderr, "\n\nhtop " VERSION " aborting. Please report bug at http://htop.sf.net\n");
+-   #else
+-   fprintf(stderr, "\n\nhtop " VERSION " aborting. Unsupported platform.\n");
+-   #endif
++   #ifdef HAVE_EXECINFO_H
+    size_t size = backtrace(backtraceArray, sizeof(backtraceArray));
+    fprintf(stderr, "Backtrace: \n");
+    backtrace_symbols_fd(backtraceArray, size, 2);
++   #endif
++   #else
++   fprintf(stderr, "\n\nhtop " VERSION " aborting. Unsupported platform.\n");
++   #endif
+    abort();
+ }
+
+diff -Naur a/CRT.h b/CRT.h
+--- a/CRT.h    2010-11-23 09:56:32.000000000 -0600
++++ b/CRT.h    2011-03-21 17:06:16.000000000 -0500
+@@ -14,7 +14,9 @@
+ #include <signal.h>
+ #include <stdlib.h>
+ #include <stdbool.h>
++#ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
++#endif
+
+ #include "String.h"
+
+diff -Naur a/configure.ac b/configure.ac
+--- a/configure.ac     2010-11-23 09:56:32.000000000 -0600
++++ b/configure.ac     2011-03-21 17:05:42.000000000 -0500
+@@ -25,6 +25,7 @@
+ AC_CHECK_HEADERS([stdlib.h string.h strings.h sys/param.h sys/time.h unistd.h curses.h],[:],[
+   missing_headers="$missing_headers $ac_header"
+ ])
++AC_CHECK_HEADERS([execinfog.h],[:],[:])
+
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_HEADER_STDBOOL
diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
--- a/package/htop/htop.mk      1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/htop.mk      2011-03-22 09:31:54.000000000 -0500
@@ -0,0 +1,17 @@
+#############################################################
+#
+# htop
+#
+#############################################################
+HTOP_VERSION = 0.9
+HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
+HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
+HTOP_DEPENDENCIES = ncurses
+
+HTOP_POST_CONFIGURE_HOOKS = HTOP_RETOUCH_CONFIGURE_AC
+
+define HTOP_RETOUCH_CONFIGURE_AC
+       touch -r $(@D)/missing $(@D)/configure.ac
+endef
+
+$(eval $(call AUTOTARGETS,package,htop))
