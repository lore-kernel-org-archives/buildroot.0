Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5283D3B7D1
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA214047F;
	Sat,  6 Dec 2025 09:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 383ABMvaf_1c; Sat,  6 Dec 2025 09:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C4740482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765014684;
	bh=DyfiFpF52G17rNBVjrKJohdm7MpDg6HSZSlwE1/W9ek=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lsj8x5f8hHjGC5CSKpssYAfp6Fu3zH2XdPfA+Xqhb/zfOSaYhNI/Lnw25dczViKQP
	 JAx3vjtyOKiD0ePyQwKc7zYgudrm4fSzcjYn6howmR/u1Ouo1tg9M9eEo7R0zgYn+L
	 5ipSXbdGYW+QCqdHebRxj68kwliRwe2bfe/FHFKiLu54EW7UqjRWPprISa57u/ThMO
	 u68d3dDhPshJtFfoHxfMc3ivJo6TJ1AvTosnO2xnrIvryZSzICvrw6tFLTiWXubaQX
	 Yv/hUKqPYnpUmr6IyAZRG1XdfNs3oBwHUF6myPiDa42fe4LCSkPQLA+Eawimr2uIiz
	 FWdVTwqFplkmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C4740482;
	Sat,  6 Dec 2025 09:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E2D151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D92E607F3
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZIrDfnT4UaX for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 09:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD0D060715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD0D060715
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD0D060715
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 09:51:20 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Rowfvs7pOlGpsRowgvIX0V; Sat, 06 Dec 2025 10:51:18 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat,  6 Dec 2025 10:51:16 +0100
Message-ID: <20251206095116.2090087-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfB5W6YI29JMH4KF5dLkPJRC+XmhB2nGwVinOnGMxvNewhQ2BCRzwydUUIeNhRigKt2ZPW7JRvZ7DnaWKfnxIE6jVW++In9I+r4cyL2St4sGxXgG+Wak0
 Fful65iCvOxeZtwNtfanDNvFgRRwa06WVxOlBgI+JRl3RuWzY4UVdoSk9AIWs7yPbWUbuJdzvTRYjUU85p/8fehWxYdcLjD+Ie/BbAhXzaCt/c3zZyasGR0A
 7cfVGlIuqDwsRoMIx2xEhYQZt1Eq7I4GCnlfjCSP1oEWrJ9SqaVcVVqyrseIsmuKCO0NA7TcIZ+bkUqhLj1gig==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765014678; bh=+f8JeviLU8mJvrY59JV+sFWlnRm6IMOrJmvsP0SC0ko=;
 h=From:To:Subject:Date:MIME-Version;
 b=aEO9Ns0fhQfcWrWLkv7sTrzuQRpgEa1avR3Aa7HAGEAXoNHD4ipa6SgEyii8NgiiC
 gGaHyb2ZV3zuzhKLWDRVOks+9j+rRP53qrtSNUuFOpHTBf4qgOlfXXznNA3olcT26j
 LGTeluYrPqysCkblPfyWxVPHppwT/KEbGNfFLtTooV7D71qm7zdLqDAY1gXwa6SMIZ
 amFhY3lR8SjP0stFx4m6eWQnrAyRggQGSpRGrSWeEkb2HsiTwXXrP8l4AhrmVqf2Y8
 qHgPvsIWFGQRkpafKCI4kwSxF3qv2P7nWXatS9rdj4J6Q/YjUlvJdW1SHlx/Axq8p2
 3nyIdapA3meVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aEO9Ns0f
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.119
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119.rst

NOTE: libnss 3.119 require libnspr 4.38.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index cf339697ea..1b15364a93 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
-sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
+sha256  e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9  nss-3.119.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9b85e86ac6..0ac34321d8 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.117
+LIBNSS_VERSION = 3.119
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
