From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 12 Jan 2011 15:15:30 -0600
Subject: [Buildroot] [PATCH] htop: new package
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EE63C42@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following adds support for version 0.8.3 of htop.  0.9 is the
latest, however, is dependant on backtrace.  The next version is to
remove the hard dependencies of backtrace and make it a compile-time
check.

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/htop/Config.in b/package/htop/Config.in
--- a/package/htop/Config.in    1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/Config.in    2011-01-11 15:16:01.000000000 -0600
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HTOP
+       bool "htop"
+       select BR2_PACKAGE_NCURSES
+       select UCLIBC_HAS_BACKTRACE if BR2_TOOLCHAIN_BUILDROOT
+       help
+         htop is an interactive text-mode process viewer for Linux.
+         It aims to be a better top. 
+
+         http://sourceforge.net/projects/htop/
diff -Naur a/package/htop/htop-cross-no-proc-check.patch
b/package/htop/htop-cross-no-proc-check.patch
--- a/package/htop/htop-cross-no-proc-check.patch       1969-12-31
18:00:00.000000000 -0600
+++ b/package/htop/htop-cross-no-proc-check.patch       2011-01-12
14:51:53.000000000 -0600
@@ -0,0 +1,18 @@
+--- a/configure        2009-06-23 08:53:37.000000000 -0500
++++ b/configure        2011-01-12 14:21:49.000000000 -0600
+@@ -21809,6 +21809,7 @@
+ 
+ fi
+ 
++if test "$cross_compiling" = no ; then
+ as_ac_File=`echo "ac_cv_file_$PROCDIR/stat" | $as_tr_sh`
+ { echo "$as_me:$LINENO: checking for $PROCDIR/stat" >&5
+ echo $ECHO_N "checking for $PROCDIR/stat... $ECHO_C" >&6; }
+@@ -21862,6 +21863,7 @@
+ echo "$as_me: error: Cannot find /proc/meminfo. Make sure you have a
Linux-compatible /proc filesystem mounted. See the file README for
help." >&2;}
+    { (exit 1); exit 1; }; }
+ fi
++fi #cross_compiling = no (Andy Kennedy)
+ 
+ 
+ 
diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
--- a/package/htop/htop.mk      1969-12-31 18:00:00.000000000 -0600
+++ b/package/htop/htop.mk      2011-01-12 13:36:36.000000000 -0600
@@ -0,0 +1,12 @@
+#############################################################
+#
+# htop
+#
+#############################################################
+# Version 0.9 requires backtrace, which doesn't exsist in uClibC, yet.
+HTOP_VERSION = 0.8.3
+HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
+HTOP_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
+HTOP_DEPENDENCIES = ncurses
+
+$(eval $(call AUTOTARGETS,package,htop))
