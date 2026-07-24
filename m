Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C972C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE85540B33;
	Fri, 24 Jul 2026 16:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQPlOXnIw8rn; Fri, 24 Jul 2026 16:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D966D40B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784911739;
	bh=ocrgyT8GY3SXfciIVWbV0Xv1KwyeKsDga76DNEP5Jkk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIGTjEmKoODgaWZXK091lPUmX9EY8Dx/Rbgkd79YxVNpeVurongOo5Ooc4kwtrMZ8
	 eGh/BcD8pOJtPw2DIeLUC1fPlbLH9hrgp2xhLblpWJUq8scsNEJs3pGSb96r+66EZM
	 ntxerMeogRBiPVjQOs1CyAfdJWhIJKk54kTADvCbds7/mUt0yxAmuSh0Hb7R53Pxl1
	 3W3BQ3gsUk3c06XpK6Gzeq7pbZEjrS3M+pwQbLHkfXbgNCXnFas6Mf3BvrqENzEGKk
	 tjI8SxWHA63MlAgNGeQhf8i2w8VUb0wdl/HrorPmW0CW11zhK2HtF50mkE5O3K4CIp
	 pbTMjMeKtMPOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D966D40B8D;
	Fri, 24 Jul 2026 16:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A70429
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B792400BD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy4i0Vi7a5fy for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 16:48:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDC7840083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDC7840083
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDC7840083
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49A4FA4C412A
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 18:48:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36132)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJ4Y-000000007PN-1F8S
 for buildroot@buildroot.org; Fri, 24 Jul 2026 16:48:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 18:48:29 +0200
Message-ID: <20260724164829.304335-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724164829.304335-1-bernd@kuhls.net>
References: <20260724164829.304335-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784911710;
 bh=caowB3txnkDaOb+pfNzFErxME+hoM/aWOstccZYRxFg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=EEnZCWKf8EZ0y4F+d5qsRjsOkJfFFk5dW5t0Rqn3hzIAYLSdgDIj5POJKPFm1WI2m
 snZQPqCd4+7S7w4ZYANPPIPAa+ASmPHC1DFHLLc4hy9pCQXfQUam4n8P0PCXrxabAh
 m04DFrVblsmpdX0SVDKcqzK75T5zP169BzZd6rKKopjWAnVGTlYXtjW5czxvthcxni
 28G7mKqAtdmCPzjGrQhpbHvn+Mo9QfbhYoGdp4N+z0H8h4em/RfjbwtISxQWsqkeAx
 0A5HOaxjUEWh0XPUGhyttgkdCNEnWs3Rm7Y55/3mxYCqtypCcnTeA8ZE/JZ9b3gm8d
 OvqUj/Ls9wbDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EEnZCWKf
Subject: [Buildroot] [PATCH 3/3] package/taglib: bump version to 2.3.1
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

https://github.com/taglib/taglib/blob/v2.3.1/CHANGELOG.md
https://mail.kde.org/pipermail/taglib-devel/2026-July/003124.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/f4105c8ea013305b24f934cd070256348afd336e

 package/taglib/taglib.hash | 4 ++--
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index b118f610ec..6c47694c28 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/taglib/taglib/releases/tag/v2.3
-sha256  7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38  taglib-2.3.tar.gz
+# From https://github.com/taglib/taglib/releases/tag/v2.3.1
+sha256  a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230  taglib-2.3.1.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9a111a86c6..0a8f371371 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.3
+TAGLIB_VERSION = 2.3.1
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
