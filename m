Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CFDC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 09:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0A8849AC;
	Tue, 21 Jan 2025 09:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SB7F6pchFar; Tue, 21 Jan 2025 09:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE11849AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE11849AD;
	Tue, 21 Jan 2025 09:09:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1856369
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB04F40B9B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0QyZOCoyAcZ for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 09:09:48 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 21 Jan 2025 09:09:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93B42409EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B42409EC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=1098f6abb=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93B42409EC
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:47 +0000 (UTC)
X-CSE-ConnectionGUID: EKfiuyhISJSGu431ctdL0A==
X-CSE-MsgGUID: B06O8Sp7TpurpgBLxxc5zw==
X-IronPort-AV: E=Sophos;i="6.13,221,1732604400"; d="scan'208";a="204253191"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jan 2025 02:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 21 Jan 2025 02:02:07 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 21 Jan 2025 02:02:06 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>
Date: Tue, 21 Jan 2025 09:05:10 +0000
Message-ID: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1737450587; x=1768986587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/BPPiO3OaygVMrDQyqbuB1+XXVfF2ZGIUJGQzqoxZWo=;
 b=bp0/YZ1hrfutYGSeFIVrAWWKVZcMShAyagPZFBqsufXLv3Dwt84MPzKS
 GMnEZ5WnIVpm0wMi9B+tGfx+gmL/b5rEq1MQORqMyMeaVmyiE9CBQNCMz
 bvgwGX3+vnbFRCKMh8cltvaCSIWAKX1KgsXqrqmBqtaj9cXSC9LGlVDpH
 NqsBjmQ+cr693PFyQ2l7qqUNLbcZKul9mZe9bsmXtjfberbL0UTa/oJxt
 a7LG/xJRgfLjQ3X2AV+v0YLFglM1q4BQ6EIgU1j8sBkF7NP6TuWBvtXIh
 Wrwwek2aCHSYjA9jMNomTrt8YWqlzH0+qyYqwJ13Vr8kaegQ95jn/pXw7
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=bp0/YZ1h
Subject: [Buildroot] [PATCH v2 0/3] Fixup Update Gateware Feature
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

The following patchset fixes the gateware update feature following the
addition of the firmware upload API in linux v6.6. Using debugfs for firmware
updating has now been removed. The update-gateware script now makes use of the
firmware upload API with sysfs and enables applying overlays during boot.
The README steps for updating the firmware have also been optimised, making it
easier for the user.
Three configs have been added:
	1. When applying overlays at boot time all dtbs need to be compiled with
	the `-@` flag.
	2. The updated update-gateware script uses `stat` on the target to get the
	size of firmware files - add coreutils and it's dependency
	(busybox_show_others) for this.

Thanks,
Jamie.

v1 -> v2:
- used fw_upload interface to write the overlay file, i.e. remove use of
  `stat` and `dd`
- removed coreutils package

Jamie Gibbons (3):
  board/beagleboard/beaglev_fire: fix update gateware feature
  configs/beaglev_fire: add support for overlays and update script
  board/beagleboard/beaglev_fire: cleanup gatewate update

 board/beagleboard/beaglev_fire/README.txt     | 13 +---
 board/beagleboard/beaglev_fire/boot.cmd       |  1 +
 .../usr/share/microchip/update-gateware.sh    | 71 ++++++++++++++-----
 configs/beaglev_fire_defconfig                |  1 +
 4 files changed, 58 insertions(+), 28 deletions(-)
 mode change 100644 => 100755 board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
