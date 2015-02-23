From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 19:01:39 +0100
Subject: [Buildroot] [git commit] qt5base: fix postgresql plugin compile
Message-ID: <20150223180159.52DB98178B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b54fbc925f419f740f4cbc8229cfbf40ce84895
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add qt5base '-psql_config' configure option and use it to set
pg_config path in configure step instead of legacy PSQL_LIBS
enviornment variable.

Fixes [1]:

PostgreSQL auto-detection... ()
make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/qt5base-5.4.0/config.tests/unix/psql'
/home/peko/autobuild/instance-0/output/host/usr/bin/sh-linux-gnu-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/peko/autobuild/instance-0/output/host/usr/sh4a-buildroot-linux-gnu/sysroot -O2 -O3 -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I. -I/usr/include/postgresql -o psql.o psql.cpp
sh-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/postgresql'
make[1]: *** [psql.o] Error 1
make[1]: Leaving directory `/home/peko/autobuild/instance-0/output/build/qt5base-5.4.0/config.tests/unix/psql'
PostgreSQL disabled.
PostgreSQL support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: *** [/home/peko/autobuild/instance-0/output/build/qt5base-5.4.0/.stamp_configured] Error 101
make: Leaving directory `/home/peko/autobuild/instance-0/buildroot'

[1] http://autobuild.buildroot.net/results/354/354bae2337703ad8bfb9d33c79538df3017b7fe9/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0007-configure-add-psql_config-option.patch    |   60 ++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     |    3 +-
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/0007-configure-add-psql_config-option.patch b/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
new file mode 100644
index 0000000..7561314
--- /dev/null
+++ b/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
@@ -0,0 +1,60 @@
+From 95f2e4001f9c1721cbdb26d3f9c38511adae9c4b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 19 Feb 2015 22:41:02 +0100
+Subject: [PATCH] configure: add '-psql_config' option
+
+Allow setting of pg_config path for cross compilation (do
+the same as for mysql_config).
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 0c66ecf..a832ae3 100755
+--- a/configure
++++ b/configure
+@@ -578,6 +578,7 @@ CFG_WIDGETS=yes
+ CFG_QCONFIG=full
+ CFG_DEBUG=auto
+ CFG_MYSQL_CONFIG=
++CFG_PSQL_CONFIG=
+ CFG_DEBUG_RELEASE=no
+ CFG_FORCEDEBUGINFO=no
+ CFG_SHARED=yes
+@@ -885,6 +886,7 @@ while [ "$#" -gt 0 ]; do
+     -arch| \
+     -host-arch| \
+     -mysql_config| \
++    -psql_config| \
+     -qpa| \
+     -qconfig| \
+     -qreal| \
+@@ -1066,6 +1068,9 @@ while [ "$#" -gt 0 ]; do
+     mysql_config)
+ 	CFG_MYSQL_CONFIG="$VAL"
+ 	;;
++    psql_config)
++	CFG_PSQL_CONFIG="$VAL"
++	;;
+     prefix)
+         QT_INSTALL_PREFIX="$VAL"
+         ;;
+@@ -4369,10 +4374,11 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
+             ;;
+         psql)
+             if [ "$CFG_SQL_psql" != "no" ]; then
++		[ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
+                 # Be careful not to use native pg_config when cross building.
+                 if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
+-                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null | filterIncludePath`
+-                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null | filterLibraryPath`
++                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
++                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
+                 fi
+                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
+                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
+-- 
+2.1.4
+
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index aaf4da0..4d344fe 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -67,8 +67,7 @@ QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_PSQL),y)
-QT5BASE_CONFIGURE_OPTS += -plugin-sql-psql
-QT5BASE_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
+QT5BASE_CONFIGURE_OPTS += -plugin-sql-psql -psql_config $(STAGING_DIR)/usr/bin/pg_config
 QT5BASE_DEPENDENCIES   += postgresql
 else
 QT5BASE_CONFIGURE_OPTS += -no-sql-psql
