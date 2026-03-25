Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859FF109C02F
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 15:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DAF882265;
	Wed, 25 Mar 2026 15:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiZcR4hmdXB4; Wed, 25 Mar 2026 15:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC61811F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774451036;
	bh=uNEB5t3NUWnrEEZUiNXpW+LHXtv5NnpjDYWHNgipK5I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bn0E39WkmBg4SUbZ2LNklMmbnN28qlPU9MZ2Qe3MJGujxHD4mvwpJ/TMEAjYslZmj
	 enod94P9JCqJpogYa/JHeVfIv/a1RBqpcJYjt9BR1voGjnGSBWscz9saOUnWppQ0zW
	 vpCJV7eTa5CghHpI0G7kJVtwOUQmoS5N/qSliy74CdwTCcvjE8VrC5tXdWz1aGq2i5
	 3I3v2Tem3YWjTfaa26XE9Dtz8i+2z6Hi9QP7WODbKlpO551F13OX1dzFfcsEtqGPwv
	 XVXRc8Iy909AF6U1vXZ/UBGmc4bgCgM4ZuDwrILCkyfXE6P/tSoSypNETSeponr7I1
	 9pmho7TSOEJ7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC61811F3;
	Wed, 25 Mar 2026 15:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B571D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B759140FE8
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrptW6uAC8IJ for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 15:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D90F40D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D90F40D31
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D90F40D31
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:03:52 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, heiko@sntech.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Wed, 25 Mar 2026 16:03:46 +0100
Message-ID: <20260325150346.414826-1-heiko@sntech.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=4CR5tkBv6CVUG6g4umwnCVifllmluXMmRwuT4soPECo=; b=LG2ubJErkaDdG9A7JN8QfWBZjs
 L7RpGcVTj/Z0MoEUYUmL7rcemcF0SQDZmLyB8SxBK6ZnGaNqNweYmrnxfHS7DA5OMbLAB+UcGeK+9
 FaWeZm7m7Mkm2aTLlonW+KYbxS5BrKnCidWOKqYKrJu/PpLe6OE75lvlcl4X4Fg1l/jTt64ccyUQQ
 r2EeldpUDBGE1n2Vav+XhQLtI670kuH89y5tbt4goEBKuRfPFHKFO2Jv0EonDSEX099rUaRAblQwR
 AkRGtP+aaFyJLcfiHv6AW79DKug16Bv5HlzlKNs7+AQw92tj9ipMO908z6t2FFlIg7BuDq1pJCoXr
 XCX4L2dQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=LG2ubJEr
Subject: [Buildroot] [PATCH] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Trusted-Firmware has been using a number of CPE identifiers in the past
but especially after v2.4, the correct identifier would be similar
to cpe:2.3:o:arm:trusted_firmware-a:2.12:rc0:*:*:-:*:*:*

  https://nvd.nist.gov/products/cpe/detail/65DEC230-1CD5-40DB-903A-22537D1E44FE

Add the relevant CPE fields to the trusted-firmware package.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index b81ce0d827..6de35dca7a 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -5,6 +5,9 @@
 ################################################################################
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
+ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
+ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
 # Handle custom ATF tarballs as specified by the configuration
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
