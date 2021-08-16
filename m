Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02140C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 12:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854B761BF9
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 12:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 854B761BF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA1980BE0;
	Mon, 16 Aug 2021 12:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNrFuTWnZ53g; Mon, 16 Aug 2021 12:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9A280BE6;
	Mon, 16 Aug 2021 12:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC2D1BF2F8
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 12:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8F340255
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 12:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnbnAEBScKA4 for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 12:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 722C840208
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629115470; x=1660651470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B2Ht0ApWZarhfFJ53BJZWiXA6Y2zMD50ksEcK3gn9aM=;
 b=JUDqb+bVf8VnM85Rblk/rQ2tJOYOMohXYYYlsaEv2MGpXu0fU18H97dD
 bbYtTKjWTyj55C0g8YjSfApp1tLxAk20igfAm5mQWU9Z9+j2OytkRI3qq
 ozk0SaA8z66DKh3Keb/bP1rFWopaZlm05riFWOTLlG6qHRG1cG8CT4whp
 fXcMchoMcU3iqcrE1JAFMscaSZhvBzvLBKeRqypN6W3Lh5AChKr0XZqkQ
 cSE3NBxWFJAnXI82UyP6uopquSQdZinor4T6/nJRaUsyCn0pgbTwkk6AH
 0KwZdoTKUg6TdH9EoPZLVd35xmOYdxoX/VFPCacpL7xKbCmSnPIJun2+7 w==;
IronPort-SDR: J5fzS9F0soKjfT1l+N50esrePeQ3lRtf3Q2qCG4sXUGW1GtUYRm8pVM+rd4ydVnf3yFtuTznEp
 E4qQHiui4H1iTVy9RttsMN6N6P08oTN5H01vdYKYuCxg33eUNvAs+hz+Xdi4EMPlV1sKiaV+24
 ffpo910dGeQZe3xFH/VjMLgvEaQF10bfqGPVtn7V5QWtTcfRczQLsye5ZSEDTOmhhCuvZBhMQ9
 QPVGDKcZZT0JKeGgrpJ8jjfc1IzwAl4DHsHbXATGp3rHWRMQx5ds1J6KlFCyMhDxVe4+Hwokhl
 ADpIp3ZS3RCqVdo6CyqfIYLS
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="128413609"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2021 05:04:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 Aug 2021 05:04:29 -0700
Received: from ROU-LT-M43218B.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 Aug 2021 05:04:27 -0700
To: <buildroot@buildroot.org>
Date: Mon, 16 Aug 2021 14:04:15 +0200
Message-ID: <20210816120418.427-1-ludovic.desroches@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Fix Microchip breakage related to
 at91bootstrap
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Ludovic Desroches via buildroot <buildroot@busybox.net>
Reply-To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, nicolas.ferre@microchip.com, Ludovic
 Desroches <ludovic.desroches@microchip.com>, thomas.petazzoni@bootlin.com,
 eugen.hristev@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

Here is the bump of at91bootstrap to v3.10.3 which fixes the issue about the
-nostartfiles flag to the ld command.

Ludovic Desroches (3):
  boot/at91bootstrap3: bump 3.x series to 3.10.3
  configs/acmesystems_*: bump at91bootstrap3 version
  configs/{atmel,microchip}: bump at91bootstrap3 version

 boot/at91bootstrap3/Config.in                          | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash                | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig           | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig           | 2 +-
 configs/acmesystems_aria_g25_128mb_defconfig           | 2 +-
 configs/acmesystems_aria_g25_256mb_defconfig           | 2 +-
 configs/acmesystems_arietta_g25_128mb_defconfig        | 2 +-
 configs/acmesystems_arietta_g25_256mb_defconfig        | 2 +-
 configs/at91sam9260eknf_defconfig                      | 2 +-
 configs/at91sam9g20dfc_defconfig                       | 2 +-
 configs/at91sam9g45m10ek_defconfig                     | 2 +-
 configs/at91sam9rlek_defconfig                         | 2 +-
 configs/at91sam9x5ek_defconfig                         | 2 +-
 configs/at91sam9x5ek_dev_defconfig                     | 2 +-
 configs/at91sam9x5ek_mmc_defconfig                     | 2 +-
 configs/at91sam9x5ek_mmc_dev_defconfig                 | 2 +-
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 2 +-
 configs/atmel_sama5d2_xplained_mmc_defconfig           | 2 +-
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 2 +-
 configs/atmel_sama5d3_xplained_defconfig               | 2 +-
 configs/atmel_sama5d3_xplained_dev_defconfig           | 2 +-
 configs/atmel_sama5d3_xplained_mmc_defconfig           | 2 +-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 2 +-
 configs/atmel_sama5d3xek_defconfig                     | 2 +-
 configs/atmel_sama5d4_xplained_defconfig               | 2 +-
 configs/atmel_sama5d4_xplained_dev_defconfig           | 2 +-
 configs/atmel_sama5d4_xplained_mmc_defconfig           | 2 +-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 2 +-
 configs/microchip_sam9x60ek_mmc_defconfig              | 2 +-
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 2 +-
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig     | 2 +-
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 2 +-
 32 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
