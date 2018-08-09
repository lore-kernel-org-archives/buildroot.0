From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:44:29 +0200
Subject: [Buildroot] [git commit branch/next] qt5wayland: add fix from
 upstream to compile without QtQuick
Message-ID: <20180809213858.39BA67FBFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dbb356c40193ef90e33399d3e16c34d0e0fbeb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Compiling qt5wayland fails if you do not have the QtQuick module:

==
.obj/qwaylandquickhardwarelayer.o: In function `QWaylandQuickHardwareLayer::classBegin()':
qwaylandquickhardwarelayer.cpp:(.text+0x170): undefined reference to `QWaylandQuickItem::staticMetaObject'
.obj/qwaylandquickhardwarelayer.o: In function `non-virtual thunk to QWaylandQuickHardwareLayer::classBegin()':
qwaylandquickhardwarelayer.cpp:(.text+0x1cc): undefined reference to `QWaylandQuickItem::staticMetaObject'
.obj/qwaylandquickhardwarelayer.o: In function `QWaylandQuickHardwareLayer::disableSceneGraphPainting()':
qwaylandquickhardwarelayer.cpp:(.text+0x1e0): undefined reference to `QWaylandQuickItem::setPaintEnabled(bool)'
.obj/qwaylandquickhardwarelayer.o: In function `QWaylandQuickHardwareLayerPrivate::layerIntegration()':
qwaylandquickhardwarelayer.cpp:(.text+0x22c): undefined reference to `QtWayland::HardwareLayerIntegrationFactory::keys(QString const&)'
qwaylandquickhardwarelayer.cpp:(.text+0x408): undefined reference to `QtWayland::HardwareLayerIntegrationFactory::create(QString const&, QStringList const&, QString const&)'
qwaylandquickhardwarelayer.cpp:(.text+0x890): undefined reference to `QtWayland::HardwareLayerIntegrationFactory::create(QString const&, QStringList const&, QString const&)'
collect2: error: ld returned 1 exit status
Makefile:375: recipe for target '../../lib/libQt5WaylandCompositor.so.5.11.1' failed
make[4]: *** [../../lib/libQt5WaylandCompositor.so.5.11.1] Error 1
==

Fix taken from upstream's git:
http://code.qt.io/cgit/qt/qtwayland.git/commit/?id=2c48ee65e8c3b894caec214641723d0777fc60b8

No longer depends on declarative after applying either.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-compilation-without-QtQuick.patch     | 69 ++++++++++++++++++++++
 package/qt5/qt5wayland/Config.in                   |  3 -
 package/qt5/qt5wayland/qt5wayland.mk               |  6 +-
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch b/package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch
new file mode 100644
index 0000000000..fe5d323db0
--- /dev/null
+++ b/package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch
@@ -0,0 +1,69 @@
+From 2c48ee65e8c3b894caec214641723d0777fc60b8 Mon Sep 17 00:00:00 2001
+From: Alexander Schlarb <alexander@ninetailed.ninja>
+Date: Sun, 29 Jul 2018 21:27:28 +0200
+Subject: Fix compilation of QtWayland without QtQuick
+
+Change-Id: I0baf542f89274f48bf7d02121a07d64f0f3a001b
+Reviewed-by: Johan Helsing <johan.helsing@qt.io>
+Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
+---
+ src/compositor/compositor_api/compositor_api.pri               | 10 +++++-----
+ .../hardware_integration/qwlhardwarelayerintegration_p.h       |  1 -
+ 2 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/src/compositor/compositor_api/compositor_api.pri b/src/compositor/compositor_api/compositor_api.pri
+index e5df0f1f..4a0c0aa6 100644
+--- a/src/compositor/compositor_api/compositor_api.pri
++++ b/src/compositor/compositor_api/compositor_api.pri
+@@ -27,7 +27,6 @@ HEADERS += \
+     compositor_api/qwaylandresource.h \
+     compositor_api/qwaylandsurfacegrabber.h \
+     compositor_api/qwaylandoutputmode_p.h \
+-    compositor_api/qwaylandquickhardwarelayer_p.h \
+ 
+ SOURCES += \
+     compositor_api/qwaylandcompositor.cpp \
+@@ -44,8 +43,7 @@ SOURCES += \
+     compositor_api/qwaylanddestroylistener.cpp \
+     compositor_api/qwaylandview.cpp \
+     compositor_api/qwaylandresource.cpp \
+-    compositor_api/qwaylandsurfacegrabber.cpp \
+-    compositor_api/qwaylandquickhardwarelayer.cpp
++    compositor_api/qwaylandsurfacegrabber.cpp
+ 
+ qtConfig(im) {
+     HEADERS += \
+@@ -71,14 +69,16 @@ qtHaveModule(quick):qtConfig(opengl) {
+         compositor_api/qwaylandquickcompositor.cpp \
+         compositor_api/qwaylandquicksurface.cpp \
+         compositor_api/qwaylandquickoutput.cpp \
+-        compositor_api/qwaylandquickitem.cpp
++        compositor_api/qwaylandquickitem.cpp \
++        compositor_api/qwaylandquickhardwarelayer.cpp
+ 
+     HEADERS += \
+         compositor_api/qwaylandquickcompositor.h \
+         compositor_api/qwaylandquicksurface.h \
+         compositor_api/qwaylandquickoutput.h \
+         compositor_api/qwaylandquickitem.h \
+-        compositor_api/qwaylandquickitem_p.h
++        compositor_api/qwaylandquickitem_p.h \
++        compositor_api/qwaylandquickhardwarelayer_p.h
+ 
+     QT += qml qml-private quick quick-private
+ }
+diff --git a/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h b/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
+index 02de8e8b..1e5fb1a1 100644
+--- a/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
++++ b/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
+@@ -54,7 +54,6 @@
+ #include <QtWaylandCompositor/qtwaylandcompositorglobal.h>
+ 
+ #include <QObject>
+-#include <QQmlParserStatus>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-- 
+cgit v1.1-6-g87c4
+
diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
index 0182d3ca56..0d5a108912 100644
--- a/package/qt5/qt5wayland/Config.in
+++ b/package/qt5/qt5wayland/Config.in
@@ -1,12 +1,9 @@
 comment "qt5wayland needs an OpenGL-capable backend"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
 
 config BR2_PACKAGE_QT5WAYLAND
 	bool "qt5wayland"
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_WAYLAND
 	help
 	  Qt is a cross-platform application and UI framework for
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 98e592f03d..d6fb6e1888 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -7,9 +7,13 @@
 QT5WAYLAND_VERSION = $(QT5_VERSION)
 QT5WAYLAND_SITE = $(QT5_SITE)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WAYLAND_VERSION).tar.xz
-QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland
+QT5WAYLAND_DEPENDENCIES = qt5base wayland
 QT5WAYLAND_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+QT5WAYLAND_DEPENDENCIES += qt5declarative
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
 QT5WAYLAND_DEPENDENCIES += libxkbcommon
 endif
