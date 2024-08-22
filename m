Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F3CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C223C60B5D;
	Thu, 22 Aug 2024 10:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXNUi66gPBVF; Thu, 22 Aug 2024 10:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD59460B4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD59460B4C;
	Thu, 22 Aug 2024 10:20:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1C191BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F06440DE6
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFmgAAaQIsCj for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F34B740DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34B740DE3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F34B740DE3
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:20:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 92C80C0006;
 Thu, 22 Aug 2024 10:20:42 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 22 Aug 2024 12:20:26 +0200
Message-ID: <20240822102040.2083799-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
References: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724322043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukVmsF/nIosv/R7jWm/e9QpNUdwVXBBrdC2iN2ZAOIU=;
 b=Vs/5sJiagDBNm8utyvFr1z1NO2RsmUfs5yjHMm4p1Npi/J88L6GF9Kk3cKAWa5PKfKpPFb
 TGTYznLVbWRK+rXZ+WWlVWK2oi76sUZHfw0TT2OFazpMk8lqiUJbW/kqYzS9fFZKNUGmZM
 +2L/iINFV6fuXAG6en/nh9gRLagFQyd+jmUpTMOf4IjqId9bsP4YnA+DsI8gCBZ8gsg55s
 +jc9Z3AgzZ0385I+FkJYFE7Y7xnMcYn6ULRqjtbL4EIPaB9bQf2GFAlZjLi8stqbf112Sn
 vQ6O08h6JRXvxaTvuvxIwDIAxtazpJzmtbQyA1rIan4+HZ34SSZ1pihz+z71zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vs/5sJia
Subject: [Buildroot] [PATCH 2024.02.x 1/9] package/qt6/qt6svg: backport fix
 for CVE-2023-32573
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports an upstream patch fixing CVE-2023-32573.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Only applicable to 2024.02.x, since >= 2024.05 use a Qt6 version that
already has the fix.
---
 ...Initialize-used-member-remove-unused.patch | 62 +++++++++++++++++++
 package/qt6/qt6svg/qt6svg.mk                  |  2 +
 2 files changed, 64 insertions(+)
 create mode 100644 package/qt6/qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch

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
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
