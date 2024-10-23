Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9500FCF538B
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 13:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4225F804F5;
	Wed, 23 Oct 2024 13:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSWjF5lcfxMP; Wed, 23 Oct 2024 13:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D62804F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D62804F7;
	Wed, 23 Oct 2024 13:58:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75A0E2072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5663F401F6
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBDaEWM3BZXK for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 13:58:09 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 23 Oct 2024 13:58:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67363403D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67363403D9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=0198f1d49=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67363403D9
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:58:09 +0000 (UTC)
X-CSE-ConnectionGUID: ZKzdCnC1TN+oEpNPERH0Ig==
X-CSE-MsgGUID: axTiWVjbRyCZEJyGETlT/Q==
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="33389728"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2024 06:51:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 06:50:42 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 06:50:41 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>, Jamie Gibbons
 <jamie.gibbons@microchip.com>
Date: Wed, 23 Oct 2024 14:53:16 +0100
Message-ID: <20241023135317.2356119-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1729691889; x=1761227889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rWH4XUq5wdGR8fGDGrEzRV/r353ykwwMq63Y0IEIIbQ=;
 b=MjXu1639hQzm3urf4ZPmBJQV3NI4C0YVZJK1x2csnPA3onkuAe1u1tFS
 oaO2d90r7touIpx30OULDH16ZWplyUkbVIqD88JR9Jd5To5HJlYYPcNIl
 +OttLmEEFMSece8xsRKzy6QkoMhv8vEpIm/U59+SrQEZIRgAnVPzprxJ6
 ymVyKEetq5LTaENu24JueECfSO69m1H46M5UBkeQZzFsNJnGtIQQNveVt
 zkP4IomoME0rkamNvPIGhKT5DJvH3UnG+SR/5/SOHPCtvlVgX+Otp98Jj
 Hr0+MuUClEXae1ktFpkJ1cfJAFIJrR0DBWJB/1tKvJsZBT1+gFY6LWNHd
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=MjXu1639
Subject: [Buildroot] [PATCH 1/2] configs/beaglev_fire: Bump U-Boot
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

Bump U-Boot to latest release tag: linux4microchip+fpga-2024.09. This
includes the latest features and bug fixes.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index 2628d4b4fd..cb0ec5ec52 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
+sha256  a2fad7fe7f933fa4679b070e952e1e7a21dbd8b586d7a9a11bfcb99e75ae7ad6  uboot-linux4microchip+fpga-2024.09.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 5d7115b914..5b42732435 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.09)/uboot-linux4microchip+fpga-2024.09.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
