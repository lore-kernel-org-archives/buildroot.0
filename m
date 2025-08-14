Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C17CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 12:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E7D6083D;
	Thu, 14 Aug 2025 12:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aA2lt4e2LurT; Thu, 14 Aug 2025 12:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E539F60867
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E539F60867;
	Thu, 14 Aug 2025 12:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F880271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A7218405A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNYuAW-j6Kef for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 12:19:57 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Aug 2025 12:19:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85D1383E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D1383E65
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=314aab60a=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85D1383E65
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:57 +0000 (UTC)
X-CSE-ConnectionGUID: TQIC9rrWQ0uPj2LhEUDt9g==
X-CSE-MsgGUID: BfV6uxp8RpmYxcLzPltvfQ==
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="45784398"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2025 05:12:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 14 Aug 2025 05:12:33 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 14 Aug 2025 05:12:32 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>
Date: Thu, 14 Aug 2025 13:16:34 +0100
Message-ID: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1755173997; x=1786709997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=COJa/7SZNdej5+fzRA46DzB4AcmBt+VFfayjNXTUtV4=;
 b=Udq6fhP5O/LME7ztXAgEnY76Hxj4m4tWSilL6kAyRhUnDfgTf1PKvcfs
 aehxFE1KCeEk3jVyWd2mpl24vC2vDVHAc5P+I+9lZqyQrnjRZNTP9z3cZ
 zU69E+8ctrZWcDiqrQkdeeLe2+vH7iNTDWM2mJzeTQw0S3KVT/bdnVuo1
 iH2ohFCzmzk0xfPT/CfBY+8/tLcgdq3PKRd5ZQDdOl1dk5uqVO8QQ8/B2
 2U8M8YGrvDdqR5fjywtzBOoT8wIEwgLgyj0EctS3kkiCMwmVC6aDgOTS9
 cLYgNbDwoOSzH8FXYZc+6xfN3XRS/uLImzQWzBMftVos/79dYdyqKDxJh
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Udq6fhP5
Subject: [Buildroot] [PATCH 0/3] Add MPFS Icicle kit with Production Silicon
 support
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

Following Microchip's Linux 2025.07 release, this patch series updates the
relevant assets to the latest versions, this includes a Linux version bump and
addditional U-Boot drivers and functionality.

In this release support for the Icicle Kit production silicon was introduced.
With this introduction comes the need to support multiple board device trees
and so CONFIG_OF_BOARD is enabled. This series makes use of the device tree
compatible from the hart software services to essentially "detect" which board
is in use and therefore select the appropiate device tree for the board. The
series also adds a fdt production node to the .its referencing the production
Icicle Kit DTB with appropriate attributes and updates the configuration names
to match the device tree compatibles for each board configuration. The
compilation of the production silicon Icicle kit dtb is included in the Icicle
kit defconfig.

Thanks,
Jamie

Jamie Gibbons (3):
  configs/microchip_mpfs_icicle: bump Linux and U-Boot, add hashes
  board: microchip: mpfs_icicle: update to support production silicon
  configs/microchip_mpfs_icicle: add support for production silicon
    Icicle kit

 board/microchip/mpfs_icicle/mpfs_icicle.its   | 36 +++++++++++++++----
 .../mpfs_icicle/patches/linux/linux.hash      |  2 +-
 .../mpfs_icicle/patches/uboot/uboot.hash      |  2 +-
 board/microchip/mpfs_icicle/uboot-env.txt     | 21 ++++++-----
 .../mpfs_icicle/uboot-fragment-rootfs.config  |  1 +
 configs/microchip_mpfs_icicle_defconfig       |  8 ++---
 6 files changed, 48 insertions(+), 22 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
