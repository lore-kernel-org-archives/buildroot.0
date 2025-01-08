Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB4E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 08:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EC71400DC;
	Wed,  8 Jan 2025 08:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gxDp2Zvrh1I; Wed,  8 Jan 2025 08:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDFE400EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDFE400EE;
	Wed,  8 Jan 2025 08:57:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30DEE1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 08:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11CCC80530
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 08:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMp7yXA3xExy for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 08:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0F2380524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F2380524
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0F2380524
 for <buildroot@busybox.net>; Wed,  8 Jan 2025 08:57:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso13991126f8f.1
 for <buildroot@busybox.net>; Wed, 08 Jan 2025 00:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736326659; x=1736931459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uri529Ld7WHtELetf7L8yAd1s/1xfNp5PWxo+9vXaGw=;
 b=kdIr2ajNjoN1qsBIzQyqYzhMXKFtFqgXGjN7CpmvlfmFAaqxliDiBLu2d5dvKz8Mun
 7BJvw9YK/xVTYgYRzt70EggTCeSZw/G3/IyEZgb9KX1fUibFSoxJxerxKT/m+2BUaLwT
 xFsdqx7zIc7KlbHCk1XkMFzIG79kKBIuKGYydQgkY3t+GyDls1ZwrZMMJveb2XSNSfPh
 YAbLcLjyH1Q7+XsXu5dMA/OmDxtyme3KKTaXHfddrwnkMi4M6RSolLTWNAgtCcn1z2gh
 GBLvE80HNOzXczHB98BmkvMvq7RkdzvEMs+aBxudTX1NCf/0ToPgDGTGL65poAE4ENKH
 Jxlw==
X-Gm-Message-State: AOJu0Yx2ye2vHsIzpIfsKsL2zcQflKSMoXZkywpFmP5R3j4vcJ/cZXxn
 FUam9zFl8VbrYfZxnNUWS0/bRZ9c+BwXj79U1BInvPp95CT50Lc0fD2kzRYZhq61D2i565C7MXn
 X6Q==
X-Gm-Gg: ASbGncuDDeHi6FYjJoJhXkb0MQsnywqHkx4wDovw5RWdb3+OKJyijUOoxwzzZojtOVy
 zZeT2MF0rwrovPPltUreAZHZA9HmF1fWg3XSzH9uksY5q63279IofqS37b09o3+p4d4g28NeFyf
 0ZSLUtQcazhIvsLNeSiGNw8gCCoUMUaaeoQl7MF0viauCFGhs1iDAx9rXwPQznkOUDYuPYEWMay
 EjEzoPYvCBmdsyu19UQy8KiQvWVxJeBtbqbacEDepR1ZAPsl0Ah7sVtkEQXYqnfP2og8NXEIq6E
 G6LXGVrWg6QNCKw=
X-Google-Smtp-Source: AGHT+IH6F+K2hv+/H2dbge54pYj7bY+7PwogCOHkK/U83zhb/jg/7nSkcFabRTt8cYlGJ/2DZ9NIiQ==
X-Received: by 2002:a5d:6d02:0:b0:38a:50f7:24fa with SMTP id
 ffacd0b85a97d-38a87357a07mr1387031f8f.54.1736326659520; 
 Wed, 08 Jan 2025 00:57:39 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474c2sm51722920f8f.55.2025.01.08.00.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:57:39 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  8 Jan 2025 09:57:31 +0100
Message-ID: <20250108085732.2566750-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1736326659; x=1736931459; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uri529Ld7WHtELetf7L8yAd1s/1xfNp5PWxo+9vXaGw=;
 b=Po3BurkI/uAKWiVcwQlKlQfSv2BggAtvHgrPhNTHRmyqnrFhgwvIgoPjZbaFCsmwBx
 NrJvboFR20Aap/XuyXOioaKse+dwUtCBux5RMKYTVEdBrarPi/vW8Fzqqd1aZWndQYFF
 qlvNN5rM4fQEcZhHzmNmIMUTaGptYh8IBJ3RRUuTeTZ2a53D1ghfWACTwk3gt/rMRvoH
 2olmTQhS9lnNo6qQp5yloRMNguLv5eeyoQ8uG4RLUse29+zx4bkqYDETjQMP9fFKnBOA
 cTi9lPyK4RA51l+9bSQI3xelYaYNdA2u+M6/oskG6Llj9zLlsdsmRwak9TkG9Qwy3KVj
 cRFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Po3BurkI
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 4769129ac..0bc60586f 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5fae869d6a24055c16ffc2d92669e3fb2b258e34d36c850bb8cf9def417ecfa0  linux-6.6.54.tar.xz
+sha256  9c6305567b75d99514cde6eb9de39973f3d5c857a75bd9dcdfca57041f8d4f34  linux-6.6.69.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index 849143568..2f55c44ba 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index efa2b6a24..fde347384 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.69"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,7 +26,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index f376c6cd3..9275b5fbf 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.69"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,7 +26,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
