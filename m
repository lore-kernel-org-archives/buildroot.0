Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4985AC41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBC2943571;
	Tue, 19 Dec 2023 12:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBC2943571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ke0eqCIiGay8; Tue, 19 Dec 2023 12:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81B9D435A0;
	Tue, 19 Dec 2023 12:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81B9D435A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0311BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D284357D
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1D284357D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60_ycONfd6zv for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:18 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 898F643577
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898F643577
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55359dc0290so4231351a12.1
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988116; x=1703592916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbRkwbU4mnLNoX4dbJ6J7PwKaJIaZxSrl3Hti7O2xnQ=;
 b=X6H/OhAGCwqheWodx374NnWqzQ3wWFEtQDh4xQY7/hJbbY1Oyzb+o4soZWMO2mUUXY
 EiizQyEInsRs/2DPCZK1r/4ekWwri+6PwRLIVzOcCVAijeLYI1CeaqK99sKdmN7smatw
 Zf+kLVDHE8lrDrB59nPZv4ctN4vtGqfFRYdd8VStPpgwl0WtyLyrfjEcC27mvg74w4UI
 navw53sy84UWXzTPKK0KgQgPPqW5mjyTWUc8V6ggxWnabd42yGt76nnxRQdTgx0aQjL1
 vT6u9zPxx6J83vMm2Skty0pGyDEXlDzyoWTGah9OkrCMao6xGYjYCDcUNCdYVUO1Ejc3
 EKZw==
X-Gm-Message-State: AOJu0Yw9E2HCKwDKFZL5TWMjzm8r814xqUuM38LyrKKjPQcPBbNRvud6
 23cXlGT24Letrj6UUWMvkrxZX/v2sHHDmnR/zTA=
X-Google-Smtp-Source: AGHT+IHMPttnSgArwexRpmgTa5Tlbm41PkSJCNl8Uj/QdQVESexeeWAFrhA8lIp7Txi18tHBzADnvQ==
X-Received: by 2002:a50:d0c6:0:b0:553:a30b:925b with SMTP id
 g6-20020a50d0c6000000b00553a30b925bmr667162edf.39.1702988116691; 
 Tue, 19 Dec 2023 04:15:16 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:16 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:04 +0100
Message-Id: <20231219121508.1695768-4-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219121508.1695768-1-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988116; x=1703592916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbRkwbU4mnLNoX4dbJ6J7PwKaJIaZxSrl3Hti7O2xnQ=;
 b=RBUoUtGblQKAY9JWrsAr9fg7ocuSEsCRXyil87PqtZdyKos3EpL3LHvHBjz3MpONxK
 R1lMlMWqlNuU2jW9inJNjYvOMOLKdSFIrSaWI7Y4WP2prF9klNaM3fm22KYcYUOKglit
 TdIl9XpescfdN41r4REWdN0ihV+gVEsl2/E89iuIvTADC4JgLmvERYUT+IUi34YL2m/5
 hN7r047pBZS89Kl4rTIu48sbvdbVuRSr/fcBAaCduZYBRaRAfVKS8fyDVpepFS78qJYk
 FChSyY13nt8jlxpHv+//pCUCamn4CvE3kfSSZFnrbyYKBHxEoRDdFM6OmUJOyhvLw1yR
 7W6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=RBUoUtGb
Subject: [Buildroot] [PATCH 3/7] configs/stm32mp157*: bump ATF to v2.6
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

- v2.6 changes to FIP instead of SSBL boot.
- This requires switching to u-boot.bin in U-Boot, and using that
  instead of .stm32 in ATF.
- fiptool expects dtb to be split off from u-boot.bin, so need custom
  u-boot-nodtb.bin in addition to u-boot.dtb.
  Caveat: this is perhaps not really obligatory, but the ATF
          documentation explains it like that.
- The partition must be named fip (while it must be named ssbl for
  SSBL boot).
- Since the partition name is set in the common template, all
  defconfigs using that template must be bumped in a single commit
- ATF now produces both fip.bin and <boardname>.stm32, so fip.bin has
  been added to the configs
- While we're at it, add the structuring comments to
  avenger96_defconfig similar like the other defconfigs

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 .../common/stm32mp157/genimage.cfg.template   |  4 +--
 configs/avenger96_defconfig                   | 28 +++++++++++++++----
 configs/stm32mp157a_dk1_defconfig             | 14 +++++++---
 configs/stm32mp157c_dk2_defconfig             | 14 +++++++---
 4 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index ff4aeceeed..c2affd98ea 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -11,8 +11,8 @@ image sdcard.img {
 		image = "%ATFBIN%"
 	}
 
-	partition ssbl {
-		image = "u-boot.stm32"
+	partition fip {
+		image = "fip.bin"
 		size = 2M
 	}
 
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 142f6dd8c9..536899583c 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -1,9 +1,16 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+
+# System configuration
 BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
@@ -12,16 +19,24 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -29,7 +44,10 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_STM32=y
-BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
+
+# Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index e764a1558d..3122c9647a 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -28,10 +28,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb E=0"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -39,9 +43,11 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
 
 # Additional tools
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index aa0fcfa843..7472be38bb 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -28,10 +28,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb E=0"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -39,9 +43,11 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
 
 # Additional tools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
