From: Julien Corjon <corjon.j@ecagroup.com>
Date: Fri, 10 Jul 2015 16:20:18 +0200
Subject: [Buildroot] [PATCH v3 1/5] qt5: bump version to 5.5.0
In-Reply-To: <1436380555-13657-3-git-send-email-corjon.j@ecagroup.com>
References: <1436380555-13657-3-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES is no longer useful since eglfs does not
depend on the device makespecs anymore. Instead, backends are autodetected by
configure [1].

0008-forkd-disable-eventfd-for-uclibc.patch disable missing eventfd in new Qt
3rd party forkd for uClibc toolchains.

Remove patches commited in Qt mainline and update pending one

[1] https://codereview.qt-project.org/#/c/107548/

Tested-by: Julien Corjon <corjon.j@ecagroup.com> Full compilation on ARM/uClibc
Tested-by: Julien Corjon <corjon.j@ecagroup.com> Partialy compiled and tested
  on i.MX6/linaro with OpenGL backend

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
v2 -> v3 : 
  - Re-include modification of qt5base.mk lost in rebase...
v1 -> v2 :
  - Rewrite commit message (suggested by Thomas)
  - Fix comment on uclibc version in patch 0008-... (suggested by Thomas)

 package/qt5/qt5.mk                                 |   4 +-
 ...ing-Check-if-uClibc-has-backtrace-support.patch |  48 ----
 package/qt5/qt5base/0004-xcb-egl-fixes.patch       |   9 +-
 .../0005-no-gold-linker-for-host-build.patch       |  40 ++-
 ...nfigure-fix-gold-linker-support-detection.patch |  36 ---
 .../0007-configure-add-psql_config-option.patch    |  61 -----
 .../0008-forkd-disable-eventfd-for-uclibc.patch    |  19 ++
 package/qt5/qt5base/qt5base.hash                   |   8 +-
 package/qt5/qt5base/qt5base.mk                     |   8 +-
 .../0001-Fix-build-with-no-c-11.patch              | 267 ---------------------
 ...z_data_p.h-Add-missing-include-byteswap.h.patch |  46 ----
 package/qt5/qt5connectivity/qt5connectivity.hash   |   8 +-
 package/qt5/qt5declarative/qt5declarative.hash     |   8 +-
 package/qt5/qt5enginio/qt5enginio.hash             |   8 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   8 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |   8 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   8 +-
 package/qt5/qt5quick1/qt5quick1.hash               |   8 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   8 +-
 package/qt5/qt5script/qt5script.hash               |   8 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   8 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   8 +-
 package/qt5/qt5svg/qt5svg.hash                     |   8 +-
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |   8 +-
 package/qt5/qt5webkit/qt5webkit.hash               |   8 +-
 package/qt5/qt5websockets/qt5websockets.hash       |   8 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   8 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   8 +-
 28 files changed, 126 insertions(+), 556 deletions(-)
 delete mode 100644 package/qt5/qt5base/0002-logging-Check-if-uClibc-has-backtrace-support.patch
 delete mode 100644 package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch
 delete mode 100644 package/qt5/qt5base/0007-configure-add-psql_config-option.patch
 create mode 100644 package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch
 delete mode 100644 package/qt5/qt5connectivity/0001-Fix-build-with-no-c-11.patch
 delete mode 100644 package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e7485e1..d7f38ac 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
-QT5_VERSION_MAJOR = 5.4
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION_MAJOR = 5.5
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5base/0002-logging-Check-if-uClibc-has-backtrace-support.patch b/package/qt5/qt5base/0002-logging-Check-if-uClibc-has-backtrace-support.patch
deleted file mode 100644
index 7d884ad..0000000
--- a/package/qt5/qt5base/0002-logging-Check-if-uClibc-has-backtrace-support.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 9f03adc74fa06e9559e8bb85f1cfd942397328b5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Wed, 24 Dec 2014 17:29:11 +0200
-Subject: [PATCH] logging: Check if uClibc has backtrace support
-
-execinfo.h is optional in uClibc. We need to check
-__UCLIBC_HAS_BACKTRACE__ if uClibc is used.
-
-Change-Id: Ie28be85b0b70472df1fc4a208581bb66ad34229e
-Sent-Upstream: https://codereview.qt-project.org/#/c/102628/
-Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
----
- src/corelib/global/qlogging.cpp | 15 +++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/src/corelib/global/qlogging.cpp b/src/corelib/global/qlogging.cpp
-index 50d35a6..fa897d6 100644
---- a/src/corelib/global/qlogging.cpp
-+++ b/src/corelib/global/qlogging.cpp
-@@ -77,14 +77,21 @@
- #endif
- 
- #if !defined QT_NO_REGULAREXPRESSION && !defined(QT_BOOTSTRAPPED)
--#  if (defined(__GLIBC__) && defined(__GLIBCXX__)) || (__has_include(<cxxabi.h>) && __has_include(<execinfo.h>))
-+#  ifdef __UCLIBC__
-+#    if __UCLIBC_HAS_BACKTRACE__
-+#      define QLOGGING_HAVE_BACKTRACE
-+#    endif
-+#  elif (defined(__GLIBC__) && defined(__GLIBCXX__)) || (__has_include(<cxxabi.h>) && __has_include(<execinfo.h>))
- #    define QLOGGING_HAVE_BACKTRACE
--#    include <qregularexpression.h>
--#    include <cxxabi.h>
--#    include <execinfo.h>
- #  endif
- #endif
- 
-+#ifdef QLOGGING_HAVE_BACKTRACE
-+#  include <qregularexpression.h>
-+#  include <cxxabi.h>
-+#  include <execinfo.h>
-+#endif
-+
- #include <stdio.h>
- 
- QT_BEGIN_NAMESPACE
--- 
-1.9.1
-
diff --git a/package/qt5/qt5base/0004-xcb-egl-fixes.patch b/package/qt5/qt5base/0004-xcb-egl-fixes.patch
index 2bbd849..53f8453 100644
--- a/package/qt5/qt5base/0004-xcb-egl-fixes.patch
+++ b/package/qt5/qt5base/0004-xcb-egl-fixes.patch
@@ -49,15 +49,16 @@ diff -Nuar a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/pl
  #include <qpa/qplatformcursor.h>
  #include <qpa/qplatformscreen.h>
  
