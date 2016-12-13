From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue, 13 Dec 2016 15:59:26 +0100
Subject: [Buildroot] [PATCH v3 2/7] qt5: bump to 5.8.0-rc
In-Reply-To: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1481641171-10407-3-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- qt5 need C++11 compliant compiler since 5.7 ([1])
- updated licenses: since version 5.7 Qt removed the (L)GPL v2.1 option in favor
  of v3 with a different exception
- qt5base: renamed library to EglFSDeviceIntegration ([2])
- qt5base: remove ras-pi patch, commit c0cc5052097c723d0331a7619d686af9eb93d33c fix it ([3])
- qt5base: remove obsolete config-option -large ([4])
- qt5base: remove gstreamer related config-option ([5])
- qt5base: add 001-directfb-Fix-for-non-GL-platform.patch ([6])
- qt5webkit: add 0004-Remove-unused-check-for-private_tests.patch ([7])

[1] http://blog.qt.io/blog/2016/06/16/qt-5-7-released/
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
[3] https://codereview.qt-project.org/#/c/167172/
[4] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
[5] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=7d4da559afb62a779b3d90a65fb679cb5433f203
[6] https://bugreports.qt.io/browse/QTBUG-57176
[7] https://bugreports.qt.io/browse/QTBUG-55950

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                              |  5 ++-
 package/qt5/qt5.mk                                 |  6 +--
 .../0001-directfb-Fix-for-non-GL-platform.patch    | 39 +++++++++++++++++++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ----------------------
 package/qt5/qt5base/qt5base.mk                     | 16 ++------
 package/qt5/qt5connectivity/qt5connectivity.mk     |  4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  4 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  4 +-
 package/qt5/qt5location/qt5location.mk             |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  4 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  4 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  4 +-
 package/qt5/qt5svg/qt5svg.mk                       |  4 +-
 package/qt5/qt5tools/qt5tools.mk                   |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  4 +-
 ...004-Remove-unused-check-for-private_tests.patch | 40 +++++++++++++++++++
 package/qt5/qt5websockets/qt5websockets.mk         |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  4 +-
 20 files changed, 116 insertions(+), 91 deletions(-)
 create mode 100644 package/qt5/qt5base/0001-directfb-Fix-for-non-GL-platform.patch
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
index e937e23..8d1f568 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,6 +1,6 @@
-QT5_VERSION_MAJOR = 5.6
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_VERSION_MAJOR = 5.8
+QT5_VERSION = $(QT5_VERSION_MAJOR).0-rc
+QT5_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5base/0001-directfb-Fix-for-non-GL-platform.patch b/package/qt5/qt5base/0001-directfb-Fix-for-non-GL-platform.patch
new file mode 100644
index 0000000..54f6aca
--- /dev/null
+++ b/package/qt5/qt5base/0001-directfb-Fix-for-non-GL-platform.patch
@@ -0,0 +1,39 @@
+From 5c4d88e55759cc64a6fcfb9059bc480fa5a19ee2 Mon Sep 17 00:00:00 2001
+From: Andreas Naumann <anaumann@ultratronik.de>
+Date: Tue, 13 Dec 2016 15:23:17 +0100
+Subject: [PATCH] directfb: Fix for non-GL platform
+
+directfb has generally no dependency on egl so include support for it
+only in the specific case of directfb_egl.
+
+Task-number: QTBUG-57176
+Change-Id: I73983f2c9deb789cd19ad59576e29d56ea2dfae1
+Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
+---
+ src/plugins/platforms/directfb/directfb.pro | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/plugins/platforms/directfb/directfb.pro b/src/plugins/platforms/directfb/directfb.pro
+index 4e95aeb..e500d8c 100644
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
+@@ -28,6 +28,7 @@ HEADERS = qdirectfbintegration.h \
+ 
+ # ### port the GL context
+ contains(QT_CONFIG, directfb_egl) {
++    QT += egl_support-private
+     HEADERS += qdirectfb_egl.h
+     SOURCES += qdirectfb_egl.cpp
+     DEFINES += DIRECTFB_GL_EGL
+-- 
+1.9.1
+
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
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 7840a6e..79ad868 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -41,12 +41,10 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
-QT5BASE_CONFIGURE_OPTS += -largefile
-
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
-QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5BASE_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
@@ -153,14 +151,6 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
-# gstreamer 0.10 support is broken in qt5multimedia
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
-QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
-QT5BASE_DEPENDENCIES   += gst1-plugins-base
-else
-QT5BASE_CONFIGURE_OPTS += -no-gstreamer
-endif
-
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
@@ -170,7 +160,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 0f7257d..6270362 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -11,8 +11,8 @@ QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5CONNECTIVITY_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5CONNECTIVITY_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5CONNECTIVITY_LICENSE = Commercial license
 QT5CONNECTIVITY_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index e5a3674..5d27556 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -11,8 +11,8 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5DECLARATIVE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5DECLARATIVE_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5DECLARATIVE_LICENSE = Commercial license
 QT5DECLARATIVE_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 223374a..4dab74a 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -11,8 +11,8 @@ QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5GRAPHICALEFFECTS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5GRAPHICALEFFECTS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5GRAPHICALEFFECTS_LICENSE = Commercial license
 QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 921656d..52a5760 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -11,8 +11,8 @@ QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5IMAGEFORMATS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5IMAGEFORMATS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5IMAGEFORMATS_LICENSE = Commercial license
 QT5IMAGEFORMATS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 358b162..8708783 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -11,8 +11,8 @@ QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5LOCATION_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5LOCATION_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5LOCATION_LICENSE = Commercial license
 QT5LOCATION_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index eb50ac1..e5faa4c 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,8 +11,8 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5MULTIMEDIA_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5MULTIMEDIA_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 0dd952a..035926d 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -11,8 +11,8 @@ QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SENSORS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5SENSORS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SENSORS_LICENSE = Commercial license
 QT5SENSORS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 04df021..1afb396 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -11,8 +11,8 @@ QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SERIALPORT_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5SERIALPORT_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SERIALPORT_LICENSE = Commercial license
 QT5SERIALPORT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index ebd5cba..f1a1597 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -11,8 +11,8 @@ QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SVG_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5SVG_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SVG_LICENSE = Commercial license
 QT5SVG_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 6befb8b..f7749b5 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -20,8 +20,8 @@ QT5TOOLS_DEPENDENCIES += qt5declarative
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5TOOLS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5TOOLS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5TOOLS_LICENSE = Commercial license
 QT5TOOLS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 9e94914..1c33360 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -11,8 +11,8 @@ QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBCHANNEL_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5WEBCHANNEL_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5WEBCHANNEL_LICENSE = Commercial license
 QT5WEBCHANNEL_REDISTRIBUTE = NO
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
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index f1200c2..6580a79 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,8 +11,8 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBSOCKETS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3
-QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
+QT5WEBSOCKETS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools)
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
 else
 QT5WEBSOCKETS_LICENSE = Commercial license
 QT5WEBSOCKETS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index a0e1209..53fedb2 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -11,8 +11,8 @@ QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5X11EXTRAS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5X11EXTRAS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5X11EXTRAS_LICENSE = Commercial license
 QT5X11EXTRAS_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 31477a7..2a002f3 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,8 +11,8 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5XMLPATTERNS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+QT5XMLPATTERNS_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
 QT5XMLPATTERNS_REDISTRIBUTE = NO
-- 
1.9.1
