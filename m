From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 15 Nov 2016 18:13:02 +0100
Subject: [Buildroot] [Rejected v2 2/2] qt5: bump to 5.8.0-beta
In-Reply-To: <20161115171307.7499-1-corjon.j@ecagroup.com>
References: <20161115171307.7499-1-corjon.j@ecagroup.com>
Message-ID: <20161115171307.7499-3-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- qt5 need C++11 compliant compiler since 5.7 ([1])
- qt5base: renamed library to EglFSDeviceIntegration ([2])
- qt5base: remove ras-pi patch, commit c0cc5052097c723d0331a7619d686af9eb93d33c fix it ([3])
- qt5base: remove obsolete config-option -large ([4])
- qt5base: make the directfb platform plugin compile ([5])
- qt5webkit : add 0004-Remove-unused-check-for-private_tests.patch ([6])

[1] http://blog.qt.io/blog/2016/06/16/qt-5-7-released/
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
[3] https://codereview.qt-project.org/#/c/167172/
[4] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
[5] https://bugreports.qt.io/browse/QTBUG-57039
[6] https://bugreports.qt.io/browse/QTBUG-55950

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                              |  5 ++-
 package/qt5/qt5.mk                                 |  6 +--
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 ...001-directfb-make-platform-plugin-compile.patch | 28 ++++++++++++++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ----------------------
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5base/qt5base.mk                     |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 package/qt5/qt5enginio/qt5enginio.hash             |  4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 ...004-Remove-unused-check-for-private_tests.patch | 40 +++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 29 files changed, 121 insertions(+), 99 deletions(-)
 create mode 100644 package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 create mode 100644 package/qt5/qt5webkit/0004-Remove-unused-check-for-private_tests.patch

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 234dfdd..77e7e09 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,15 +11,16 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_ARM_CPU_ARMV4
 	default y
 
-comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+comment "Qt5 needs a toolchain w/ wchar, NPTL, C++11, dynamic library"
 	depends on !BR2_PACKAGE_QT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e937e23..77dd757 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,6 +1,6 @@
