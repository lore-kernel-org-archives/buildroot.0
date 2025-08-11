Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D22CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 646B041410;
	Mon, 11 Aug 2025 16:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAUQ7xx0qX6o; Mon, 11 Aug 2025 16:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58ACD41064
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58ACD41064;
	Mon, 11 Aug 2025 16:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83482154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71CF141060
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBCiEVN4i_Op for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:56:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB1E40ED7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB1E40ED7
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB1E40ED7
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61794547ab4so583578a12.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931364; x=1755536164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4VQTCVj4hi6N0gPRno/YKscELfZ81EOYZtb2rqpelI=;
 b=UqNWWouOYqxqcOtkRHmUgr9gon0QMfBLHvBHBkL3nfE+OA5qEt+woUDWqmLuSFDCEo
 BFJrgQT3pCwqhc+KRHrR7gw79s4/ItzJhe1ALz3bvMOwepXAJZN6X8EU6eyUnRB5YG1k
 jor85V8X6Ko85Se+2fSOVlYCeVD2uHCKIVwxVuUmKGgODn8g7xLgNlLlts7IHon6mxwc
 ne0a+QeMRYwrcM3lrI8rFiFJCEcU9enIq3CptfyDVaC1h8zqqTXjQBnzMx3PhHzsnZQF
 Xe/h1LtMJpwe4g3S7IGSF2XvbTiUZxP2yInEv+XLCZgc80UHgKNHZkOqRPux5/kxWd8+
 5uLQ==
X-Gm-Message-State: AOJu0YxkHvvy0WXIWMA8Y24UbLb7iFb3t3ai04BqP1hNe7G5iIYGl34x
 /9wdGWn4mG0X8Dyhfaqb79nhhDw8BwtKVJt7k4J4dgIeG/zqc4qUV14GTpFxXA==
X-Gm-Gg: ASbGncsKdibFlf27EY4D/8qDZwB9zNRbN9s7vbIIN1yBLd+z+j6lkeM8hx0QSgIPk5R
 RNa6mkW1PbWO0/ZmIcY1LLSzRxlyM2R7j13Bc12Yv3mPbLRZbv2WVAO0BK8IX8w+JNXFhTxDcC/
 J/pzJI0p4jLcX5Qeatv48jtj9Bm8jZ+4iUNrSAcCHmeyRCH6hAX5Wnoc4Z2B0dTqyz4ZCduIOPV
 1h+aMRFeCkXyAq51hyiftABPh1OorIgvKtvfHDS69Hxqn0gT9JlhGCypUAYZAEroKX66szdW+wA
 uU8I09JhT7rsZlwXxTa3FtPndolT8rdLjRJZGvPOg/XuPUqo7B2D1nRRibtgZuoWTR3tbVtNsQS
 0bmBUTDxJ493ex1MhJcA=
X-Google-Smtp-Source: AGHT+IEmDKH4YElUY66IfD+wvVZsOXOMs7FOrSJis6/91CiaHgiRrWuwltRG0ZRAVlVA/PnONHsnCQ==
X-Received: by 2002:a17:907:1c28:b0:af9:67ef:96d2 with SMTP id
 a640c23a62f3a-af9deb0e2cemr381719166b.11.1754931363280; 
 Mon, 11 Aug 2025 09:56:03 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:56:01 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:28 +0300
Message-ID: <20250811165531.1533913-9-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931364; x=1755536164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4VQTCVj4hi6N0gPRno/YKscELfZ81EOYZtb2rqpelI=;
 b=gXpUs85OJ7gNOpBGhxqGyu/kgj/2O0j7jX1dsVvImxmoGlQ+7TRjWCNg2PoIZgWwEO
 TyXm3ij171GXsf8b5ymBEB2u4r1bDM4yJ9eIELq5eQFIjVoRO2jP2qYNU31czhyokU4a
 dVW1JtTSTS0bQfvReiJYMpLBMJnNl7WW9VPoZqqJPirFlTqplmzBGY5iHpIBIAojwfTY
 A/V0nMa2gOHQEiql/W4I6Su7H4uJ7ZiamKfODsOb4owQI8ITaMnidHa4BZCtSQh3aKrB
 fSVqhObYaEdaaM49RngyGiD6Ahgy/6qN/uqhwsi01huhCLNB45fgrEGTuQuzSk7DW25w
 6E4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gXpUs85O
Subject: [Buildroot] [PATCH v3 08/11] configs/ls1046a-rdb: bump BSP tag to
 lf-6.12.20-2.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the kernel, U-Boot, ATF tags, as well as documentation, used by
the LS1046A-RDB to the latest Linux Factory release.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-rdb/patches/linux/linux.hash      |  2 +-
 .../ls1046a-rdb/patches/uboot/uboot.hash      |  2 +-
 board/freescale/ls1046a-rdb/readme.txt        | 23 ++++++++++---------
 configs/ls1046a-rdb_defconfig                 |  6 ++---
 5 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 41c7ad4068a4..c05084df7660 100644
--- a/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
+sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/linux/linux.hash b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
index 43dbe074c2ec..3aea05469cc0 100644
--- a/board/freescale/ls1046a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
+sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
index 5e36d9348789..1072686160f5 100644
--- a/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
+sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-rdb/readme.txt b/board/freescale/ls1046a-rdb/readme.txt
index 72005b20d93b..ede7a607a883 100644
--- a/board/freescale/ls1046a-rdb/readme.txt
+++ b/board/freescale/ls1046a-rdb/readme.txt
@@ -10,23 +10,24 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
 
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
-common with i.MX), currently tag lf-6.6.36-2.1.0, two releases behind the
-latest lf-6.12.3-1.0.0.  In Buildroot, the latest Linux Factory release tag
-is used, which may be considered pre-release software, as it may contain
-features which are not yet documented, and it generally undergoes less testing.
+common with i.MX), but has a slower release cadence than LF. The currently used
+tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+Buildroot, the latest Linux Factory release tag is always used, which may be
+considered pre-release software, as it may contain features which are not yet
+documented, and it generally undergoes less testing.
 
 For the software Layerscape Debian Linux SDK User Guide, see:
   - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.3-1.0.0
-  - atf (fork), lf-6.12.3-1.0.0
-  - uboot (fork), lf-6.12.3-1.0.0
-  - qoriq-fm-ucode (blob), lf-6.12.3-1.0.0
-  - linux (fork), lf-6.12.3-1.0.0
-  - fmlib, lf-6.12.3-1.0.0
-  - fmc, lf-6.12.3-1.0.0
+  - rcw, lf-6.12.20-2.0.0
+  - atf (fork), lf-6.12.20-2.0.0
+  - uboot (fork), lf-6.12.20-2.0.0
+  - qoriq-fm-ucode (blob), lf-6.12.20-2.0.0
+  - linux (fork), lf-6.12.20-2.0.0
+  - fmlib, lf-6.12.20-2.0.0
+  - fmc, lf-6.12.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index dfa7536617a9..3ae206192ddc 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
