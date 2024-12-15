Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F2FE77183
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C747E81225;
	Sun, 15 Dec 2024 10:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgr-6kLnB6yl; Sun, 15 Dec 2024 10:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C185780B67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C185780B67;
	Sun, 15 Dec 2024 10:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FA269
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31AAD40263
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9ZIfKNAVnTm for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:14:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9638B40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9638B40108
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9638B40108
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30227ccf803so34673971fa.2
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 02:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257646; x=1734862446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zf5F/qC72cPnvNzLukveRfA9BQiqsvkCRQ3aEjkyPpk=;
 b=iFAlFhaPzPFOPsK21aM5FhcM1LHNrUmoO8fixFCGKvY+ptL2SVNCF6EU3xt+S9NPPx
 ltZx7fFPeQBGYQG4+mY7uZMHLcuWL5zFopRY6Sw2/BGSGNzjpb1Pc3agP+Wxo98we78E
 3L1lMrPK90lpRFuDy0C/mY9pcTdxPBCgYYAMB89tAKsCFDdW7EAItvGtrUsqiaNL/5VY
 Z2n+9ct+wCoELeWFNptPzpyWq24rb/lPVpGoXv1WDtLrFlYa8uQZjIXPvtbYYx28zC4T
 6Ya2Bwo4NmIpZibCd5y7NPgG/eGuTNPS1+ssRjNB7BNECyUzpO4N0qK7nTkI4lvxZg9x
 5z5w==
X-Gm-Message-State: AOJu0Yy5c7or9faz5R0uZY2Huv1ZQvcfT+LQXCAgEhvnVRRRdy3xqSS8
 jEkx+SKlN6rwl8fEu2yFq6inNaDvxuVQUyWCPR0OTyp+awV4ljSepP6ifOAoi30=
X-Gm-Gg: ASbGncuGzFYE4dORyBthy7bUMz38zkdTetGPX9OpxGMAUgXB4/nq2WnBI0nuw9uULa7
 PJT9mvLDVd5pVj+QQ/0/iB91futTweySwozrhg9F2yyDpaJtZcajPwnVUSRKlf4+bKUWymQjQkQ
 XWozVdwXXNaN90Gb7L3yUMt3DKjCsDC2jQg7n3pGi/qZW9QNj5DkJfNaGIQD3DtP64aaLFnkAwj
 YV6/muo4zdZVw22lKGTRWjnNGYFU3kpcQjsGh7o9NGu3o7W6Vy4GyfcOV86QD0d
X-Google-Smtp-Source: AGHT+IFlipjI47vOVcBRcKRelKncGWEgVr02/k68rgOvo17vQSycITkI6skDj7MTc/jRrxoOlKoGxA==
X-Received: by 2002:a05:6512:2203:b0:53e:2f9d:6a73 with SMTP id
 2adb3069b0e04-540857ff585mr3008686e87.0.1734257646331; 
 Sun, 15 Dec 2024 02:14:06 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm462646e87.217.2024.12.15.02.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:14:04 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 13:12:56 +0300
Message-ID: <20241215101353.3214256-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215101353.3214256-1-geomatsi@gmail.com>
References: <20241215101353.3214256-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734257646; x=1734862446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zf5F/qC72cPnvNzLukveRfA9BQiqsvkCRQ3aEjkyPpk=;
 b=cnyGFhvsU1fZu1uyEFpp5dKytH22Nw6JzFADJn6rp1aMVrLiyIno3zf3ysXSMw5eOt
 anzckogcdAihpTOZghfIe9p+zfnDbB+gKLotEIhABSyVV0Le4S4t7D1s4E3EMFFJ39lL
 qo/CJnkj3wn99bfyd23//bhp7DAuVWlGJHWAF9f0Ij9zFqSD1PJaGiGGBb4al1rWhvS3
 F9ftXWz1uue0d+KuRzjBzGaHQCEKeuiAuV6fcPEjiWjqnVITkTSoineOVSu2hT0OFnfd
 8/wmh2V8OqF2AzIuyIg8kcWc+shliZCPPBg5+xyxh+mODwk2sezSU7tuP3CVtZZ6DOkX
 7CCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cnyGFhvs
Subject: [Buildroot] [PATCH 2/4] configs/linksprite_pcduino: bump BSP
 versions
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.12.3 and to U-Boot 2024.10.
Force check of hashes for Linux kernel, headers, U-Boot. Finally,
add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .checkpackageignore                                      | 1 -
 .../pcduino/patches/linux-headers/linux-headers.hash     | 1 +
 board/linksprite/pcduino/patches/linux/linux.hash        | 2 ++
 board/linksprite/pcduino/patches/uboot/uboot.hash        | 2 ++
 configs/linksprite_pcduino_defconfig                     | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)
 create mode 120000 board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/linksprite/pcduino/patches/linux/linux.hash
 create mode 100644 board/linksprite/pcduino/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 3e4704a577..7711bbb7f8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -167,7 +167,6 @@ configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/linksprite/pcduino/patches/linux-headers/linux-headers.hash b/board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/linksprite/pcduino/patches/linux/linux.hash b/board/linksprite/pcduino/patches/linux/linux.hash
new file mode 100644
index 0000000000..aea771e7bf
--- /dev/null
+++ b/board/linksprite/pcduino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/linksprite/pcduino/patches/uboot/uboot.hash b/board/linksprite/pcduino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/linksprite/pcduino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index 69663e0c3e..a9fe21991f 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/linksprite/pcduino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="pcduino"
 BR2_TARGET_GENERIC_ISSUE="pcDuino buildroot is ready"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -10,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,11 +31,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
