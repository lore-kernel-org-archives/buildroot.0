From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:50:43 +0100
Subject: [Buildroot] [git commit] package/qt5base: drop 5.6 support
Message-ID: <20200309140907.16B348E780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ef6ade0dea40fd6d2d0b8061c09854a8e7fabc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And get rid of the 5.12.7 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-qtbase-Fix-build-error-when-using-EGL.patch |  0
 ...2-double-conversion-enable-for-microblaze.patch |  0
 package/qt5/qt5base/5.12.7/qt5base.hash            | 11 ----
 .../0001-eglfs-rasp-pi-header-inclusion.patch      | 45 -------------
 ...002-qtbase-Fix-build-error-when-using-EGL.patch | 37 -----------
 ...d-fpermissive-gcc-flag-to-allow-compilati.patch | 29 ---------
 .../5.6.3/0004-fix-icu-build-for-qt5webkit.patch   | 74 ----------------------
 .../0005-Do-not-load-plugin-from-the-PWD.patch     | 32 ----------
 package/qt5/qt5base/5.6.3/qt5base.hash             | 10 ---
 package/qt5/qt5base/Config.in                      | 11 +---
 package/qt5/qt5base/qt5base.hash                   | 13 +++-
 package/qt5/qt5base/qt5base.mk                     | 64 +------------------
 12 files changed, 17 insertions(+), 309 deletions(-)