---- a/src/platformsupport/eglconvenience/qeglplatformcursor.cpp	2014-08-07 16:53:50.038277168 -0400
-+++ b/src/platformsupport/eglconvenience/qeglplatformcursor.cpp	2014-08-07 17:00:36.806286766 -0400
-@@ -49,8 +49,8 @@
+--- qt5base-5.5.0.orig/src/platformsupport/eglconvenience/qeglplatformcursor.cpp
++++ qt5base-5.5.0/src/platformsupport/eglconvenience/qeglplatformcursor.cpp
+@@ -41,8 +41,8 @@
  
- #include <QtPlatformSupport/private/qdevicediscovery_p.h>
+ #include <QtGui/private/qguiapplication_p.h>
  
 -#include "qeglplatformcursor_p.h"
  #include "qeglplatformintegration_p.h"
 +#include "qeglplatformcursor_p.h"
+ #include "qeglplatformscreen_p.h"
  
  QT_BEGIN_NAMESPACE
  
diff --git a/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch b/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
index 99d5928..3dc9a6d 100644
--- a/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
+++ b/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
@@ -1,27 +1,41 @@
-Use the gold linker only for target builds
+From 2cb4b7e947f64580592afaf221d4b261d980bb45 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 19 May 2015 21:30:21 +0200
+Subject: [PATCH] Disable gold linker/new dtags support for host builds
 
-Availability of the gold linker is only tested with the
-cross-compiler, not the host compiler, so Qt shouldn't assume it's
-available when doing host builds.
+There is no test for gold linker and new dtags support for the host build
+(only for the target compiler/build) which leads to trouble in some cross
+compiling environments (see [1] for details).
 
-This fixes build failures occuring when cross-compiling Qt5 with a
-gold capable cross-compiler, on a host that has a too old compiler to
-support gold.
+So disable gold linker/new dtags support unconditionally for host builds.
 
-Bug reported upstream at https://bugreports.qt.io/browse/QTBUG-46125.
+[1] http://lists.busybox.net/pipermail/buildroot/2015-May/128303.html
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Task-number: QTBUG-46125
+Change-Id: Ic62828704dcce461487d63860705158cce3e4af8
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+---
+ mkspecs/features/default_post.prf | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
 
-Index: b/mkspecs/features/default_post.prf
-===================================================================
+diff --git a/mkspecs/features/default_post.prf b/mkspecs/features/default_post.prf
+index 8e68b95..bcaddc8 100644
 --- a/mkspecs/features/default_post.prf
 +++ b/mkspecs/features/default_post.prf
-@@ -62,7 +62,7 @@
+@@ -62,8 +62,11 @@ debug {
      QMAKE_LIBFLAGS += $$QMAKE_LIBFLAGS_RELEASE
  }
  
 -use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
-+!host_build: use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
+-enable_new_dtags: QMAKE_LFLAGS += $$QMAKE_LFLAGS_NEW_DTAGS
++# disable special linker flags for host builds (no proper test for host support yet)
++!host_build {
++    use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
++    enable_new_dtags: QMAKE_LFLAGS += $$QMAKE_LFLAGS_NEW_DTAGS
++}
  
  dll:win32: QMAKE_LFLAGS += $$QMAKE_LFLAGS_DLL
  static:mac: QMAKE_LFLAGS += $$QMAKE_LFLAGS_STATIC_LIB
