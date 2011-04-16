From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 16 Apr 2011 22:56:48 +0200
Subject: [Buildroot] [git commit] package: add htop package
Message-ID: <20110417053736.E069E82144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7fa9c251956577058142b001464bbc0ae67a763a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes made based upon e-mails with Mike Frysinger and Gerhard Heift. The
autoreconf change is important for anyone using uClibc as there is no widely
available backtrace (yet).

[Peter: fix Config.in indentation, autoreconf, patch]
Signed-off-by:  Andy Kennedy <Andy.Kennedy@AdTran.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    3 ++
 package/htop/Config.in  |    8 +++++
 package/htop/htop.mk    |   13 ++++++++
 package/htop/htop.patch |   75 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 package/htop/Config.in
 create mode 100644 package/htop/htop.mk
 create mode 100644 package/htop/htop.patch

diff --git a/package/Config.in b/package/Config.in
index ea39570..014c2c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -477,6 +477,9 @@ endmenu
 menu "System tools"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
+endif
+source "package/htop/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/htop/Config.in b/package/htop/Config.in
new file mode 100644
index 0000000..55b4b15
--- /dev/null
+++ b/package/htop/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HTOP
+	bool "htop"
+	select BR2_PACKAGE_NCURSES
+	help
+	  htop is an interactive text-mode process viewer for Linux.
+	  It aims to be a better top.
+
+	  http://htop.sf.net
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
new file mode 100644
index 0000000..3f27b3e
--- /dev/null
+++ b/package/htop/htop.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# htop
+#
+#############################################################
+
+HTOP_VERSION = 0.9
+HTOP_SOURCE = htop-$(HTOP_VERSION).tar.gz
+HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERSION)
+HTOP_DEPENDENCIES = ncurses
+HTOP_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS,package,htop))
diff --git a/package/htop/htop.patch b/package/htop/htop.patch
new file mode 100644
index 0000000..7765614
--- /dev/null
+++ b/package/htop/htop.patch
@@ -0,0 +1,75 @@
+# This patch removes the hard dependency on backtrace by checking for
+# it at compile time and adds a cross-compile /proc check.
+# Patch given to me by Hisham <hisham.hm@gmail.com> (htop-general)
+#
+# This patch is taken from upstream svn (r213, r215)
+#
+# Signed-off-by: Andy Kennedy <Andy.Kennedy@adtran.com>
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
+--- a/configure.ac    2010-11-23 09:56:32.000000000 -0600
++++ b/configure.ac    2011-03-21 17:06:16.000000000 -0500
+@@ -25,6 +25,7 @@
+ AC_CHECK_HEADERS([stdlib.h string.h strings.h sys/param.h sys/time.h unistd.h curses.h],[:],[
+   missing_headers="$missing_headers $ac_header"
+ ])
++AC_CHECK_HEADERS([execinfo.h],[:],[:])
+
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_HEADER_STDBOOL
+@@ -99,10 +100,10 @@
+   AC_MSG_ERROR([missing headers: $missing_headers])
+ fi
+
+-
+-
++if test "$cross_compiling" = "no"; then
+ AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find /proc/stat. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
+ AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
++fi
+
+ AC_ARG_ENABLE(plpa, [AC_HELP_STRING([--enable-plpa], [enable PLPA support for CPU affinity])], ,enable_plpa="yes")
+ PLPA_INCLUDED
-- 
1.7.3.4
