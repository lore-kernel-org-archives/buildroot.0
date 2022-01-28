Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40DBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 747C261145;
	Fri, 28 Jan 2022 18:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_-cKXo9AgkT; Fri, 28 Jan 2022 18:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8E261151;
	Fri, 28 Jan 2022 18:37:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1721BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A85661149
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOlVZG1luDI2 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:37:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE50161145
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:37:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 55DD282B2E; Fri, 28 Jan 2022 18:30:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 19:36:09 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 072c2aec0b2b34f1c1589d7e121ffcf56a747922
X-Git-Newrev: b0cbf7935acc8b18ee047381ec657db418e22147
X-Patchwork-Hint: ignore
Message-Id: <20220128183019.55DD282B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/qt5/qt5base: fix
 CVE-2021-38593
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6525053802907570790=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6525053802907570790==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b0cbf7935acc8b18ee047381ec657db418e22147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

5.15.2 is the last public release of 5.15 and does not contain this CVE
fix. However, >=6.1.2 and >5.12.12 all contain the necessary patches so
let's port them to 5.15.2.

Technically only the first two patches are required to patch the CVE.
However, the second patch introduces a regression that is fixed in the third
patch.

The patches are taken from KDE kde/5.15 git branch.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9151eab3c7e4548a052be69aecba1f2b1ee6396c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ssing-intensive-painting-of-high-number-o.patch | 163 +++++++++++++++++++++
 ...x-for-avoiding-huge-number-of-tiny-dashes.patch |  37 +++++
 ...x-for-avoiding-huge-number-of-tiny-dashes.patch | 100 +++++++++++++
 package/qt5/qt5base/qt5base.mk                     |   4 +
 4 files changed, 304 insertions(+)

