Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58A5D26D7D
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 19:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7A540C6F;
	Fri,  9 Jan 2026 19:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNaZv6YjdYZH; Fri,  9 Jan 2026 19:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A906740C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767986399;
	bh=14vYkLilx4mh4Up8DBI5xTxp9bmLABsmNML9XJQiJF8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XdY9wn6nzkKSn9Y6FPHdpwxqcJlwhOXRaZlNXTs/T1p1VKClvA+3car76nJq1IZrY
	 /KWbCUgYwVSsHpoKhm9Z/yotflsTwJ+qffcu7EZU6i7PAH+8zPGLp/UX95h6VSzjwW
	 DcmivLmBnuiwVjBqC/lSbe/GQvRY1OXEs7cScWywU0vCfyOQ0pSBq67mNkj1qAuAc7
	 ClzcOF912pAxHmbKQilPhW4oWQXtulajV9kxf9VfuSTs0z1s2dZ4KH5+d4D9HhPF+S
	 GKOYiIFOCoY9QoFMfpgltAWrtpSKLstTpo9Qo0/EEwVO5L8qqwZS8LrB2BP0sVdz0P
	 bHQ95W7bm3S0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A906740C72;
	Fri,  9 Jan 2026 19:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B24131
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652DD60F02
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bumjqrPw-gf8 for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 19:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1874660EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1874660EFA
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1874660EFA
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 19:19:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b727f452fffso523408766b.1
 for <buildroot@buildroot.org>; Fri, 09 Jan 2026 11:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767986394; x=1768591194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFoMCJu373f4dnM3vpvN3H2c00djpqawHrOpCustVp0=;
 b=flOzoUum4raPQ2SJoAZUMwIHVRithwcduyaocuI/l3FCBN8x5fI4rgcKypWyMTI7GP
 V/sc8xMHsSW3HN514xe3Fj54xlWImZWOMyvhDsMM5A/k8KXJm6soGL68NZ1nOCRENnAh
 mBGxEGjODT6/66e/eUPn9O+PgxnZrYEXLxsZDGNlMd8l/VIgfHCmLCXZFmEuUOREWVoT
 7XnyzIr5S6zpw8QV9k8YzlyTSGjNu5U2Dm1+/byf0OBdjuClihf8soPKUyJ3wluw60f1
 ZIILJgGA6TBtSFr4LwIMKwusvr3GC3bLehQEQqa9U3aWoV9nv6ppK38nttiSePIPDpRC
 PlfA==
X-Gm-Message-State: AOJu0YwLr4OwdGQ1mVWrhlkJOIIG0rdDFkSANhz8LhrAio5qTtSPajio
 a6cIONClXu2DpTwwjRb3vcixrQUtLJGHgM+1kUiT5EmoXQ6FrbAsS1PvO/yA/AiNIgIjBsUhLus
 4RjPf
X-Gm-Gg: AY/fxX6fzTyb0irFpQYtr3F/JKBbOYgTEE3bF3XT79Zfeu+sx8rUUJY/GyWI2QsHlY5
 EuP/OopfroO+eDjRx3OlzJ2ZI4tw4ImJekJqcz4uBk/51QVNPTWJtGQ6ekaCZTcnLpbG/kbrkih
 dM3IJJYWjJzqOkLa0eeU9wheQ7pfA5MEwS0fNSYDT7iNOQOF5oiB+Nbbo2oIf4Fl3S/56p5UoZ3
 w/JRoUGK/zQ84hR4ikaQFnUSIxrrxHx70AzHqCNNxKaa9uLzfhB9LzfszLfPIO0ZtVJHigWuWlO
 dT0dGCFs0CkwRomFqbwDDgaOdayCF5z+Kso8OQiHPfiPHDrJ7sU4RqRnEJGocbsRgDwB3dNIMm9
 hy4s0Iz6aFZZYhiWJi8JOxXKAHtZenHNJSMgKSI98pFeRu+JxEksJB6X22xAiwD4VxS4mV307ys
 hDEgLCorJLwc6nK7cLO/N+gQrT9mohX1m7skdJqwQ0zdCcZ8PicW/7g2ZswsBLCn7fQ+lzs/FO8
 B2yQqJrQ9P5WoZOVPoBYO0RAB/BxP3s
X-Google-Smtp-Source: AGHT+IFJeo4mI4mlApyngS74KWKqhNDrqIgFDk+ZMb+lL3uM0cYGbCwqVvChlTn9ybOI+C3Plu8FVw==
X-Received: by 2002:a17:907:7742:b0:b83:1341:b656 with SMTP id
 a640c23a62f3a-b8429b0beb3mr1075153566b.22.1767986394517; 
 Fri, 09 Jan 2026 11:19:54 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27c0casm1203601466b.19.2026.01.09.11.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 11:19:54 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri,  9 Jan 2026 20:19:50 +0100
Message-ID: <20260109191950.2245931-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767986394; x=1768591194;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CFoMCJu373f4dnM3vpvN3H2c00djpqawHrOpCustVp0=;
 b=SUBiJkAGsRwXCz08p1TnkUmxAGtyrrH1NZvg4/d/lVKyoAMZXtLHNT3VvOSefgzRid
 1z4ksl+o+4k18fsVxZIVyd4755lJN8E/V85BXoRZYQUWJ4KRVbub+nTvHMiEruskIk/p
 Qbd5sutXgRnUuLXgYzIaPSRZBch+DvVbvo8pk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SUBiJkAG
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.197
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

The patch bumps the Linux kernel to version 5.15.197 and, for the SD
configuration, also updates U-Boot to version 2026.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f469-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f469_disco_sd_defconfig                          | 4 ++--
 configs/stm32f469_disco_xip_defconfig                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
index 68e85f8a21d1..50c6664f950c 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 440526977bd9..b6a925ea4e89 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 704e8ecc16b3..f1cc193cb59d 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 5d6c5ba7527f..08390f56ff25 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.186"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
