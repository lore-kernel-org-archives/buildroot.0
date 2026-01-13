Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A29D0C85A
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 11:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23CBB6F59A;
	Tue, 13 Jan 2026 11:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FStGUQ7p2ObW; Tue, 13 Jan 2026 11:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8276F598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768303751;
	bh=YaMl3lGPYv0RJB1M5orA2HRExwf+7fRS6GGob4muHLI=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=U90lGyQdnnfLFFTthGlVAbl1w9iq6lqBnwpv6ASkZwGvAGMvpZmhaglEowT85FjgK
	 doPB/k2zu4b/Ej1335sqJPDZbhIRNo1s+H/1pMjYBrDxotWcUNOJfR/8b7S65VtHHX
	 xuCzc57F5WlAGPp6FAcz7TWiQLg1A6OYrFIJ2oPFllwAgJayi915AN7IxbH7LpV3s9
	 765YIEB+kM+G373trilFT7SdOKry7Xm0u6vU8EinvIhfdt7iS8nKwRc8r0ZgnPZBIS
	 IpmNLipV4I9fr/ahFVhrdnHPRKr3E58P67+0XiZHjpWyHJJlM1ES7HnBuG6rKi5RvP
	 fQpS2T3we2p1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8276F598;
	Tue, 13 Jan 2026 11:29:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0BEE231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69286F599
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rv6D8zzYM3gT for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 11:29:09 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 Jan 2026 11:29:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB2C86F596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB2C86F596
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=4667d680c=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB2C86F596
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:08 +0000 (UTC)
X-CSE-ConnectionGUID: fkj/fYnYQMC1ZBpFewgdGg==
X-CSE-MsgGUID: ECW59JU1RYetOdDBPWsEDQ==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="51784104"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:22:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 04:21:31 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 04:21:30 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Tue, 13 Jan 2026 11:26:16 +0000
Message-ID: <20260113112621.347651-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768303748; x=1799839748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OIstnoeCO5G4omz4YR8yZnxeiFK8WvzNn9/tHpVQKeU=;
 b=WfuLRO/iPoY4mSz3ksAgEiJ2bUq3Njlq6+mPaRtl8zQ+t+ysHM2i55Sr
 EVFy9/9zZ99Vih/TwKKxVu+cBYzNtUhKOKLZJAYg7pc43wg6k/JE6K/wX
 aVIhLOe235dcnCk/XCdaaL4m8VcRb+a1AQt45bqUc3PViRiwKWN3jrqkM
 VVqznJUu+9Ix5+zUwJVH8WsyAdPgJ9zBn5RSxRYlZQtvoCf/GbbfkUcbT
 bNhFH9lWkYC1WPeQhvibE2Uc6kr80JDW0DUbp5c6qEPln+hlLW1NFHPF9
 WhjYqJmrtO/jX+I2qNrG1QEUws7n2j1tR8CnHDeQSGuZD072aKo7FQiOB
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=WfuLRO/i
Subject: [Buildroot] [PATCH 0/5] Bump MPFS Components
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following series bumps U-Boot and Linux components for the BeagleV Fire and
Microchip's MPFS Icicle kit, maintaining their relevant hash files. The series
also includes a one line removal from the BeagleV Fire U-Boot boot script to
remove a redundant command. For more information on these changes please see
individual patches, however these are all straight forward changes.

Thanks,
Jamie

Jamie Gibbons (5):
  configs/microchip_mpfs_icicle: Bump U-Boot
  configs/microchip_mpfs_icicle: Bump Linux
  configs/beaglev_fire: Bump U-Boot
  configs/beaglev_fire: Bump Linux
  beaglev_fire: remove fdt set from boot script

 board/beagleboard/beaglev_fire/boot.cmd                 | 1 -
 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 board/microchip/mpfs_icicle/patches/linux/linux.hash    | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash    | 2 +-
 configs/beaglev_fire_defconfig                          | 6 +++---
 configs/microchip_mpfs_icicle_defconfig                 | 4 ++--
 7 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
