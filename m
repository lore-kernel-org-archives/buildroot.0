Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CBCC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C87A826EF;
	Mon,  8 Jan 2024 19:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C87A826EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNxWHjhdfVHk; Mon,  8 Jan 2024 19:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC16826A8;
	Mon,  8 Jan 2024 19:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EC16826A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55B421BF2B4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 19:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DECF826A8
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 19:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DECF826A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07TWHHlXK9mA for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 19:25:41 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46B1B82270
 for <buildroot@busybox.net>; Mon,  8 Jan 2024 19:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B1B82270
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so1334276f8f.1
 for <buildroot@busybox.net>; Mon, 08 Jan 2024 11:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704741939; x=1705346739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/85/AGCbGgUv71smPuZCPrhgDRCjYMdUj4moH/e7htY=;
 b=Dz45TaP5mQIL/keKGkOSH83NWMRx49eWqflM5j+IEnvaczeLo7u+fR68zt/yF9Wmyl
 78o5CnwaabqEAcZqsh7TP9UyPFVPQG2ceBkfmHdNCtp5wsX9hV6SEMtwUKpXYghWTAF7
 rz24NuXpCcwoFtyRJWL7C81ff2zglrBUHv1d6j+E6KrHhvqXF6ENTE6ldmVT5tMAMLWA
 usdTOPUIXTJ/+a0OCfHu/B8nr39mw8YjUkLlraZscT0FJ5UCr+9RLTvlB5+1yHM1w7DF
 lq9FYv94WyJ8pvtjfNsTLuQON23eQs1qadkHTdolYGCW01UWqplXWfEInhVPyERxYWqS
 0Rsg==
X-Gm-Message-State: AOJu0YxeYawpj+FD8dcu9aR+5QmKZBqI9FnF1tPMAyn6iYphp5ZZUG7i
 jC7boAN8WpnyfpVpulHPVgGtw2XF70I=
X-Google-Smtp-Source: AGHT+IHjG+k4NHE3ztlD0EhBYN8SmWkv1z6f+EDNk0eQa0NbCGJZoVohJSq4smTOW38IBp9urnWlkQ==
X-Received: by 2002:a05:6000:907:b0:336:7b4d:deb2 with SMTP id
 cw7-20020a056000090700b003367b4ddeb2mr112996wrb.29.1704741938988; 
 Mon, 08 Jan 2024 11:25:38 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 l17-20020a5d4bd1000000b00336a1f6ce7csm413730wrt.19.2024.01.08.11.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 11:25:38 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  8 Jan 2024 20:25:33 +0100
Message-Id: <20240108192533.2720-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704741939; x=1705346739; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/85/AGCbGgUv71smPuZCPrhgDRCjYMdUj4moH/e7htY=;
 b=iflf2q3olMXJq5KpV/IdpASai9vLTz8mmqVXk1fZfWTT/NDaqU/gcW7fZGoMP6o33B
 edIRpdHeVQRKUOhyK+6b+FcafsfsvEDSDh5Uj38NfGr8Za85YaT1y0pYUqnrKQA8tofT
 9i5NatlhLeMfYzUi7QIbXV4b1J5GhkVXijfAjN8h5n+wDcjMXpRdIBL9+gLtJntno8c3
 rSM37vnxcT7J2lGRv7pXIu/B09q08LNqDFi/ErkLpja2YfZh3yh64hFwji1aj4+FDjho
 zEdwb2HR7mNyWc9In+S40FB6j+zbiIf/nISqxBLB/yYj9wKHvQ/abCz7tcnWF1Jftbf5
 Vm2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iflf2q3o
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 10 +++++-----
 configs/olimex_a20_olinuxino_lime_defconfig  | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 3294748b1..bf4420739 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 6.1 LTS series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Toolchain
 # glibc is needed for sunxi-mali-utgard package.
@@ -23,12 +23,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.55"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.10"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-olinuxino-lime2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 6b46794df..5e26eaf85 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 6.1 LTS series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Toolchain
 # glibc is needed for sunxi-mali-utgard package.
@@ -23,12 +23,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.55"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.10"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-olinuxino-lime"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
