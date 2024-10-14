Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C1D1813A
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F2B6073B;
	Mon, 14 Oct 2024 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6v75fyroh-x; Mon, 14 Oct 2024 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D431160750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D431160750;
	Mon, 14 Oct 2024 20:07:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 101FF1BF349
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 20:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27D44011B
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ra3xo7LtGr2 for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 20:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7522A4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7522A4000B
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7522A4000B
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 20:07:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EK7qMm031987;
 Mon, 14 Oct 2024 15:07:52 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EK7qnL085650
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Oct 2024 15:07:52 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 15:07:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 15:07:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EK7qAW101657;
 Mon, 14 Oct 2024 15:07:52 -0500
Date: Mon, 14 Oct 2024 15:07:48 -0500
MIME-Version: 1.0
Message-ID: <20241014-optee-cleanup-v1-1-70a2fa042ba1@ti.com>
X-B4-Tracking: v=1; b=H4sIABN6DWcC/x3MQQqAIBRF0a3EHyekFEVbiQZiz/oQKloRiHtPG
 p7BvZkSIiPR3GSKeDixdxWybcgc2u0QvFWT6lQvO9kLHy5AmBPa3UFIPVpjMGBSE9UmRFh+/9+
 ylvIBb32sOl8AAAA=
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728936472;
 bh=iv48pijGNslq9m+FFxwjbfz0NidCte9/op0kr1Idqk8=;
 h=From:Date:Subject:To:CC;
 b=aPeubyWaA9kjgck7Ao74QARPLgnGjaYlu1bVg5jybFqzQxtcZCMI3GxvA4N+24obp
 Gma0AaAbttXX34JjXih1ZKHo8jPQqtyojHuK4tdX3IV3Iqbsv+CFeKGQhjNX9P6AKC
 nqu+hqVFlB4AJB6f/YTUMTk1GsphopZ0oi/FYwdA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=aPeubyWa
Subject: [Buildroot] [PATCH] boot/uboot: make OP-TEE binary in U-Boot
 selectable
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bryan Brattlof <bb@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are a few different versions of OP-TEE we can select. Rather than
manually adding these in the BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS field,
allow them to be selectable from the U-Boot menu.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/uboot/Config.in             | 21 +++++++++++++++++----
 boot/uboot/uboot.mk              |  4 ++++
 configs/beagleboneai64_defconfig |  3 ++-
 configs/beagleplay_defconfig     |  3 ++-
 configs/ti_am62ax_sk_defconfig   |  3 ++-
 configs/ti_am62x_sk_defconfig    |  3 ++-
 configs/ti_am64x_sk_defconfig    |  3 ++-
 7 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bfe61cd167d6b..3bc3853e855c7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -268,13 +268,26 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
 endchoice
 
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
-	bool "U-Boot needs OPTEE TEE"
+	bool "U-Boot needs OP-TEE"
 	depends on BR2_TARGET_OPTEE_OS_CORE
 	help
 	  Some platforms (such as Rockchip) encapsulate the TEE inside
-	  U-Boot. This option makes sure optee-os gets built prior to
-	  U-Boot, and that the TEE variable pointing to OPTEE's
-	  tee.elf, is passed during the Buildroot build.
+	  U-Boot. This option makes sure optee-os is built prior to
+	  U-Boot, and that the TEE variable, pointing to the OP-TEE
+	  binary, is passed during the Buildroot build.
+
+choice
+	prompt "U-Boot OP-TEE format"
+	default BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
+	depends on BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
+
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
+	bool "tee.elf"
+
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN
+	bool "tee-pager_v2.bin"
+
+endchoice
 
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d8faef648fadd..f1caa59f331a8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -196,7 +196,11 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
 UBOOT_DEPENDENCIES += optee-os
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF),y)
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
+else ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN),y)
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee-pager_v2.bin
+endif
 endif
 
 # TI K3 devices needs at least ti-sysfw (System Firmware) provided
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index 0429dd63e17c6..a7be263b3f846 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -37,12 +37,13 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_beagleboneai64_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
index 42aa2fbd6ed20..4ba735c808062 100644
--- a/configs/beagleplay_defconfig
+++ b/configs/beagleplay_defconfig
@@ -42,6 +42,8 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_beagleplay_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
@@ -49,7 +51,6 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.img_unsigned"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 77aa4a88e8ccd..bac4bab1ea7df 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -34,12 +34,13 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62ax_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index e11b803b73e43..e634cbc68dfe4 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -37,12 +37,13 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index a9ec5e3d536fd..c8c3f6f8bace3 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -37,12 +37,13 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_PAGER_V2_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y

---
base-commit: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
change-id: 20241014-optee-cleanup-1a7fcce5e828

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
