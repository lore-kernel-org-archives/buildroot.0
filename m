Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2702ACDE00B
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E114E60ABC;
	Thu, 25 Jun 2026 15:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HHsoReOO22C; Thu, 25 Jun 2026 15:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F57B6103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782402920;
	bh=zsd8rKa5yOFF81Ygkn99ee6TCY+0t+2YgytnH6XK/2A=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=THbqSw+ar6hmlZLyuaGuY2OWJDnAt3kO7DOSNoVy3QGcBDUgBeR2IJB9suJh7N7DQ
	 NECLqIEttiqVSDaRPmBCmVv9eTXRvSKv3TCJ/vPtbgTIkgdqJbJgFucMT08igAMj4l
	 fssXvsyzkeACbudA4P3UVS8JavoUl5Kj2xRYTOmZuqbmALbD3ntLga4SPwEWWK4ky3
	 w/l3uR9BThm63CXbhFVc13HB6bElej3F7zzjAfMrfJUo49ZBUMk+GQmEmJEgzeV7e4
	 5B2UnrVccHmaEFsJno9X4zmaH8FaIGkfoTo0s2zojLz9VG6h7WjBV7gsp8w9NsF7Zc
	 Fg8qPO/I/UOZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F57B6103D;
	Thu, 25 Jun 2026 15:55:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5D018F
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF3F982803
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSq15usvOJ0i for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:55:18 +0000 (UTC)
X-Greylist: delayed 1036 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Jun 2026 15:55:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B44AA821C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44AA821C3
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:1600:19:5550::42ac; helo=smtp-42ac.mail.infomaniak.ch;
 envelope-from=foss+buildroot@0leil.net; receiver=<UNKNOWN> 
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch
 [IPv6:2001:1600:19:5550::42ac])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44AA821C3
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:55:17 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmNHC3cfzz3FX;
 Thu, 25 Jun 2026 17:37:59 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gmNHB664KzSy7; Thu, 25 Jun 2026 17:37:58 +0200 (CEST)
Date: Thu, 25 Jun 2026 17:37:44 +0200
MIME-Version: 1.0
Message-Id: <20260625-tf-cpe-update-v1-1-b315a596d23b@cherry.de>
References: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
In-Reply-To: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1782401879;
 bh=gdHgeB8d8orobmdaXNaWAJBgOgj3wxMyXWKgdKjcnnY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fiIPS52Oh7NBvXKjAa56bS4LYPqiCEACVdWekR1zw38bqeA8z0xWhEOQy9QOUWPx8
 Z6pMmuk7ZCCt0EooMZQNk3IzWQufqBJWPvTxSvj0X3+ozL9p6RWj8AX6a4R2zpkvxf
 7RspM0IJV+8JTgvshaI3zOklyeD4xZBAz9SSdDTQCvpnJUTSf3zzXhpnbtAwztzQFr
 vdQ5e1TZ729PQRiuzg49BXJVTILff6oo4tSqIDV16DXStQe1TwVEdBQR2dtn0tYwGW
 AZ+ftUh/COtfDgwlQVD92oPb0nlYGqYb5R24SqmdFs7Qzit9bUqLP1/Q8UpUaNdEHY
 dG+j5oerW1qWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=fiIPS52O
Subject: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: fix CPE
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

A new (and hopefully definitive) CPE is to be used for TF-A:

cpe:2.3:o:trustedfirmware:trusted_firmware-a:

as reported in TF-A directly[1]. NVD correctly reports[2] the new CPE
deprecates the "old" one Buildroot was using.

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware".

[1] https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/efd7b189fa259c349699957462c7b52bf640e27b%5E%21/
[2] https://nvd.nist.gov/products/cpe/detail/2E1BD3E8-DF65-42E3-A0BA-747137D6DEF2
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1b52f36783..798efd5a15 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -6,7 +6,7 @@
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
 ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
-ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
+ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = trustedfirmware
 ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
 ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(patsubst v%,%,$(patsubst lts-%,%,$(ARM_TRUSTED_FIRMWARE_VERSION)))
 

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
