Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D477E77180
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17CA608BB;
	Sun,  8 Dec 2024 14:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyQygdpgxjhq; Sun,  8 Dec 2024 14:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66FA608E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66FA608E3;
	Sun,  8 Dec 2024 14:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DC06F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9EBD81BC5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNa2m7lleUO0 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0064281BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0064281BA9
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0064281BA9
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:27 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3c1f68ef1so342102a12.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668705; x=1734273505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EUcBF0TdjWGI1GqS2cvXYxY0O/cnACZGS7E6+3wX808=;
 b=CR9hRtulti9D7WboB9vBc35oU593nxhfJGjwklzwhdq9AjBvotHF8TvwqZB/8nKHG0
 Z5UtIpr0KP+LjhI00LdRWvoBGHcwHNfbpG3rFFKCH0DDA1KR4WW2YdjIrBEIv2/KYE1F
 hQ3+Ytu/FVAxB4feSCWJ37uPRhEmuRcdnEeGibKzHjcuZdj9Gk9sWoXxgRp/x1NMjV51
 DKuzx/ieoldtH4muFb3B0yiUPntriXlysgsGRaR4GqMkL1jRwwKzBtSs2CHDmPn+fgGg
 70SmOZ4AT3Eq1m3j8AeZFs/UVFR+nrqqIajDSzkZRFrlL4Q37c1lAARgJxEBgEagA7iV
 pXCw==
X-Gm-Message-State: AOJu0YzdFt0l+9tsCO98i3qoevOvVRFLD9WTKl+KVuf5sibWPkdpns9N
 lYCBnWoYIMAe83lHgnmweIfkyGVRNm0XHxVVxBwjAMNvgC8AuVmEbx4bzQ==
X-Gm-Gg: ASbGncvlfqRif8du7L4csYYd+UAMhVSBenLXjgwhed0LHg4b9NEBhENDw8nxBKTxNSc
 Ue5jLCzcPswpmCkEFBic8Q6nTNPRstyGDXGm22LStVAmFcpBogfWuxNRTrU11NtV+3Q6ol6Bm6N
 tHZDsBe6+QvLiEiIZfciRR0MboOuZDGJkXQg9yYZJ6NowrOoxJfIJD30L8HC9uT9MhaStB3CfyB
 rQ0hL0+68CAnPhHUAbrbtBm0nCbYxjHQcqrSrTMzbw=
X-Google-Smtp-Source: AGHT+IHPkvKJq8AnmBIc8jWEUVuomkNhw01I/eqA6ix+WezbDiuLC3qT0rMXutz9tJ4qMWYae/Ra/g==
X-Received: by 2002:a17:906:6a1a:b0:a9e:e0a4:e984 with SMTP id
 a640c23a62f3a-aa63a3437cemr349313766b.13.1733668704756; 
 Sun, 08 Dec 2024 06:38:24 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:23 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:52 +0200
Message-ID: <20241208143802.1048266-2-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668705; x=1734273505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUcBF0TdjWGI1GqS2cvXYxY0O/cnACZGS7E6+3wX808=;
 b=j//1ZpVQ7cd3ehHe9sV4qpYwpuOOnJLhQA1a/ItDdlJygnPZbVZQW1wTh1QsqaNMM1
 tLMDQ3ATQq5Mi1x1SDRDZUIfl6CYr5KSMxeYeE4X4W/StEYTsV2mAzKtkd/iJtehrdiM
 5BqaTwp7jZWFgF2GamN2XlgYsqFNjAGj1JU11VWjXebUjnCrJMVwXzVnNAw3bbykzkD3
 WreuneJhhcUAOFApu8JBQUvxF/tgDAnFL6AhZ8uoLxzrjd7t+/CIhnJXQsA/yNVdVMSU
 wYqP0u8sAngZhEGAgGu5YGYbTx5Cwt9VXP8WCgEYXJevd1jLdZCOEQVwnRSqgKiE5hcM
 ZSbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j//1ZpVQ
Subject: [Buildroot] [PATCH v2 01/11] platform/layerscape: bump Linux
 Factory tag to lf-6.6.36-2.1.0
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

Update the following packages to the latest Linux Factory tag:

- qoriq-cadence-dp-firmware
  - the updated download path was taken from the Yocto BSP at
    https://github.com/nxp-qoriq/yocto-sdk.
  - the recipe is here:
    https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/dp-firmware-cadence/dp-firmware-cadence_22.04.bb

