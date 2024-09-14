Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C241C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 394844058D;
	Sat, 14 Sep 2024 13:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoNgK8keeJJy; Sat, 14 Sep 2024 13:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8AF340130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8AF340130;
	Sat, 14 Sep 2024 13:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DF361BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD0A6076D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7zpSa0-8hCw for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3159360652
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3159360652
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19DDD82B59; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:01:05 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d9b046e634f4b4390e2d36f7224b30851ee1e46c
X-Git-Newrev: a9aa11544a1358609aee8446723898c6b5f22689
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.19DDD82B59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6svg:
 backport fix for CVE-2023-32573
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9aa11544a1358609aee8446723898c6b5f22689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports an upstream patch fixing CVE-2023-32573.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Font-Initialize-used-member-remove-unused.patch | 62 ++++++++++++++++++++++
 package/qt6/qt6svg/qt6svg.mk                       |  2 +
 2 files changed, 64 insertions(+)

diff --git a/package/qt6/qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch b/package/qt6/qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch
new file mode 100644
index 0000000000..590b586f9a
--- /dev/null
+++ b/package/qt6/qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch
@@ -0,0 +1,62 @@
+From 3497a6b81f561f61ab784b2847f718e912b4d80c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Robert=20L=C3=B6hning?= <robert.loehning@qt.io>
+Date: Mon, 24 Apr 2023 15:27:17 +0200
+Subject: [PATCH] QSvgFont: Initialize used member, remove unused
+
+Credit to OSS-Fuzz
+
+[ChangeLog][QtSvg] Fixed undefined behavior from using uninitialized
+variable.
+
+Pick-to: 6.5 6.2 5.15
+Coverity-Id: 22618
+Change-Id: Id52277bb0e2845f4d342e187dbb8093e9276b70c
+Reviewed-by: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-32573
+Upstream: https://codereview.qt-project.org/gitweb?p=qt%2Fqtsvg.git;a=commit;h=ff22c3ccf8ccf813fdcfda23f7740ba73ba5ce0a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/svg/qsvgfont_p.h    | 5 ++---
+ src/svg/qsvghandler.cpp | 2 +-
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/svg/qsvgfont_p.h b/src/svg/qsvgfont_p.h
+index a7cc98b1..9cf3dfe3 100644
+--- a/src/svg/qsvgfont_p.h
++++ b/src/svg/qsvgfont_p.h
+@@ -38,6 +38,7 @@ public:
+ class Q_SVG_PRIVATE_EXPORT QSvgFont : public QSvgRefCounted
+ {
+ public:
++    static constexpr qreal DEFAULT_UNITS_PER_EM = 1000;
+     QSvgFont(qreal horizAdvX);
+ 
+     void setFamilyName(const QString &name);
+@@ -50,9 +51,7 @@ public:
+     void draw(QPainter *p, const QPointF &point, const QString &str, qreal pixelSize, Qt::Alignment alignment) const;
+ public:
+     QString m_familyName;
+-    qreal m_unitsPerEm;
+-    qreal m_ascent;
+-    qreal m_descent;
++    qreal m_unitsPerEm = DEFAULT_UNITS_PER_EM;
+     qreal m_horizAdvX;
+     QHash<QChar, QSvgGlyph> m_glyphs;
+ };
+diff --git a/src/svg/qsvghandler.cpp b/src/svg/qsvghandler.cpp
+index 29ca7332..a8918489 100644
+--- a/src/svg/qsvghandler.cpp
++++ b/src/svg/qsvghandler.cpp
+@@ -2622,7 +2622,7 @@ static bool parseFontFaceNode(QSvgStyleProperty *parent,
+ 
+     qreal unitsPerEm = toDouble(unitsPerEmStr);
+     if (!unitsPerEm)
+-        unitsPerEm = 1000;
++        unitsPerEm = QSvgFont::DEFAULT_UNITS_PER_EM;
+ 
+     if (!name.isEmpty())
+         font->setFamilyName(name);
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..4386556548 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -9,6 +9,8 @@ QT6SVG_SITE = $(QT6_SITE)
 QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
 QT6SVG_INSTALL_STAGING = YES
 QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
+# 0001-QSvgFont-Initialize-used-member-remove-unused.patch
+QT6SVG_IGNORE_CVES += CVE-2023-32573
 
 QT6SVG_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
