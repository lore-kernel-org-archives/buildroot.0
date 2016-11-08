From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue,  8 Nov 2016 11:30:44 +0100
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.8.0-beta
In-Reply-To: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1478601048-21388-2-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed all hashes (until final release).

- qt5base: renamed library to EglFSDeviceIntegration ([1])
- qt5base: remove ras-pi patch
- qt5base: remove obsolete config-option -large ([2])
- qt5base: make the directfb platform plugin compile ([3])
- qt53d/quickcontrols2/serialbus: move out of tech-preview
- qt5enginio: remove discontinued module

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
[3] Without this patch, qmake is looking for directfb_egl feature which usually is not
    provided (only by some raspi mkspec afaics).

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/Config.in                              |  7 +--
 package/qt5/qt5.mk                                 |  6 +-
 package/qt5/qt53d/qt53d.hash                       |  2 -
 ...001-directfb-make-platform-plugin-compile.patch | 22 ++++++++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ---------------
 package/qt5/qt5base/qt5base.hash                   |  2 -
 package/qt5/qt5base/qt5base.mk                     |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  2 -
 package/qt5/qt5connectivity/qt5connectivity.hash   |  2 -
 package/qt5/qt5declarative/qt5declarative.hash     |  2 -
 package/qt5/qt5enginio/Config.in                   | 13 -----
 package/qt5/qt5enginio/qt5enginio.hash             |  2 -
 package/qt5/qt5enginio/qt5enginio.mk               | 64 ----------------------
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  2 -
 package/qt5/qt5imageformats/qt5imageformats.hash   |  2 -
 package/qt5/qt5location/qt5location.hash           |  2 -
 package/qt5/qt5multimedia/qt5multimedia.hash       |  2 -
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  2 -
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  2 -
 package/qt5/qt5script/qt5script.hash               |  2 -
 package/qt5/qt5sensors/qt5sensors.hash             |  2 -
 package/qt5/qt5serialbus/qt5serialbus.hash         |  2 -
 package/qt5/qt5serialport/qt5serialport.hash       |  2 -
 package/qt5/qt5svg/qt5svg.hash                     |  2 -
 package/qt5/qt5tools/qt5tools.hash                 |  2 -
 package/qt5/qt5webchannel/qt5webchannel.hash       |  2 -
 package/qt5/qt5webkit/qt5webkit.hash               |  2 -
 package/qt5/qt5websockets/qt5websockets.hash       |  2 -
 package/qt5/qt5x11extras/qt5x11extras.hash         |  2 -
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  2 -
 30 files changed, 29 insertions(+), 178 deletions(-)
 delete mode 100644 package/qt5/qt53d/qt53d.hash
 create mode 100644 package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 delete mode 100644 package/qt5/qt5base/qt5base.hash
 delete mode 100644 package/qt5/qt5canvas3d/qt5canvas3d.hash
 delete mode 100644 package/qt5/qt5connectivity/qt5connectivity.hash
 delete mode 100644 package/qt5/qt5declarative/qt5declarative.hash
 delete mode 100644 package/qt5/qt5enginio/Config.in
 delete mode 100644 package/qt5/qt5enginio/qt5enginio.hash
 delete mode 100644 package/qt5/qt5enginio/qt5enginio.mk
 delete mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
 delete mode 100644 package/qt5/qt5imageformats/qt5imageformats.hash
 delete mode 100644 package/qt5/qt5location/qt5location.hash
 delete mode 100644 package/qt5/qt5multimedia/qt5multimedia.hash
 delete mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.hash
 delete mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
 delete mode 100644 package/qt5/qt5script/qt5script.hash
 delete mode 100644 package/qt5/qt5sensors/qt5sensors.hash
 delete mode 100644 package/qt5/qt5serialbus/qt5serialbus.hash
 delete mode 100644 package/qt5/qt5serialport/qt5serialport.hash
 delete mode 100644 package/qt5/qt5svg/qt5svg.hash
 delete mode 100644 package/qt5/qt5tools/qt5tools.hash
 delete mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
 delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
 delete mode 100644 package/qt5/qt5websockets/qt5websockets.hash
 delete mode 100644 package/qt5/qt5x11extras/qt5x11extras.hash
 delete mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 234dfdd..a4dc481 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -31,16 +31,18 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