+-- 
+2.1.0
+
diff --git a/package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch b/package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch
deleted file mode 100644
index 053d429..0000000
--- a/package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6e750053cd6d183173a4c39f2b1080b3c9814d76 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 15 Feb 2015 22:58:07 +0100
-Subject: [PATCH] configure: fix gold linker support detection
-
-Submitted upstream: https://bugreports.qt.io/browse/QTBUG-44487
-
-While the -fuse-ld=gold flag is related to linking, it is an argument to the
-compiler driver to tell it what linker to execute, NOT an option to tell the
-linker to behave differently.
-
-So it shouldn't get prefixed with -Wl when passed though the compiler driver.
-
-Fixes http://autobuild.buildroot.net/results/92c/92c3fb4ddb934115b228652bb8c972bb7459bb40/
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 043d9fc..987d7f0 100755
---- a/configure
-+++ b/configure
-@@ -3263,7 +3263,7 @@ fi
- 
- # auto-detect -fuse-ld=gold support
- if [ "$CFG_USE_GOLD_LINKER" != "no" ]; then
--    if linkerSupportsFlag $TEST_COMPILER -fuse-ld=gold; then
-+    if compilerSupportsFlag $TEST_COMPILER -fuse-ld=gold; then
-        CFG_USE_GOLD_LINKER=yes
-     else
-         if [ "$CFG_USE_GOLD_LINKER" = "yes" ]; then
--- 
-2.1.3
-
diff --git a/package/qt5/qt5base/0007-configure-add-psql_config-option.patch b/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
deleted file mode 100644
index 8075fe4..0000000
--- a/package/qt5/qt5base/0007-configure-add-psql_config-option.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f23a18de3c398c908c92b8cf8f20edc12435b9d1 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 19 Feb 2015 22:41:02 +0100
-Subject: [PATCH] configure: add '-psql_config' option
-
-Allow setting of pg_config path for cross compilation (do
-the same as for mysql_config).
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/configure b/configure
-index 0c66ecf..491486a 100755
---- a/configure
-+++ b/configure
-@@ -578,6 +578,7 @@ CFG_WIDGETS=yes
- CFG_QCONFIG=full
- CFG_DEBUG=auto
- CFG_MYSQL_CONFIG=
-+CFG_PSQL_CONFIG=
- CFG_DEBUG_RELEASE=no
- CFG_FORCEDEBUGINFO=no
- CFG_SHARED=yes
-@@ -885,6 +886,7 @@ while [ "$#" -gt 0 ]; do
-     -arch| \
-     -host-arch| \
-     -mysql_config| \
-+    -psql_config| \
-     -qpa| \
-     -qconfig| \
-     -qreal| \
-@@ -1066,6 +1068,9 @@ while [ "$#" -gt 0 ]; do
-     mysql_config)
- 	CFG_MYSQL_CONFIG="$VAL"
- 	;;
-+    psql_config)
-+	CFG_PSQL_CONFIG="$VAL"
-+	;;
-     prefix)
-         QT_INSTALL_PREFIX="$VAL"
-         ;;
-@@ -4369,10 +4374,11 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
-             ;;
-         psql)
-             if [ "$CFG_SQL_psql" != "no" ]; then
-+		[ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=`"$WHICH" pg_config`
-                 # Be careful not to use native pg_config when cross building.
--                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null | filterIncludePath`
--                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null | filterLibraryPath`
-+                if [ "$XPLATFORM_MINGW" != "yes" ] && [ -x "$CFG_PSQL_CONFIG" ]; then
-+                    QT_CFLAGS_PSQL=`$CFG_PSQL_CONFIG --includedir 2>/dev/null | filterIncludePath`
-+                    QT_LFLAGS_PSQL=`$CFG_PSQL_CONFIG --libdir 2>/dev/null | filterLibraryPath`
-                 fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
--- 
-2.1.4
-
diff --git a/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch b/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch
new file mode 100644
index 0000000..fa00e60
--- /dev/null
+++ b/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch
@@ -0,0 +1,19 @@
+Disable eventfd in forkd for uClibc <= 0.9.33 toolchains
+
+Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
+
+Index: qt5base-5.5.0/src/3rdparty/forkfd/forkfd.c
+===================================================================
+--- qt5base-5.5.0.orig/src/3rdparty/forkfd/forkfd.c
++++ qt5base-5.5.0/src/3rdparty/forkfd/forkfd.c
+@@ -48,6 +48,10 @@
+ #  if (defined(__GLIBC__) && (__GLIBC__ << 16) + __GLIBC_MINOR__ >= 0x209) || defined(__BIONIC__)
+ #    define HAVE_PIPE2    1
+ #  endif
++#  if (defined(__UCLIBC__) && (__UCLIBC_MAJOR__ == 0) && (__UCLIBC_MINOR__ < 9 || (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 33)))
++#    undef HAVE_EVENTFD
++#    undef HAVE_PIPE2
++#  endif
+ #endif
+ 
+ #if _POSIX_VERSION-0 >= 200809L || _XOPEN_VERSION-0 >= 500
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 7dcf28d..07f6caf 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtbase-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 8574a593830959c0f7e5430fe77a43832ea7f5299e14a397a74576b3df7fb1b7 qtbase-opensource-src-5.4.1.tar.xz
-sha1   134ec03371722cc31e2041a82c255cec708ca848                         qtbase-opensource-src-5.4.1.tar.xz
-md5    9507825e558c980fed602de1f16ec7ae                                 qtbase-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtbase-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 893f0691739c00d13ff85bf8d3fd14e1c7a62fbbbcffa44b0491da4d5e570965 qtbase-opensource-src-5.5.0.tar.xz
+sha1   3d6734bc6d00e1017c1db40d68309997bdf7bf6f                         qtbase-opensource-src-5.5.0.tar.xz
+md5    252613b5a180c94d7196d10467a4f08b                                 qtbase-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e2db5d1..eb6b883 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -117,12 +117,6 @@ QT5BASE_CONFIGURE_OPTS += -eglfs
 QT5BASE_DEPENDENCIES   += libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
-QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
-	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
-endif
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
-	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
 endif
 else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
@@ -161,6 +155,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
@@ -189,7 +184,6 @@ define QT5BASE_CONFIGURE_CMDS
 		-device-option BR_CCACHE="$(CCACHE)" \
 		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
 		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
-		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
 endef
diff --git a/package/qt5/qt5connectivity/0001-Fix-build-with-no-c-11.patch b/package/qt5/qt5connectivity/0001-Fix-build-with-no-c-11.patch
deleted file mode 100644
index 0311ced..0000000
--- a/package/qt5/qt5connectivity/0001-Fix-build-with-no-c-11.patch
+++ /dev/null
@@ -1,267 +0,0 @@
-From 898b2bdd10edff5da7b3093cacbd2e5db46cd0ff Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Thu, 22 Jan 2015 13:14:41 +0200
-Subject: [PATCH] Fix build with -no-c++11
-
-With -no-c++11,
-
-  - Enum type names cannot be used as namespaces. Use old style naming.
-  - For errno, errno.h must be included.
-  - stdint.h must be included to use uint*_t types. Use quint*
-    equivalents instead.
-
-Change-Id: I992f531a46cfc997df0aa6fc7ff6bf75fb750fc6
-Sent-Upstream: https://codereview.qt-project.org/104254
-Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
----
- src/bluetooth/bluez/bluez5_helper.cpp        | 16 ++---
- src/bluetooth/bluez/bluez_data_p.h           | 94 ++++++++++++++--------------
- src/bluetooth/bluez/hcimanager.cpp           |  1 +
- src/bluetooth/qlowenergycontroller_bluez.cpp |  2 +
- 4 files changed, 58 insertions(+), 55 deletions(-)
-
-diff --git a/src/bluetooth/bluez/bluez5_helper.cpp b/src/bluetooth/bluez/bluez5_helper.cpp
-index eebeae9..0e3c006 100644
---- a/src/bluetooth/bluez/bluez5_helper.cpp
-+++ b/src/bluetooth/bluez/bluez5_helper.cpp
-@@ -45,16 +45,16 @@ Q_DECLARE_LOGGING_CATEGORY(QT_BT_BLUEZ)
- 
- typedef enum Bluez5TestResultType
- {
--    Unknown,
--    Bluez4,
--    Bluez5
-+    BluezVersionUnknown,
-+    BluezVersion4,
-+    BluezVersion5
- } Bluez5TestResult;
- 
--Q_GLOBAL_STATIC_WITH_ARGS(Bluez5TestResult, bluezVersion, (Bluez5TestResult::Unknown));
-+Q_GLOBAL_STATIC_WITH_ARGS(Bluez5TestResult, bluezVersion, (BluezVersionUnknown));
- 
- bool isBluez5()
- {
--    if (*bluezVersion() == Bluez5TestResultType::Unknown) {
-+    if (*bluezVersion() == BluezVersionUnknown) {
-         OrgFreedesktopDBusObjectManagerInterface manager(QStringLiteral("org.bluez"),
-                                                          QStringLiteral("/"),
-                                                          QDBusConnection::systemBus());
-@@ -65,15 +65,15 @@ bool isBluez5()
-         QDBusPendingReply<ManagedObjectList> reply = manager.GetManagedObjects();
-         reply.waitForFinished();
-         if (reply.isError()) {
--            *bluezVersion() = Bluez5TestResultType::Bluez4;
-+            *bluezVersion() = BluezVersion4;
-             qCDebug(QT_BT_BLUEZ) << "Bluez 4 detected.";
-         } else {
--            *bluezVersion() = Bluez5TestResultType::Bluez5;
-+            *bluezVersion() = BluezVersion5;
-             qCDebug(QT_BT_BLUEZ) << "Bluez 5 detected.";
-         }
-     }
- 
--    return (*bluezVersion() == Bluez5TestResultType::Bluez5);
-+    return (*bluezVersion() == BluezVersion5);
- }
- 
- struct AdapterData
-diff --git a/src/bluetooth/bluez/bluez_data_p.h b/src/bluetooth/bluez/bluez_data_p.h
-index 7c79997..9d2d96b 100644
---- a/src/bluetooth/bluez/bluez_data_p.h
-+++ b/src/bluetooth/bluez/bluez_data_p.h
-@@ -75,8 +75,8 @@
- 
- #define BT_SECURITY 4
- struct bt_security {
--    uint8_t level;
--    uint8_t key_size;
-+    quint8 level;
-+    quint8 key_size;
- };
- #define BT_SECURITY_SDP     0
- #define BT_SECURITY_LOW     1
-@@ -162,14 +162,14 @@ static inline void ntoh128(const quint128 *src, quint128 *dst)
-         dst->data[15 - i] = src->data[i];
- }
- 
--static inline uint16_t bt_get_le16(const void *ptr)
-+static inline quint16 bt_get_le16(const void *ptr)
- {
--    return bt_get_unaligned((const uint16_t *) ptr);
-+    return bt_get_unaligned((const quint16 *) ptr);
- }
- #elif __BYTE_ORDER == __BIG_ENDIAN
--static inline uint16_t bt_get_le16(const void *ptr)
-+static inline quint16 bt_get_le16(const void *ptr)
- {
--    return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
-+    return bswap_16(bt_get_unaligned((const quint16 *) ptr));
- }
- 
- static inline void btoh128(const quint128 *src, quint128 *dst)
-@@ -213,79 +213,79 @@ struct sockaddr_hci {
- };
- 
- struct hci_dev_req {
--    uint16_t dev_id;
--    uint32_t dev_opt;
-+    quint16 dev_id;
-+    quint32 dev_opt;
- };
- 
- struct hci_dev_list_req {
--    uint16_t dev_num;
-+    quint16 dev_num;
-     struct hci_dev_req dev_req[0];
- };
- 
- struct hci_dev_stats {
--    uint32_t err_rx;
--    uint32_t err_tx;
--    uint32_t cmd_tx;
--    uint32_t evt_rx;
--    uint32_t acl_tx;
--    uint32_t acl_rx;
--    uint32_t sco_tx;
--    uint32_t sco_rx;
--    uint32_t byte_rx;
--    uint32_t byte_tx;
-+    quint32 err_rx;
-+    quint32 err_tx;
-+    quint32 cmd_tx;
-+    quint32 evt_rx;
-+    quint32 acl_tx;
-+    quint32 acl_rx;
-+    quint32 sco_tx;
-+    quint32 sco_rx;
-+    quint32 byte_rx;
-+    quint32 byte_tx;
- };
- 
- struct hci_dev_info {
--    uint16_t dev_id;
-+    quint16 dev_id;
-     char     name[8];
- 
-     bdaddr_t bdaddr;
- 
--    uint32_t flags;
--    uint8_t  type;
-+    quint32 flags;
-+    quint8  type;
- 
--    uint8_t  features[8];
-+    quint8  features[8];
- 
--    uint32_t pkt_type;
--    uint32_t link_policy;
--    uint32_t link_mode;
-+    quint32 pkt_type;
-+    quint32 link_policy;
-+    quint32 link_mode;
- 
--    uint16_t acl_mtu;
--    uint16_t acl_pkts;
--    uint16_t sco_mtu;
--    uint16_t sco_pkts;
-+    quint16 acl_mtu;
-+    quint16 acl_pkts;
-+    quint16 sco_mtu;
-+    quint16 sco_pkts;
- 
-     struct   hci_dev_stats stat;
- };
- 
- struct hci_conn_info {
--    uint16_t handle;
-+    quint16 handle;
-     bdaddr_t bdaddr;
--    uint8_t  type;
--    uint8_t  out;
--    uint16_t state;
--    uint32_t link_mode;
-+    quint8  type;
-+    quint8  out;
-+    quint16 state;
-+    quint32 link_mode;
- };
- 
- struct hci_conn_list_req {
--    uint16_t dev_id;
--    uint16_t conn_num;
-+    quint16 dev_id;
-+    quint16 conn_num;
-     struct hci_conn_info conn_info[0];
- };
- 
- struct hci_filter {
--    uint32_t type_mask;
--    uint32_t event_mask[2];
--    uint16_t opcode;
-+    quint32 type_mask;
-+    quint32 event_mask[2];
-+    quint16 opcode;
- };
- 
- static inline void hci_set_bit(int nr, void *addr)
- {
--    *((uint32_t *) addr + (nr >> 5)) |= (1 << (nr & 31));
-+    *((quint32 *) addr + (nr >> 5)) |= (1 << (nr & 31));
- }
- static inline void hci_clear_bit(int nr, void *addr)
- {
--    *((uint32_t *) addr + (nr >> 5)) &= ~(1 << (nr & 31));
-+    *((quint32 *) addr + (nr >> 5)) &= ~(1 << (nr & 31));
- }
- static inline void hci_filter_clear(struct hci_filter *f)
- {
-@@ -317,16 +317,16 @@ static inline void hci_filter_all_events(struct hci_filter *f)
- }
- 
- typedef struct {
--    uint8_t evt;
--    uint8_t plen;
-+    quint8 evt;
-+    quint8 plen;
- } __attribute__ ((packed)) hci_event_hdr;
- #define HCI_EVENT_HDR_SIZE 2
- 
- #define EVT_ENCRYPT_CHANGE 0x08
- typedef struct {
--    uint8_t  status;
--    uint16_t handle;
--    uint8_t  encrypt;
-+    quint8  status;
-+    quint16 handle;
-+    quint8  encrypt;
- } __attribute__ ((packed)) evt_encrypt_change;
- #define EVT_ENCRYPT_CHANGE_SIZE 4
- 
-diff --git a/src/bluetooth/bluez/hcimanager.cpp b/src/bluetooth/bluez/hcimanager.cpp
-index 17d54a4..3245058 100644
---- a/src/bluetooth/bluez/hcimanager.cpp
-+++ b/src/bluetooth/bluez/hcimanager.cpp
-@@ -38,6 +38,7 @@
- 
- #include <QtCore/QLoggingCategory>
- 
-+#include <errno.h>
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <sys/ioctl.h>
-diff --git a/src/bluetooth/qlowenergycontroller_bluez.cpp b/src/bluetooth/qlowenergycontroller_bluez.cpp
-index 5629966..f22cea7 100644
---- a/src/bluetooth/qlowenergycontroller_bluez.cpp
-+++ b/src/bluetooth/qlowenergycontroller_bluez.cpp
-@@ -41,6 +41,8 @@
- #include <QtBluetooth/QBluetoothSocket>
- #include <QtBluetooth/QLowEnergyService>
- 
-+#include <errno.h>
-+
- #define ATTRIBUTE_CHANNEL_ID 4
- 
- #define ATT_DEFAULT_LE_MTU 23
--- 
-1.9.1
-
diff --git a/package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch b/package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch
deleted file mode 100644
index fc4be10..0000000
--- a/package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-bluez_data_p.h: Add missing "#include <byteswap.h>"
-
-This patch has been submitted upstream:
-
-  https://bugreports.qt.io/browse/QTBUG-44421
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 1e219701c61cdedf0e8cfda542ee2485f5fd059a Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 11 Feb 2015 18:11:05 +0000
-Subject: [PATCH] bluez_data_p.h: Add missing "#include <byteswap.h>"
-
-Building qtconnectivity fails for big endian platforms because the
-bswap_16 function is not declared. This is the error message:
-
-In file included from bluez/hcimanager_p.h:52:0,
-		 from bluez/hcimanager.cpp:35:
-./bluez/bluez_data_p.h: In function 'quint16 bt_get_le16(const void*)':
-./bluez/bluez_data_p.h:172:60: error: 'bswap_16' was not declared in
-this scope
-     return bswap_16(bt_get_unaligned((const quint16 *) ptr));
-
-bswap_16 is defined in byteswap.h so we can include this file in order
-to fix this problem.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- src/bluetooth/bluez/bluez_data_p.h |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/src/bluetooth/bluez/bluez_data_p.h b/src/bluetooth/bluez/bluez_data_p.h
-index 9d2d96b..64c90dd 100644
---- a/src/bluetooth/bluez/bluez_data_p.h
-+++ b/src/bluetooth/bluez/bluez_data_p.h
-@@ -48,6 +48,7 @@
- #include <QtCore/qglobal.h>
- #include <sys/socket.h>
- #include <QtBluetooth/QBluetoothUuid>
-+#include <byteswap.h>
- 
- #define BTPROTO_L2CAP   0
- #define BTPROTO_HCI     1
--- 
-1.7.1
-
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 32836c9..d323b5f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtconnectivity-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 82c4ffb590f6716672da271ad41c51499b888b46140f40b06367b9eace7b2360 qtconnectivity-opensource-src-5.4.1.tar.xz
-sha1   b49f34507f2ebebd400391a48244828d4ff89fa3                         qtconnectivity-opensource-src-5.4.1.tar.xz
-md5    056c7eba6a396bbd82d265feca1fe47b                                 qtconnectivity-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtconnectivity-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 f1cfdd934e11dc114039c84a6a6b83870b56b2966715f1cb266f25bce1524302 qtconnectivity-opensource-src-5.5.0.tar.xz
+sha1   b393471529502028b0d5318088a27e48e944bc90                         qtconnectivity-opensource-src-5.5.0.tar.xz
+md5    31b005585b2be1c8aca9ea585a90f2b0                                 qtconnectivity-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 6c31859..9fb9609 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtdeclarative-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 15124e242a8a4a8fc5bedd32910b3b0b372b6c2b63f99572c4a2427e668d4417 qtdeclarative-opensource-src-5.4.1.tar.xz
-sha1   fb345784035caafef2d848bb29ad6bfce8ec2f8f                         qtdeclarative-opensource-src-5.4.1.tar.xz
-md5    86dfe5c41e14a142c72fdaa6a64f933c                                 qtdeclarative-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtdeclarative-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 858a12c5647764da8f81edec4ed444af77888cf931b739c10168064ae96f6773 qtdeclarative-opensource-src-5.5.0.tar.xz
+sha1   f41766db6f6bc8b9cefff05543891c271436043e                         qtdeclarative-opensource-src-5.5.0.tar.xz
+md5    1452c92f8c660dc7d23d9e17d89f8716                                 qtdeclarative-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index f5124fa..359e745 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtenginio-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 aedb131c29180c7dbc41f888d6a078378a2dd3337766461734cc1b8f07e9577a qtenginio-opensource-src-5.4.1.tar.xz
-sha1   35da0343762a6aa7ded2c62aa4b36e77152a9240                         qtenginio-opensource-src-5.4.1.tar.xz
-md5    c80b967b159c513350fcfca223f435d4                                 qtenginio-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtenginio-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 f61c4b2a26550bcb5e81cfcde55b1e521ee021226679dc9f60ab6c55f21f1520 qtenginio-opensource-src-5.5.0.tar.xz
+sha1   14b961bea8cf2f2d4510283d6120038dbf90d29d                         qtenginio-opensource-src-5.5.0.tar.xz
+md5    917e3105fe125068942f39e775f621ad                                 qtenginio-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index deb4c38..8c020a0 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtgraphicaleffects-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 bae2f0e8120f0b4e6e1b56a486713821615d0af7c69fb4ecdcbabc22b8f8351c qtgraphicaleffects-opensource-src-5.4.1.tar.xz
-sha1   9d0637176c9ce0006917dc52e6d20c975f0fb9a8                         qtgraphicaleffects-opensource-src-5.4.1.tar.xz
-md5    02bec01c2af9a7d08582fbffbfa4976a                                 qtgraphicaleffects-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtgraphicaleffects-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 f143514e7414797f264fea6348635e1db3e15d13e326af4a6b355fecf0a147ee qtgraphicaleffects-opensource-src-5.5.0.tar.xz
+sha1   1e9ca2b5d1fdfe6a73dfd646868c5351989ecccc                         qtgraphicaleffects-opensource-src-5.5.0.tar.xz
+md5    2fb95cecb2ab0542cb0b5847c65600c3                                 qtgraphicaleffects-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 6534a69..8bc5705 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtimageformats-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 3f6c5bb568ebbee24700c439a60b2e512026dfee5be896c846e4f289cc5b846f qtimageformats-opensource-src-5.4.1.tar.xz
-sha1   6fb124e2f8c644c97b56d023fcd90cf70dd5b1ba                         qtimageformats-opensource-src-5.4.1.tar.xz
-md5    1436680e00ea3e211fd0abdb7c18014a                                 qtimageformats-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtimageformats-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 6479d1d2ac5b7dd85566799e13a173e525cbccd5c8bd43e7db1bdaf772af8955 qtimageformats-opensource-src-5.5.0.tar.xz
+sha1   cffd35f9742f13a0c5afc04eab27b7b47338e800                         qtimageformats-opensource-src-5.5.0.tar.xz
+md5    72cbebfda5253dece90fa90ded64e953                                 qtimageformats-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 546ce8c..f4e23d5 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtmultimedia-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 3830dd4a11727cc4a3ab32dc10e4cd016739d0b1b0c59685512853e10f1e534e qtmultimedia-opensource-src-5.4.1.tar.xz
-sha1   5e9f06cccc86608ab185fc31a338b7b215342288                         qtmultimedia-opensource-src-5.4.1.tar.xz
-md5    7412a5c62da71b44b9f29e29fdc6af4d                                 qtmultimedia-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtmultimedia-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 a8bf1bd59bad74bba2906e6a86faa1cf008c8dba5f5a9cdea72eb0ce5f85355b qtmultimedia-opensource-src-5.5.0.tar.xz
+sha1   3438c16f498e40eaa68cd518b76ddd81c02a5471                         qtmultimedia-opensource-src-5.5.0.tar.xz
+md5    2759807c5d1842ee69e516aacd5e756a                                 qtmultimedia-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
index 53fb31f..2b0c19c 100644
--- a/package/qt5/qt5quick1/qt5quick1.hash
+++ b/package/qt5/qt5quick1/qt5quick1.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtquick1-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 eb5324c784eef15b3d0f7e2fc2265b0f2e823a31330e88e09379972313ca432d qtquick1-opensource-src-5.4.1.tar.xz
-sha1   f89cccdeac4c31157ac8b97fa96d426b5bb18630                         qtquick1-opensource-src-5.4.1.tar.xz
-md5    16d711d20238e3220fc4030dab608f0b                                 qtquick1-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtquick1-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 db563b33e1670bc8a254d53c0a8e29ba501b903fafcd3b7e3d2ab845db0dfa2c qtquick1-opensource-src-5.5.0.tar.xz
+sha1   27d67436cd902bb8b89b5808e4cc4a34fd61ac75                         qtquick1-opensource-src-5.5.0.tar.xz
+md5    8cd53fd1100e7f7cdf5b14f7c227e7b9                                 qtquick1-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index b8e8baf..6aab435 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtquickcontrols-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 fe0852c510b7ab9111310d6880d1b1f34908274099aefa5a14316173b25cfbc2 qtquickcontrols-opensource-src-5.4.1.tar.xz
-sha1   696ddb887bba366cb8132e53a94d571ac94666b8                         qtquickcontrols-opensource-src-5.4.1.tar.xz
-md5    2950c8df9da1e3d418a1e209d24f503a                                 qtquickcontrols-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtquickcontrols-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 df616aa6b390797f92f33115510961d1a53a55c349a18ae21f74b4aff478c2ea qtquickcontrols-opensource-src-5.5.0.tar.xz
+sha1   9b12048acb3555f7e98bd6c1333437fb04cf60d6                         qtquickcontrols-opensource-src-5.5.0.tar.xz
+md5    24b59d5928092f02e0cba969d9548350                                 qtquickcontrols-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 6c7c3f5..2b17fb7 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtscript-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 f432acc8376b86279faee273ff4e26226059d0cffbaced35e05a559d2efbcbaf qtscript-opensource-src-5.4.1.tar.xz
-sha1   1b9ede97f3120c95c2dce322b6140eeb20416044                         qtscript-opensource-src-5.4.1.tar.xz
-md5    70165fd13fa0ba5b1f577f849f0c4f12                                 qtscript-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtscript-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 343932ea8b2ecb16c3d9b49db55a7975f2f22534055608de4b06b1e38d867e8b qtscript-opensource-src-5.5.0.tar.xz
+sha1   ed5cf73c8217a249535442c49a8a0e5c43f6e648                         qtscript-opensource-src-5.5.0.tar.xz
+md5    1e9766d2651d6a81221525462378336d                                 qtscript-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 8de2164..e52ee6d 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtsensors-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 ac4b8e2ef7520e674eb53848ec3d459d8ae92735093106b93104dec7f65edbf8 qtsensors-opensource-src-5.4.1.tar.xz
-sha1   b02811264b6d6fd790d4f3b68f42d6162e73fc4f                         qtsensors-opensource-src-5.4.1.tar.xz
-md5    0787b72a67d1e38a3a47b54b84a6dc42                                 qtsensors-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtsensors-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 8d5a989df94b28dac872f3b28437982ecc6434b38b44da75f1d4bf81915fd14b qtsensors-opensource-src-5.5.0.tar.xz
+sha1   bd4b2fb7685f80ef1661ced90ff665b4b27216aa                         qtsensors-opensource-src-5.5.0.tar.xz
+md5    68ea0a61147a4934ca0fbd04fae10ed6                                 qtsensors-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index ba922bb..05c276a 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtserialport-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 79d99e826bf49e469a651cdc2d499d8b54e52bb8aaa279719a3afa03eba5d0ff qtserialport-opensource-src-5.4.1.tar.xz
-sha1   c87b381d6a0b6445c7fab54ef2807a555bfbcb47                         qtserialport-opensource-src-5.4.1.tar.xz
-md5    2333d25916a74260ce39b8a77c7c4288                                 qtserialport-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtserialport-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 a60e2d2113c1c3895b71c901921f83b81e9b3c59e3620cf94bd8647730efa866 qtserialport-opensource-src-5.5.0.tar.xz
+sha1   371da46f2f2ad652a22b0f04e4b48f088976d3ce                         qtserialport-opensource-src-5.5.0.tar.xz
+md5    8a76f051ed28a9c925d32f5864d33e78                                 qtserialport-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 060bef4..c47855e 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtsvg-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 be8a90ccce2e873d3489a416d1748089f46e329519acb990cf851d6c9f9de12c qtsvg-opensource-src-5.4.1.tar.xz
-sha1   f5bcaa91bd20ba7cdf27006a5553a6f182b62994                         qtsvg-opensource-src-5.4.1.tar.xz
-md5    b4a1e4f5dae26a7500f4f61a550f67eb                                 qtsvg-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtsvg-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 00efdeec66d34dabeddf17c510c0d607179991566a030d461968a16d6322e19f qtsvg-opensource-src-5.5.0.tar.xz
+sha1   9238a1aedd126f84a73014c12b6391267238da0a                         qtsvg-opensource-src-5.5.0.tar.xz
+md5    08234e3c3696f1a75df30201ca16d4bc                                 qtsvg-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 6ca2297..83975b0 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebkit-examples-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 19187bb31c349c67f90c92df896f14f9167b982bdef5187e83fd68407826720a qtwebkit-examples-opensource-src-5.4.1.tar.xz
-sha1   7a150502661a3af7dde5c546cdd4a335068a0298                         qtwebkit-examples-opensource-src-5.4.1.tar.xz
-md5    783bfd27e79769f3ceeb206a4921400b                                 qtwebkit-examples-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebkit-examples-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 d25564fb56e8e06ad782390c7a7cf2c80f52c1dac5a8cac6ad5382711cd4bd12 qtwebkit-examples-opensource-src-5.5.0.tar.xz
+sha1   706464b813e9910fefd4af83e479a8247fd50a68                         qtwebkit-examples-opensource-src-5.5.0.tar.xz
+md5    5005737b4b29a76c70d2d08e5b105a66                                 qtwebkit-examples-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 851296f..741772b 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebkit-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 6607211ef8a913dc778617bf4ba0970e34cc71e1da3abb477eabe0035e7119bf qtwebkit-opensource-src-5.4.1.tar.xz
-sha1   6cfebb74d334e77e26ecbe7d6609578eb46ab276                         qtwebkit-opensource-src-5.4.1.tar.xz
-md5    186627b1ea5b614811fbd0cfa9b4d073                                 qtwebkit-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebkit-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 17964996347d040a68b0c378a84b4b3874f1289c0d561b6868f7668402d9eeec qtwebkit-opensource-src-5.5.0.tar.xz
+sha1   8489ffa9253ab429b75f65117e435624dd78f769                         qtwebkit-opensource-src-5.5.0.tar.xz
+md5    5335fe211f5c0f92a4f6ca370fa9a0ce                                 qtwebkit-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index c39b73b..d3c0f3b 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebsockets-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 daf56f98c5e267253bd2d2e421472fc02faa1703a9063cc14cf8afce6967ab44 qtwebsockets-opensource-src-5.4.1.tar.xz
-sha1   3fb9be047b67673f40d272faab5ba0c8055e7717                         qtwebsockets-opensource-src-5.4.1.tar.xz
-md5    308e1e9126e6fab8b06616db9810973e                                 qtwebsockets-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebsockets-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 1ad465b1b2d1e6dddbdc403af9f69d93b1c408f6903c28ccaa52058df7ee8ae8 qtwebsockets-opensource-src-5.5.0.tar.xz
+sha1   215f4e8d8170933d68e9395d966ecf6213fc0a74                         qtwebsockets-opensource-src-5.5.0.tar.xz
+md5    aa7b160a4b97fafe71d5546c20715b8f                                 qtwebsockets-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index bfa9099..3b87968 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtx11extras-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 20a61cdb9f925e9ab959bed1e7aeb1855b721619d5dc5f3691b8c1ce186e8c2e qtx11extras-opensource-src-5.4.1.tar.xz
-sha1   7a75f936df70ac551cfc7b08914365cbb25b122d                         qtx11extras-opensource-src-5.4.1.tar.xz
-md5    87d555e0c7eccaa462a9bba85fb2d4de                                 qtx11extras-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtx11extras-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 bcb3cec5c9f0b551f0e2de30824c8be08620fbbe466ad4846beb2ad636d0b979 qtx11extras-opensource-src-5.5.0.tar.xz
+sha1   2eb25a96cc061b364d5fc30125a5ca9904857e89                         qtx11extras-opensource-src-5.5.0.tar.xz
+md5    9bee6d5c127ba8cc878ac7c2664d99f9                                 qtx11extras-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 5a2804e..718f8ce 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtxmlpatterns-opensource-src-5.4.1.tar.xz.mirrorlist
-sha256 f5142ff4d3f1154550530eddf310d2ff149c6f0055d3d028ad48cb5491c65318 qtxmlpatterns-opensource-src-5.4.1.tar.xz
-sha1   b25c2ec875fa1cbe0de20fd39bdd444c703540b4                         qtxmlpatterns-opensource-src-5.4.1.tar.xz
-md5    ec2970e9e9c38f88be74f18101937c28                                 qtxmlpatterns-opensource-src-5.4.1.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtxmlpatterns-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 672882c670c13c5caec199173cdabffd38474d06979d261bdc6e19738e0cef53 qtxmlpatterns-opensource-src-5.5.0.tar.xz
+sha1   d961f998980264f19916f70c8585da8479a84724                         qtxmlpatterns-opensource-src-5.5.0.tar.xz
+md5    138ab73b2376fcfca92a4bb6ab47e4a4                                 qtxmlpatterns-opensource-src-5.5.0.tar.xz
-- 
2.1.0