diff --git a/package/qt5/qt5base/5.12.7/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.7/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.7/0002-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/0002-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.7/0002-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/0002-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.7/qt5base.hash b/package/qt5/qt5base/5.12.7/qt5base.hash
deleted file mode 100644
index 0697464cb9..0000000000
--- a/package/qt5/qt5base/5.12.7/qt5base.hash
+++ /dev/null
@@ -1,11 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtbase-everywhere-src-5.12.7.tar.xz.sha256
-sha256 b18939cb25d90aef8721fb12ec34c3632d3490ced958e41f6c7a52064643665d qtbase-everywhere-src-5.12.7.tar.xz
-
-# Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
-sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt5/qt5base/5.6.3/0001-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/5.6.3/0001-eglfs-rasp-pi-header-inclusion.patch
deleted file mode 100644
index f1f6d9b0b7..0000000000
--- a/package/qt5/qt5base/5.6.3/0001-eglfs-rasp-pi-header-inclusion.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 91c3b111e45dd476aba057836b1b618eacf90f3f Mon Sep 17 00:00:00 2001
-From: Julien Corjon <corjon.j@ecagroup.com>
-Date: Tue, 21 Jul 2015 09:58:14 +0200
-Subject: [PATCH] eglfs - fix rasp-pi header inclusion
-
-eglplateform.h include headers for low level instruction and fail on brcm
-headers inclusion
-  For the brcm presence test we use egl pkg-config file
-  For the eglfs-plugin compilation we use the egl configuration
-
-Upstream-Status: https://bugreports.qt.io/browse/QTBUG-47339
-Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
----
- config.tests/qpa/eglfs-brcm/eglfs-brcm.pro   | 2 ++
- src/plugins/platforms/eglfs/eglfs-plugin.pro | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-index ce16a3a..192a8ad 100644
---- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-+++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-@@ -1,6 +1,8 @@
- SOURCES = eglfs-brcm.cpp
- 
- CONFIG -= qt
-+CONFIG += link_pkgconfig
-+PKGCONFIG += egl
- 
- INCLUDEPATH += $$QMAKE_INCDIR_EGL
- 
-diff --git a/src/plugins/platforms/eglfs/eglfs-plugin.pro b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-index 0f493fd..8479496 100644
---- a/src/plugins/platforms/eglfs/eglfs-plugin.pro
-+++ b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-@@ -6,6 +6,7 @@ PLUGIN_CLASS_NAME = QEglFSIntegrationPlugin
- load(qt_plugin)
- 
- QT += platformsupport-private eglfs_device_lib-private
-+CONFIG += egl
- 
- SOURCES += $$PWD/qeglfsmain.cpp
- 
--- 
-2.1.0
-
diff --git a/package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
deleted file mode 100644
index 0d0e0f922b..0000000000
--- a/package/qt5/qt5base/5.6.3/0002-qtbase-Fix-build-error-when-using-EGL.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d69bd3fd52502c7eb2799397fea14afe350e2cbf Mon Sep 17 00:00:00 2001
-From: Yuqing Zhu <carol.zhu@nxp.com>
-Date: Mon, 27 Mar 2017 15:33:35 +0800
-Subject: [PATCH] qtbase: Fix build error when using EGL
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-A build error was occurring due to missing EGL configuration.
-
-Fixed by adding the necessary ties to the EGL pkg-config.
-
-Task-number: QTBUG-61712
-Change-Id: I87190ea39392b4604c563cf9d89edb85068d85fc
-Upstream-Status: Pending
-Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
----
- mkspecs/features/egl.prf | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/mkspecs/features/egl.prf b/mkspecs/features/egl.prf
-index 9fa0c9e219..85d5852ba6 100644
---- a/mkspecs/features/egl.prf
-+++ b/mkspecs/features/egl.prf
-@@ -1,3 +1,9 @@
-+# egl headers need a definition
-+PKG_CONFIG = $$pkgConfigExecutable()
-+PKGCONFIG_CFLAGS = $$system($$PKG_CONFIG --cflags egl)
-+PKGCONFIG_CFLAGS = $$find(PKGCONFIG_CFLAGS, ^-D.*)
-+QMAKE_CFLAGS_EGL = $$PKGCONFIG_CFLAGS
-+
- INCLUDEPATH += $$QMAKE_INCDIR_EGL
- LIBS_PRIVATE += $$QMAKE_LIBS_EGL
- QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
--- 
-2.16.1
-
diff --git a/package/qt5/qt5base/5.6.3/0003-libressl-add-fpermissive-gcc-flag-to-allow-compilati.patch b/package/qt5/qt5base/5.6.3/0003-libressl-add-fpermissive-gcc-flag-to-allow-compilati.patch
deleted file mode 100644
index c8fc426f79..0000000000
--- a/package/qt5/qt5base/5.6.3/0003-libressl-add-fpermissive-gcc-flag-to-allow-compilati.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 62588f2d8267c67c2337004e83e80695280db9eb Mon Sep 17 00:00:00 2001
-From: James Grant <jamesg@zaltys.org>
-Date: Sun, 3 Mar 2019 17:29:29 +1300
-Subject: [PATCH 1/1] libressl - add -fpermissive gcc flag to allow
- compilation.
-
-Workaround for 'const BIO_METHOD *' vs. 'BIO_METHOD *' changes to BIO_new() and BIO_s_mem() function signatures.
-
-Signed-off-by: James Grant <jamesg@zaltys.org>
----
- src/network/ssl/ssl.pri | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/network/ssl/ssl.pri b/src/network/ssl/ssl.pri
-index 29c47cd7..f0aad448 100644
---- a/src/network/ssl/ssl.pri
-+++ b/src/network/ssl/ssl.pri
-@@ -77,7 +77,7 @@ android:!android-no-sdk: SOURCES += ssl/qsslsocket_openssl_android.cpp
-         LIBS_PRIVATE += $$OPENSSL_LIBS_RELEASE
-     }
- 
--    QMAKE_CXXFLAGS += $$OPENSSL_CFLAGS
-+    QMAKE_CXXFLAGS += $$OPENSSL_CFLAGS -fpermissive
-     LIBS_PRIVATE += $$OPENSSL_LIBS
-     win32: LIBS_PRIVATE += -lcrypt32
- }
--- 
-2.18.1
-
diff --git a/package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch b/package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch
deleted file mode 100644
index 0d166b848a..0000000000
--- a/package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From: Arfrever Frehtes Taifersar Arahesis <Arfrever@Apache.Org>
-Date: Mon, 23 Nov 2015 03:54:00 +0000
-Subject: [PATCH 1/1] When UChar is defined as char16_t in ICU, then qtbase fails to detect ICU.
-
-Build fails with following error:
-
-ICU auto-detection... ()
-x86_64-pc-linux-gnu-g++ -c -march=core2 -O2 -fno-ident \
- -frecord-gcc-switches -pipe -Wall -O2 -Wall -W -fPIC  -I. \
- -I/var/tmp/portage/dev-qt/qtcore-5.5.1/work/qtbase-opensource-src-5.5.1/mkspecs/linux-g++ -o icu.o icu.cpp
-In file included from /usr/include/unicode/utypes.h:36:0,
-                 from icu.cpp:34:
-/usr/include/unicode/umachine.h:306:13: error: 'char16_t' does not name a type
-     typedef char16_t UChar;
-             ^
-In file included from /usr/include/unicode/utypes.h:37:0,
-                 from icu.cpp:34:
-/usr/include/unicode/uversion.h:165:55: error: 'UChar' does not name a type
- u_versionFromUString(UVersionInfo versionArray, const UChar *versionString);
-                                                       ^
-...
-Makefile:177: recipe for target 'icu.o' failed
-gmake: *** [icu.o] Error 1
-ICU disabled.
-The ICU library support cannot be enabled.
-
-This change isn't needed for new Qt versions, because c++11 is mandatory since 5.7.
-Upstream desided not to merge this change into old branches, like 5.6.
-Original patch was slightly modified to apply cleanly on Qt 5.6.3.
-
-Fetch from: https://bugreports.qt.io/secure/attachment/52478/qtbase-5.5.1-icu.patch
-Signed-off-by: Arfrever Frehtes Taifersar Arahesis <Arfrever@Apache.Org>
-Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
-
----
-diff -purN qt5base-5.6.3.orig/config.tests/unix/compile.test qt5base-5.6.3/config.tests/unix/compile.test
---- qt5base-5.6.3.orig/config.tests/unix/compile.test	2019-08-11 00:35:33.181545706 +0300
-+++ qt5base-5.6.3/config.tests/unix/compile.test	2017-09-06 15:13:54.000000000 +0300
-@@ -47,7 +47,7 @@ while [ "$#" -gt 0 ]; do
-         INC=`echo $PARAM | sed -e 's/^-I//'`
-         INCLUDEPATH="$INCLUDEPATH \"$INC\""
-         ;;
--    -f*|-D*)
-+    -f*|-D*|-std=*)
-         CFLAGS="$CFLAGS \"$PARAM\""
-         CXXFLAGS="$CXXFLAGS \"$PARAM\""
-         ;;
-diff -purN qt5base-5.6.3.orig/configure qt5base-5.6.3/configure
---- qt5base-5.6.3.orig/configure	2019-08-11 00:57:45.488214036 +0300
-+++ qt5base-5.6.3/configure	2017-09-06 15:13:54.000000000 +0300
-@@ -5183,8 +5183,10 @@ fi
- 
- # auto-detect libicu support
- if [ "$CFG_ICU" != "no" ]; then
--    if compileTest unix/icu "ICU"; then
-+    QT_CXXFLAGS_ICU=`icu-config --cxxflags 2>/dev/null`
-+    if compileTest unix/icu "ICU" $QT_CXXFLAGS_ICU; then
-         [ "$CFG_ICU" = "auto" ] && CFG_ICU=yes
-+        QMakeVar set QT_CXXFLAGS_ICU "$QT_CXXFLAGS_ICU"
-     else
-         if [ "$CFG_ICU" = "auto" ]; then
-             CFG_ICU=no
-diff -purN qt5base-5.6.3.orig/doc/Makefile qt5base-5.6.3/doc/Makefile
-diff -purN qt5base-5.6.3.orig/src/corelib/tools/tools.pri qt5base-5.6.3/src/corelib/tools/tools.pri
---- qt5base-5.6.3.orig/src/corelib/tools/tools.pri	2019-08-11 00:45:45.073818635 +0300
-+++ qt5base-5.6.3/src/corelib/tools/tools.pri	2017-09-06 15:13:54.000000000 +0300
-@@ -169,6 +169,7 @@ contains(QT_CONFIG,icu) {
-                tools/qcollator_icu.cpp \
-                tools/qtimezoneprivate_icu.cpp
-     DEFINES += QT_USE_ICU
-+    QMAKE_CXXFLAGS += $$QT_CXXFLAGS_ICU
- } else: win32 {
-     SOURCES += tools/qcollator_win.cpp
- } else: macx {
diff --git a/package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch b/package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch
deleted file mode 100644
index 4acd42f005..0000000000
--- a/package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bf131e8d2181b3404f5293546ed390999f760404 Mon Sep 17 00:00:00 2001
-From: Olivier Goffart <ogoffart@woboq.com>
-Date: Fri, 8 Nov 2019 11:30:40 +0100
-Subject: [PATCH] Do not load plugin from the $PWD
-
-I see no reason why this would make sense to look for plugins in the current
-directory. And when there are plugins there, it may actually be wrong
-
-Change-Id: I5f5aa168021fedddafce90effde0d5762cd0c4c5
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-
-Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=bf131e8d2181b3404f5293546ed390999f760404
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/corelib/plugin/qpluginloader.cpp | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/corelib/plugin/qpluginloader.cpp b/src/corelib/plugin/qpluginloader.cpp
-index cadff4f32b..c2443dbdda 100644
---- a/src/corelib/plugin/qpluginloader.cpp
-+++ b/src/corelib/plugin/qpluginloader.cpp
-@@ -305,7 +305,6 @@ static QString locatePlugin(const QString& fileName)
-         paths.append(fileName.left(slash)); // don't include the '/'
-     } else {
-         paths = QCoreApplication::libraryPaths();
--        paths.prepend(QStringLiteral(".")); // search in current dir first
-     }
- 
-     for (const QString &path : qAsConst(paths)) {
--- 
-2.25.0
-
diff --git a/package/qt5/qt5base/5.6.3/qt5base.hash b/package/qt5/qt5base/5.6.3/qt5base.hash
deleted file mode 100644
index 2dae2e8bf0..0000000000
--- a/package/qt5/qt5base/5.6.3/qt5base.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
-
-# Hashes for license files:
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 66f6bb53f6d985a4d651bf1ecfe8bbcbe32b0f744708d588f047580ee85d8ec8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1d05f2662f0be7544c4cc238d0957d1ed5d0edc45210e9108f905df354241a0e header.BSD
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 2b4ed13876..1862a7d9b6 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_QT5BASE
 	bool "qt5base"
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE if BR2_PACKAGE_QT5_VERSION_5_6
-	select BR2_PACKAGE_PCRE_16 if BR2_PACKAGE_QT5_VERSION_5_6
-	select BR2_PACKAGE_PCRE_UTF if BR2_PACKAGE_QT5_VERSION_5_6
-	select BR2_PACKAGE_PCRE2 if BR2_PACKAGE_QT5_VERSION_LATEST
-	select BR2_PACKAGE_PCRE2_16 if BR2_PACKAGE_QT5_VERSION_LATEST
+	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_PCRE2_16
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -288,9 +285,7 @@ comment "icu support needs a toolchain w/ gcc >= 4.8"
 
 config BR2_PACKAGE_QT5BASE_OPENSSL
 	bool
-	# No OpenSSL 1.1.x support in Qt 5.6.x
-	default y if BR2_PACKAGE_QT5_VERSION_5_6 && BR2_PACKAGE_LIBRESSL
-	default y if BR2_PACKAGE_QT5_VERSION_LATEST && BR2_PACKAGE_OPENSSL
+	default y if BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 5316f03b10..0697464cb9 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,11 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtbase-everywhere-src-5.12.7.tar.xz.sha256
+sha256 b18939cb25d90aef8721fb12ec34c3632d3490ced958e41f6c7a52064643665d qtbase-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
+sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
+sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 774c771bc9..c392c06627 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -8,7 +8,7 @@ QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5BASE_VERSION).tar.xz
 
