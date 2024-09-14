Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734B9C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 340D2405CC;
	Sat, 14 Sep 2024 13:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npiXqPCIKlTs; Sat, 14 Sep 2024 13:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB0B405CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB0B405CF;
	Sat, 14 Sep 2024 13:23:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBA101BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA1458434A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bH9fwpVzaKxM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC178431B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FC178431B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C2FF82B5E; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:11:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 61b4095409c84aa94f4f4b503cf2014a9d3cf83d
X-Git-Newrev: 862543eca03a9819d4429ce7c5237e6449ae63a9
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.3C2FF82B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
 backport fix for CVE-2023-32763
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=862543eca03a9819d4429ce7c5237e6449ae63a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports some upstream commits to fix CVE-2023-32763.

To backport the CVE fix, we had to backport two other related patches
to make the backport reasonably clean/straightforward.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-maximumWidth-for-a-text-containing-s.patch |  88 +++++++++++
 ...-fix-maximumWidth-for-a-text-containing-l.patch | 168 +++++++++++++++++++++
 ...0005-Fix-specific-overflow-in-qtextlayout.patch |  79 ++++++++++
 package/qt6/qt6base/qt6base.mk                     |   2 +
 4 files changed, 337 insertions(+)

diff --git a/package/qt6/qt6base/0003-QTextLayout-fix-maximumWidth-for-a-text-containing-s.patch b/package/qt6/qt6base/0003-QTextLayout-fix-maximumWidth-for-a-text-containing-s.patch
new file mode 100644
index 0000000000..6717c0e905
--- /dev/null
+++ b/package/qt6/qt6base/0003-QTextLayout-fix-maximumWidth-for-a-text-containing-s.patch
@@ -0,0 +1,88 @@
+From ffa54deca4ee1e47c112b33ff37f296c4df6c559 Mon Sep 17 00:00:00 2001
+From: Vladimir Belyavsky <belyavskyv@gmail.com>
+Date: Mon, 26 Sep 2022 19:32:50 +0300
+Subject: [PATCH] QTextLayout: fix maximumWidth() for a text containing spaces
+
+When laying out a text and calculating maxWidth, we must _always_ take
+into account the accumulated width of spaces (lbh.spaceData.textWidth)
+regardless of wrapMode, other text content, spaces position, etc.
+
+Fixes: QTBUG-106947
+Change-Id: I2ac9af92ed7dd07c1e040bfcf83949a358d1c9c9
+Reviewed-by: Qt CI Bot <qt_ci_bot@qt-project.org>
+Reviewed-by: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/4945fd93f13d2fc34adf260fd0e0325d0794f3f7
+[Thomas: Needed to backport fix for
+https://security-tracker.debian.org/tracker/CVE-2023-32763]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/gui/text/qtextlayout.cpp                     |  6 +-----
+ .../gui/text/qtextlayout/tst_qtextlayout.cpp     | 16 ++++++++++++++--
+ 2 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index e3c69db7e57..9ae6bee2de3 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -1919,7 +1919,6 @@ void QTextLine::layout_helper(int maxGlyphs)
+             }
+ 
+             if (!lbh.manualWrap && lbh.spaceData.textWidth > line.width) {
+-                lbh.spaceData.textWidth = line.width; // ignore spaces that fall out of the line.
+                 goto found;
+             }
+         } else {
+@@ -2105,12 +2104,9 @@ found:
+         eng->maxWidth = qMax(eng->maxWidth, line.textWidth);
+     } else {
+         eng->minWidth = qMax(eng->minWidth, lbh.minw);
+-        eng->maxWidth += line.textWidth;
++        eng->maxWidth += line.textWidth + lbh.spaceData.textWidth;
+     }
+ 
+-    if (line.textWidth > 0 && item < eng->layoutData->items.size())
+-        eng->maxWidth += lbh.spaceData.textWidth;
+-
+     line.textWidth += trailingSpace;
+     if (lbh.spaceData.length) {
+         line.trailingSpaces = lbh.spaceData.length;
+diff --git a/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp b/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp
+index a8b42b88697..680c62e9825 100644
+--- a/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp
++++ b/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp
+@@ -124,6 +124,7 @@ private slots:
+     void tooManyDirectionalCharctersCrash_qtbug77819();
+     void softHyphens_data();
+     void softHyphens();
++    void min_maximumWidth_data();
+     void min_maximumWidth();
+ 
+ private:
+@@ -2662,10 +2663,21 @@ void tst_QTextLayout::softHyphens()
+     }
+ }
+ 
++void tst_QTextLayout::min_maximumWidth_data()
++{
++    QTest::addColumn<QString>("text");
++
++    QTest::newRow("long string") << QStringLiteral("lmong_long_crazy_87235982735_23857239682376923876923876-fuwhfhfw-names-AAAA-deeaois2019-03-03.and.more");
++    QTest::newRow("QTBUG-106947") << QStringLiteral("text                                text");
++    QTest::newRow("spaces") << QStringLiteral("                text                text                ");
++}
++
+ void tst_QTextLayout::min_maximumWidth()
+ {
+-    QString longString("lmong_long_crazy_87235982735_23857239682376923876923876-fuwhfhfw-names-AAAA-deeaois2019-03-03.and.more");
+-    QTextLayout layout(longString, testFont);
++    QFETCH(QString, text);
++
++    QTextLayout layout(text, testFont);
++    layout.setCacheEnabled(true);
+ 
+     for (int wrapMode = QTextOption::NoWrap; wrapMode <= QTextOption::WrapAtWordBoundaryOrAnywhere; ++wrapMode) {
+         QTextOption opt;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0004-QTextLayout-fix-maximumWidth-for-a-text-containing-l.patch b/package/qt6/qt6base/0004-QTextLayout-fix-maximumWidth-for-a-text-containing-l.patch
new file mode 100644
index 0000000000..7163b8ff7e
--- /dev/null
+++ b/package/qt6/qt6base/0004-QTextLayout-fix-maximumWidth-for-a-text-containing-l.patch
@@ -0,0 +1,168 @@
+From b58616bff6715a6c66bdc9019d008b7918d3ccc8 Mon Sep 17 00:00:00 2001
+From: Vladimir Belyavsky <belyavskyv@gmail.com>
+Date: Tue, 27 Sep 2022 16:57:08 +0300
+Subject: [PATCH] QTextLayout: fix maximumWidth() for a text containing line
+ separator
+
+This is improved version of previous fix
+013c346a8dcbd618febb07884c64c740daf9754d that was reverted because it
+broke some tests for Quick Text. The problem was that it did not work
+correctly in the case the text was wrapped to a fixed width.
+To deal with this we'll accumulate current line full width (as if it
+hadn't been wrapped) in layout data (layoutData->currentMaxWidth).
+Then when the next line is explicitly wrapped by line or paragraph
+separator, this accumulated width will be used to adjust layout's
+maximum width.
+
+Change-Id: Iad7119d9808e1db15fe1fbc5db049c3db928529f
+Fixes: QTBUG-89557
+Fixes: QTBUG-104986
+Reviewed-by: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/991c056438b311566bc4ea543af0f33dfd5dffbb
+[Thomas: Needed to backport fix for
+https://security-tracker.debian.org/tracker/CVE-2023-32763]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/gui/text/qtextengine.cpp                     |  3 +++
+ src/gui/text/qtextengine_p.h                     |  1 +
+ src/gui/text/qtextlayout.cpp                     | 16 +++++++++++-----
+ .../gui/text/qtextlayout/tst_qtextlayout.cpp     | 16 +++++++++++++++-
+ 4 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/src/gui/text/qtextengine.cpp b/src/gui/text/qtextengine.cpp
+index ec528760e3b..ef3cdcbaaa7 100644
+--- a/src/gui/text/qtextengine.cpp
++++ b/src/gui/text/qtextengine.cpp
+@@ -2619,6 +2619,7 @@ QTextEngine::LayoutData::LayoutData()
+     haveCharAttributes = false;
+     logClustersPtr = nullptr;
+     available_glyphs = 0;
++    currentMaxWidth = 0;
+ }
+ 
+ QTextEngine::LayoutData::LayoutData(const QString &str, void **stack_memory, int _allocated)
+@@ -2651,6 +2652,7 @@ QTextEngine::LayoutData::LayoutData(const QString &str, void **stack_memory, int
+     hasBidi = false;
+     layoutState = LayoutEmpty;
+     haveCharAttributes = false;
++    currentMaxWidth = 0;
+ }
+ 
+ QTextEngine::LayoutData::~LayoutData()
+@@ -2736,6 +2738,7 @@ void QTextEngine::freeMemory()
+         layoutData->hasBidi = false;
+         layoutData->layoutState = LayoutEmpty;
+         layoutData->haveCharAttributes = false;
++        layoutData->currentMaxWidth = 0;
+         layoutData->items.clear();
+     }
+     if (specialData)
+diff --git a/src/gui/text/qtextengine_p.h b/src/gui/text/qtextengine_p.h
+index 925dafe04e2..59e332c64ae 100644
+--- a/src/gui/text/qtextengine_p.h
++++ b/src/gui/text/qtextengine_p.h
+@@ -385,6 +385,7 @@ public:
+         uint layoutState : 2;
+         uint memory_on_stack : 1;
+         uint haveCharAttributes : 1;
++        QFixed currentMaxWidth;
+         QString string;
+         bool reallocate(int totalGlyphs);
+     };
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index 9ae6bee2de3..2009dd3d0bb 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -1808,6 +1808,7 @@ void QTextLine::layout_helper(int maxGlyphs)
+     lbh.logClusters = eng->layoutData->logClustersPtr;
+     lbh.previousGlyph = 0;
+ 
++    bool manuallyWrapped = false;
+     bool hasInlineObject = false;
+     QFixed maxInlineObjectHeight = 0;
+ 
+@@ -1883,6 +1884,7 @@ void QTextLine::layout_helper(int maxGlyphs)
+                 lbh.calculateRightBearingForPreviousGlyph();
+             }
+             line += lbh.tmpData;
++            manuallyWrapped = true;
+             goto found;
+         } else if (current.analysis.flags == QScriptAnalysis::Object) {
+             lbh.whiteSpaceOrObject = true;
+@@ -1917,11 +1919,10 @@ void QTextLine::layout_helper(int maxGlyphs)
+                 addNextCluster(lbh.currentPosition, end, lbh.spaceData, lbh.glyphCount,
+                                current, lbh.logClusters, lbh.glyphs);
+             }
+-
+-            if (!lbh.manualWrap && lbh.spaceData.textWidth > line.width) {
+-                goto found;
+-            }
+         } else {
++            if (!lbh.manualWrap && lbh.spaceData.textWidth > line.width)
++                goto found;
++
+             lbh.whiteSpaceOrObject = false;
+             bool sb_or_ws = false;
+             lbh.saveCurrentGlyph();
+@@ -2104,7 +2105,12 @@ found:
+         eng->maxWidth = qMax(eng->maxWidth, line.textWidth);
+     } else {
+         eng->minWidth = qMax(eng->minWidth, lbh.minw);
+-        eng->maxWidth += line.textWidth + lbh.spaceData.textWidth;
++        eng->layoutData->currentMaxWidth += line.textWidth;
++        if (!manuallyWrapped)
++            eng->layoutData->currentMaxWidth += lbh.spaceData.textWidth;
++        eng->maxWidth = qMax(eng->maxWidth, eng->layoutData->currentMaxWidth);
++        if (manuallyWrapped)
++            eng->layoutData->currentMaxWidth = 0;
+     }
+ 
+     line.textWidth += trailingSpace;
+diff --git a/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp b/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp
+index 680c62e9825..5b14c4e1491 100644
+--- a/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp
++++ b/tests/auto/gui/text/qtextlayout/tst_qtextlayout.cpp
+@@ -2670,17 +2670,28 @@ void tst_QTextLayout::min_maximumWidth_data()
+     QTest::newRow("long string") << QStringLiteral("lmong_long_crazy_87235982735_23857239682376923876923876-fuwhfhfw-names-AAAA-deeaois2019-03-03.and.more");
+     QTest::newRow("QTBUG-106947") << QStringLiteral("text                                text");
+     QTest::newRow("spaces") << QStringLiteral("                text                text                ");
++    QTest::newRow("QTBUG-104986") << QStringLiteral("text\ntext\ntext");
++    QTest::newRow("spaces + line breaks") << QStringLiteral("       \n         text\n                \ntext       \n         ");
+ }
+ 
+ void tst_QTextLayout::min_maximumWidth()
+ {
+     QFETCH(QString, text);
++    text.replace('\n', QChar::LineSeparator);
+ 
+     QTextLayout layout(text, testFont);
+     layout.setCacheEnabled(true);
+ 
++    QTextOption opt;
++    opt.setWrapMode(QTextOption::NoWrap);
++    layout.setTextOption(opt);
++    layout.beginLayout();
++    while (layout.createLine().isValid()) { }
++    layout.endLayout();
++
++    const qreal nonWrappedMaxWidth = layout.maximumWidth();
++
+     for (int wrapMode = QTextOption::NoWrap; wrapMode <= QTextOption::WrapAtWordBoundaryOrAnywhere; ++wrapMode) {
+-        QTextOption opt;
+         opt.setWrapMode((QTextOption::WrapMode)wrapMode);
+         layout.setTextOption(opt);
+         layout.beginLayout();
+@@ -2689,6 +2700,9 @@ void tst_QTextLayout::min_maximumWidth()
+         const qreal minWidth = layout.minimumWidth();
+         const qreal maxWidth = layout.maximumWidth();
+ 
++        QCOMPARE_LE(minWidth, maxWidth);
++        QCOMPARE_LE(maxWidth, nonWrappedMaxWidth); // maxWidth for wrapped text shouldn't exceed maxWidth for the text without wrapping.
++
+         // Try the layout from slightly wider than the widest (maxWidth)
+         // and narrow it down to slighly narrower than minWidth
+         // layout.maximumWidth() should return the same regardless
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0005-Fix-specific-overflow-in-qtextlayout.patch b/package/qt6/qt6base/0005-Fix-specific-overflow-in-qtextlayout.patch
new file mode 100644
index 0000000000..44d9d382d4
--- /dev/null
+++ b/package/qt6/qt6base/0005-Fix-specific-overflow-in-qtextlayout.patch
@@ -0,0 +1,79 @@
+From 693a617236d37e12798013c75d51fd02dd1e1963 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Date: Fri, 5 May 2023 09:51:32 +0200
+Subject: [PATCH] Fix specific overflow in qtextlayout
+
+Adds qAddOverflow and qMulOverflow definitions to QFixed
+
+Fixes: QTBUG-113337
+Pick-to: 6.5 6.5.1 6.2 5.15
+Change-Id: I13579306defceaccdc0fbb1ec0e9b77c6f8d1af9
+Reviewed-by: Eirik Aavitsland <eirik.aavitsland@qt.io>
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-32763
+Upstream: https://github.com/qt/qtbase/commit/7b7a01c266b507636eab51a36328c7c72d82d93c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/gui/painting/qfixed_p.h  | 17 +++++++++++++++++
+ src/gui/text/qtextlayout.cpp |  9 ++++++---
+ 2 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/src/gui/painting/qfixed_p.h b/src/gui/painting/qfixed_p.h
+index f3718a097e5..c0a13d057f5 100644
+--- a/src/gui/painting/qfixed_p.h
++++ b/src/gui/painting/qfixed_p.h
+@@ -18,6 +18,7 @@
+ #include <QtGui/private/qtguiglobal_p.h>
+ #include "QtCore/qdebug.h"
+ #include "QtCore/qpoint.h"
++#include "QtCore/qnumeric.h"
+ #include "QtCore/qsize.h"
+ 
+ QT_BEGIN_NAMESPACE
+@@ -136,6 +137,22 @@ constexpr inline QFixed operator+(uint i, QFixed d) { return d+i; }
+ constexpr inline QFixed operator-(uint i, QFixed d) { return -(d-i); }
+ // constexpr inline QFixed operator*(qreal d, QFixed d2) { return d2*d; }
+ 
++inline bool qAddOverflow(QFixed v1, QFixed v2, QFixed *r)
++{
++    int val;
++    bool result = qAddOverflow(v1.value(), v2.value(), &val);
++    r->setValue(val);
++    return result;
++}
++
++inline bool qMulOverflow(QFixed v1, QFixed v2, QFixed *r)
++{
++    int val;
++    bool result = qMulOverflow(v1.value(), v2.value(), &val);
++    r->setValue(val);
++    return result;
++}
++
+ #ifndef QT_NO_DEBUG_STREAM
+ inline QDebug &operator<<(QDebug &dbg, QFixed f)
+ { return dbg << f.toReal(); }
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index 2009dd3d0bb..1844f777b4e 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -2105,9 +2105,12 @@ found:
+         eng->maxWidth = qMax(eng->maxWidth, line.textWidth);
+     } else {
+         eng->minWidth = qMax(eng->minWidth, lbh.minw);
+-        eng->layoutData->currentMaxWidth += line.textWidth;
+-        if (!manuallyWrapped)
+-            eng->layoutData->currentMaxWidth += lbh.spaceData.textWidth;
++        if (qAddOverflow(eng->layoutData->currentMaxWidth, line.textWidth, &eng->layoutData->currentMaxWidth))
++            eng->layoutData->currentMaxWidth = QFIXED_MAX;
++        if (!manuallyWrapped) {
++            if (qAddOverflow(eng->layoutData->currentMaxWidth, lbh.spaceData.textWidth, &eng->layoutData->currentMaxWidth))
++                eng->layoutData->currentMaxWidth = QFIXED_MAX;
++        }
+         eng->maxWidth = qMax(eng->maxWidth, eng->layoutData->currentMaxWidth);
+         if (manuallyWrapped)
+             eng->layoutData->currentMaxWidth = 0;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9143a36d9e..a14f1dd4fd 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -13,6 +13,8 @@ QT6BASE_CPE_ID_PRODUCT = qt
 QT6BASE_IGNORE_CVES += CVE-2023-33285
 # 0002-Hsts-match-header-names-case-insensitively.patch
 QT6BASE_IGNORE_CVES += CVE-2023-32762
+# 0005-Fix-specific-overflow-in-qtextlayout.patch
+QT6BASE_IGNORE_CVES += CVE-2023-32763
 
 QT6BASE_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
