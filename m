Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99853C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F5941715;
	Mon,  4 Mar 2024 15:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nqw2Rle7rg8e; Mon,  4 Mar 2024 15:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DFC541848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DFC541848;
	Mon,  4 Mar 2024 15:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 009621BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00C3C81F63
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNOIHjiSyd1B for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0506D8169A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0506D8169A
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0506D8169A
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5131c0691feso5739946e87.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566473; x=1710171273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NBuzEMB3K1oZGBWhz7xYBTAJH7ekJkyJDrjsik6awI=;
 b=TdGcfBh6H4w+wDBZUks0/XrMo4sfNv6BEtW7ZSEzqZwfJ67q/IQRplsqIoH3Ag5Atf
 SusLkT0WmhMfcZQRUm3zA/mYrnx5s/gX4u6jvsL7YU8miAPVUbOeBvuaBORCJfKGBtJw
 1ahVW+a7sdGwri6qxnBXYjZ69uDFXkLeTy4h1s62pA4IjSUK54YZ4Ubua+roFhZyjM/B
 sdNVu7HdDMcjcgUfCgXuVhaOo9aL5NA0SnE40Ku3PjBkhznDOPwHUqnGOh92cxMmDEVj
 E8CxHbH6wloYelDQiacGWYfmO0/3CZmmln29uqVGS1DPhCOJiYTL+ppawTRCNLKeXHsD
 8QMQ==
X-Gm-Message-State: AOJu0Yx+9/0V7y00v9dnU7whN3+11hiN6udbNQy5eMuFseSVTO72AD3C
 sWyLKQvYR4WXHzJqlSOnFzZ++YieGL8PfsikEyLkhlZN/pCIdwp4sOND9zqByLna6GxV6goCQxO
 dtc8=
X-Google-Smtp-Source: AGHT+IFFk2lNR3yepf3SaH+HLmzu/cjFh4QxPeULsKbiUOFRaoZxwDNBMxdcdqqaHb+Jcv1rHrjA9A==
X-Received: by 2002:a05:6512:3c95:b0:513:3e60:f463 with SMTP id
 h21-20020a0565123c9500b005133e60f463mr4846439lfv.62.1709566472688; 
 Mon, 04 Mar 2024 07:34:32 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:51 +0100
Message-ID: <20240304153253.732708-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566473; x=1710171273;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NBuzEMB3K1oZGBWhz7xYBTAJH7ekJkyJDrjsik6awI=;
 b=EG76DdJw2nVgctrya2BGieYp95VeCHpcik/H3agBtNQigCktwYaiCv44TXE86ksUdx
 GBYYfSsOpUVaZiimDwXCALXcUu3zTMljM8uaAGft70/RumbQMI+8DjzluZuGJyLhKV6X
 WaYCLpCTV+sa/qDGZZ4cjzDqwqmyFKmQtdjmw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EG76DdJw
Subject: [Buildroot] [PATCH v9 20/22] configs/ti_am64x_sk_defconfig: bump
 U-Boot version to 2024.01
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 2024.01 version of U-Boot for the am64x-sk board has introduced two
major changes:
- The device tree k3-am642-sk.dtb is no longer searched in /boot, but in
  /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
  and the use of extlinux.conf for the proper loading of the device tree.
  Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
  auto-generate the extlinux.conf file so that developers can change the
  kernel loading options by modifying the .config.
- U-Boot is capable of building tiboot3.bin using Binman. So it's no longer
  necessary to use custom tools like ti-k3-image-gen.

Furthermore, ti-k3-r5-loader creates the following tiboot3.bin files:
- GP    -> tiboot3_am64x-gp-evm.bin
- HS    -> tiboot3_am64x_sr2-hs-evm.bin
- HS_FS -> tiboot3_am64x_sr2-hs-fs-evm.bin

The patch also allows you to identify the correct file based on the
SEC_TYPE option.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v9:
- squashed with patch [v8,20/23] "package/ti-k3: fix BR2_PACKAGE_TI_K3_SOC
  setting for am64x SOC"
- Update the commit message

Added in v8

 board/ti/am64x-sk/genimage.cfg |  7 ++++++-
 configs/ti_am64x_sk_defconfig  | 13 +++++++------
 package/ti-k3/Config.in        |  3 ++-
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/board/ti/am64x-sk/genimage.cfg b/board/ti/am64x-sk/genimage.cfg
index 26304fe98f99..88dff8fe23dc 100644
--- a/board/ti/am64x-sk/genimage.cfg
+++ b/board/ti/am64x-sk/genimage.cfg
@@ -4,10 +4,15 @@ image boot.vfat {
 			"tiboot3.bin",
 			"tispl.bin",
 			"u-boot.img",
+			"k3-am642-sk.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
-	size = 16M
+	size = 64M
 }
 
 image sdcard.img {
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 566cbbe4824f..9b92b645dd21 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,14 +1,14 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/common/am6xx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_PACKAGE_TI_K3=y
@@ -24,19 +24,20 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index b8545b7bca62..9c61f8880a15 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -43,7 +43,8 @@ config BR2_PACKAGE_TI_K3_SOC
 	string
 	default "am62ax" if BR2_PACKAGE_TI_K3_SOC_AM62AX
 	default "am62x"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "am64x_sr2"  if BR2_PACKAGE_TI_K3_SOC_AM64X && !BR2_PACKAGE_TI_K3_SECTYPE_GP
 	default "am65x"  if BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