-QT5_VERSION_MAJOR = 5.6
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_VERSION_MAJOR = 5.8
+QT5_VERSION = $(QT5_VERSION_MAJOR).0-beta
+QT5_SITE = http://download.qt.io/development_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7179380..345b845 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qt3d-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 f5cc80e306ffa7ea1b3ae38dfec7da8908a2e7d4d44353d0bd9916a07cfdaa04 qt3d-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
new file mode 100644
index 0000000..b6c1452
--- /dev/null
+++ b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
@@ -0,0 +1,28 @@
+Configuring directfb backend fails due to unknown feature directfb_egl
+
+See : https://bugreports.qt.io/browse/QTBUG-57039
+
+Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
+
+diff --git a/src/plugins/platforms/directfb/directfb.pro b/src/plugins/platforms/directfb/directfb.pro
+index 406b89e..a83b09f 100644
+--- a/src/plugins/platforms/directfb/directfb.pro
++++ b/src/plugins/platforms/directfb/directfb.pro
+@@ -3,7 +3,7 @@ TARGET = qdirectfb
+ QT += \
+     core-private gui-private \
+     eventdispatcher_support-private service_support-private \
+-    fontdatabase_support-private egl_support-private
++    fontdatabase_support-private
+ 
+ QMAKE_USE += directfb
+ 
+@@ -27,7 +27,7 @@ HEADERS = qdirectfbintegration.h \
+     qdirectfbeglhooks.h
+ 
+ # ### port the GL context
+-qtConfig(directfb_egl) {
++contains(QT_CONFIG, directfb_egl) {
+     HEADERS += qdirectfb_egl.h
+     SOURCES += qdirectfb_egl.cpp
+     DEFINES += DIRECTFB_GL_EGL
diff --git a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
deleted file mode 100644
index f1f6d9b..0000000
--- a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
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
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 9808e9b..71e423b 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtbase-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 b527598e5f9a8aa4b128e4f7f6661ebbb17857f7e8248b75e536b7782c345f4d qtbase-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 23dba2a..f4ca921 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -41,8 +41,6 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
-QT5BASE_CONFIGURE_OPTS += -largefile
-
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
 QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
@@ -170,7 +168,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 01819e4..132342c 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtcanvas3d-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 30671e07c9b9f811d0b8367f7233a241fac28e3e2478d0e47493ffeb710113d3 qtcanvas3d-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 4574f3d..deb5266 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtconnectivity-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 524c887a8530ebff913cb72a1d553bde079c30a38acfa04443fd94c7843484fc qtconnectivity-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index d8d3a68..646631f 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtdeclarative-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 d03ca3ab85aac9312a536e4b40a6c0b603b67275adb9fbd8e4efad93390c542b qtdeclarative-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 9951834..db9eacf 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
-sha256 90ffc38d214a75ab0ef90a4760843f12bc073ae49c17de24c677d1d403bddcc3 qtenginio-opensource-src-1.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
+sha256 ea5418a55bd36cbf354bde85480044422865ed284d8eadbc122d6e523b96d00f qtenginio-opensource-src-1.6.2.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index ae29e3b..153d5dc 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtgraphicaleffects-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 1c68919231875b4c41b1f1c2c18ad6639b5c78f05444483b42e96cda58e8b88e qtgraphicaleffects-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 54b58e4..31b6ccc 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtimageformats-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 9d6d7a868188b7b004fe5c68605b3028d32f120ce8815f722c2af33e53d38268 qtimageformats-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 374952f..ef90b14 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtlocation-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 7fa9cda14eddf1053d4c8271d4b100a62ffb3822155b2f0d308f9b4b885d4480  qtlocation-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 56a11fb..b3c9da2 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtmultimedia-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 66601ca2afe3f1d443d6742a78f7141c153bb5cc64132479139bfe36efd301ff qtmultimedia-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 6db589d..39726b7 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtquickcontrols-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 88a44ca5e0bcaf4ca626d03a056158cbcb423d90f256643175f626fbb8713d58 qtquickcontrols-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 0d85d48..9fe8a07 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtquickcontrols2-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 02fa08257580976d0c518fd139e46b43c5ce79ce6c1c51e92092fb6d235cc113 qtquickcontrols2-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index c8ecb75..9fbf0e7 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtscript-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 5450122878c3ecb00dc19aaf5bd67d719ddf1d431d6e4c8c59fef981dbfa99d7 qtscript-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 65cd127..03ebba9 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtsensors-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 fc15d6edc47cded8997d709623e3dd863d978632ac19b1acb8310732090150f0 qtsensors-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 308c365..9fe8306 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtserialbus-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 4c551e7c535e4898e7fdf8a64b3a39622938ff1ceec42047c3c70768fd7af9bd qtserialbus-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 2458e5d..3af2c7d 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtserialport-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 ec9c289e10449720a19b50759a99536aad2cb8ef90bd6bdf05dc599d29133ce6 qtserialport-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 0c9e9eb..74d3b0c 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtsvg-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 091c9fc57d5cda919e589d72eb8ad0a6eca8ebf248d5d4c48b41e6faa95eee83 qtsvg-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index cc11b28..98b0d81 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qttools-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 7a48d2d159375fc0a3af3ce02456429cabe69db2466229853186486a554761d2 qttools-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 0f9eaae..8f36aad 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtwebchannel-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 d2221b83c9302ae800a738f7b7ad6d63b79a928ee815596ab60ce703a842949e qtwebchannel-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5webkit/0004-Remove-unused-check-for-private_tests.patch b/package/qt5/qt5webkit/0004-Remove-unused-check-for-private_tests.patch
new file mode 100644
index 0000000..69f4229
--- /dev/null
+++ b/package/qt5/qt5webkit/0004-Remove-unused-check-for-private_tests.patch
@@ -0,0 +1,40 @@
+From 646ea4ff9efb13d69428b785b4545209f1fac63d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jkt@kde.org>
+Date: Wed, 14 Sep 2016 23:51:14 +0200
+Subject: [PATCH] Remove unused check for private_tests
+
+It turns out that qt_developer_build is never used anyway.
+
+I did some git archeology and it looks like it was nuked when doing the
+5.2 merge from upstream. The original purpose was apparently to control
+-Werror, which is nowadays controlled by CONFIG -= production_build.
+
+This actually fixes the build, as the QT_FOR_CONFIG += core-private which
+would have been required for qtConfig(private_tests) is missing.
+
+Task-number: QTBUG-55950
+Change-Id: Iaaaad184b29b523ce4a4ed8afec2ac527d8f93e3
+
+Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
+---
+ Tools/qmake/mkspecs/features/default_pre.prf | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Tools/qmake/mkspecs/features/default_pre.prf b/Tools/qmake/mkspecs/features/default_pre.prf
+index 6bb52d0..8aa806d 100644
+--- a/Tools/qmake/mkspecs/features/default_pre.prf
++++ b/Tools/qmake/mkspecs/features/default_pre.prf
+@@ -62,10 +62,6 @@ win32-msvc*: MAKEFILE_NOOP_COMMAND = @echo >NUL
+ scratchbox: PYTHON = python2.6
+ else: PYTHON = python
+ 
+-# We use private_tests to detect developer build, since the destdir will
+-# always be our webkit build dir. This might change as configure changes.
+-qtConfig(private_tests): CONFIG += qt_developer_build
+-
+ # By default we enable "production build", and build-webkit, which is
+ # used by bots and developers, will disable it, to enable warnings etc.
+ CONFIG += production_build
+-- 
+2.9.3
+
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 309f776..8caa3fc 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/snapshots/qt/5.8/5.8.0-beta/latest_src/submodules/qtwebkit-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 06c41e7383c11de04ad82830092e0bb07c6a641de05de5d4f959a4fbb9019aad qtwebkit-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3443476..5cfb9f3 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtwebsockets-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 ad97f4d48de979aaa8c905fb962ed806e8bf8188b4a1a3010986252976661ba3 qtwebsockets-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 297c578..1d15605 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtx11extras-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 e03ac7bb7b4ccbc78f5afefc5d690f64398fac4aa05c6877a6fafa1e7392ed0e qtx11extras-opensource-src-5.8.0-beta.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index fa4e97f..8fedb47 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
+# Hash from: http://download.qt.io/development_releases/qt/5.8/5.8.0-beta/submodules/qtxmlpatterns-opensource-src-5.8.0-beta.tar.xz.mirrorlist
+sha256 c7bce469b18a82e979385ad6531830e09aac95d88936ca4e5470c40ed9701c12 qtxmlpatterns-opensource-src-5.8.0-beta.tar.xz
-- 
2.9.3
