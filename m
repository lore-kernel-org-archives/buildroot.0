Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E864C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 14:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB72E409CC;
	Fri, 11 Feb 2022 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0z7nM1jejWVT; Fri, 11 Feb 2022 14:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB77A4037E;
	Fri, 11 Feb 2022 14:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3469B1BF255
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 14:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C87060761
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 14:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CQPPeFHYudW for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 14:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 728CC60644
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644588541; x=1676124541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lu3v18Ln+7CEsFk8eCGM6NIVtnI2d2nx0//cMWyzB1g=;
 b=Fg7GrFxL8VqQitwhgIJCT4h00hLtjvFydf2EeOonUM2LAF4u41zV2PPw
 EnwHxSIWFLBAdIaZEFd1oGKGhDRqtKSMwnibQS5p8PubfOcYnTG4kKzob
 taEr1J4A5VQRqSN4KQ/hZrO+z4V+jUXS+dMwuIZAI/Qq2BvDH1BHcMs6l
 v7jAVlj3M48MmMFjyFN61ntLhxx29dR9JMqalh4JKB4fox6fMDED2wMlR
 bQMlfyUnNVW5LmFmJ/J9zv+3DOILwlC7DjnT7tiGy42BE/nUUaIXC57Bf
 EVe5fUeaVGExB0Ol8FuWoQ2rAToymUjGf4Migwzufd/soNge3g6oxwWCn Q==;
IronPort-SDR: TBM+ra2nkDUxJVGChq5eemsumEKalLQdXs9AI6iPEPTFkTR+Xgrt+wjADzhLkgdQ5dIl2qXi2F
 0IRgwHY4B9zQTYVc6zSWRQM+Y4CiAVadotS3GIy6dXpy87T5fvHRwpfikFuQhq518uW/h+7flK
 SRM4Jf9Rt+4k5reyrDhYhI6b479kM7AZCBc/1dzAGIeqIzcism6zN3VXkhCHBU/ma1D6HR0/88
 417/K+eHsLqpjEAq9LuWqO+CaBSSoliD5aoCJzknJUXZW9uvg7Piz1zOMFFC3B0KGM+dQ1CM62
 7wbAtLPQH0LRokbM1krsjG9b
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="145670454"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Feb 2022 07:09:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Feb 2022 07:09:01 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Feb 2022 07:08:59 -0700
To: <buildroot@buildroot.org>
Date: Fri, 11 Feb 2022 16:08:55 +0200
Message-ID: <20220211140855.917229-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/microchip_sama7g5ek_mmc_dev_defconfig:
 add rng tools
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
From: Eugen Hristev via buildroot <buildroot@buildroot.org>
Reply-To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add rng tools. Without this, when booting, prompt will not
appear until 'random: crng init done' appears.
Avoid this by using rng tools without the libjitterentropy.
Libjitterentropy is a jitter source of entropy which does
not help for AT91 cpus as the jitter does not have
enough variance to generate fast enough entropy.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Hi,

This should go for 2022.02 in my opinion.

Thanks,

 configs/microchip_sama7g5ek_mmc_dev_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index 3253bce401..895e63edcd 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -27,6 +27,8 @@ BR2_PACKAGE_MMC_UTILS=y
 BR2_PACKAGE_MTD=y
 BR2_PACKAGE_WILC1000_FIRMWARE=y
 BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_RNG_TOOLS=y
+# BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
 BR2_PACKAGE_SETSERIAL=y
 BR2_PACKAGE_SPI_TOOLS=y
 BR2_PACKAGE_USBUTILS=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
