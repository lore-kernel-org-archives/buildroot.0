Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC46CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 12:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 144EC40AF6;
	Thu, 14 Aug 2025 12:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TkmdpdKrFs4; Thu, 14 Aug 2025 12:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C10B40ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C10B40ADA;
	Thu, 14 Aug 2025 12:20:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C44F938
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C9584162
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBTGWEi8HihS for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=314aab60a=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA046840F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA046840F1
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA046840F1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:57 +0000 (UTC)
X-CSE-ConnectionGUID: TQIC9rrWQ0uPj2LhEUDt9g==
X-CSE-MsgGUID: hqlrhRRoT4KJ+ULKPpBuXA==
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="45784399"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2025 05:12:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 14 Aug 2025 05:12:35 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 14 Aug 2025 05:12:33 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>
Date: Thu, 14 Aug 2025 13:16:35 +0100
Message-ID: <20250814121637.3775660-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
References: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1755173998; x=1786709998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGC7Z39XQz+KnKQvugrE/9tFt9sca2m0oBl6D2tuSBM=;
 b=UM5aNlXUEZeiiXW0W1j6QAKLVEQLaTQP9VBkozQ/ROYZUvol5Kngm2Ru
 tP4vZoukQtruto/0H8URYyuXGBMfvTaRjwyPvGV/zWMPzuwEsTw+LwMhr
 Iq+huFMSuyvl3ynfcvskMynpPVXdvs2ySRcwvDPCJc/TibLH7sITTLhU+
 y0pEJilej2eQo6VP3KFbizauZ/1jBOkHhdTKaX1ANf21nRfln81uVnTlR
 sH2EgToJ4F4AIW2lMh09wpR/1J1GwkGPAkt8aePEAY4rg1FAxppi8Hi1y
 cX8S/hlgL24vpyqx/RHV/zcM/DNCsd/HotDGhttt9JX3256IPNyHWelG/
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=UM5aNlXU
Subject: [Buildroot] [PATCH 1/3] configs/microchip_mpfs_icicle: bump Linux
 and U-Boot, add hashes
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

Following Microchip's Linux 2025.07 release, update the assets to the
latest versions, this includes a Linux version bump and addditional
U-Boot drivers and functionality. Update the Linux headers to support
the updated v6.12 kernel. Update the corresponding package hashes.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/microchip/mpfs_icicle/patches/linux/linux.hash | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/linux/linux.hash b/board/microchip/mpfs_icicle/patches/linux/linux.hash
index 416a8b1550..d0e2d5693c 100644
--- a/board/microchip/mpfs_icicle/patches/linux/linux.hash
+++ b/board/microchip/mpfs_icicle/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  dcb7b41fd363729675c34545fcb514d5a94dbb3714ee10f527a26ca7716c2579  linux-linux4microchip+fpga-2024.06.tar.gz
+sha256  7789cc2844cb9633aa8c146e194c9ad3482bf06ace707d66d0ca6039ed16833d  linux-linux4microchip+fpga-2025.07.tar.gz
diff --git a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
index 2628d4b4fd..0adbe15710 100644
--- a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
+++ b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
+sha256  8dab9abc2861d95e609cd62a44b4687d03dc13eae6487fd1ae1ded6398ddb0cd  uboot-linux4microchip+fpga-2025.07.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 4337ac34b4..4d465016c7 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,13 +1,13 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/microchip/mpfs_icicle/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.07)/linux-linux4microchip+fpga-2025.07.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.07)/uboot-linux4microchip+fpga-2025.07.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