-QT5BASE_DEPENDENCIES = host-pkgconf zlib
+QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 
 # A few comments:
@@ -30,9 +30,7 @@ QT5BASE_CONFIGURE_OPTS += \
 # starting from version 5.9.0, -optimize-debug is enabled by default
 # for debug builds and it overrides -O* with -Og which is not what we
 # want.
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
-endif
 
 QT5BASE_CFLAGS = $(TARGET_CFLAGS)
 QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
@@ -42,12 +40,6 @@ QT5BASE_CFLAGS += -O0
 QT5BASE_CXXFLAGS += -O0
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5BASE_DEPENDENCIES += pcre
-else
-QT5BASE_DEPENDENCIES += pcre2
-endif
-
 ifeq ($(BR2_X86_CPU_HAS_SSE2),)
 QT5BASE_CONFIGURE_OPTS += -no-sse2
 else ifeq ($(BR2_X86_CPU_HAS_SSE3),)
@@ -64,7 +56,7 @@ else ifeq ($(BR2_X86_CPU_HAS_AVX2),)
 QT5BASE_CONFIGURE_OPTS += -no-avx2
 else
 # no buildroot BR2_X86_CPU_HAS_AVX512 option yet for qt configure
-# option '-no-avx512' (available for latest only)
+# option '-no-avx512'
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
@@ -94,18 +86,9 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5BASE_CONFIGURE_OPTS += -largefile
-endif
-
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5BASE_LICENSE += , BSD-3-Clause (examples)
 QT5BASE_LICENSE_FILES += header.BSD
