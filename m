Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA4FFD9E01
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FAF4061F;
	Thu, 26 Feb 2026 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmo41cZ6CSWW; Thu, 26 Feb 2026 19:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858B140621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772134851;
	bh=uoA/T6Xt5OdNA/eNUmw7pb3I93nWQFDN/V4BIZ/J9CM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y2Jq5pxNdfRjHDQTcQCswAHzPUWn8xZ11SuiznuPUK7ounH4RDSgjKKOaC3fJOoNo
	 DuPwSVN0tmMkZLWm5+QKaZZfmlADMCYxIE/TNAw2yKABDie/DgLKbv4ERbiMKSNGpL
	 Moch+1ZAS5QNcGlcKX9niFZcx55OZj2baNTrz+L3KihRPBdNDC14c3jY1P17fi0U5A
	 WjGOab9v0cnfDAiaKvdkyboox+XQm1K/G4ZuDQpHUU83kL30ygKwrxZrjXLPqJog7Y
	 fYiV3Hx0V3TMQ4SIG9m3I+HbcigMaqT24HhUHyqEFaONmY16Tqldo/ARuN/aVJj0Kl
	 S226y4/v64Vqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858B140621;
	Thu, 26 Feb 2026 19:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 873D423D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A52E401D5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsC-Wl_Tm8Tx for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 19:40:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 590F840085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 590F840085
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 590F840085
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:40:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9D8FA4C2C9B;
 Thu, 26 Feb 2026 20:40:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55590)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhDs-0000000063M-2s29;
 Thu, 26 Feb 2026 19:40:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu, 26 Feb 2026 20:40:29 +0100
Message-ID: <20260226194032.4110146-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772134832;
 bh=PCJ/ztasN0GPBv+0zGRG2mnw80ctWJgVf2OuWdPQAPA=;
 h=From:To:Cc:Subject:Date:From;
 b=pNtq7n+He5I/ykXRuUin4qmjMURFvnlxdLFXxWcSDTBdX7RLaE6zqu7o5kxZKgQnV
 45ycniE77Ut5UDoDURVHRmS5Oxu4KzyWZrB9yMULqo66Rkkf3BaeDyBX0AR9cQCq4b
 qHPKd4nNh0eIoELs0uzLd3xrSn7vG0x8EC7fTQHKlP4ZWNZaQBeSRm6XOy3PMTJ7dd
 6k1J9rtPPo/0uXUwxEldsll6cy9ZeyNljQQCD0b5B6M5lnB2Q9hv+akuoSQvqwCXsM
 GLJPwi4QRfb6eLKUVSinOYIDkAqGJJ18QopqLsQAHOBxjr8J9CPOsQHC0ihhixTrwC
 262ryZAlIWzFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pNtq7n+H
Subject: [Buildroot] [PATCH/next 1/3] package/spirv-{headers,
 tools}: bump to version 1.4.341.0
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

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.341.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 019145f959..2ddd887076 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c47ca6342ebe86f57b46b8dbeb266fa655a1ca8e10d07e45370ff2d9c36312e  spirv-headers-1.4.335.0.tar.gz
+sha256  cab0a654c4917e16367483296b44cdb1d614e3120c721beafcd37e3a8580486c  spirv-headers-1.4.341.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 0d0ee949bd..413f7c3586 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.335.0
+SPIRV_HEADERS_VERSION = 1.4.341.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index cba67d7d8d..37f8046545 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8b3d5637061b52675e506ffa1100740031e38bdd96b8177978acfd898a705da2  spirv-tools-1.4.335.0.tar.gz
+sha256  15bfb678138cdf9cd1480dfb952547bbb66b763a735b6d5582578572f5c2e6f9  spirv-tools-1.4.341.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index f0e76bb9ad..af3cc659f5 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.335.0
+SPIRV_TOOLS_VERSION = 1.4.341.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
