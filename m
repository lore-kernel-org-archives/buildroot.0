From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Oct 2018 20:18:26 +0200
Subject: [Buildroot] [PATCH v1] qt5wayland: remove legacy
 compile-without-QtQuick patch
Message-ID: <20181015181826.26194-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch was taken from upstream [1], removing it fixes [2]:

  Applying 0001-fix-compilation-without-QtQuick.patch using patch:
  patching file src/compositor/compositor_api/compositor_api.pri
  Reversed (or previously applied) patch detected!  Skipping patch.
  3 out of 3 hunks ignored -- saving rejects to file src/compositor/compositor_api/compositor_api.pri.rej
  patching file src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
  Reversed (or previously applied) patch detected!  Skipping patch.
  1 out of 1 hunk ignored -- saving rejects to file src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h.rej

[1] http://code.qt.io/cgit/qt/qtwayland.git/commit/?id=2c48ee65e8c3b894caec214641723d0777fc60b8
[2] http://autobuild.buildroot.net/results/0d31817bb4d416d01f4d1bec3e22ce0e5b2ca1c3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...0001-fix-compilation-without-QtQuick.patch | 69 -------------------
 1 file changed, 69 deletions(-)
 delete mode 100644 package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch

diff --git a/package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch b/package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch
deleted file mode 100644
index fe5d323db0..0000000000
--- a/package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 2c48ee65e8c3b894caec214641723d0777fc60b8 Mon Sep 17 00:00:00 2001
-From: Alexander Schlarb <alexander@ninetailed.ninja>
-Date: Sun, 29 Jul 2018 21:27:28 +0200
-Subject: Fix compilation of QtWayland without QtQuick
-
-Change-Id: I0baf542f89274f48bf7d02121a07d64f0f3a001b
-Reviewed-by: Johan Helsing <johan.helsing@qt.io>
-Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
----
- src/compositor/compositor_api/compositor_api.pri               | 10 +++++-----
- .../hardware_integration/qwlhardwarelayerintegration_p.h       |  1 -
- 2 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/src/compositor/compositor_api/compositor_api.pri b/src/compositor/compositor_api/compositor_api.pri
-index e5df0f1f..4a0c0aa6 100644
---- a/src/compositor/compositor_api/compositor_api.pri
-+++ b/src/compositor/compositor_api/compositor_api.pri
-@@ -27,7 +27,6 @@ HEADERS += \
-     compositor_api/qwaylandresource.h \
-     compositor_api/qwaylandsurfacegrabber.h \
-     compositor_api/qwaylandoutputmode_p.h \
--    compositor_api/qwaylandquickhardwarelayer_p.h \
- 
- SOURCES += \
-     compositor_api/qwaylandcompositor.cpp \
-@@ -44,8 +43,7 @@ SOURCES += \
-     compositor_api/qwaylanddestroylistener.cpp \
-     compositor_api/qwaylandview.cpp \
-     compositor_api/qwaylandresource.cpp \
--    compositor_api/qwaylandsurfacegrabber.cpp \
--    compositor_api/qwaylandquickhardwarelayer.cpp
-+    compositor_api/qwaylandsurfacegrabber.cpp
- 
- qtConfig(im) {
-     HEADERS += \
-@@ -71,14 +69,16 @@ qtHaveModule(quick):qtConfig(opengl) {
-         compositor_api/qwaylandquickcompositor.cpp \
-         compositor_api/qwaylandquicksurface.cpp \
-         compositor_api/qwaylandquickoutput.cpp \
--        compositor_api/qwaylandquickitem.cpp
-+        compositor_api/qwaylandquickitem.cpp \
-+        compositor_api/qwaylandquickhardwarelayer.cpp
- 
-     HEADERS += \
-         compositor_api/qwaylandquickcompositor.h \
-         compositor_api/qwaylandquicksurface.h \
-         compositor_api/qwaylandquickoutput.h \
-         compositor_api/qwaylandquickitem.h \
--        compositor_api/qwaylandquickitem_p.h
-+        compositor_api/qwaylandquickitem_p.h \
-+        compositor_api/qwaylandquickhardwarelayer_p.h
- 
-     QT += qml qml-private quick quick-private
- }
-diff --git a/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h b/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
-index 02de8e8b..1e5fb1a1 100644
---- a/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
-+++ b/src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
-@@ -54,7 +54,6 @@
- #include <QtWaylandCompositor/qtwaylandcompositorglobal.h>
- 
- #include <QObject>
--#include <QQmlParserStatus>
- 
- QT_BEGIN_NAMESPACE
- 
--- 
-cgit v1.1-6-g87c4
-
-- 
2.19.0
