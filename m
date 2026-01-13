Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB71D0C859
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 11:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E36DE40A94;
	Tue, 13 Jan 2026 11:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWY0u5SeQvlT; Tue, 13 Jan 2026 11:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F66F42A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768303753;
	bh=gxFOl7CNuBkCEu0EBT8QFTDbhXAGFm/XGSwq0wy1H3s=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CwdmYUd9oAInniT1ZCOTLGP4BFS9l2pyrC4LVyV2NrtZu790dR6KFPXsoEHWuQkRS
	 VdMNtnCtivzZGY1F44V0nFo4Wox3HjbaMUHl6fGhagy/vNRSfQrwIsoKdAiy14uotd
	 XAGmAtCZZ1sYVinPnNBHjaKpkqzrXDRsqr65aPL9W9xfBbAuFiVZEDc6ywmHGLMpYO
	 pNpj1elwybZwQ5Y7q0bRiuDx/88lRebU1oYhdu85jx6NOTcTsU4JIEiMo9650H9IzD
	 1tfnXVoSRRdCk5Th/Myu1XhUtz8kuWbKlcXLzJZHCFsvdLRXnqE3izuMg/5ClRthk8
	 idF9GLqSPrVow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F66F42A55;
	Tue, 13 Jan 2026 11:29:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC3A11CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2EB6F596
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZjmSA8ksHQQ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 11:29:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=4667d680c=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B2D36F598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B2D36F598
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B2D36F598
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:09 +0000 (UTC)
X-CSE-ConnectionGUID: fkj/fYnYQMC1ZBpFewgdGg==
X-CSE-MsgGUID: 2WNBsm+YTtmC0xYqa4ut7w==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="51784105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:22:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 04:21:44 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 04:21:43 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Tue, 13 Jan 2026 11:26:17 +0000
Message-ID: <20260113112621.347651-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113112621.347651-1-jamie.gibbons@microchip.com>
References: <20260113112621.347651-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768303749; x=1799839749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWZ/go+e5knjLwdMin+P07TbaBEHkhzCePa+hRHdZo0=;
 b=kHc3hqS1zZZ6+teHgoGAN8hXyNecDerlvnGB/8Xe0JElq2BRahAzp9dx
 1gZnOZj7qCvpjxUW2iojeW03R6aT32nMGJ57Z2WqW/xMEjiwKWSLdAngu
 E6ApH7RoYPDIGEvB8qvMmwMGp9T2LUMQ6ms+UuP9M7bXQq4ryW5mafhO/
 omSOFcMzEIFsKZ7EbOq+XM0jmRHdxtQ/DrGOii9LVEnsuLixLOffLWlcm
 PSCk5hduCNmQQeE/GOVaNE+O4nyEA8MIHUKnSRjGNlGPbIvriD4lfN8cw
 EQrJ+iVjiNwGkbppFFWVOmfi9c45KPJhgfUzw8gwAmoXQcUk73v6bQwet
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=kHc3hqS1
Subject: [Buildroot] [PATCH 1/5] configs/microchip_mpfs_icicle: Bump U-Boot
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

Bump U-Boot to latest release tag linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a U-Boot version
update from v2023.07 to v2025.07.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
index 0adbe15710..a40f963a2e 100644
--- a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
+++ b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8dab9abc2861d95e609cd62a44b4687d03dc13eae6487fd1ae1ded6398ddb0cd  uboot-linux4microchip+fpga-2025.07.tar.gz
+sha256  591c80f7e16d6f43192deb7ab7587ae81b31ba7c7de1a668c14b9997b6c976c8  uboot-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 52b865ef77..b5a7562b7e 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.07)/uboot-linux4microchip+fpga-2025.07.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.10)/uboot-linux4microchip+fpga-2025.10.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
