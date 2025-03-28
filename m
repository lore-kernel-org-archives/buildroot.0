Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3ADC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB29C8594E;
	Fri, 28 Mar 2025 18:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IebgXs9KDiUy; Fri, 28 Mar 2025 18:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA48585949
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA48585949;
	Fri, 28 Mar 2025 18:04:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A90371B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FBB8424FA
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVY4KMmuhbbc for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C4CD405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C4CD405A1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C4CD405A1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d64e6c83eso2577165e9.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185084; x=1743789884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNp69jQJjJ3lPmxSgGFuSxUR+u5ZRWak002Ct61ZY8k=;
 b=X2zI51/F1jSW4XOWmhq9T8eEqyEi8LNca3Ns7Ww5qemCGkyz4vukgNVWuoI/q/kQ9m
 IpFcAO/qIwJiJcnYzPtLnt83h/CnyOvEhRgQkp61qZtInJPRzOcX56EAZPM1ZHO119JB
 rOZWktuUO1pZRV3MVevTOg/HtKQW4A+gCGr/pA2+k7IxNKNetPkia0DZQVdeYUA5lR/2
 5Dspz+dFcBnEjuyjTY8A20G6OzFFH/Cm63zg6hMoScgUzFuNSb/zVnmzxOBlcWSXh2gw
 G79K7P173JtZzisBKAeQLS3gvIEBOqh9PDkhdkRmbzJNglRMuj0LLVVb0EqCwixA6x4G
 fWDA==
X-Gm-Message-State: AOJu0Ywc8UEIHl8irpNt/DkvZEwxyR7i/63qMG0BmtXOBi2ZOJKrAQb4
 5O6dyXAdhLGHpXCtSlUP7BFIvelEhDI798H8ts5cm/ZLdKH9TYMmvscS1yjO
X-Gm-Gg: ASbGncv9jQnVy1Of+QtmeEL2lSARywX3F+/NNAmD/NT/WO7bl03qRVqlO04jE49l4M7
 Ej+I42tKJxlhL2jsWJStGbW+bkxEvS9yKwhqXcvBYF5Ya45G/oj/PhhPnX4YjWPF1keOmLlT4WO
 s5UcR8fOR+8B8L3inBTTUU1kCnyYTU/uZ+yuCiToxGCbjh4s23ZUqlz7dNErdWXqFq1ArZUFWEm
 xSraX0qyq/21492aRV489svldVF2x119DLNxW0z6B9f3GUKkkTlkyBbKjtgShLbT4gIKxtnw1JA
 x5z2QJyFq6FtvJx+j+213pTPwzGLnpjRNRqjPA==
X-Google-Smtp-Source: AGHT+IGCc23zic+b/AwKGIAF6AAMDG0yPFYI9Xij0HDWSlZGSW7qb2zeITCYjVW4lZ+CYHtCKzXHNQ==
X-Received: by 2002:a05:600c:1ca9:b0:439:88bb:d00b with SMTP id
 5b1f17b1804b1-43db8516c5emr1902385e9.5.1743185083778; 
 Fri, 28 Mar 2025 11:04:43 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:42 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:14 +0200
Message-ID: <20250328180427.3434693-7-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185084; x=1743789884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNp69jQJjJ3lPmxSgGFuSxUR+u5ZRWak002Ct61ZY8k=;
 b=SLbtK/bZqaWbj7AnknPEFmyOfIPWBPZHqITOthvH0oaSJ0Etqn1HwVWlMY4F6i0Qw8
 Gtj7WAd21wZp8eEcIFZhNVjVlMafpJGjaOuul1hwTrJKk8+i1wNKNuTw/CGGWHMlfueV
 wnx1xj3hSXlrKDmPY3JDvQvKTVTZWL4OzyFZcrD1RfOMAzNGrwP789J+tRdhy3tbKWqq
 1wqwNHLLrYR/9U9kkkDM0rybyyYkZsY7acYnGRin+11ivXedJzeNRCb+gauZgL3nhF0i
 +N2XkTg4d8EqVWOrhv7JYmReYuWbXm6mhY3EB2sT17dOpLLbtXYmvHhu4GpvDRs6eH3M
 6KrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SLbtK/bZ
Subject: [Buildroot] [PATCH v2 06/18] configs/ls1046a-frwy: bump BSP tag to
 lf-6.12.3-1.0.0
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Linux Factory tag is lf-6.12.3-1.0.0 (Q1 2025), update to
that.

The LS1046A-FRWY board is currently supported by NXP through a BSP
called LDLSDK. That isn't what we use, so update the documentation to
reflect that for awareness, and provide a link.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: update to the now newest BSP tag

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |  2 +-
 board/freescale/ls1046a-frwy/readme.txt       | 30 ++++++++++++-------
 configs/ls1046a-frwy_defconfig                |  8 ++---
 5 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 344a6299d88d..41c7ad4068a4 100644
--- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
+sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
index fa38fb1f75b1..43dbe074c2ec 100644
--- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
+sha256  9e2fff1014f1b196be8149c63a6054e40b1b36b222e53db3f445c96c856066e0  linux-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
index a1e3b693768d..5e36d9348789 100644
--- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
+sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index fb1c82067ce5..8c83a4eac94d 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -4,20 +4,30 @@ NXP LS1046A-FRWY
 
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
-  - rcw, lf-6.6.52-2.2.0
-  - atf (fork), lf-6.6.52-2.2.0
-  - uboot (fork), lf-6.6.52-2.2.0
-  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
-  - linux (fork), lf-6.6.52-2.2.0
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), currently tag lf-6.6.36-2.1.0, two releases behind the
+latest lf-6.12.3-1.0.0.  In Buildroot, the latest Linux Factory release tag
+is used, which may be considered pre-release software, as it may contain
+features which are not yet documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - rcw, lf-6.12.3-1.0.0
+  - atf (fork), lf-6.12.3-1.0.0
+  - uboot (fork), lf-6.12.3-1.0.0
+  - qoriq-fm-ucode (blob), lf-6.12.3-1.0.0
+  - linux (fork), lf-6.12.3-1.0.0
+  - fmlib, lf-6.12.3-1.0.0
+  - fmc, lf-6.12.3-1.0.0
 
 Build
 =====
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index a138234a1423..7d7e1b5686e5 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1046afrwy"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
