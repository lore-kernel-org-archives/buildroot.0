Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C770C5320E
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5DFA60B49;
	Thu, 22 Aug 2024 10:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFqIJ0vuOJm6; Thu, 22 Aug 2024 10:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF05660D93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF05660D93;
	Thu, 22 Aug 2024 10:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BF031BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED21D40DE3
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGMIe087DbBW for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4139B40DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4139B40DE5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4139B40DE5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:20:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5C4CDC000A;
 Thu, 22 Aug 2024 10:20:44 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 22 Aug 2024 12:20:28 +0200
Message-ID: <20240822102040.2083799-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
References: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724322044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZ1rHatQRt1dX1nvbUDeGE9CVJ0fwdssBb7wTzZlRNc=;
 b=FrDmNC7XqnHrtXIAeLNBT7bl2AKY4HQoF9GbfgFujchxqSfWSAdW2LgoWaNE4KVz6nk66L
 Yp5lOgO2NCsL7YuFukd7ovsjBEKudJ+xl9ZhC/GWKeiPcGWUFSxRwWHfrUua2OpjxQ1kSw
 BkdWWsM9vhes0A+YcAy/z5ey0zZjX2NLlY4GvpjMRaj9sHCfHJW9+EX4jhbnyFtNjOvEWg
 nlunxQI4L+dbsdJ2zCA9WURiHj7lfPOd0dZrzwGzl5iSp+OCt/QC5EDUOXP99XsGvhC1pl
 vM/pSyx4Z/l/ndz73e8b49ykU4aFf+6ExJTvyRK41OPuJFbR6dGXqX8tkluoIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FrDmNC7X
Subject: [Buildroot] [PATCH 2024.02.x 3/9] package/qt6/qt6base: backport fix
 for CVE-2023-32762
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

This commit backports an upstream patch that fixes CVE-2023-32762.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Only applicable to 2024.02.x, since >= 2024.05 use a Qt6 version that
already has the fix.
---
 ...atch-header-names-case-insensitively.patch | 57 +++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                |  2 +
 2 files changed, 59 insertions(+)
 create mode 100644 package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch

diff --git a/package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch b/package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch
new file mode 100644
index 0000000000..16332d7914
--- /dev/null
+++ b/package/qt6/qt6base/0002-Hsts-match-header-names-case-insensitively.patch
@@ -0,0 +1,57 @@
+From 5e8697e3aa4e92643c52d34aacfa26890e7d417d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
+Date: Fri, 5 May 2023 11:07:26 +0200
+Subject: [PATCH] Hsts: match header names case insensitively
+
+Header field names are always considered to be case-insensitive.
+
+Pick-to: 6.5 6.5.1 6.2 5.15
+Fixes: QTBUG-113392
+Change-Id: Ifb4def4bb7f2ac070416cdc76581a769f1e52b43
+Reviewed-by: Qt CI Bot <qt_ci_bot@qt-project.org>
+Reviewed-by: Edward Welbourne <edward.welbourne@qt.io>
+Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-32762
+Upstream: https://github.com/qt/qtbase/commit/1b736a815be0222f4b24289cf17575fc15707305
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/qhsts.cpp                 | 4 ++--
+ tests/auto/network/access/hsts/tst_qhsts.cpp | 6 ++++++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/network/access/qhsts.cpp b/src/network/access/qhsts.cpp
+index 39905f35480..82deede1729 100644
+--- a/src/network/access/qhsts.cpp
++++ b/src/network/access/qhsts.cpp
+@@ -327,8 +327,8 @@ quoted-pair    = "\" CHAR
+ bool QHstsHeaderParser::parse(const QList<QPair<QByteArray, QByteArray>> &headers)
+ {
+     for (const auto &h : headers) {
+-        // We use '==' since header name was already 'trimmed' for us:
+-        if (h.first == "Strict-Transport-Security") {
++        // We compare directly because header name was already 'trimmed' for us:
++        if (h.first.compare("Strict-Transport-Security", Qt::CaseInsensitive) == 0) {
+             header = h.second;
+             // RFC6797, 8.1:
+             //
+diff --git a/tests/auto/network/access/hsts/tst_qhsts.cpp b/tests/auto/network/access/hsts/tst_qhsts.cpp
+index 252f5e8f579..97a2d2889e5 100644
+--- a/tests/auto/network/access/hsts/tst_qhsts.cpp
++++ b/tests/auto/network/access/hsts/tst_qhsts.cpp
+@@ -216,6 +216,12 @@ void tst_QHsts::testSTSHeaderParser()
+     QVERIFY(parser.expirationDate() > QDateTime::currentDateTimeUtc());
+     QVERIFY(parser.includeSubDomains());
+ 
++    list.pop_back();
++    list << Header("strict-transport-security", "includeSubDomains;max-age=1000");
++    QVERIFY(parser.parse(list));
++    QVERIFY(parser.expirationDate() > QDateTime::currentDateTimeUtc());
++    QVERIFY(parser.includeSubDomains());
++
+     list.pop_back();
+     // Invalid (includeSubDomains twice):
+     list << Header("Strict-Transport-Security", "max-age = 1000 ; includeSubDomains;includeSubDomains");
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a38edcf8ac..9143a36d9e 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -11,6 +11,8 @@ QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
 # 0001-QDnsLookup-Unix-make-sure-we-don-t-overflow-the-buff.patch
 QT6BASE_IGNORE_CVES += CVE-2023-33285
+# 0002-Hsts-match-header-names-case-insensitively.patch
+QT6BASE_IGNORE_CVES += CVE-2023-32762
 
 QT6BASE_CMAKE_BACKEND = ninja
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
