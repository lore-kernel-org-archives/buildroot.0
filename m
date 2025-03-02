Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7698FC282CD
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4708B40DDE;
	Sun,  2 Mar 2025 21:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVsfgieaykDB; Sun,  2 Mar 2025 21:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10BC413A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10BC413A2;
	Sun,  2 Mar 2025 21:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3DC9958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A10CA83F62
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QorJ1Jxc_Baz for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32ED783F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32ED783F5F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32ED783F5F
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390ef13838cso193320f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952360; x=1741557160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52V/6pxj6nJwQfiU0Ntf68nUWH0NjuhYAEoKqJUJ9qo=;
 b=rIqgpSm938RFz95pLH7NU+sEtgsnlh/MVbjcoaBUZ+LAQseqOlh1Jvo7+GYAh9K4iL
 mP+MjK9cEyOY7+6K5AkB1PlLkmCrDXNp2DtrkMgjLJ6kl2pa/FnJ4O6YVDt7XpF9C/FX
 djmglHre94O0ApeCSGWfmbEPdAMDbT6YYiy5JBnPI9w/CtvQuM+wh3GHLg9dtmlSGHfD
 nVNUssVdXOvWGfw1FCdN6UqMo/tXXEkqJ4kJdfGS1NBe7OzTpK07Pwtl63zbO3BiUv3O
 BWpQdt1DY0qlzHZp45dfFhAe3PaF5ptMqJIyMIU0k2H/A5xnbJzSEvr5kyqpiNFJX0tz
 ejBA==
X-Gm-Message-State: AOJu0Yy7gfUzsZXC0VCBsi/u+mW/Tuc1sTiwMUZk/qAnYluZWuyGrcHI
 0PYkHNAMznDed3ruyDqm8i+pba6PTgnoWMa21BV1ee5u4otjaCxIaLH9BL6F
X-Gm-Gg: ASbGnct9S1UiZvGncTV4cHEsZv8+dsJzGYzuAf8K4g+M9W1agfyOQDExF12y3l2S/YT
 LVw9SGbD9X/0rqdZVr+2uK2TWMl8BIRCMfHwjyKR2w5/VBPbEyRtrMTYXt/YPmLzUQs/CjWHn37
 Y64YEo5T2opMIyxWK1CIJCmveNwa4a0nUcrLQduqFSTJWTDSyMoC0F1pIXRB2Vvc6cJbwlI5w+P
 97IrN8Ne2PpAT28hkv7qQ5V0e5idcQ3jJ6LzCMf2xwVCyL0VlrX/u6PCsjucnIeqBDiyxyFLoGc
 omUFqyj82gp+CncV+AR/QCVNzRSxut1RQroE7A==
X-Google-Smtp-Source: AGHT+IHqjAJtDVsr0hEoJpkhlybiv0F7ISSoNwFVhZcyWj7n8YYysCQMkTPFRPL019nj9U+c9x1arQ==
X-Received: by 2002:a05:600c:154a:b0:439:9821:7938 with SMTP id
 5b1f17b1804b1-43ba67448e9mr37613885e9.6.1740952359356; 
 Sun, 02 Mar 2025 13:52:39 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:38 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:07 +0200
Message-ID: <20250302215219.1276480-4-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952360; x=1741557160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52V/6pxj6nJwQfiU0Ntf68nUWH0NjuhYAEoKqJUJ9qo=;
 b=PBPZpgDvsaqOCoQ9PeQJFUbaf+U1kjjtlte4r03DQGUcm/XWlJW8zLc1gA33BYy99L
 NesenXpnJhOBYoiIPdCHXNYVASZcwUQy3bz4oGvYHtdXMfVQFKA5brTSluDOLwBUxNEh
 cFXcKdmYx65ib9tZut6k6UxrV1m7peGN5m9bv6+uGmDqZEJVL11dGzxXudqt7CzLD4eF
 igj+lMcxQ1U4/vNjACQLoE5Xz6oFN26tUcEHb3S7jBbVq2W9HjQibyVySCZM4UccFM+d
 lUZkr0atyEk9N4VxK//wGfPxDLQj8dvbQKykjuL405M1sB29SxYMvUgPj+0FtT/jQvUX
 YwNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PBPZpgDv
Subject: [Buildroot] [PATCH 03/15] configs/ls1028ardb: update to
 lf-6.6.52-2.2.0 tag
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

Update the kernel, U-Boot, ATF tags, as well as documentation, used by
the LS1028A-RDB to the latest Linux Factory release.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Break out LS1028A defconfig and board patch file changes out of larger
  "[PATCH v2 01/11] platform/layerscape: bump Linux Factory tag to
  lf-6.6.36-2.1.0" patch
- Bump to lf-6.6.52-2.2.0 instead of lf-6.6.36-2.1.0 (new tag appeared
  in between)

 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1028ardb/patches/linux/linux.hash       |  2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |  2 +-
 board/freescale/ls1028ardb/readme.txt         | 27 ++++++++++++-------
 configs/ls1028ardb_defconfig                  |  6 ++---
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index f9af28ab3cf5..344a6299d88d 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
+sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index e038c2286237..fa38fb1f75b1 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
+sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index a5ccd82b2b0d..a1e3b693768d 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
+sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 6633d60b9013..0d83e4370912 100644
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
+tag lf-6.6.36-2.1.0, one release behind the latest lf-6.6.52-2.2.0.
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
+  - rcw, lf-6.6.52-2.2.0
+  - atf (fork), lf-6.6.52-2.2.0
+  - uboot (fork), lf-6.6.52-2.2.0
+  - cadence-dp-firmware (blob), lf-6.6.52-2.2.0
+  - linux (fork), lf-6.6.52-2.2.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 0d1843bf5fce..c47761e7cff5 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
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
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
