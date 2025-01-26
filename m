Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE6BC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 13:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4509580A6F;
	Sun, 26 Jan 2025 13:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoHI891bvw8F; Sun, 26 Jan 2025 13:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46FB480A75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46FB480A75;
	Sun, 26 Jan 2025 13:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A107AF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 890774023E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 13:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Zb1ITatgxas for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 13:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CC0E40B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC0E40B04
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC0E40B04
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 13:17:21 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso3962266b.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 05:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737897440; x=1738502240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3YyQAfPm1xOqfZkbve4cDPA0tXFng3JqXRyeL7EOOvc=;
 b=dpf7z2PjuC0+NLYB7glGTV1+BlY3WKw/xmGX6VQPPUbGTIWwUAfog0OonvAtNOdkCq
 pdMRo1aZK/DUVbiPx5gffLeT8KksrNjFOfrxd+B4Eo7gfh+7TUJr0CnVxpBiJhEk8Ni1
 2ClkBQAjKCbfLdlpb+cGnblCQBi30h7dnCbYpbJrkfq4ghpWObiGYgavVro7ugjQ4jja
 a/rur2ISIFJvFqIQ9a92UpzdhO1Nq+XSPVxSi4K4aWU82LKUlm36KT10O64fWuT7jI3a
 dmCZ2r0a3W3gE3en44i+DksUAx+39OeNvX4tVscaeoiabGJwjSYhJ6QbhJVnQe5GXi8x
 YXTw==
X-Gm-Message-State: AOJu0YxGQTc1w40niklK3GpwB2XxvC9XSp+SpbzH1JGGQAgLbVSYBbSC
 NtwNmPMmbqIks1HKta5l4vfFa2Cd9gZr5VAMSTc/LcZ8CBRMdy6L6vLnkfQ0qQFUoEjeIGHRbsS
 N
X-Gm-Gg: ASbGncuM4/RdKK3qVYD0xe8SXHzxEnWgxfMATmxv9n2a9X0Vr6rUN+WF74sxQ2U+736
 Ce93vUNuQjROCSa+HfGZEOCdWoI+V4CmoEMgi34/3ENkcrnxYXZ2BgK3XKsaxa+0pp9aBt/ZPbv
 9uVP3Q3/4XqZydu8J0Ad535I/NPYf4rhpfYoD9tfPfuFvIYeHAJHoMQZhUZcK37/5pXbVmFSmkL
 6vfCmKf8KvzEvlqIJ4Crs5o9PZUMpCOeDkwhvgfVKx7Kw5x4Djd23T6/iSbWeYslma8SRu2sFtg
 8I7pcZw88w2V2G3BdS0dEqoAGbiwKpdI0og34lD4Xoi/5z6OvbpFJf26unydPb9Q9JZ2QnDpzWX
 ViHw18cNGbu31tymySKpPmqKlkBh2E8IXZT1k9Z02ScFZBao=
X-Google-Smtp-Source: AGHT+IE+94MqXaIkIJFMv6j3gcqA1GG6hEKp2n2e5eSBApgpfc1ccNnNr0woqjSBYI2xJd8e+CCXZA==
X-Received: by 2002:a17:906:c143:b0:aab:9842:71f9 with SMTP id
 a640c23a62f3a-ab38b10ffbfmr3163998866b.22.1737897439619; 
 Sun, 26 Jan 2025 05:17:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-24-84-174.retail.telecomitalia.it. [79.24.84.174])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e1251dsm422793366b.23.2025.01.26.05.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:17:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 26 Jan 2025 14:17:16 +0100
Message-ID: <20250126131716.2663079-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737897440; x=1738502240;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3YyQAfPm1xOqfZkbve4cDPA0tXFng3JqXRyeL7EOOvc=;
 b=KpIIVjfmF55HXs1u4536jD0CtO1pPOzQOme2lyMyG3u4mNITHymYqn6+XmDFnuIyDO
 APE5GT2qoMh5t8SuqRccDJxzf5A5CStxLlL8yC+Z++ZGjQT6sB6Jpb65v8VS+VOjQmF2
 3nidPhRoMMy2jcaBKqgSOxHCEXrtABaPphmUU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KpIIVjfm
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to 6.12.11
 and U-Boot to 2025.01
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

The patch bumps the Linux kernel to version 6.12.11 and U-Boot to
version 2025.01.
Arm trusted firmware is already up to date.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 706ddb8dbbd4..4885d0b08648 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5ffceb2350db1547e69231a63df2d3beed015a313d7d7adf8b5cb71dedaeb16a  linux-6.10.13.tar.xz
+sha256  475172fdbd87a153f123a57952672e773bdb6daf5b58a417d1a5e419fcfeec49  linux-6.12.11.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 904fa56c02a3..50674352d71d 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 0c37fdc167f0..69f800240925 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
