Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F19C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 11:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4373F403E2;
	Mon, 29 Jul 2024 11:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-OTNqok2cfe; Mon, 29 Jul 2024 11:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E484041C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1E484041C;
	Mon, 29 Jul 2024 11:29:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 263B91BF573
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E19B60816
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZ12o213rzM3 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 11:29:39 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Jul 2024 11:29:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41F3360719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F3360719
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=933036aaa=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41F3360719
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 11:29:39 +0000 (UTC)
X-CSE-ConnectionGUID: v5TOBtAoSjmYpwi+5FE++g==
X-CSE-MsgGUID: avq6zeCgSBCH4epgWHPJig==
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="32604360"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jul 2024 04:22:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jul 2024 04:22:11 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jul 2024 04:22:10 -0700
To: <buildroot@buildroot.org>
Date: Mon, 29 Jul 2024 12:24:14 +0100
Message-ID: <20240729112417.806611-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1722252579; x=1753788579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IaF60HTlL8eGX59wiPGTHF0zaS+Jkl+a+e3ve/TmsK0=;
 b=aSpyk9XXd9z4j90ZMlpJ2LAwH+fJbbuaASp10ruroq+dGpuWCLoRHj58
 Mm5P3sk07T4txJqcLRJCnxzarFBC849hYXEm3z0GYPR2L3h2Cf80VpfVG
 FHVdMZTd+A+AYI2BaHMSjAZIoy7RS1I012qLs5VQPuE+KfORZ7V4YDymp
 YHqIuJUDvHVzUmIZbQaVXAV4oXw5ckqFoRzk9Sbq/EtQihmeq2itz9jfI
 acKddOcLuRKOphvNbef4qG0qO9ayex6OB33p+of1OJoko9sy34VC0khma
 Dojp1Bxos4/5CT4L8gbJcelAB54oqbLavLvAri5q3M2HrkIpLtEVTPe6g
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=aSpyk9XX
Subject: [Buildroot] [PATCH 0/3] Update assets for MPFS related boards
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following patchset updates all relative assets to the latest Microchip
Linux release. This includes updating mpfs_icicle and beaglev_fire Linux and
U-Boot configs to the most recent 2024.06 release assets. With these changes
comes an addtional bump to the kernel headers from v6.1 to v6.6 and an update
to the mpfs_icicle config to ensure package hashes are included.
Finally, the microchip-hss-payload-generator package is also updated to the
latest 2024.09 release asset.
All relative package hashes have been updated.

Thanks,
Jamie.

Jamie Gibbons (3):
  configs/microchip_mpfs_icicle: bump assets and add hashes
  configs/beaglev_fire: bump assets
  package/microchip-hss-payload-generator: bump to version 2024.06

 board/beagleboard/beaglev_fire/patches/linux/linux.hash   | 2 +-
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash   | 2 +-
 .../mpfs_icicle/patches/linux-headers/linux-headers.hash  | 1 +
 board/microchip/mpfs_icicle/patches/linux/linux.hash      | 2 ++
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash      | 2 ++
 configs/beaglev_fire_defconfig                            | 6 +++---
 configs/microchip_mpfs_icicle_defconfig                   | 8 +++++---
 .../microchip-hss-payload-generator.hash                  | 1 +
 .../microchip-hss-payload-generator.mk                    | 2 +-
 9 files changed, 17 insertions(+), 9 deletions(-)
 create mode 120000 board/microchip/mpfs_icicle/patches/linux-headers/linux-headers.hash
 create mode 100644 board/microchip/mpfs_icicle/patches/linux/linux.hash
 create mode 100644 board/microchip/mpfs_icicle/patches/uboot/uboot.hash

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
