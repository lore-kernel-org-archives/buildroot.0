From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 24 Feb 2015 23:47:49 +0100
Subject: [Buildroot] [PATCH] qt5base: update for postgresql plugin compile
	fix
Message-ID: <1424818069-11681-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../qt5/qt5base/0007-configure-add-psql_config-option.patch   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5base/0007-configure-add-psql_config-option.patch b/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
index 7561314..8075fe4 100644
--- a/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
+++ b/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
@@ -1,4 +1,4 @@
-From 95f2e4001f9c1721cbdb26d3f9c38511adae9c4b Mon Sep 17 00:00:00 2001
+From f23a18de3c398c908c92b8cf8f20edc12435b9d1 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Thu, 19 Feb 2015 22:41:02 +0100
 Subject: [PATCH] configure: add '-psql_config' option
@@ -8,11 +8,11 @@ the same as for mysql_config).
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- configure | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
+ configure | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 0c66ecf..a832ae3 100755
+index 0c66ecf..491486a 100755
 --- a/configure
 +++ b/configure
 @@ -578,6 +578,7 @@ CFG_WIDGETS=yes
@@ -47,9 +47,10 @@ index 0c66ecf..a832ae3 100755
              if [ "$CFG_SQL_psql" != "no" ]; then
 +		[ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
                  # Be careful not to use native pg_config when cross building.
-                 if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
+-                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
 -                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null | filterIncludePath`
 -                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null | filterLibraryPath`
++                if [ "$XPLATFORM_MINGW" != "yes" ] && [ -x "$CFG_PSQL_CONFIG" ]; then
 +                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
 +                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
                  fi
-- 
2.1.4