+source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
-source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
+source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5sensors/Config.in"
+source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
@@ -49,9 +51,6 @@ source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 comment "technology preview"
-source "package/qt5/qt53d/Config.in"
-source "package/qt5/qt5quickcontrols2/Config.in"
-source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5webkit/Config.in"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d25f663..4d5dbf3 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,6 +1,6 @@
-QT5_VERSION_MAJOR = 5.6
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_VERSION_MAJOR = 5.8
+QT5_VERSION = $(QT5_VERSION_MAJOR).0-beta
+QT5_SITE = http://download.qt.io/development_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
deleted file mode 100644
index 7179380..0000000
--- a/package/qt5/qt53d/qt53d.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
new file mode 100644
index 0000000..96cc3b0
--- /dev/null
+++ b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
@@ -0,0 +1,22 @@
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
deleted file mode 100644
index 9808e9b..0000000
--- a/package/qt5/qt5base/qt5base.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
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
deleted file mode 100644
index 01819e4..0000000
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
deleted file mode 100644
index 4574f3d..0000000
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
deleted file mode 100644
index d8d3a68..0000000
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
deleted file mode 100644
index fcb866c..0000000
--- a/package/qt5/qt5enginio/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_QT5ENGINIO
-	bool "qt5enginio"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_QT5BASE
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_NETWORK
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package corresponds to the qt5enginio module.
-
-	  http://qt.io
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
deleted file mode 100644
index 9951834..0000000
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
-sha256 90ffc38d214a75ab0ef90a4760843f12bc073ae49c17de24c677d1d403bddcc3 qtenginio-opensource-src-1.6.2.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
deleted file mode 100644
index ada5fa7..0000000
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ /dev/null
@@ -1,64 +0,0 @@
-################################################################################
-#
-# qt5enginio
-#
-################################################################################
-
-# Qt5Enginio does not follow Qt versionning
-# see https://bugreports.qt.io/browse/QTBUG-50111
-QT5ENGINIO_VERSION = 1.6.2
-QT5ENGINIO_SITE = $(QT5_SITE)
-QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
-QT5ENGINIO_DEPENDENCIES = openssl qt5base
-QT5ENGINIO_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5ENGINIO_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
-QT5ENGINIO_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-else
-QT5ENGINIO_LICENSE = Commercial license
-QT5ENGINIO_REDISTRIBUTE = NO
-endif
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-QT5ENGINIO_DEPENDENCIES += qt5declarative
-endif
-
-define QT5ENGINIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-endef
-
-define QT5ENGINIO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5ENGINIO_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5ENGINIO_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/Enginio $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5ENGINIO_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/enginio $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5ENGINIO_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libEnginio.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5ENGINIO_INSTALL_TARGET_CMDS
-	$(QT5ENGINIO_INSTALL_TARGET_LIBS)
-	$(QT5ENGINIO_INSTALL_TARGET_QMLS)
-	$(QT5ENGINIO_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
deleted file mode 100644
index ae29e3b..0000000
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
deleted file mode 100644
index 54b58e4..0000000
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
deleted file mode 100644
index 374952f..0000000
--- a/package/qt5/qt5location/qt5location.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
deleted file mode 100644
index 56a11fb..0000000
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
deleted file mode 100644
index 6db589d..0000000
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
deleted file mode 100644
index 0d85d48..0000000
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
deleted file mode 100644
index c8ecb75..0000000
--- a/package/qt5/qt5script/qt5script.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
deleted file mode 100644
index 65cd127..0000000
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
deleted file mode 100644
index 308c365..0000000
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
deleted file mode 100644
index 2458e5d..0000000
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
deleted file mode 100644
index 0c9e9eb..0000000
--- a/package/qt5/qt5svg/qt5svg.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
deleted file mode 100644
index cc11b28..0000000
--- a/package/qt5/qt5tools/qt5tools.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
deleted file mode 100644
index 0f9eaae..0000000
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
deleted file mode 100644
index 96b8bdd..0000000
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256 bdd659573e7e75cd4ad57b7160a7353d98d21a6fef06e4fb9e114a5b1f1e9dab qt5webkit-b35917bcb44d7f200af0f4ac68a126fa0aa8d93d.tar.gz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
deleted file mode 100644
index 3443476..0000000
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
deleted file mode 100644
index 297c578..0000000
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
deleted file mode 100644
index fa4e97f..0000000
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
-sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
-- 
1.9.1
