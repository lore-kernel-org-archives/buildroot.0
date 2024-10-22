Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E7D1CDD5
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21CF80ABF;
	Tue, 22 Oct 2024 10:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Mn2yYgsm1yX; Tue, 22 Oct 2024 10:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0ED80B3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0ED80B3B;
	Tue, 22 Oct 2024 10:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD93271F
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7806B40287
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlZ_eJm7V3Hq for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 10:29:27 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Oct 2024 10:29:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B09C400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B09C400DD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=018f217b1=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B09C400DD
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:27 +0000 (UTC)
X-CSE-ConnectionGUID: c+qRROuNRZ2d3z6tLWfXNg==
X-CSE-MsgGUID: pQH3CMZMTi60kwp9bjh54A==
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="200750575"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2024 03:22:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 22 Oct 2024 03:21:50 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 22 Oct 2024 03:21:49 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>, Jamie Gibbons
 <jamie.gibbons@microchip.com>
Date: Tue, 22 Oct 2024 11:24:23 +0100
Message-ID: <20241022102426.220196-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1729592967; x=1761128967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RoTtqD6Tf1fgHY9mgdtMboxdAJ5pKhkClub2dy0b6h4=;
 b=lo4mLaxpiCUrEryfVGcCDAOM6An1jYqWKc9/C3F39dDYAbeoTFePeYXn
 63cBi3PTZZKqOSnTFLiSp/UqKYm+JCwaW4ZKyKWr7aSE8nO/pPvCzGHkB
 ytjPLzwj8QxnM3f+YKljIzA84uN1g2MjegvUw+P5g2iBKdcMR9X7Bl4N0
 S5jENNOAH4GdseD7SRoVhOm+iKVBcOLnquWA11zYxiwcyggl08Vbz2w30
 RsxRKRMAXh2VUOolMY5ZL5PdFhbhLcvY8hmP/aiZJbeOVXIzGwRFOgQwS
 g9dsWEvfYck2sfAAIl9Xn3Mix7M4htob44oBbgrZ+D41+888QKfFrvcSs
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=lo4mLaxp
Subject: [Buildroot] [PATCH 0/3] Fixup Update Gateware Feature
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

Jamie Gibbons (3):
  board/beagleboard/beaglev_fire: fix update gateware feature
  configs/beaglev_fire: add support for overlays and update script
  board/beagleboard/beaglev_fire: cleanup gatewate update

 board/beagleboard/beaglev_fire/README.txt     | 13 +---
 board/beagleboard/beaglev_fire/boot.cmd       |  1 +
 .../usr/share/microchip/update-gateware.sh    | 65 +++++++++++++------
 configs/beaglev_fire_defconfig                |  3 +
 4 files changed, 53 insertions(+), 29 deletions(-)
 mode change 100644 => 100755 board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
