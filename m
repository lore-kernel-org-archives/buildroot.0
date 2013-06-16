From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Jun 2013 20:29:15 +0200
Subject: [Buildroot] [git commit] sconeserver: add patch to fix build issue
Message-ID: <20130616183505.1E2009AD41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3874b0d978b8f15d3f7769a309d1a27735788559
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/f28/f2856c00d99fbf9ce882442ab7b868ccc4966388/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../sconeserver-fix-configure-operators.patch      |   93 ++++++++++++++++++++
 1 files changed, 93 insertions(+), 0 deletions(-)

diff --git a/package/sconeserver/sconeserver-fix-configure-operators.patch b/package/sconeserver/sconeserver-fix-configure-operators.patch
new file mode 100644
index 0000000..504be45
--- /dev/null
+++ b/package/sconeserver/sconeserver-fix-configure-operators.patch
@@ -0,0 +1,93 @@
+configure: use the proper '=' POSIX shell operator
+
+The '==' shell operator doesn't work in POSIX shells, so when sh is
+symlinked to a POSIX shell such as dash and not a bash shell, the
+configure tests that use this operator fail to work.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: sconeserver-211/configure.in
+===================================================================
+--- sconeserver-211.orig/configure.in	2013-05-14 12:00:19.000000000 +0200
++++ sconeserver-211/configure.in	2013-06-16 18:47:31.000000000 +0200
+@@ -121,7 +121,7 @@
+   [SSL="$withval"],
+   [AC_CHECK_HEADER([openssl/ssl.h],[SSL="yes"],[SSL="no"])]
+ )
+-if test "x$SSL" == "xyes"; then
++if test "x$SSL" = "xyes"; then
+   AC_CHECK_HEADER([openssl/ssl.h],,
+     [AC_MSG_ERROR([header file <openssl/ssl.h> is required for OpenSSL, use --with-openssl-path=PATH])]
+   )
+@@ -179,7 +179,7 @@
+ )
+ 
+ # Check we have libxml2 if Sconesite is enabled
+-if test "x$SCONESITE" == "xyes"; then
++if test "x$SCONESITE" = "xyes"; then
+   if test "x$ac_cv_lib_xml2_xmlNewDoc" != "xyes"; then
+     AC_MSG_ERROR([library 'libxml2' is required for Sconesite])
+   fi
+@@ -195,7 +195,7 @@
+   [MAGICK_CONFIG="Magick++-config"]
+ )
+ AC_CHECK_PROG([MAGICK], ["$MAGICK_CONFIG"], [yes], [no])
+-if test "x$MAGICK" == "xyes"; then
++if test "x$MAGICK" = "xyes"; then
+   MAGICK_CFLAGS=`$MAGICK_CONFIG --cppflags`
+   MAGICK_LDFLAGS=`$MAGICK_CONFIG --ldflags`
+   MAGICK_LIBS=`$MAGICK_CONFIG --libs`
+@@ -209,7 +209,7 @@
+ )
+ 
+ # Need ImageMagick for image
+-if test "x$IMAGE" == "xyes"; then
++if test "x$IMAGE" = "xyes"; then
+   if test "x$MAGICK" != "xyes"; then
+     AC_MSG_ERROR([library 'Magick++' is required for image])
+   fi
+@@ -227,7 +227,7 @@
+   [RSS="yes"]
+ )
+ # Need libxml2 library for rss
+-if test "x$RSS" == "xyes"; then
++if test "x$RSS" = "xyes"; then
+   if test "x$ac_cv_lib_xml2_xmlNewDoc" != "xyes"; then
+     AC_MSG_ERROR([library 'libxml2' is required for the rss module])
+   fi
+@@ -249,7 +249,7 @@
+   [AC_CHECK_HEADER([mysql/mysql.h],[MYSQL="yes"],[MYSQL="no"])]
+ )
+ # Need mysqlclient library for mysql
+-if test "x$MYSQL" == "xyes"; then
++if test "x$MYSQL" = "xyes"; then
+   AC_CHECK_LIB([mysqlclient],[mysql_init],
+     [CXXFLAGS="$CXXFLAGS `$MYSQL_CONFIG --cflags`"
+      MYSQL_LIBADD=`$MYSQL_CONFIG --libs`
+@@ -266,7 +266,7 @@
+   [AC_CHECK_HEADER([sqlite3.h],[SQLITE="yes"],[SQLITE="no"])]
+ )
+ # Need sqlite3 library for sqlite
+-if test "x$SQLITE" == "xyes"; then
++if test "x$SQLITE" = "xyes"; then
+   AC_CHECK_LIB([sqlite3],[sqlite3_open_v2],
+     [SQLITE_LIBADD="-lsqlite3"
+      AC_SUBST(SQLITE_LIBADD)],
+@@ -283,7 +283,7 @@
+   [AC_CHECK_HEADER([mpfr.h],[MATHS="yes"],[MATHS="no"])]
+ )
+ # Need libgmp and libmpfr library for maths
+-if test "x$MATHS" == "xyes"; then
++if test "x$MATHS" = "xyes"; then
+   AC_CHECK_LIB([mpfr],[mpfr_init],
+     [MATHS_LIBADD="-lgmp -lmpfr"
+      AC_SUBST(MATHS_LIBADD)],
+@@ -300,7 +300,7 @@
+   [AC_CHECK_HEADER([X11/Xlib.h],[UI="yes"],[UI="no"])]
+ )
+ # Need libX11 library for ui
+-if test "x$UI" == "xyes"; then
++if test "x$UI" = "xyes"; then
+   AC_CHECK_LIB([X11],[XOpenDisplay],
+     [UI_LIBADD="-lX11"
+      AC_SUBST(UI_LIBADD)],
