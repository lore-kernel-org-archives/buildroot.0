Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA6ECA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 13:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A8CA83D5E;
	Thu, 14 Aug 2025 13:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uf5649zrTogX; Thu, 14 Aug 2025 13:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2FE383DBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2FE383DBA;
	Thu, 14 Aug 2025 13:50:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E32AA271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA37C83DBA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAZUu-GNGq9k for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 13:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=brenomatheus@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BF0B83D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF0B83D5E
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BF0B83D5E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:50:54 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4b109914034so9595591cf.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 06:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755179454; x=1755784254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7gOxGb1ZmqgeXznq4+tfgcTSjtbSF7bBMGMNjHFHINQ=;
 b=Dv53Tvn9CbENqCZ/SrHq5RU1R4fxNIjEVeRsOO9ql36IZQ9MSZ/KatTQr3ChCSPrDV
 zPkZVZc3dokgugcIVk+EOoFwrDdPBSopSMO7qcKM7YmLvp4xk4zEIpktvcJlDjkZep/Z
 mwvPoz8zGr03KTdgfgkMj6qNvLWtSxncHVZma8GuES4xPC6uBBDJaGCZ+uemrgjiA2pB
 gQcd5kOTB5ASm9yl61gIg5iAkTnwgntYHDrYRS3c7nOQdo/YFyDXPs6AinXrK5D5P2LT
 wm9d//EmXZ9E9WYCnPtM86O377lVst5MEbQ+DEpxmfRGv/QhUFcT8yvJyQKWNO7X1q89
 14eg==
X-Gm-Message-State: AOJu0Yx7Qeu+oC5vWYLDNzRayKCJZdWQfvCH3CJGh/eISWLjWEPyvSly
 PHZKjMYRVOTAPtold4TMSG9+v1K+LMkBvfMFGDqLmEpJeceaYOEQzNEl
X-Gm-Gg: ASbGncv14/zR0Hr6Fo+bAQVVcT25V/upYnz4Q595Xkh04GQnTvucWqWkQWDkaAaa68A
 MncfJnGKcfcBuxxr4ZrG9MBEyOCxHGPVRlYiw5EEo3/Ph1bsclQyeN6OCdGUOa6A63qHwG69Oy2
 SX0K/SLFyUnDUWtM6nlkImFhKNcc2SdGgX8d5vmSsQuYkVxqn6kgTOWm3lKGV2uXwIZ1fMQnXKE
 aaHEHlfHGbtyTVc8e/CPJIoHEcXxkEgVqtkdj+QmXJ24AOhMXp4HX/VSETuE4Qj5SVQMXDaIas+
 AWJTcOkLyjQAj/jaMsGrY2Plj2RVhjtoT4ZmYiEiADzKtLpMcNC+rWpHExxpnEcqWB9erXrMU5H
 C9JGH+6nqgnB4b0pAF9E6aCWbR3zZH721cGySKy6JxpeOf2/zgMYxFQ==
X-Google-Smtp-Source: AGHT+IFRpxqLd4ZALCOCzeYc8UDs5oRQ1heb2ckpNQzpVrmqd/S1l8calOUFp30jSFD452y4fgtGcA==
X-Received: by 2002:a05:622a:1e18:b0:4b0:77d7:c8b4 with SMTP id
 d75a77b69052e-4b10a934c1cmr45419111cf.14.1755179453617; 
 Thu, 14 Aug 2025 06:50:53 -0700 (PDT)
Received: from breno-Precision-3561..
 ([2601:188:c603:2490:d653:5882:bce5:5c8d])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f72b045sm2118307985a.60.2025.08.14.06.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:50:52 -0700 (PDT)
From: Breno Lima <brenomatheus@gmail.com>
To: breno.lima@nxp.com,
	festevam@gmail.com,
	ju.o@free.fr
Date: Thu, 14 Aug 2025 09:50:42 -0400
Message-Id: <20250814135042.3472923-1-brenomatheus@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755179454; x=1755784254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7gOxGb1ZmqgeXznq4+tfgcTSjtbSF7bBMGMNjHFHINQ=;
 b=AErf/NFSXIGKZUxeCQlnHXk1912Qz3DnsNmKIeSB6pvymSnG01xDm8zEggb8hLd/0i
 OP0FKKVYSd+nyWBZ5/tDFbpI0i3wWycBYdYTn+44zcnJRTy5jO52c2qgbqonO7aBGSR6
 w58031LP2YV6eePEj+h54PycA0EGarugnYm0Ndpn5TyvjVkkEgT927DyBjQ5lt9iUOO5
 7ZgjkETcOUrrlgmvBE+0yroIpI66CKXT2eLWFSN/RVR8/NYwo+UxSYASapeCYokJgeZY
 rR6kMq3Dhy0VwyZyKUy/L4AcFlQ6AwoAWreJQyLnGdVPFmRn/ZHmNJs689DLVcvBRBNr
 TIKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AErf/NFS
Subject: [Buildroot] [PATCH v2] configs/freescale_imx93evk_defconfig: Add
 OP-TEE OS support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Breno Lima <breno.lima@nxp.com>

Add OP-TEE OS Support. NXP BSP lf-6.12.3-1.0.0 version.

The i.MX93 Boot Container requires a raw TEE binary without a TEE header.
Update the imx9-bootloader-prepare.sh script and Config.in accordingly
to ensure compatibility with this requirement.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Breno Lima <breno.lima@nxp.com>
---
Changes in v2:
- Updated title
- Added OP-TEE OS Hash
---
 board/freescale/common/imx/imx9-bootloader-prepare.sh   | 2 +-
 board/freescale/imx93evk/patches/optee-os/optee-os.hash | 3 +++
 boot/optee-os/Config.in                                 | 2 +-
 configs/freescale_imx93evk_defconfig                    | 7 +++++++
 4 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 board/freescale/imx93evk/patches/optee-os/optee-os.hash

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index 2db887a785..a267114d43 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -20,7 +20,7 @@ main ()
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
 			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
 			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
-			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
+			-ap "${BINARIES_DIR}/tee-raw.bin" a55 0x96000000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
diff --git a/board/freescale/imx93evk/patches/optee-os/optee-os.hash b/board/freescale/imx93evk/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..248adffbbc
--- /dev/null
+++ b/board/freescale/imx93evk/patches/optee-os/optee-os.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4b685080a094cb0f0489b8114ae8b73c37ec13eda9f5618c8b6311ff1f472f57  imx-optee-os-lf-6.12.3-1.0.0.tar.gz
+
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 433dae90d8..e737d2a0ac 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -167,7 +167,7 @@ config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 
 config BR2_TARGET_OPTEE_OS_CORE_IMAGES
 	string "Binary boot images"
-	default "tee.bin tee-*_v2.bin"
+	default "tee.bin tee-raw.bin tee-*_v2.bin"
 	help
 	  Names of generated image files that are installed in the
 	  output images/ directory.
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index 1140747825..0a39859342 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -25,6 +25,13 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-optee-os,lf-6.12.3-1.0.0)/imx-optee-os-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="imx"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="mx93evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