diff --git a/package/qt5/qt5base/0010-Avoid-processing-intensive-painting-of-high-number-o.patch b/package/qt5/qt5base/0010-Avoid-processing-intensive-painting-of-high-number-o.patch
new file mode 100644
index 0000000000..03287d19ca
--- /dev/null
+++ b/package/qt5/qt5base/0010-Avoid-processing-intensive-painting-of-high-number-o.patch
@@ -0,0 +1,163 @@
+From 307bc02e379e63aa9b7a3d21bbcd9c84d34c600f Mon Sep 17 00:00:00 2001
+From: Eirik Aavitsland <eirik.aavitsland@qt.io>
+Date: Tue, 13 Apr 2021 14:23:45 +0200
+Subject: [PATCH] Avoid processing-intensive painting of high number of tiny
+ dashes
+
+When stroking a dashed path, an unnecessary amount of processing would
+be spent if there is a huge number of dashes visible, e.g. because of
+scaling. Since the dashes are too small to be indivdually visible
+anyway, just replace with a semi-transparent solid line for such
+cases.
+
+Pick-to: 6.1 6.0 5.15
+Change-Id: I9e9f7861257ad5bce46a0cf113d1a9d7824911e6
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+(cherry picked from commit f4d791b330d02777fcaf02938732892eb3167e9b)
+
+* asturmlechner 2021-08-21:
+Conflict from preceding 94dd2ceb in dev branch:
+	src/gui/painting/qpaintengineex.cpp
+	Resolved via:
+
+     if (pen.style() > Qt::SolidLine) {
+         QRectF cpRect = path.controlPointRect();
+         const QTransform &xf = state()->matrix;
+-        if (pen.isCosmetic()) {
++        if (qt_pen_is_cosmetic(pen, state()->renderHints)){
+             clipRect = d->exDeviceRect;
+             cpRect.translate(xf.dx(), xf.dy());
+         } else {
+
+FTBFS from preceding 471e4fcb in dev branch changing QVector to QList:
+	Resolved via:
+
+         QRectF extentRect = cpRect.adjusted(-pw, -pw, pw, pw) & clipRect;
+         qreal extent = qMax(extentRect.width(), extentRect.height());
+         qreal patternLength = 0;
+-        const QList<qreal> pattern = pen.dashPattern();
++        const QVector<qreal> pattern = pen.dashPattern();
+         const int patternSize = qMin(pattern.size(), 32);
+         for (int i = 0; i < patternSize; i++)
+             patternLength += qMax(pattern.at(i), qreal(0));
+
+[Retrieved from: https://invent.kde.org/qt/qt/qtbase/-/commit/081d835c040a90f8ee76807354355062ac521dfb]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/gui/painting/qpaintengineex.cpp           | 44 +++++++++++++++----
+ .../other/lancelot/scripts/tinydashes.qps     | 34 ++++++++++++++
+ 2 files changed, 69 insertions(+), 9 deletions(-)
+ create mode 100644 tests/auto/other/lancelot/scripts/tinydashes.qps
+
+diff --git a/src/gui/painting/qpaintengineex.cpp b/src/gui/painting/qpaintengineex.cpp
+index 5d8f89eadd..55fdb0c2a0 100644
+--- a/src/gui/painting/qpaintengineex.cpp
++++ b/src/gui/painting/qpaintengineex.cpp
+@@ -385,7 +385,7 @@ QPainterState *QPaintEngineEx::createState(QPainterState *orig) const
+ 
+ Q_GUI_EXPORT extern bool qt_scaleForTransform(const QTransform &transform, qreal *scale); // qtransform.cpp
+ 
+-void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &pen)
++void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &inPen)
+ {
+ #ifdef QT_DEBUG_DRAW
+     qDebug() << "QPaintEngineEx::stroke()" << pen;
+@@ -403,6 +403,38 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &pen)
+         d->stroker.setCubicToHook(qpaintengineex_cubicTo);
+     }
+ 
++    QRectF clipRect;
++    QPen pen = inPen;
++    if (pen.style() > Qt::SolidLine) {
++        QRectF cpRect = path.controlPointRect();
++        const QTransform &xf = state()->matrix;
++        if (qt_pen_is_cosmetic(pen, state()->renderHints)){
++            clipRect = d->exDeviceRect;
++            cpRect.translate(xf.dx(), xf.dy());
++        } else {
++            clipRect = xf.inverted().mapRect(QRectF(d->exDeviceRect));
++        }
++        // Check to avoid generating unwieldy amount of dashes that will not be visible anyway
++        QRectF extentRect = cpRect & clipRect;
++        qreal extent = qMax(extentRect.width(), extentRect.height());
++        qreal patternLength = 0;
++        const QVector<qreal> pattern = pen.dashPattern();
++        const int patternSize = qMin(pattern.size(), 32);
++        for (int i = 0; i < patternSize; i++)
++            patternLength += qMax(pattern.at(i), qreal(0));
++        if (pen.widthF())
++            patternLength *= pen.widthF();
++        if (qFuzzyIsNull(patternLength)) {
++            pen.setStyle(Qt::NoPen);
++        } else if (extent / patternLength > 10000) {
++            // approximate stream of tiny dashes with semi-transparent solid line
++            pen.setStyle(Qt::SolidLine);
++            QColor color(pen.color());
++            color.setAlpha(color.alpha() / 2);
++            pen.setColor(color);
++        }
++    }
++
+     if (!qpen_fast_equals(pen, d->strokerPen)) {
+         d->strokerPen = pen;
+         d->stroker.setJoinStyle(pen.joinStyle());
+@@ -430,14 +462,8 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &pen)
+         return;
+     }
+ 
+-    if (pen.style() > Qt::SolidLine) {
+-        if (qt_pen_is_cosmetic(pen, state()->renderHints)){
+-            d->activeStroker->setClipRect(d->exDeviceRect);
+-        } else {
+-            QRectF clipRect = state()->matrix.inverted().mapRect(QRectF(d->exDeviceRect));
+-            d->activeStroker->setClipRect(clipRect);
+-        }
+-    }
++    if (!clipRect.isNull())
++        d->activeStroker->setClipRect(clipRect);
+ 
+     if (d->activeStroker == &d->stroker)
+         d->stroker.setForceOpen(path.hasExplicitOpen());
+diff --git a/tests/auto/other/lancelot/scripts/tinydashes.qps b/tests/auto/other/lancelot/scripts/tinydashes.qps
+new file mode 100644
+index 0000000000..d41ced7f5f
+--- /dev/null
++++ b/tests/auto/other/lancelot/scripts/tinydashes.qps
+@@ -0,0 +1,34 @@
++# Version: 1
++# CheckVsReference: 5%
++
++path_addEllipse mypath 20.0 20.0 200.0 200.0
++
++save
++setPen blue 20 SolidLine FlatCap
++pen_setCosmetic true
++pen_setDashPattern [ 0.0004 0.0004 ]
++setBrush yellow
++
++drawPath mypath
++translate 300 0
++setRenderHint Antialiasing true
++drawPath mypath
++restore
++
++path_addEllipse bigpath 200000.0 200000.0 2000000.0 2000000.0
++
++setPen blue 20 DotLine FlatCap
++setBrush yellow
++
++save
++translate 0 300
++scale 0.0001 0.00011
++drawPath bigpath
++restore
++
++save
++translate 300 300
++setRenderHint Antialiasing true
++scale 0.0001 0.00011
++drawPath bigpath
++restore
+-- 
+2.34.1
+
diff --git a/package/qt5/qt5base/0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch b/package/qt5/qt5base/0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
new file mode 100644
index 0000000000..16e0f20200
--- /dev/null
+++ b/package/qt5/qt5base/0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
@@ -0,0 +1,37 @@
+From 856d11f695fb6effe26a359f9ad0efdf24067085 Mon Sep 17 00:00:00 2001
+From: Eirik Aavitsland <eirik.aavitsland@qt.io>
+Date: Fri, 23 Jul 2021 15:53:56 +0200
+Subject: [PATCH] Improve fix for avoiding huge number of tiny dashes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some pathological cases were not caught by the previous fix.
+
+Fixes: QTBUG-95239
+Pick-to: 6.2 6.1 5.15
+Change-Id: I0337ee3923ff93ccb36c4d7b810a9c0667354cc5
+Reviewed-by: Robert Löhning <robert.loehning@qt.io>
+(cherry picked from commit 6b400e3147dcfd8cc3a393ace1bd118c93762e0c)
+[Retrieved from: https://invent.kde.org/qt/qt/qtbase/-/commit/fed5713eeba5bf8e0ee413cb4e77109bfa7c2bce]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/gui/painting/qpaintengineex.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gui/painting/qpaintengineex.cpp b/src/gui/painting/qpaintengineex.cpp
+index 55fdb0c2a0..19e4b23423 100644
+--- a/src/gui/painting/qpaintengineex.cpp
++++ b/src/gui/painting/qpaintengineex.cpp
+@@ -426,7 +426,7 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &inPen)
+             patternLength *= pen.widthF();
+         if (qFuzzyIsNull(patternLength)) {
+             pen.setStyle(Qt::NoPen);
+-        } else if (extent / patternLength > 10000) {
++        } else if (qFuzzyIsNull(extent) || extent / patternLength > 10000) {
+             // approximate stream of tiny dashes with semi-transparent solid line
+             pen.setStyle(Qt::SolidLine);
+             QColor color(pen.color());
+-- 
+2.34.1
+
diff --git a/package/qt5/qt5base/0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch b/package/qt5/qt5base/0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch
new file mode 100644
index 0000000000..ca3c2736ae
--- /dev/null
+++ b/package/qt5/qt5base/0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch
@@ -0,0 +1,100 @@
+From 3b1a60f651776a7b2d155803b07a52a9e27bdf78 Mon Sep 17 00:00:00 2001
+From: Eirik Aavitsland <eirik.aavitsland@qt.io>
+Date: Fri, 30 Jul 2021 13:03:49 +0200
+Subject: [PATCH] Refix for avoiding huge number of tiny dashes
+
+Previous fix hit too widely so some valid horizontal and vertical
+lines were affected; the root problem being that such lines have an
+empty control point rect (width or height is 0). Fix by caculating in
+the pen width.
+
+Pick-to: 6.2 6.1 5.15
+Change-Id: I7a436e873f6d485028f6759d0e2c6456f07eebdc
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+(cherry picked from commit 84aba80944a2e1c3058d7a1372e0e66676411884)
+[Retrieved from: https://invent.kde.org/qt/qt/qtbase/-/commit/427df34efdcb56582a9ae9f7d2d1f39eeff70328]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/gui/painting/qpaintengineex.cpp           |  8 ++---
+ .../gui/painting/qpainter/tst_qpainter.cpp    | 31 +++++++++++++++++++
+ 2 files changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/src/gui/painting/qpaintengineex.cpp b/src/gui/painting/qpaintengineex.cpp
+index 19e4b23423..9fe510827a 100644
+--- a/src/gui/painting/qpaintengineex.cpp
++++ b/src/gui/painting/qpaintengineex.cpp
+@@ -415,18 +415,18 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &inPen)
+             clipRect = xf.inverted().mapRect(QRectF(d->exDeviceRect));
+         }
+         // Check to avoid generating unwieldy amount of dashes that will not be visible anyway
+-        QRectF extentRect = cpRect & clipRect;
++        qreal pw = pen.widthF() ? pen.widthF() : 1;
++        QRectF extentRect = cpRect.adjusted(-pw, -pw, pw, pw) & clipRect;
+         qreal extent = qMax(extentRect.width(), extentRect.height());
+         qreal patternLength = 0;
+         const QVector<qreal> pattern = pen.dashPattern();
+         const int patternSize = qMin(pattern.size(), 32);
+         for (int i = 0; i < patternSize; i++)
+             patternLength += qMax(pattern.at(i), qreal(0));
+-        if (pen.widthF())
+-            patternLength *= pen.widthF();
++        patternLength *= pw;
+         if (qFuzzyIsNull(patternLength)) {
+             pen.setStyle(Qt::NoPen);
+-        } else if (qFuzzyIsNull(extent) || extent / patternLength > 10000) {
++        } else if (extent / patternLength > 10000) {
+             // approximate stream of tiny dashes with semi-transparent solid line
+             pen.setStyle(Qt::SolidLine);
+             QColor color(pen.color());
+diff --git a/tests/auto/gui/painting/qpainter/tst_qpainter.cpp b/tests/auto/gui/painting/qpainter/tst_qpainter.cpp
+index 42e98ce363..d7c3f95f1d 100644
+--- a/tests/auto/gui/painting/qpainter/tst_qpainter.cpp
++++ b/tests/auto/gui/painting/qpainter/tst_qpainter.cpp
+@@ -308,6 +308,7 @@ private slots:
+     void fillPolygon();
+ 
+     void drawImageAtPointF();
++    void scaledDashes();
+ 
+ private:
+     void fillData();
+@@ -5468,6 +5469,36 @@ void tst_QPainter::drawImageAtPointF()
+     paint.end();
+ }
+ 
++void tst_QPainter::scaledDashes()
++{
++    // Test that we do not hit the limit-huge-number-of-dashes path
++    QRgb fore = qRgb(0, 0, 0xff);
++    QRgb back = qRgb(0xff, 0xff, 0);
++    QImage image(5, 32, QImage::Format_RGB32);
++    image.fill(back);
++    QPainter p(&image);
++    QPen pen(QColor(fore), 3, Qt::DotLine);
++    p.setPen(pen);
++    p.scale(1, 2);
++    p.drawLine(2, 0, 2, 16);
++    p.end();
++
++    bool foreFound = false;
++    bool backFound = false;
++    int i = 0;
++    while (i < 32 && (!foreFound || !backFound)) {
++        QRgb pix = image.pixel(3, i);
++        if (pix == fore)
++            foreFound = true;
++        else if (pix == back)
++            backFound = true;
++        i++;
++    }
++
++    QVERIFY(foreFound);
++    QVERIFY(backFound);
++}
++
+ QTEST_MAIN(tst_QPainter)
+ 
+ #include "tst_qpainter.moc"
+-- 
+2.34.1
+
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 7897e4294a..62dc16b647 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -11,6 +11,10 @@ QT5BASE_SOURCE = qtbase-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5BASE_VERSION).tar.xz
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 
+# 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
+# 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
+QT5BASE_IGNORE_CVES += CVE-2021-38593
+
 # A few comments:
 #  * -no-pch to workaround the issue described at
 #     http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.

--===============6525053802907570790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6525053802907570790==--
