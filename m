From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Apr 2015 21:30:36 +0200
Subject: [Buildroot] [PATCH v1] qt: fix postgresql plugin configure
Message-ID: <1428953436-1124-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch (see [1], [2]) which fixes a bug introduced by previous
patch '0007-configure-add-psql_config-option.patch'.

[1] https://bugreports.qt.io/browse/QTBUG-45463
[2] https://codereview.qt-project.org/110041

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...erIncludePath-and-filterLibraryPath-usage.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch

diff --git a/package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch b/package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch
new file mode 100644
index 0000000..6d66633
--- /dev/null
+++ b/package/qt/0008-Remove-filterIncludePath-and-filterLibraryPath-usage.patch
@@ -0,0 +1,36 @@
+From 8ae2c4e9ae59041384f95d9125d214ecb0b54f6f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lisandro=20Dami=C3=A1n=20Nicanor=20P=C3=A9rez=20Meyer?=
+ <perezmeyer@gmail.com>
+Date: Wed, 8 Apr 2015 21:45:37 -0300
+Subject: [PATCH] Remove filterIncludePath and filterLibraryPath usage.
+
+They are only defined in qt5's configure script.
+
+Task-number: QTBUG-45463
+Change-Id: Ibce2bd1d06e35de5174b15919c939b41cf013d05
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+
+Upstream: http://code.qt.io/cgit/qt/qt.git/patch/?id=90a09c7aedb3036aa1f572a959c67b1f8fcd9e9c
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index a3cde93..317e826 100755
+--- a/configure
++++ b/configure
+@@ -5575,8 +5575,8 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
+                 [ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
+                 # Be careful not to use native pg_config when cross building.
+                 if [ "$XPLATFORM_MINGW" != "yes" ] && [ -x "$CFG_PSQL_CONFIG" ]; then
+-                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
+-                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
++                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null`
++                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null`
+                 fi
+                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
+                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
+-- 
+2.1.4
+
-- 
2.1.4