@@ -145,7 +128,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_GUI),y)
 QT5BASE_CONFIGURE_OPTS += -gui -system-freetype
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5_VERSION_5_6),-I$(STAGING_DIR)/usr/include/freetype2)
 QT5BASE_DEPENDENCIES += freetype
 else
 QT5BASE_CONFIGURE_OPTS += -no-gui -no-freetype
@@ -175,11 +157,7 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5BASE_CONFIGURE_OPTS += -xcb
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5BASE_CONFIGURE_OPTS += -system-xkbcommon-x11
-else
 QT5BASE_CONFIGURE_OPTS += -xkbcommon
-endif
 
 QT5BASE_DEPENDENCIES   += \
 	libxcb \
@@ -215,15 +193,8 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-# No OpenSSL 1.1.x support in Qt 5.6.x
-# LibreSSL works with shared linkage only and -fpermissive patch
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBRESSL),-openssl-linked,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBRESSL),openssl)
-else
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
-endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
@@ -247,16 +218,6 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-# gstreamer 0.10 support is broken in qt5multimedia
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
-QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
-QT5BASE_DEPENDENCIES   += gst1-plugins-base
-else
-QT5BASE_CONFIGURE_OPTS += -no-gstreamer
-endif
-endif
-
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 QT5BASE_CONFIGURE_OPTS += -libinput
 QT5BASE_DEPENDENCIES += libinput
