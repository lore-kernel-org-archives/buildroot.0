Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB32C44500
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A4740704;
	Tue,  7 Jul 2026 04:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_zs1e9xaFOE; Tue,  7 Jul 2026 04:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D53AE4071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397341;
	bh=7wWahLPGZxz4k8YxDgTCpciJXr92nIMfk0pwMSpI9a0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y89vMdCLWuhmwkdFXY8ArYHcWV+TqnXChlg2VK3hioDPr4+gSrINcGWsUiOdaJJG1
	 j2MUxrz9nmUu/X/WhvQUWld1Zg33+rfXbYN3iL5XSGZYFIq1LkxblPqiHCHzstKcmY
	 7CPOtBbEE7CJC5/pqZaizJChlKTbd1VRexbguSHe+Zo6gNWQxQ8GWGk/JCZMHryD32
	 6iM8uh93yQ1YeBJSznuUTbqTZCTc3Slyn25NtLaqVcBxXBT7eRpnqSqVj8LSiVP4fl
	 /q3DPZkW81MfK4Njf9LYCPn0/kRss7dNDDJUz4Gl5stu8v7lRZlBSOIu4EVYbOw9Of
	 L2jTfz9IUx/Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53AE4071B;
	Tue,  7 Jul 2026 04:09:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 024D2315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC8AE6074C
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XkwE9fjGUEX for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08EE26072D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08EE26072D
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08EE26072D
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:59 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c99eaa1f020so3826076a12.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397339; x=1784002139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TR+P3Ywj48Ebd6CA4zSWDQArvv/nRe/DaOErgKQyFJU=;
 b=GZ+O/IIjKmSRVUYMR3Pnu+bb6dOuGr/mqc35a0y68g0FKEpXubhuLQPkVw+3XGCk/q
 AG4cPi302o9jsC/5kjT4ZNWZTMxT+wyGKlTZWsa0kEMmF+FHQvdYS6cYHIF9hVuLcK1H
 YcisQHzcFv6lmwLSnph3egkPQ08rMga/hj5zqs7IFyzRz9vqvPGkwBerl0Kd3KAaKigc
 9DuIj/LT0Dolyv3bBm9nmpFTOwhatdaF+/d71zPX5Jn7yf+eTeYbuv/JvaDXbbQ/Ok1B
 8ab8cmHJ/ha/EyIwsgXgrOj/kpRhBRfw/FHYSw96s8jRLdcX7NDawytVG9t06V4Bk+lf
 YNiA==
X-Gm-Message-State: AOJu0YxoWp9XVJKfR6y0xXXcmomtO08ug+0GiGxaEcTKLpUGHj+UwDf+
 uqJwv/ylOksw9Y3xzQBk7PlihEp5ItYIRzUZh2DgcWo5sLMtRVk3p+MZDgZ1EWJM
X-Gm-Gg: AfdE7ckLrxlcxFi4tdUGQemL1GQ66FoulmOrcPI2uscpYlKug5xgO9MKm9PJrd3F0PA
 yqYONu+DU3cnPs7595La1r8YMxOEGg2VVEBxKSnAbCUmx+M71A39f7j/BaMKZqmtZfW4jz41YsO
 NlhlsQaju2Igzd07WeI5fKOe3NSRkP4EcZad/wujNankDbBdqBgELv3CxK30deP4iYEmoeKSDA1
 tyg/OrY9Iq9n5H5oGTbFMzCwcXKUYQlgtwENoAYTEDHcYXyhhPYGiPJ6czrY2EUafjJF1QGXZss
 Wd75FKmoT418Zo70suVQZOBCg+dm4Wv9vwZeYHJoFMLQhmJE9NEBqH5CvbgAAqh8zGue0SaSjkx
 qUae4XjZ6dEwX0UJpq77XroSGiiqghypC4ooIDKtwknXnakBBqtOAm+SZ8vj33pOTGycow0Q3Go
 9dav0JC3xv4zcHNy8fr+pv+uBdWMwW9f9H9y5w3ItckIMq4bzIPRputFlY1SH6ywaVHHfPfnZR+
 A==
X-Received: by 2002:a05:6a20:1455:b0:3c0:3d56:d391 with SMTP id
 adf61e73a8af0-3c08ec7904dmr4375640637.1.1783397339204; 
 Mon, 06 Jul 2026 21:08:59 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:58 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:43 -0700
Message-Id: <20260707040544.108052-8-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397339; x=1784002139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TR+P3Ywj48Ebd6CA4zSWDQArvv/nRe/DaOErgKQyFJU=;
 b=bh6U4JGwafIZ2NbZcL6rl+vhyQAy/DtQuLQELvFbRobtrtPMM+ItRwPBbQG+7mmMpJ
 35DM/Wk6465ZLwy6kYbVZFWYbh3DYSWhHagtSM62xdAlAd8unqRbDladVqaJe1I8apiC
 de8xd5MoILH/bjXzil36d8YWPlyNhDylQIbYgKzitxCM6aqhv369FavTkmIaSjIe88Lr
 Y8Z1ig2i/UwZ+fVsbHwPLkEi4vtBtvnP3t3sjrUsN+S0dme3zQ1QyZwfQKVF3H5FkIx1
 iQ542jsr/unBphLw2wS1SXkqn9PF6SY80NXWF94aEwWk2ZL775GjiaY5Ir/VFL1ehJ+K
 n1ZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bh6U4JGw
Subject: [Buildroot] [PATCH 8/9] configs/ls1046a-frwy: bump BSP tag to
 lf-6.18.20-2.0.0
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

Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware.hash                    |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash        |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash        |  2 +-
 board/freescale/ls1046a-frwy/readme.txt          | 16 ++++++++--------
 configs/ls1046a-frwy_defconfig                   |  8 ++++----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7981c74137..4a62068d29 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
+sha256  658af40a90fd8e2460d364775a0c37e0507201e49de7f69c8a22d61e179f81e1  atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index f30030c86a..85d5173aa7 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
+sha256  206f997d41bb958099bf7a89a02a6889942b118984f81f9a45bec9907f60708f  linux-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index 38d54d9922..80bbe7d219 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
+sha256  04aed627132db7b656117c7a35fb29d314172319fa3a297ea6748eebac2b5ce3  u-boot-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 57eb743d5a..4312afe40f 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -12,7 +12,7 @@ For more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.18.20-2.0.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -22,13 +22,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.34-2.1.0
-  - atf (fork), lf-6.12.34-2.1.0
-  - uboot (fork), lf-6.12.34-2.1.0
-  - qoriq-fm-ucode (blob), lf-6.12.34-2.1.0
-  - linux (fork), lf-6.12.34-2.1.0
-  - fmlib, lf-6.12.34-2.1.0
-  - fmc, lf-6.12.34-2.1.0
+  - rcw, lf-6.18.20-2.0.0
+  - atf (fork), lf-6.18.20-2.0.0
+  - uboot (fork), lf-6.18.20-2.0.0
+  - qoriq-fm-ucode (blob), lf-6.18.20-2.0.0
+  - linux (fork), lf-6.18.20-2.0.0
+  - fmlib, lf-6.18.20-2.0.0
+  - fmc, lf-6.18.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 838d132d55..346931bc2d 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.18.20-2.0.0)/linux-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.18.20-2.0.0)/atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.18.20-2.0.0)/u-boot-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
