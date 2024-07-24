Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE15C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 14:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D8F608DB;
	Wed, 24 Jul 2024 14:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzINvjKcGFyy; Wed, 24 Jul 2024 14:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A127608C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A127608C0;
	Wed, 24 Jul 2024 14:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C90031BF48D
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 14:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B721B608C0
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 14:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PEd7fj_Kkrb for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 14:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F096606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F096606B9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F096606B9
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 14:19:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso51975525e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721830763; x=1722435563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UfmPccMy+5W32i5Lvox7zj0u9OG1g1jGAq7DEhdGQg4=;
 b=npAb1o/eWMVv5n//qej3whcdozL2wMauxuZKW7+0RUEA1XmD9kPiHuzqtomrkAzVJ+
 RYfnuTuq3+A5x5d/flR6V2khtgEquYrtSxx7nPlmEzRSweq1MvUUlsCROucC2+LnTIuI
 ma631XRJ5pN70CDWVuEO44ZNgv0HiBO3U4KTtpGtAkx/IF1e1f/H26KULK23e8Pg/6px
 EnCMYv57XlA1uLJ2Xw10fi0dU50RLJMKsv0R7bNORQZPAsSSL7oRdujbQahyetGy0tzk
 a6VP+8pwnCiZHiRFWEpB6LDEkKRBt4RBxJnXT7mpCS84EXU8pXZg2DQCq5tdVGji/jP/
 s+BA==
X-Gm-Message-State: AOJu0Yza5ALT4oJO2Oi0gRrNUYS9IQbCb3i3nvd1IroRQbEcAwW6nCr3
 TRxe8942HMwFmld/B4C7zRM3vhpx8nheoZeKzbJ0rrsQCa6Uo68j7xmLY6P0A5m/G5kIpEn+aDj
 /04Y=
X-Google-Smtp-Source: AGHT+IENefNmzSe575Lkd3j78CJMOscIFWUMQo4KYu87pz1Z8iJyq3UX3H2DcYgl9cp4k76izVadqQ==
X-Received: by 2002:a05:6000:1f8f:b0:368:6f64:3072 with SMTP id
 ffacd0b85a97d-369f5a6e512mr2004572f8f.7.1721830762944; 
 Wed, 24 Jul 2024 07:19:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.5.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684225sm14605402f8f.9.2024.07.24.07.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 07:19:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 16:19:11 +0200
Message-ID: <20240724141911.2693092-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721830763; x=1722435563;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UfmPccMy+5W32i5Lvox7zj0u9OG1g1jGAq7DEhdGQg4=;
 b=rh3bvHb+UHE6zuFFlSDLbE3VyhgTSgl6fAFlCnNi2ZVF3b5Ma2G7r2MWwMs3KWBVLk
 1M/qHLaGacmsa626JrgGLOGDcm3kd3MGUeR0F+lYxeh6mvD3G1vbMjPuJ21m6XYQbgOU
 HhMoekATSw5AzuqSo6zJLENcYy37hVKHrZq44=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rh3bvHb+
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump TF-A,
 U-Boot and Linux versions
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
Cc: linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps:

  - TF-A to version v2.10
  - U-Boot to versione v2024.07
  - Linux kernel to version 6.10

The TF-A bump required applying a patch, sent upstream, to fix a
regression in the domain access permissions configuration for the boot
console UART.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...rop-UARTs-domain-permissions-setting.patch | 65 +++++++++++++++++++
 .../arm-trusted-firmware.hash                 |  2 +-
 .../patches/linux/linux.hash                  |  2 +-
 .../patches/uboot/uboot.hash                  |  2 +-
 configs/imx8mn_bsh_smm_s2_defconfig           |  8 +--
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  8 +--
 6 files changed, 76 insertions(+), 11 deletions(-)
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch
new file mode 100644
index 000000000000..74b12df38dcf
--- /dev/null
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch
@@ -0,0 +1,65 @@
+From 0d12fc41d6c68b257de1610a1511144d731f9af4 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 24 Jul 2024 10:46:49 +0200
+Subject: [PATCH] fix(imx8m): drop UARTs domain permissions setting
+
+The commit d76f012ea8fc0 ("refactor(imx8m): replace magic number with
+enum type") also hardcodes the domain permissions configuration for the
+UARTs, causing a regression for any board using a boot console different
+from UART2. Indeed, previously, the RDC_PDAP_UARTn registers were set to
+the reset value (0xff), meaning all domains were enabled for read and
+write access.
+
+This patch partially reverts that commit to fix the regression.
+
+Fixes: d76f012ea8fc0 ("refactor(imx8m): replace magic number with enum type")
+Change-Id: I2670bf485372f32ef45cebb72a7694a9a800f417
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/30131
+---
+ plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c | 2 --
+ plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c | 2 --
+ plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c | 1 -
+ 3 files changed, 5 deletions(-)
+
+diff --git a/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c b/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c
+index f6e46eb67bc9..539df931a6a4 100644
+--- a/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c
++++ b/plat/imx/imx8m/imx8mm/imx8mm_bl31_setup.c
+@@ -67,8 +67,6 @@ static const struct imx_rdc_cfg rdc[] = {
+ 	RDC_MDAn(RDC_MDA_M4, DID1),
+ 
+ 	/* peripherals domain permission */
+-	RDC_PDAPn(RDC_PDAP_UART4, D1R | D1W),
+-	RDC_PDAPn(RDC_PDAP_UART2, D0R | D0W),
+ 
+ 	/* memory region */
+ 
+diff --git a/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c b/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c
+index befa7698f912..604ef3cae6dc 100644
+--- a/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c
++++ b/plat/imx/imx8m/imx8mn/imx8mn_bl31_setup.c
+@@ -53,8 +53,6 @@ static const struct imx_rdc_cfg rdc[] = {
+ 	RDC_MDAn(RDC_MDA_M7, DID1),
+ 
+ 	/* peripherals domain permission */
+-	RDC_PDAPn(RDC_PDAP_UART4, D1R | D1W),
+-	RDC_PDAPn(RDC_PDAP_UART2, D0R | D0W),
+ 
+ 	/* memory region */
+ 	RDC_MEM_REGIONn(16, 0x0, 0x0, 0xff),
+diff --git a/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c b/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c
+index ffad3d159e59..5251c28e6ba8 100644
+--- a/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c
++++ b/plat/imx/imx8m/imx8mp/imx8mp_bl31_setup.c
+@@ -54,7 +54,6 @@ static const struct imx_rdc_cfg rdc[] = {
+ 	RDC_MDAn(RDC_MDA_M7, DID1),
+ 
+ 	/* peripherals domain permission */
+-	RDC_PDAPn(RDC_PDAP_UART2, D0R | D0W),
+ 
+ 	/* memory region */
+ 
+-- 
+2.43.0
+
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 80e592dab606..02714d06a09c 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fc4cdac7c08fc398b6d4b705285dc13ac2d2b30a7449c6f07e9ccd81207241df  arm-trusted-firmware-v2.5.tar.gz
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index b017ef2a893e..53eb1438945b 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3e4d8e561da5703a205ae8d7b2bed6c5c64fc4299eebcbfd20481e63b57d5ee3  linux-6.1.6.tar.xz
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 7cef5b688ec3..fe9b4f53dc63 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 841512ed1a16..2b358cf57b28 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,14 +22,14 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index b4553ceb5214..e903cbf3148a 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