@@ -264,7 +225,6 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-libinput
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 # only enable gtk support if libgtk3 X11 backend is enabled
 ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
 QT5BASE_CONFIGURE_OPTS += -gtk
@@ -272,7 +232,6 @@ QT5BASE_DEPENDENCIES += libgtk3
 else
 QT5BASE_CONFIGURE_OPTS += -no-gtk
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 QT5BASE_CONFIGURE_OPTS += -journald
@@ -290,7 +249,6 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
@@ -298,9 +256,6 @@ endif
 ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
 endif
-else
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
-endif
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
@@ -308,7 +263,6 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
@@ -316,7 +270,6 @@ else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
 endif
-endif
 
 ifneq ($(QT5BASE_CONFIG_FILE),)
 define QT5BASE_CONFIGURE_CONFIG_FILE
@@ -325,7 +278,7 @@ endef
 endif
 
 QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
 define QT5BASE_CONFIGURE_ARCH_CONFIG
 	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
@@ -403,15 +356,6 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5BASE_INSTALL_TARGET_FONTS
-	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
-	fi
-endef
-endif
-
 define QT5BASE_INSTALL_TARGET_EXAMPLES
 	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
@@ -421,14 +365,12 @@ endef
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_FONTS)
 	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 else
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
-	$(QT5BASE_INSTALL_TARGET_FONTS)
 	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 endif
