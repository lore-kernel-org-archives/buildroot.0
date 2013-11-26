From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Nov 2013 09:51:04 -0300
Subject: [Buildroot] [PATCH] php: fix iconv related build failure
Message-ID: <1385470264-17180-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a rare edge build failure when iconv is enabled, easily reproduced
in a debian chroot with an aarch64 external toolchain with iconv +
xmlrpc support enabled with a php cgi + cli target.
Should solve bug #6500.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php-01-no-iconv-search.patch | 32 ++++++++++++++++++++++++++++++++
 package/php/php-no-iconv-search.patch    | 21 ---------------------
 2 files changed, 32 insertions(+), 21 deletions(-)
 create mode 100644 package/php/php-01-no-iconv-search.patch
 delete mode 100644 package/php/php-no-iconv-search.patch

diff --git a/package/php/php-01-no-iconv-search.patch b/package/php/php-01-no-iconv-search.patch
new file mode 100644
index 0000000..d2a7ae3
--- /dev/null
+++ b/package/php/php-01-no-iconv-search.patch
@@ -0,0 +1,32 @@
+Just assume ICONV_DIR is fine since we pass the correct parameters
+to configure.
+Otherwise configure will try to guess on absolute directories and
+sometimes messes up on some weird edge conditions.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.3.27.orig/configure php-5.3.27/configure
+--- php-5.3.27.orig/configure	2013-11-26 09:33:30.874253800 -0300
++++ php-5.3.27/configure	2013-11-26 09:41:41.495363637 -0300
+@@ -48212,20 +48212,7 @@
+ 
+ 
+   if test "$iconv_avail" != "no"; then
+-    if test -z "$ICONV_DIR"; then
+-      for i in /usr/local /usr; do
+-        if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
+-          PHP_ICONV_PREFIX="$i"
+-          break
+-        fi
+-      done
+-      if test -z "$PHP_ICONV_PREFIX"; then
+-        PHP_ICONV_PREFIX="/usr"
+-      fi
+-    else
+-      PHP_ICONV_PREFIX="$ICONV_DIR"
+-    fi
+-
++    PHP_ICONV_PREFIX="$ICONV_DIR"
+     CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
+     LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
+ 
diff --git a/package/php/php-no-iconv-search.patch b/package/php/php-no-iconv-search.patch
deleted file mode 100644
index d1e924b..0000000
--- a/package/php/php-no-iconv-search.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Don't push LDFLAGS/CFLAGS for iconv.
-Just assume they're covered somewhere else.
-Otherwise we get -L/usr/lib and -I/usr/include search paths with uClibc
-internal iconv support, which breaks things.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura php-5.3.13/configure php-5.3.13-iconv/configure
---- php-5.3.13/configure	2012-05-08 06:41:23.000000000 -0300
-+++ php-5.3.13-iconv/configure	2012-05-18 22:18:21.313975849 -0300
-@@ -47885,8 +47885,8 @@
-       PHP_ICONV_PREFIX="$ICONV_DIR"
-     fi
- 
--    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
--    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
-+    #CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
-+    #LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
- 
-     if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
-       PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
-- 
1.8.3.2
