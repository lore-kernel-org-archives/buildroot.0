Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5973C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 18:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA2580F79;
	Mon, 20 Jan 2025 18:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 805QoFcYBy6Q; Mon, 20 Jan 2025 18:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DED482EFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DED482EFC;
	Mon, 20 Jan 2025 18:38:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A143959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F355440FEC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfjJUYnlE05U for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 18:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E090400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E090400DC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E090400DC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:38:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so52922835e9.2
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 10:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737398310; x=1738003110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hz+JSS5jLs4Ec3cuWSfJmkFXBhveFe1xga351ZcCENk=;
 b=U5KGYJFdfRFvFnSk0nioXapFk8AzehQgObupcpGjli0t0NoevFA3pVpsTgHSZr49Qy
 LeGUIxTmQZYgGORZbsrNObrL4VN6PaPSnGjd+0YlE7Ofz+GmRhnkZYP9/4ZIKZZ7AASD
 D/pwoFJ1guWSIwXSPiFtoYjz7Gk1ycAh0tyHD8dDu+fr9aQs0BKUWr6FUjkAapSEx07x
 CZYHr0Ue2UIYdYpyQolr1KPp22QpipibMkTEBKgDrqlmEyYNqlEkAOO9XOlcjSKaAH2M
 dnwuzQZCxQ5zU8OiUqD8THoatHmhH2/JbRMcR5xrUM+YfoIYifN1b6UGoFYct8VHoiqS
 RKag==
X-Gm-Message-State: AOJu0YxoGfYD0Z6eC7NWc8UycLRvWj7g7Xj1JnzBNb/MyQHuV4jurRsC
 eZsT8jos0DgZZgDQqoXrExIj6eUkcMYqOeBF7SNim/SNJjiAk6iyY5gg7nzMIE0xjiVxLGWu80f
 2
X-Gm-Gg: ASbGncvenQzFfPIGbB9EiIlm6KnCr+v+8206oARf3zGDA+hiWx7rZGue9bJlXL4Gobr
 7AiAZUzVUNEq0vLQj7jub6F0wGxHMVOdRuPNnHb/BuZ9xyjfYjJ3r7MdQS2w7AGzDpU2Yw4Kc7z
 kOJZ8LEa5rYASVv8CB4hzvGYK8itZjTvhyJEzK1bA6LVFmu2N2vYxYZbU43RyDMHXtVU1n40Bjy
 zTQlKRDft3UN+l7kyIO6CkceRHhwxQ8syI37dW6CV2l6fsv/Q+EJcJKfh3aaxdjv+3iklco9Hml
 qAgeXxVdlle54fxfcPCmi45/Hgxm/Tyf6jU9DFzfjpx80+OmGytcLpQ4mBcy
X-Google-Smtp-Source: AGHT+IEtW+OgDVoJlt934omsOA8i1FO0DdnI3LQjI6HleWiml5IhSkaNTyKDL2P670anPIe5V7iWfA==
X-Received: by 2002:a05:600c:1386:b0:434:f739:7cd9 with SMTP id
 5b1f17b1804b1-438913cf349mr123730385e9.9.1737398310372; 
 Mon, 20 Jan 2025 10:38:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890421fabsm148595155e9.24.2025.01.20.10.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 10:38:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 Jan 2025 19:38:27 +0100
Message-ID: <20250120183827.3343737-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737398310; x=1738003110;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hz+JSS5jLs4Ec3cuWSfJmkFXBhveFe1xga351ZcCENk=;
 b=nKdCRemPtBrwB63VqSZZ6mxvj0A9gbrTXF/Hg7Ef5Yz5JPQjqFQXTO0gziEJqmf24L
 10uF9vFJRI060JlIoahKHWbJBBg6M8a45MGCxG1KjKhCgmEP7FXtyuaf52yK0pmoYp0I
 Q22MgnNPCFG+q9rgGtLbfVklsxPMGCi+zPBAM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nKdCRemP
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.176
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

The patch bumps the Linux kernel to version 5.15.176 and, for the SD
configuration, also updates U-Boot to version 2025.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index b241c795baac..57c69adb36ce 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
+sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 904fa56c02a3..50674352d71d 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 84b22d596c91..3aa27f10ad02 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 7c79b10e1fee..67db22f9332f 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.167"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
