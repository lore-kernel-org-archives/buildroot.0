From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Mar 2015 21:07:09 +0100
Subject: [Buildroot] [PATCH v1] qt: fix postgresql plugin compile
Message-ID: <1426104429-26006-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add qt5base '-psql_config' configure option and use it to set
pg_config path in configure step instead of legacy PSQL_LIBS
enviornment variable.

Fixes [1]:

PostgreSQL support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: *** [/ssd1/thomas/autobuild/instance-0/output/build/qt-4.8.6/.stamp_configured] Error 101

[1] http://autobuild.buildroot.net/results/1e9/1e949d4593836bc45a55e071cc54ff9c00fad8ae

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../qt/0007-configure-add-psql_config-option.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/qt/0007-configure-add-psql_config-option.patch

diff --git a/package/qt/0007-configure-add-psql_config-option.patch b/package/qt/0007-configure-add-psql_config-option.patch
new file mode 100644
index 0000000..3723afa
--- /dev/null
+++ b/package/qt/0007-configure-add-psql_config-option.patch
@@ -0,0 +1,62 @@
+From c5f2c2d2b1e35606e38d5bf575bb6db74620c247 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 11 Mar 2015 20:55:42 +0100
+Subject: [PATCH] configure: add '-psql_config' option
+
+Allow setting of pg_config path for cross compilation (do
+the same as for mysql_config).
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index c7d2cea..a3cde93 100755
+--- a/configure
++++ b/configure
+@@ -741,6 +741,7 @@ CFG_INCREMENTAL=auto
+ CFG_QCONFIG=full
+ CFG_DEBUG=auto
+ CFG_MYSQL_CONFIG=
++CFG_PSQL_CONFIG=
+ CFG_DEBUG_RELEASE=no
+ CFG_SHARED=yes
+ CFG_SM=auto
+@@ -1159,7 +1160,7 @@ while [ "$#" -gt 0 ]; do
+         shift
+         VAL=$1
+         ;;
+-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-sysroot)
++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-psql_config|-sysroot)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         shift
+         VAL="$1"
+@@ -1371,6 +1372,9 @@ while [ "$#" -gt 0 ]; do
+     mysql_config)
+ 	CFG_MYSQL_CONFIG="$VAL"
+ 	;;
++    psql_config)
++	CFG_PSQL_CONFIG="$VAL"
++	;;
+     prefix)
+         QT_INSTALL_PREFIX="$VAL"
+         ;;
+@@ -5568,10 +5572,11 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
+             ;;
+         psql)
+             if [ "$CFG_SQL_psql" != "no" ]; then
++                [ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
+                 # Be careful not to use native pg_config when cross building.
+-                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
+-                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
+-                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
++                if [ "$XPLATFORM_MINGW" != "yes" ] && [ -x "$CFG_PSQL_CONFIG" ]; then
++                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
++                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
+                 fi
+                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
+                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
+-- 
+2.1.4
+
-- 
2.1.4
