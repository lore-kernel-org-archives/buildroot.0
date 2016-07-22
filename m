From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2016 20:34:46 -0300
Subject: [Buildroot] [PATCH] htop: bump to version 2.0.2
Message-ID: <1469230486-22870-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...001-Allow-to-override-ncurses-config-path.patch | 36 ----------------------
 package/htop/htop.hash                             |  6 ++--
 package/htop/htop.mk                               |  4 +--
 3 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 package/htop/0001-Allow-to-override-ncurses-config-path.patch

diff --git a/package/htop/0001-Allow-to-override-ncurses-config-path.patch b/package/htop/0001-Allow-to-override-ncurses-config-path.patch
deleted file mode 100644
index 9a8de15..0000000
--- a/package/htop/0001-Allow-to-override-ncurses-config-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 666f12f60f7d7936af932bf513bc0e9c5c5158f9 Mon Sep 17 00:00:00 2001
-From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
-Date: Sat, 9 Jul 2016 22:48:34 -0300
-Subject: [PATCH] Allow to override ncurses*-config path
-
-This will be used when cross-compiling with ncurses*-config generated for the
-target, using constructs like
-htop_ncurses_config_script=/path/to/ncurses5-config
-
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
-Patch sent upstream: https://github.com/hishamhm/htop/pull/524
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fa32359..790a7f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -147,7 +147,11 @@ fi
- # HTOP_CHECK_SCRIPT(LIBNAME, FUNCTION, DEFINE, CONFIG_SCRIPT, ELSE_PART)
- m4_define([HTOP_CHECK_SCRIPT],
- [
--   htop_config_script=$([$4] --libs 2> /dev/null)
-+   if test ! -z "$htop_[$1]_config_script"; then
-+      htop_config_script=$($htop_[$1]_config_script --libs 2> /dev/null)
-+   else
-+      htop_config_script=$([$4] --libs 2> /dev/null)
-+   fi
-    htop_script_success=no
-    htop_save_LDFLAGS="$LDFLAGS"
-    if test ! "x$htop_config_script" = x; then
--- 
-2.9.0
-
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index ae359ec..cfea23f 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
-# Hashes from: http://www.freelists.org/post/htop/ANN-htop-201
-md5   f75fe92b4defaa80d99109830f34b5e2          htop-2.0.1.tar.gz
-sha1  ef9adab68b0218a16936c306f635e7fce227b7e6  htop-2.0.1.tar.gz
+# Hashes from: http://www.freelists.org/post/htop/ANN-htop-202
+md5	7d354d904bad591a931ad57e99fea84a	htop-2.0.2.tar.gz
+sha1	201f793f13dce2448e36047079875b9bd5bba75a	htop-2.0.2.tar.gz
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 8a6b020..c4df5ac 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-HTOP_VERSION = 2.0.1
+HTOP_VERSION = 2.0.2
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-# For 0001-Allow-to-override-ncurses-config-path.patch
-HTOP_AUTORECONF = YES
 HTOP_CONF_OPTS = --disable-unicode
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = htop_ncurses_config_script=$(STAGING_DIR)/usr/bin/ncurses5-config
-- 
2.7.3
