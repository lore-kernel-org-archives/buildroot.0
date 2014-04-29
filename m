From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Apr 2014 14:55:15 +0200
Subject: [Buildroot] [git commit] qt 4.8.x : bump version to 4.8.6
Message-ID: <20140429180628.C159E9C952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3be25f3558d1fc16c717416038d0048db837ca8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropped upstream patch fix-polyline-drawing.patch
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt-fix-polyline-drawing.patch |  145 ------------------------------
 package/qt/qt.mk                         |    2 +-
 2 files changed, 1 insertions(+), 146 deletions(-)

diff --git a/package/qt/qt-fix-polyline-drawing.patch b/package/qt/qt-fix-polyline-drawing.patch
deleted file mode 100644
index d0c3d07..0000000
--- a/package/qt/qt-fix-polyline-drawing.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From b7029fbd12c32e851ed7d81b692197176eb71d9e Mon Sep 17 00:00:00 2001
-From: Gunnar Sletta <gunnar.sletta@digia.com>
-Date: Thu, 4 Jul 2013 16:20:40 +1000
-Subject: [PATCH] Fix drawing of 0-width polylines from outside the devicerect.
-
-This was broken by a previous fix which aimed to fix gaps in
-polylines with tiny line segments. The result was that we
-skipped updating the origin point when stroke() didn't produce
-pixels which accidentally included the case of the line
-being completely outside the deviceRect. I fixed this
-by returning the value of clipLine in drawLine to the caller
-so we could still update the origin for this case.
-
-Task-number: QTBUG-31579
-Change-Id: Iac29436f042da7658bbeaf9370351dc6f2c95065
-(cherry picked from qtbase/900cccfd459fcbdbc4aa3d313afe12cfbf68fd87)
----
- src/gui/painting/qcosmeticstroker.cpp | 42 ++++++++++++++++++++++-------------
- src/gui/painting/qcosmeticstroker_p.h |  2 +-
- 2 files changed, 27 insertions(+), 17 deletions(-)
-
-diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
-index 0061ecb..4413170 100644
---- a/src/gui/painting/qcosmeticstroker.cpp
-+++ b/src/gui/painting/qcosmeticstroker.cpp
-@@ -133,10 +133,15 @@ struct NoDasher {
- 
- };
- 
-+/*
-+ * The return value is the result of the clipLine() call performed at the start
-+ * of each of the two functions, aka "false" means completely outside the devices
-+ * rect.
-+ */
- template<DrawPixel drawPixel, class Dasher>
--static void drawLine(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
-+static bool drawLine(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
- template<DrawPixel drawPixel, class Dasher>
--static void drawLineAA(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
-+static bool drawLineAA(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
- 
- inline void drawPixel(QCosmeticStroker *stroker, int x, int y, int coverage)
- {
-@@ -602,17 +607,20 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
-                 caps |= CapEnd;
- 
-             QCosmeticStroker::Point last = this->lastPixel;
--            stroke(this, p.x(), p.y(), p2.x(), p2.y(), caps);
-+            bool unclipped = stroke(this, p.x(), p.y(), p2.x(), p2.y(), caps);
- 
-             /* fix for gaps in polylines with fastpen and aliased in a sequence
-                of points with small distances: if current point p2 has been dropped
--               out, keep last non dropped point p. */
--            if (fastPenAliased) {
--                if (last.x != lastPixel.x || last.y != lastPixel.y ||
--                    points == begin + 2 || points == end - 2 ) {
--                    {
--                        p = p2;
--                    }
-+               out, keep last non dropped point p.
-+
-+               However, if the line was completely outside the devicerect, we
-+               still need to update p to avoid drawing the line after this one from
-+               a bad starting position.
-+            */
-+            if (fastPenAliased && unclipped) {
-+                if (last.x != lastPixel.x || last.y != lastPixel.y
-+                    || points == begin + 2 || points == end - 2) {
-+                    p = p2;
-                 }
-             } else {
-                 p = p2;
-@@ -720,10 +728,10 @@ static inline void capAdjust(int caps, int &x1, int &x2, int &y, int yinc)
-   the drawing shifts from horizontal to vertical or back.
-   */
- template<DrawPixel drawPixel, class Dasher>
--static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
-+static bool drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
- {
-     if (stroker->clipLine(rx1, ry1, rx2, ry2))
--        return;
-+        return false;
- 
-     static const int half = 31;
-     int x1 = toF26Dot6(rx1) + half;
-@@ -813,7 +821,7 @@ static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2,
-     } else {
-         // horizontal
-         if (!dx)
--            return;
-+            return true;
- 
-         QCosmeticStroker::Direction dir = QCosmeticStroker::LeftToRight;
- 
-@@ -886,14 +894,15 @@ static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2,
-         }
-     }
-     stroker->lastPixel = last;
-+    return true;
- }
- 
- 
- template<DrawPixel drawPixel, class Dasher>
--static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
-+static bool drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
- {
-     if (stroker->clipLine(rx1, ry1, rx2, ry2))
--        return;
-+        return false;
- 
-     int x1 = toF26Dot6(rx1);
-     int y1 = toF26Dot6(ry1);
-@@ -967,7 +976,7 @@ static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx
-     } else {
-         // horizontal
-         if (!dx)
--            return;
-+            return true;
- 
-         int yinc = F16Dot16FixedDiv(dy, dx);
- 
-@@ -1029,6 +1038,7 @@ static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx
-             drawPixel(stroker, x, (y>>16) + 1, alpha * alphaEnd >> 6);
-         }
-     }
-+    return true;
- }
- 
- QT_END_NAMESPACE
-diff --git a/src/gui/painting/qcosmeticstroker_p.h b/src/gui/painting/qcosmeticstroker_p.h
-index 870738b..3216856 100644
---- a/src/gui/painting/qcosmeticstroker_p.h
-+++ b/src/gui/painting/qcosmeticstroker_p.h
-@@ -56,7 +56,7 @@ QT_MODULE(Gui)
- class QCosmeticStroker;
- 
- 
--typedef void (*StrokeLine)(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
-+typedef bool (*StrokeLine)(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
- 
- class QCosmeticStroker
- {
--- 
-1.8.3.2
-
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 507e0db..f54b6e6 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,7 +12,7 @@
 ################################################################################
 
 QT_VERSION_MAJOR = 4.8
-QT_VERSION = $(QT_VERSION_MAJOR).5
+QT_VERSION = $(QT_VERSION_MAJOR).6
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
