Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E37E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 06:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD60140967;
	Sat, 11 Jan 2025 06:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxp2wdtOOpHv; Sat, 11 Jan 2025 06:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D51409F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D51409F2;
	Sat, 11 Jan 2025 06:38:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27B70950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0673360E85
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02H_dCsy1idN for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 06:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18C4260B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C4260B91
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18C4260B91
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:07 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21619108a6bso46910395ad.3
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 22:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736577487; x=1737182287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G01peBde40/JKioGwUs2eOEymqSwK3whWVWtJzVHeQ0=;
 b=LF0zH3S9pQhi7c/XoPqKjL1HfzIFqrMHo2z7sogP5kwi7CJfMwE3MBH2HCSNVBwTIf
 zR2Nt48APpqCWpRsjF30ZgDIaay2YX0BHU52Ozp/ZZjktpOr7J073aUtWddWFp1NkXE+
 dlZDM1BDFTHLaVUY6uK0gLMOasvemVdIX75ZthRnjwB7usndz5KgNCwcwDQA66N+2PaA
 BEkNmi8rRMY4WrOXbcdze6D2tI9I1gNBXRAh5BK9+seyomnNuwPb0WkB+WI+z+qjcqXE
 xqkjWlSMYC9pShhGuId7EQY9hPpQMx3ID7Al1QZxDq/yj1Ffn1Xwd807qgbkIawTfz5f
 aABQ==
X-Gm-Message-State: AOJu0YzNWVBzVZc0bgPfV7YAuwKgRIhvOwzBplR5bL9HbzjAB3hjozil
 SV03us5W6jBHrI4EyAm6ZPNE/uqN+v6+bthi6UbekhS/Isk/Ulodp9s6MrZL
X-Gm-Gg: ASbGncuFF9sxmMIPGpmypawhHwKMvnChRVwIF6glA0bxEFTUamDnyGLVyzyHVR0g62i
 eVm9tEwMVHxq8HjpKHO7EI44PoFCLvamkJ7m1mzG9tGSxozrVGH2muOpJAVZ26UBIfWN0zoe/Pf
 V/9pi8aq6mSzVRHai15qhaYINCi3F/NMgoa7SAx2TSCoYxF4MtuiZsGwFYVjMTrEBinIQQulops
 vQMxn/T1e1VcYp+AwePo0BMneVwU+TaXsJy9AyCZlRQPsjRZPgBwWIg9CtCs4qmp5i2d9LZy6Uy
 JaeAZOg1P5qCrcqU0MvTdXq57OT5PdznNnz70CQD
X-Google-Smtp-Source: AGHT+IFHsg1S+r7nI73zGm7kKJz9Ckh0gJI6pELa/POyLjLhdI4/+6bvjJcnSY2WTJnAkvaQycc/Og==
X-Received: by 2002:a05:6a00:399a:b0:725:f1ca:fd8a with SMTP id
 d2e1a72fcca58-72d21fb1dfcmr22298528b3a.19.1736577486895; 
 Fri, 10 Jan 2025 22:38:06 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406a9433sm2477488b3a.176.2025.01.10.22.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 22:38:06 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 22:37:53 -0800
Message-Id: <20250111063753.769689-5-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736577487; x=1737182287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G01peBde40/JKioGwUs2eOEymqSwK3whWVWtJzVHeQ0=;
 b=JgEwVQSey34zWFz+wAUEsWqoKACx/5QuqEKOp1eKS3JMXNSzrDsShJ6DwJMCED5yVX
 TM3Hvx1A12VTWbb7DMUqd34QZD9tJJFX+q+IGH5L+fqigDW+dxEA/0ob8x4BwdPVcT1i
 JqpgC5SMhguayAK8ItlwG0ekJ4ssdBqm+2GK7Bwh5Bb16TtoiZicoTYjQxrKnNeOhfEe
 zq73H1nY0Opaced3FlyoLTdJkQJkTrPG0QLbZXqPY5fz6/ZEHWG8+xUcke97Prq+0KlV
 tsq20TpEtxWgpr8doFGtDZCdXtkbLjh5a3U/7oYbyhdnta210SytN2EtSx1Iw1ogfkq7
 K2RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JgEwVQSe
Subject: [Buildroot] [PATCH 5/5] configs/ls1046a-frwy_defconfig: bump BSP
 components to lf-6.6.52-2.2.0
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

- Updated Linux, U-Boot, and TF-A to lf-6.6.52-2.2.0 tag.
- Updated readme.txt

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash   |  2 +-
 .../freescale/ls1046a-frwy/patches/linux/linux.hash  |  2 +-
 .../freescale/ls1046a-frwy/patches/uboot/uboot.hash  |  2 +-
 board/freescale/ls1046a-frwy/readme.txt              | 12 +++++++-----
 configs/ls1046a-frwy_defconfig                       |  6 +++---
 5 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index f9af28ab3c..344a6299d8 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
+sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index e038c22862..fa38fb1f75 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
+sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index a5ccd82b2b..a1e3b69376 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
+sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 4d1e0e1dcd..1a32bad9bb 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -13,11 +13,13 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
   - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
 
 the components from NXP are:
-  - rcw, lf-6.6.23-2.0.0
-  - atf (fork), lf-6.6.23-2.0.0
-  - uboot (fork), lf-6.6.23-2.0.0
-  - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
-  - linux (fork), lf-6.6.23-2.0.0
+  - rcw, lf-6.6.52-2.2.0
+  - atf (fork), lf-6.6.52-2.2.0
+  - uboot (fork), lf-6.6.52-2.2.0
+  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
+  - linux (fork), lf-6.6.52-2.2.0
+  - fmlib, lf-6.6.52-2.2.0
+  - fmc, lf-6.6.52-2.2.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 2cf0f9c8bc..52d8f0cc07 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
