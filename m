From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 10 Jul 2016 17:59:34 -0300
Subject: [Buildroot] [PATCH] htop: bump to version 2.0.1
Message-ID: <20160710205934.5373-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- drop 0001-native-affinity.patch as it was replaced upstream [1]. Autoreconf
  could be dropped

- drop conf env ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes because
  these tests no longer run when cross-compiling [2]

- upstream created a custom check function to use ncurses*-config [3] but it
  does not allow to override the path to ncurses*-config, leading to a build
  failure as the htop build system would search the path of host tools.
  A new patch 0001-Allow-to-override-ncurses-config-path.patch allows this
  override [4]. It brings back the need to autoreconf

- set path to ncurses5-config in conf env in order to avoid the htop build
  system finding it in the path of host tools

[1] https://github.com/hishamhm/htop/commit/dfad0afb36df9ac104490454c6472625e3ecbe0c
[2] https://github.com/hishamhm/htop/commit/b56195663760d76ea61d9ed15121dd4a13fa68cd
[3] https://github.com/hishamhm/htop/commit/96c929f82b811f054726f1ba3e5fd065976a1204
[4] https://github.com/hishamhm/htop/pull/524/commits/666f12f60f7d7936af932bf513bc0e9c5c5158f9

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 ...001-Allow-to-override-ncurses-config-path.patch | 36 ++++++++++++++++++++++
 package/htop/0001-native-affinity.patch            | 25 ---------------
 package/htop/htop.hash                             |  5 +--
 package/htop/htop.mk                               |  7 +++--
 4 files changed, 43 insertions(+), 30 deletions(-)
 create mode 100644 package/htop/0001-Allow-to-override-ncurses-config-path.patch
 delete mode 100644 package/htop/0001-native-affinity.patch

diff --git a/package/htop/0001-Allow-to-override-ncurses-config-path.patch b/package/htop/0001-Allow-to-override-ncurses-config-path.patch
new file mode 100644
index 0000000..9a8de15
--- /dev/null
+++ b/package/htop/0001-Allow-to-override-ncurses-config-path.patch
@@ -0,0 +1,36 @@
+From 666f12f60f7d7936af932bf513bc0e9c5c5158f9 Mon Sep 17 00:00:00 2001
+From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+Date: Sat, 9 Jul 2016 22:48:34 -0300
+Subject: [PATCH] Allow to override ncurses*-config path
+
+This will be used when cross-compiling with ncurses*-config generated for the
+target, using constructs like
+htop_ncurses_config_script=/path/to/ncurses5-config
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+---
+Patch sent upstream: https://github.com/hishamhm/htop/pull/524
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa32359..790a7f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -147,7 +147,11 @@ fi
+ # HTOP_CHECK_SCRIPT(LIBNAME, FUNCTION, DEFINE, CONFIG_SCRIPT, ELSE_PART)
+ m4_define([HTOP_CHECK_SCRIPT],
+ [
+-   htop_config_script=$([$4] --libs 2> /dev/null)
++   if test ! -z "$htop_[$1]_config_script"; then
++      htop_config_script=$($htop_[$1]_config_script --libs 2> /dev/null)
++   else
++      htop_config_script=$([$4] --libs 2> /dev/null)
++   fi
+    htop_script_success=no
+    htop_save_LDFLAGS="$LDFLAGS"
+    if test ! "x$htop_config_script" = x; then
+-- 
+2.9.0
+
diff --git a/package/htop/0001-native-affinity.patch b/package/htop/0001-native-affinity.patch
deleted file mode 100644
index bf68e53..0000000
--- a/package/htop/0001-native-affinity.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-# This patch removes the check for native_affinity for cross compiling.
-# This patch has been pushed to htop on 23 November 2011, however, is
-# not in the 1.0 release and may not be exactly what Hisham puts into
-# the official build.
-#
-# Signed-off-by: Andy Kennedy <Andy.Kennedy@adtran.com>
-diff -Naur a/configure.ac b/configure.ac
---- a/configure.ac     2011-11-20 20:46:48.000000000 -0600
-+++ b/configure.ac     2011-11-23 10:41:44.000000000 -0600
-@@ -111,7 +111,6 @@
- if test "$cross_compiling" = "no"; then
- AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find /proc/stat. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
- AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
--fi
- 
- AC_ARG_ENABLE(native_affinity, [AC_HELP_STRING([--enable-native-affinity], [enable native sched_setaffinity and sched_getaffinity for affinity support, disables hwloc])], ,enable_native_affinity="yes")
- if test "x$enable_native_affinity" = xyes; then
-@@ -130,6 +129,7 @@
-       AC_MSG_RESULT([yes])],
-      [AC_MSG_RESULT([no])])
- fi
-+fi
- 
- AC_ARG_ENABLE(hwloc, [AC_HELP_STRING([--enable-hwloc], [enable hwloc support for CPU affinity])],, enable_hwloc="no")
- if test "x$enable_hwloc" = xyes
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 41d5a2e..ae359ec 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,2 +1,3 @@
-# From http://www.freelists.org/post/htop/ANN-htop-103
-md5	e768b9b55c033d9c1dffda72db3a6ac7	htop-1.0.3.tar.gz
+# Hashes from: http://www.freelists.org/post/htop/ANN-htop-201
+md5   f75fe92b4defaa80d99109830f34b5e2          htop-2.0.1.tar.gz
+sha1  ef9adab68b0218a16936c306f635e7fce227b7e6  htop-2.0.1.tar.gz
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 629b04c..8a6b020 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-HTOP_VERSION = 1.0.3
+HTOP_VERSION = 2.0.1
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-# For htop-01-native-affinity.patch
+# For 0001-Allow-to-override-ncurses-config-path.patch
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPTS = --disable-unicode
-HTOP_CONF_ENV = ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes
+# Prevent htop build system from searching the host paths
+HTOP_CONF_ENV = htop_ncurses_config_script=$(STAGING_DIR)/usr/bin/ncurses5-config
 HTOP_LICENSE = GPLv2
 HTOP_LICENSE_FILES = COPYING
 
-- 
2.9.0