- arm-trusted-firmware
- linux
- u-boot
- fmc
- fmlib
- qoriq-rcw

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- reference LDLSDKUG instead of LLDPUG which is now apparently obsolete.
- explain relationship to Linux Factory

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1028ardb/patches/linux/linux.hash       |  2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |  2 +-
 board/freescale/ls1028ardb/readme.txt         | 27 ++++++++++------
 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |  2 +-
 board/freescale/ls1046a-frwy/readme.txt       | 31 +++++++++++++------
 configs/ls1028ardb_defconfig                  |  6 ++--
 configs/ls1046a-frwy_defconfig                |  6 ++--
 package/fmc/fmc.hash                          |  2 +-
 package/fmc/fmc.mk                            |  2 +-
 package/fmlib/fmlib.hash                      |  2 +-
 package/fmlib/fmlib.mk                        |  2 +-
 .../qoriq-cadence-dp-firmware.hash            |  2 +-
 .../qoriq-cadence-dp-firmware.mk              | 10 +++---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash    |  2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk      |  2 +-
 package/qoriq-rcw/qoriq-rcw.hash              |  2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |  2 +-
 20 files changed, 65 insertions(+), 45 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index f9af28ab3cf5..942dab47072c 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
+sha256  4562efdc08efae7d36f3ee481871aac8ed0c856f8023d2186e4affdc5b768270  atf-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index e038c2286237..bfdc2c268d2d 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
+sha256  26e0db3dda786d939269f85df0f605e28cb55646ab8c541fc9bbbb4ab7fd9bf3  linux-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index a5ccd82b2b0d..b1d83aa9135e 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
+sha256  51adf233d53af875f70cf451e5950dd0b6af09ff35e546eacc4ec6998454c7eb  u-boot-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 6633d60b9013..95f0694b744e 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -4,19 +4,28 @@ NXP LS1028ARDB
 
 This file documents the Buildroot support for the LS1028A Reference Design Board.
 
-for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+For more details about the board and the QorIQ Layerscape SoC, see the following pages:
   - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
   - https://www.nxp.com/LS1028A
 
-for the software NXP LSDK (Layerscape Software Development Kit), see
-  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory, currently
+tag lf-6.6.3_1.0.0, a few releases behind the latest lf-6.6.36-2.1.0.
+In Buildroot, the latest Linux Factory release tag is used.
 
-the components from NXP are:
-  - rcw, lf-6.6.23-2.0.0
-  - atf (fork), lf-6.6.23-2.0.0
-  - uboot (fork), lf-6.6.23-2.0.0
-  - cadence-dp-firmware (blob), LSDK 20.12
-  - linux (fork), lf-6.6.23-2.0.0
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+Note: the latest Linux Factory release may contain features which are not yet
+documented in the LDLSDKUG.
+
+The components from NXP are:
+  - rcw, lf-6.6.36-2.1.0
+  - atf (fork), lf-6.6.36-2.1.0
+  - uboot (fork), lf-6.6.36-2.1.0
+  - cadence-dp-firmware (blob), lf-6.6.36-2.1.0
+  - linux (fork), lf-6.6.36-2.1.0
 
 Build
 =====
diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index f9af28ab3cf5..942dab47072c 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
+sha256  4562efdc08efae7d36f3ee481871aac8ed0c856f8023d2186e4affdc5b768270  atf-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index e038c2286237..bfdc2c268d2d 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
+sha256  26e0db3dda786d939269f85df0f605e28cb55646ab8c541fc9bbbb4ab7fd9bf3  linux-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index a5ccd82b2b0d..b1d83aa9135e 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
+sha256  51adf233d53af875f70cf451e5950dd0b6af09ff35e546eacc4ec6998454c7eb  u-boot-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 4d1e0e1dcd9c..17dc23cc7c4a 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -4,20 +4,31 @@ NXP LS1046A-FRWY
 
 This file documents the Buildroot support for the LS1046A Freeway Board.
 
-for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+For more details about the board and the QorIQ Layerscape SoC, see the following pages:
   - https://www.nxp.com/design/software/qoriq-developer-resources/ls1046a-freeway-board:FRWY-LS1046A
   - https://www.nxp.com/FRWY-LS1046A
   - https://www.nxp.com/docs/en/quick-reference-guide/FRWY-LS1046AGSG.pdf
 
