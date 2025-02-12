Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52751C0219E
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 09:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEAF5811BB;
	Wed, 12 Feb 2025 09:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZzDFxko8JIB; Wed, 12 Feb 2025 09:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D747C812BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D747C812BB;
	Wed, 12 Feb 2025 09:25:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 216216C
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6DF4131F
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gw1WzLWGPWYJ for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 09:25:26 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 12 Feb 2025 09:25:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E32CF410D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32CF410D8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=131dbbb23=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E32CF410D8
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:25:25 +0000 (UTC)
X-CSE-ConnectionGUID: 8On2WiCATZeye62J/tHISQ==
X-CSE-MsgGUID: GD5+8upnQ+SF9EJ3tXWGmw==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; d="scan'208";a="268932243"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2025 02:18:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:18:03 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Feb 2025 02:18:02 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>
Date: Wed, 12 Feb 2025 09:21:18 +0000
Message-ID: <20250212092121.11699-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1739352326; x=1770888326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=inIUiUn+19bmMhLGGHeHchEsegkrOEBv8SYgDTCUr+M=;
 b=Sd72vRvCMbwOnmBPgXZh2V0XkFY85OBS2MDHHkdNsHMhGh/GxLhRCWal
 dApXPKbumecDVSk66OE+lZzJqz38qmgbS22GFO2BqoFAZMaS0kMN8DNdO
 g0XtG5o5Arg/oa7sBVoG8I7pcnCTau+nHttf7o1d82MVfR7YHcIavpYA4
 rwwa4h5EhmGu14kExWFqgrd+2aULj8VGSnJC5nyHfdC4p2OPP7vPuSR47
 IcQ1ZFcMYRaSFlHz3/h8y+98GlV3r8qN6abcSRkapcVuS4bYoK/DW0pak
 nMAtOR4CT6MqCWDaMtr3BDvE596jjIFnFQXZLIO4+ez+KXtd/fGsKM4nc
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Sd72vRvC
Subject: [Buildroot] [PATCH v3 0/3]  Fixup Update Gateware Feature
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

v2 -> v3:
- swap patch 1 and 2 ordering
- add fixes tag as appropriate
- update configs/beaglev_fire commit message to be more appropriate
- update update-gateware.sh steps in README.txt

v1 -> v2:
- used fw_upload interface to write the overlay file, i.e. remove use of
  `stat` and `dd`
- removed coreutils package

Jamie Gibbons (3):
  configs/beaglev_fire: add support for overlays and update script
  board/beagleboard/beaglev_fire: fix update gateware feature
  board/beagleboard/beaglev_fire: cleanup gatewate update

 board/beagleboard/beaglev_fire/README.txt     | 15 ++--
 board/beagleboard/beaglev_fire/boot.cmd       |  1 +
 .../usr/share/microchip/update-gateware.sh    | 71 ++++++++++++++-----
 configs/beaglev_fire_defconfig                |  1 +
 4 files changed, 59 insertions(+), 29 deletions(-)
 mode change 100644 => 100755 board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
