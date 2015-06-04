From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  4 Jun 2015 19:28:41 +0200
Subject: [Buildroot] [PATCH] qt: bump to 4.8.7
Message-ID: <1433438921-5118-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches applied upstream.
Add hash file.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 .../qt/0007-configure-add-psql_config-option.patch | 62 ----------------------
 ...erIncludePath-and-filterLibraryPath-usage.patch | 36 -------------
 package/qt/qt.hash                                 |  3 ++
 package/qt/qt.mk                                   |  2 +-
 4 files changed, 4 insertions(+), 99 deletions(-)
 delete mode 100644 package/qt/0007-configure-add-psql_config-option.patch
 delete mode 100644 package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch
 create mode 100644 package/qt/qt.hash

diff --git a/package/qt/0007-configure-add-psql_config-option.patch b/package/qt/0007-configure-add-psql_config-option.patch
deleted file mode 100644
index 3723afa..0000000
--- a/package/qt/0007-configure-add-psql_config-option.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From c5f2c2d2b1e35606e38d5bf575bb6db74620c247 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Wed, 11 Mar 2015 20:55:42 +0100
-Subject: [PATCH] configure: add '-psql_config' option
-
-Allow setting of pg_config path for cross compilation (do
-the same as for mysql_config).
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index c7d2cea..a3cde93 100755
---- a/configure
-+++ b/configure
-@@ -741,6 +741,7 @@ CFG_INCREMENTAL=auto
- CFG_QCONFIG=full
- CFG_DEBUG=auto
- CFG_MYSQL_CONFIG=
-+CFG_PSQL_CONFIG=
- CFG_DEBUG_RELEASE=no
- CFG_SHARED=yes
- CFG_SM=auto
-@@ -1159,7 +1160,7 @@ while [ "$#" -gt 0 ]; do
-         shift
-         VAL=$1
-         ;;
--    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-sysroot)
-+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-psql_config|-sysroot)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL="$1"
-@@ -1371,6 +1372,9 @@ while [ "$#" -gt 0 ]; do
-     mysql_config)
- 	CFG_MYSQL_CONFIG="$VAL"
- 	;;
-+    psql_config)
-+	CFG_PSQL_CONFIG="$VAL"
-+	;;
-     prefix)
-         QT_INSTALL_PREFIX="$VAL"
-         ;;
-@@ -5568,10 +5572,11 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
-             ;;
-         psql)
-             if [ "$CFG_SQL_psql" != "no" ]; then
-+                [ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
-                 # Be careful not to use native pg_config when cross building.
--                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
--                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
-+                if [ "$XPLATFORM_MINGW" != "yes" ] && [ -x "$CFG_PSQL_CONFIG" ]; then
-+                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
-+                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
-                 fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
--- 
-2.1.4
-
diff --git a/package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch b/package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch
deleted file mode 100644
index 6d66633..0000000
--- a/package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8ae2c4e9ae59041384f95d9125d214ecb0b54f6f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Lisandro=20Dami=C3=A1n=20Nicanor=20P=C3=A9rez=20Meyer?=
- <perezmeyer@gmail.com>
-Date: Wed, 8 Apr 2015 21:45:37 -0300
-Subject: [PATCH] Remove filterIncludePath and filterLibraryPath usage.
-
-They are only defined in qt5's configure script.
-
-Task-number: QTBUG-45463
-Change-Id: Ibce2bd1d06e35de5174b15919c939b41cf013d05
-Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
-
-Upstream: http://code.qt.io/cgit/qt/qt.git/patch/?id=90a09c7aedb3036aa1f572a959c67b1f8fcd9e9c
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index a3cde93..317e826 100755
---- a/configure
-+++ b/configure
-@@ -5575,8 +5575,8 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
-                 [ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
-                 # Be careful not to use native pg_config when cross building.
-                 if [ "$XPLATFORM_MINGW" != "yes" ] && [ -x "$CFG_PSQL_CONFIG" ]; then
--                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
--                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
-+                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null`
-+                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null`
-                 fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
--- 
-2.1.4
-
diff --git a/package/qt/qt.hash b/package/qt/qt.hash
new file mode 100644
index 0000000..301010c
--- /dev/null
+++ b/package/qt/qt.hash
@@ -0,0 +1,3 @@
+# md5 http://download.qt.io/official_releases/qt/4.8/4.8.7/md5sums-4.8.7, sha256 locally computed:
+md5    d990ee66bf7ab0c785589776f35ba6ad                                 qt-everywhere-opensource-src-4.8.7.tar.gz
+sha256 e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0 qt-everywhere-opensource-src-4.8.7.tar.gz
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 035ca3a..a7bbe5f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 ################################################################################
 
 QT_VERSION_MAJOR = 4.8
-QT_VERSION = $(QT_VERSION_MAJOR).6
+QT_VERSION = $(QT_VERSION_MAJOR).7
 QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
-- 
1.9.1