-for the software NXP LSDK (Layerscape Software Development Kit), see
-  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
-
-the components from NXP are:
-  - rcw, lf-6.6.23-2.0.0
-  - atf (fork), lf-6.6.23-2.0.0
-  - uboot (fork), lf-6.6.23-2.0.0
-  - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
-  - linux (fork), lf-6.6.23-2.0.0
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory, currently
+tag lf-6.6.3_1.0.0, a few releases behind the latest lf-6.6.36-2.1.0.
+In Buildroot, the latest Linux Factory release tag is used.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+Note: the latest Linux Factory release may contain features which are not yet
+documented in the LDLSDKUG.
+
+The components from NXP are:
+  - rcw, lf-6.6.36-2.1.0
+  - atf (fork), lf-6.6.36-2.1.0
+  - uboot (fork), lf-6.6.36-2.1.0
+  - qoriq-fm-ucode (blob), lf-6.6.36-2.1.0
+  - linux (fork), lf-6.6.36-2.1.0
+  - fmlib, lf-6.6.36-2.1.0
+  - fmc, lf-6.6.36-2.1.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 0d1843bf5fce..e73e9a954584 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.36-2.1.0)/linux-lf-6.6.36-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.36-2.1.0)/atf-lf-6.6.36-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.36-2.1.0)/u-boot-lf-6.6.36-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 2cf0f9c8bc50..7b86d6ba9810 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.36-2.1.0)/linux-lf-6.6.36-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.36-2.1.0)/atf-lf-6.6.36-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.36-2.1.0)/u-boot-lf-6.6.36-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 961ce18ac713..a467e99af842 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-LSDK-21.08.tar.gz
+sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-lf-6.6.36-2.1.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 4f25545ffd8c..1135b46fe042 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = LSDK-21.08
+FMC_VERSION = lf-6.6.36-2.1.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index f81b017869c3..034c44c5e10e 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  64dc76c0adc3aa58bce6aba470dee7dee001d4964ccb1958e899a59d9917b21d  fmlib-LSDK-21.08.tar.gz
+sha256  64dc76c0adc3aa58bce6aba470dee7dee001d4964ccb1958e899a59d9917b21d  fmlib-lf-6.6.36-2.1.0.tar.gz
 sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  COPYING
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 3d185979d51e..2682d0683cc8 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = LSDK-21.08
+FMLIB_VERSION = lf-6.6.36-2.1.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = COPYING
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index 6e5c761463d9..eb6579b919c9 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e267655a47fbe118f6960bca7994bd6b8986ef955344fe006a424be96f868602  firmware-cadence-lsdk2012.bin
+sha256  65f829a9e2597bffc58a680aaefa638122144a083633d1ae09b3aec1d9f8ab84  firmware-imx-8.16.bin
 sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
 sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
 sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 4f75287269a3..04e3a2a6d9ee 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk2012
-QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
-QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = 8.16
+QORIQ_CADENCE_DP_FIRMWARE_SITE = https://www.nxp.com/lgfiles/NMG/MAD/YOCTO
+QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-imx-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
@@ -20,11 +20,11 @@ define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/hdmi/cadence/dp_ls1028a.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/hdmi/cadence/dp_ls1028a.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
 endef
 
 $(eval $(generic-package))
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 67efd675cc26..ba284664ab25 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
+sha256  2c6b69c34cf689178f8ee7db312c1bfd0e5e4d12dfe1e7f097ab35212f7776b0  qoriq-fm-ucode-lf-6.6.36-2.1.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 84360533eb1d..1718b1566730 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.6.36-2.1.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 1f664842f5ea..876733c39a19 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52dfb95a3d8e811609dd8a982a5c6f3ba88fac096ea8448a27b571b7c25e3a83  qoriq-rcw-lf-6.6.23-2.0.0.tar.gz
+sha256  ed952fa73b290cff67603aeb6a37970d69ea56b66656f002f531912782416a35  qoriq-rcw-lf-6.6.36-2.1.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index c6cfe59a5629..1acf5758a0ab 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.6.23-2.0.0
+QORIQ_RCW_VERSION = lf-6.6.36-2.1.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
