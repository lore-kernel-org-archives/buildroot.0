Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C566D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36DAE81281;
	Sat, 26 Oct 2024 21:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sP6vQHki2fA; Sat, 26 Oct 2024 21:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC218128A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC218128A;
	Sat, 26 Oct 2024 21:05:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D263C5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B324A4018B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7_TXFZCRymM for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64F4040003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F4040003
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64F4040003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:05:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A14BFA4C0C85
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:05:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60178)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nyh-000000005XK-3zK2
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:05:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:05:44 +0200
Message-Id: <20241026210544.2668585-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976744;
 bh=FLnJPrfmb47vFzJHS/kFC44EBLfb7pLQcafPx7ECZ6U=;
 h=From:To:Subject:Date:From;
 b=GYXCGNaXPnRpYpNNGVrMOW283UKQdnbycII5v1v0BViFoCGaY8FL9xGszI1vyfw9q
 JKNDB0DGyw/kctc6cNU/nBxtXn1jyRqW2HIQpQbo12Ie8VFLSKe7Gf3XXDW3m11999
 JBZzevo+6rCe+y66qURG6c7gb4agtQEKVHAFJw2lijPCvBm03rerrdojBUi1cI8fol
 HPNRh4oAeW28hWSOiRPlG1YN2vPnHGSUT/CxbiI7VDLntNSva9EA4bqX218rJtgBUQ
 dWt6SSFlQhUSRzcQEyCUX1MWBkHP55fy1537Za/BkeuK1K8evDR2eazPg3LJg8Fd7i
 g1yiWGWlBcXeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=GYXCGNaX
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump version
 to 3.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/openssl/openssl/blob/openssl-3.4.0/NEWS.md#openssl-34

Fixes CVE-2024-6119:
https://openssl-library.org/news/vulnerabilities/index.html
https://github.com/openssl/openssl/commit/c47d9d7ec81bbab339d102bded809a558d0ebe6a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 52fce1eb3a..dad30da34e 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.3.2/openssl-3.3.2.tar.gz.sha256
-sha256  2e8a40b01979afe8be0bbfb3de5dc1c6709fedb46d6c89c10da114ab5fc3d281  openssl-3.3.2.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.4.0/openssl-3.4.0.tar.gz.sha256
+sha256  e15dda82fe2fe8139dc2ac21a36d4ca01d5313c75f99f46c4e8a27709b7294bf  openssl-3.4.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a90e599c17..6a59cb2ff0 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.3.2
+LIBOPENSSL_VERSION = 3.4.0
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
