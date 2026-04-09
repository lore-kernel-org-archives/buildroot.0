Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1695DF364AB
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 17:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C360781199;
	Thu,  9 Apr 2026 17:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f6KtmaLEEaA; Thu,  9 Apr 2026 17:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D888A808D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775756416;
	bh=6zlbUFDVlksnwu4txxHGlrSovzYc98RJ20t0iOc5GQM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e5W6G8S5Ob4A1d3f0hxN6M7WsuETIBRHQ5GhcB2kOsa+yvC9AALMcGhjXhYfw09YZ
	 DUCfPpabb4GVRPC79CRVesJNbeeEtj+tj23PpGkyQmQJyspc9at9OBFB+pnndXMPKr
	 4FEBKP584T5BmmBxjdK/tEnqDxrO2c6YVf7irtOl7m5tHFDEPhiRBPxM/753s/nS9O
	 bvEcndBJ56qkhEmZ/Chm1hXMzSH4x5F+4KAxcpL+3Gcsq/12GofOLP+opSYSjxPbsl
	 otD4DTZYo/yNxfrY7f8CXUzmfBxA8Phs34GO7FV/44yoCiAvkp4QpjggYbcVBN6WFU
	 uekw9QJPx//+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D888A808D1;
	Thu,  9 Apr 2026 17:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B2E7237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28DCF40426
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYvEWKatqWDN for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 17:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5644140425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5644140425
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5644140425
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:40:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4889e045bc6so12462015e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 10:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775756412; x=1776361212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sB2DRnwgd1B0PzcTXLYsfvDQP9P0giroekZQ8XeumTk=;
 b=BNs92TZYYNBxk+qJyDkt019/kFEHV5rxCFAnV8jRgMsne/kSBuSE74RPFVfjco0oyQ
 WMXMHEsfXzezBYMW3y9IIn7SSa8hDT34gr96Sqt7d10to+Pac0za7ItKVDMBuzegl+F1
 UoPphNj4XsMm1w3PAZ3lAUvZuHcIOVJ6Jsg/9YIWsIqWdrz9cQYzsUWD06xuv2EKyuRj
 HRWA0ydTYFvLocLj/UHAmTf2KqJbtznfFxflKYCKJEe6fTEFi0P4q65nHPByd27wEhGW
 CH4fU4Ea9oVwwfmOcnEgzMNg44weq+8CrO7gKhz9YDOILSLKNenCuJcqnZ6jJo58HNbt
 TbtA==
X-Gm-Message-State: AOJu0YzupWV0PCiDpzVop5tmfEIinDGbnfpFvTvNmEynsO54UvrW3DWz
 cMVKtiwToFg7kz3K4+qhAzXJR5870V3B84qHK4fg4Rb3ffvDb6I9wbd0GDV66Rdtec/WgSVzixZ
 dCA/W
X-Gm-Gg: AeBDievW0RVl8Mc06fIvwsI6cYqJC+tJ3xDVCgZFB8hOTjXZ08394JBmgO1wjoomMgc
 zDK4EFl09v/IWVlJgjNUaWu0J6ZFwQxqI6xsTSgn4QrmcX/RkTRpc6hzzCKG7ptGxjDyhwAIib+
 FvILF/ZzZfTUlUPHPl3fPu6Hu9iMxlQXysMz0cQxng/G2yDZGy4c1imKdC54Ae+6DsAS/8ES9PC
 097/bjrhJehnFXvIXFPkdRxqUdCQsQYjr0LwUcxaGRW4cQBEY7LGlmzGq19ujtldPygLpQC2NsG
 LbAllT6eycEK4nii6zSBM3NjczvZsrtSoJb+px+q+uYX+32zXv/jLz8pA6/ewuoAdZwH/YMOi9v
 1PyAlasDaSah4+Rbs4TqL270909Z5h+E3jwFRT0AXZFHOVnz/ff/uN9+t3bxTh5By0kW7iU6E4G
 GiN9yZFabqJZYWcgdas90KuaBw1cr5FLbxMyySc5I3rzCFkAwLFdk1VheGqk2SRpzcsBTVgsXM7
 P8sdewlyCIHHpL+J1AeFZ3E8l8KTGNAFwLkh5JnmUX8A54=
X-Received: by 2002:a05:600c:49a3:b0:488:8bdd:cfb9 with SMTP id
 5b1f17b1804b1-488cfa1fdafmr29725225e9.1.1775756411984; 
 Thu, 09 Apr 2026 10:40:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5888acbsm9360195e9.1.2026.04.09.10.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 10:40:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  9 Apr 2026 19:40:06 +0200
Message-ID: <20260409174006.3948266-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775756412; x=1776361212;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sB2DRnwgd1B0PzcTXLYsfvDQP9P0giroekZQ8XeumTk=;
 b=GXugrnmr5nMM9dzF8dR6NNPP9K7G2D8RlMIX9Hhw5n+SWae5uKNZZ/Vf5PCQQP9GJb
 LnnOWmkNBJbV127XX3D4QSFAh2vR0k/5xQIDwT5X86wea6IbifomJqo3d+7JfJQcRYwg
 GsMzaSRYoSNJAtR6UJakUM+3ezZH0q+tm61ao=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GXugrnmr
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.202
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

The patch bumps the Linux kernel to version 5.15.202 and, for the SD
configuration, also updates U-Boot to version 2026.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index 50c6664f950c..7929b2b9e344 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index f1cc193cb59d..c58523217e22 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 08390f56ff25..9124177193f4 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
