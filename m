Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A17C44503
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 11:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192138455C;
	Wed, 21 Jan 2026 11:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NPqa4zIuA35; Wed, 21 Jan 2026 11:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2252184541
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768993352;
	bh=b7/foqgD5Pu355XR5+gOm7YScHfFIAnpOm2kB+BLfps=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCEZ7itNRCbpMtkG+d7Xkoth1K9z5xv3ITpKubyRqKoaIsIRg5cnFxDaZcrLVX6K4
	 eivQXCmXw3Q0ErUG6qE8eTKpoANEYm55suol1qcCXIBbb9GwTnJIqmPHzRPRtytDZV
	 AxJ24yjX/fpF/LR2Wi4fap+qXKOUrvKkmHy68B8UWhtMFR3XRok02hVaEVW4xcydeO
	 wlXdjvSykYwmwhWchgo/CeiEluocw01wspMOrQc8j9Yj/9S1PQPaKJ7+UVHAP0BrhO
	 vpZ9U8nub5aB4ajns/aj6sUPlcWAE7ktAOnlRu+NC1Ph3ShuRolTl08L0cA0XXldpZ
	 Lb/f2xJMZPqOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2252184541;
	Wed, 21 Jan 2026 11:02:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30EC7169
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D5E41B31
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4zm4iWYZtqw for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 11:02:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F354441B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F354441B33
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F354441B33
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1134044805; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Jan 2026 11:02:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1viVyX-0000000E4up-3Y6N;
 Wed, 21 Jan 2026 12:02:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 12:02:02 +0100
Message-ID: <20260121110208.3355429-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121110208.3355429-1-peter@korsgaard.com>
References: <20260121110208.3355429-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VVa9jnY3CO3XEwkf5FNlfRs1Eu8EpNZaD8WMljI2FhhTocMsC97eAx/S0OIgKVOcnoZWoduyCDez7g681JKOdimTKE2S6GSLSqyZSxcgVd9t8WiPoe5hi4z4PGW/LGVP1eCsHSm4x2RtabFH+uWO/YLFuSVbn59+cF8o0MQXXvtjnLLbBPqom2O6ImxZ5jwZQzTBdKzaRVBNIfRsmOGYy0pMtmIPVLCiy4gzvk6QLYm93ubY24JsJoHMmDnkKp1OYSzygdkbt+KZ/vCd0MJ8r+rS9jhS2naHSJJxN3N0OgrhQHGKaoZSMD+jhrpsN2UcmBmVLl+UGOmmoEZ4WE6u0g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YYLssj8+OfK9AeDfrirFrJSYAXyPjV1YnM9D1f8tu6o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=VVa9jnY3
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/4] boot/uboot: fix 'bootloader' typo
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

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 22a5c35821..29f3f40b1b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -685,7 +685,7 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 	string "Custom psu_init_gpl file"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	help
-	  On ZynqMP the booloader is responsible for some basic
+	  On ZynqMP the bootloader is responsible for some basic
 	  initializations, such as enabling peripherals and
 	  configuring pinmuxes. The psu_init_gpl.c file (and,
 	  optionally, psu_init_gpl.h) contains the code for such
@@ -722,7 +722,7 @@ config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on BR2_TARGET_UBOOT_ZYNQ
 	help
-	  On Zynq the booloader is responsible for some basic
+	  On Zynq the bootloader is responsible for some basic
 	  initializations, such as enabling peripherals and
 	  configuring pinmuxes. The ps7_init_gpl.c file (and,
 	  optionally, ps7_init_gpl.h) contains the code for such
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
