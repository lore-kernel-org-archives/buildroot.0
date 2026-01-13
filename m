Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B176DD0C859
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 11:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858FE42A70;
	Tue, 13 Jan 2026 11:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBfzPy_Da-V3; Tue, 13 Jan 2026 11:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F8342A65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768303764;
	bh=SueE2oAzhfX/a4SWQ1qVh4QRIxasufkVzwv6kNLvQIU=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OT1YQbJzHqqx0CajYLpa1VMX06us+cVyjPCUODk6Kt2BFx+MXgJGMi+fTXPe6VKoR
	 DsrTiQD+8vHZcDrXCkX5Yy0StePjATDaVHs3/TY/xRKIFmqGDMwJ3W5DWcipoB9VDT
	 d4klyomfsIsiWqPPZoJXTL5cdPpoMDHk6Ha1hhPxza3pdp+AV59F9f2F36JiaFkiGW
	 8PDtJL9WdP5zYg2ryttwL6rfdUe/3M7O/Zh5fz/A/JF8hEaubMMqiFFfgUnJ4oFjWu
	 BRbVm3fDkoMC8ORs5D9zZUmoge8AybUOuaTsCOhNvDY2lZufktbEHKifqnKQKjDKY1
	 VGgwDtF0SBPug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F8342A65;
	Tue, 13 Jan 2026 11:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19EBD231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0063D42A62
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VHRcR04qQa0 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 11:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=4667d680c=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7D5D42A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7D5D42A65
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7D5D42A65
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:21 +0000 (UTC)
X-CSE-ConnectionGUID: 0yeimWqJTFqgigneZrHUpQ==
X-CSE-MsgGUID: 9278Va2LQ36+XgbySk1Ddw==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="52237243"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jan 2026 04:22:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 04:21:54 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 04:21:53 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Tue, 13 Jan 2026 11:26:19 +0000
Message-ID: <20260113112621.347651-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113112621.347651-1-jamie.gibbons@microchip.com>
References: <20260113112621.347651-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768303762; x=1799839762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=seBCWwN/rotr0Ah8ymsTrVoiiIidNtvOopSuNUlcKjc=;
 b=i6cyJSL/CTyky/ruysowvGaf3hW3gZSEOe8o8ABKeKmdfavvgGbyzGKR
 Be8UOYxPF74LasiWhf4mtCLdvS0708lgdvPEdXQecf1RS83ern7JcaC7T
 3zzmjs3kyTYEzDvtEgRoY4CVEJk0z1+4KqFdHsuurw/bqUiV7Ivvii90+
 3mXe8psicpAxeVICmtk0eNQuavk8j6lqzKAHWjWc/Rdtut+s9epGXRE9C
 UPlwszfYwvg2UPHktDP//vNYCp4E0Gjl9NAfBfhDiR3BsAFYhlfT95y4c
 BpHgxOa7qefMe5zi9TkX09hxKbApl2kqSxkFUbLKDewYWWdpmHz610FUZ
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=i6cyJSL/
Subject: [Buildroot] [PATCH 3/5] configs/beaglev_fire: Bump U-Boot
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

Bump U-Boot to latest release tag: linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a U-Boot version
bump to v2025.07.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index cb0ec5ec52..a40f963a2e 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a2fad7fe7f933fa4679b070e952e1e7a21dbd8b586d7a9a11bfcb99e75ae7ad6  uboot-linux4microchip+fpga-2024.09.tar.gz
+sha256  591c80f7e16d6f43192deb7ab7587ae81b31ba7c7de1a668c14b9997b6c976c8  uboot-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index bfaa8208e9..4fc33969d0 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.09)/uboot-linux4microchip+fpga-2024.09.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.10)/uboot-linux4microchip+fpga-2025.10.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
