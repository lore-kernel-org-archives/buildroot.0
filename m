Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD0E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5EDD40838;
	Tue, 31 Dec 2024 10:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkCO3pB66ion; Tue, 31 Dec 2024 10:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8729D40843
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8729D40843;
	Tue, 31 Dec 2024 10:55:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50044968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3175E813F1
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U29e-LCIaRVp for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 10:55:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C0718137A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0718137A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C0718137A
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:55:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E661AE0009;
 Tue, 31 Dec 2024 10:55:36 +0000 (UTC)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Buildroot List <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 31 Dec 2024 11:55:35 +0100
Message-ID: <20241231105535.1685869-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735642537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hV6q7v0lpsVtyDI2rv9e9NlFJGUHYo5sG59KYyAsuxg=;
 b=VTuFcv1Bz6HWDqvpEdlxEMDyKRuJrosnGDBEZ7UOK/dYFcJoTXYWqW2KTIX9wbR9R+WLoF
 FFcgv1ZKprH4MDk0OyGeIPhNhd/PLZfJEyBmNsZAOfKx9aJnZZaaRr8995dp5iG7L1M4Q1
 D5aA9Hi1WVBmSbkfcqOKwvbr4NYEjteahKMGG3B2SQbf7hVaSMlGxhEqgX57eOvvKiQlvE
 aB2gR9u5AG/nVAHAtwTsYm/FcNmvg++HLHKBrWoNtKMKgHTisWAWfIN3SdCODXzgdohBpa
 dCNr7eb2Hn/Xsrr4kCIQeFvbztwv7d5bb20NKrndIspJdLbcSuO3+ZypOK0kpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VTuFcv1B
Subject: [Buildroot] [2024.02.x] package/qt6base: properly ignore
 CVE-2023-32573
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
a9aa11544a1358609aee8446723898c6b5f22689 ("package/qt6/qt6svg:
backport fix for CVE-2023-32573"), a fix for security issue
CVE-2023-32573 was added to qt6svg, with the appropriate
QT6SVG_IGNORE_CVES entry.

However, all CVEs against Qt are reported by the NVD on the qt:qt
vendor/product CPE. For example:

  https://nvd.nist.gov/vuln/detail/CVE-2023-32573

Therefore, the QT6SVG_IGNORE_CVES entry added has no effect, and
CVE-2023-32573 continues to be reported against our qt6base package.

The only reasonable option is to collect all such CVE ignore entries
for Qt modules into the qt6base package, which is the one that matches
with the qt:qt CPE identifier. This commit does just that, with an
hopefully appropriate comment in qt6base.mk that explains what's going
on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 package/qt6/qt6svg/qt6svg.mk   | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index ab6764cbbe..3d45079747 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -27,6 +27,14 @@ QT6BASE_IGNORE_CVES += CVE-2023-34410
 # 0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch
 QT6BASE_IGNORE_CVES += CVE-2024-39936
 
+# All Qt CVEs are reported by NVD against the qt:qt vendor/product
+# CPE, so from a Buildroot perspective, they will all show up reported
+# on qt6base. The ignore CVE entries below are for other Qt modules,
+# but they need to be listed here to be properly accounted for.
+
+# qt6svg/0001-QSvgFont-Initialize-used-member-remove-unused.patch
+QT6BASE_IGNORE_CVES += CVE-2023-32573
+
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 4386556548..25e87dd208 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -9,8 +9,6 @@ QT6SVG_SITE = $(QT6_SITE)
 QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
 QT6SVG_INSTALL_STAGING = YES
 QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
-# 0001-QSvgFont-Initialize-used-member-remove-unused.patch
-QT6SVG_IGNORE_CVES += CVE-2023-32573
 
 QT6SVG_CMAKE_BACKEND = ninja
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
