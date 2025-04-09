Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA465C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 07:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF09408F6;
	Wed,  9 Apr 2025 07:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLnyxtjGpHOq; Wed,  9 Apr 2025 07:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A9C4076D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A9C4076D;
	Wed,  9 Apr 2025 07:39:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0ECE1F1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 07:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 925EF40519
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 07:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENS4o_BOiGMU for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 07:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=meena.murthy@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE1C040496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1C040496
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE1C040496
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 07:39:24 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-aee773df955so344949a12.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 00:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744184364; x=1744789164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFOdb9jdChrWH2TQ7V/Ymq0M040keiQ81oFAMJOR/e0=;
 b=Yugxm9pAZikdxJU+Ex3dVRzVfzeBC3MbjmP76KsyGm9LKYDQLtrQqawQjCjMd0VFV8
 fKZ1IHa7xJxYtkxHrKmlaQtdbD5QutAe8TYQU9FaAK4QsZNZUVnkQaZwPvXpn+Q3T8Q8
 qu82M5Lj/gQIrpmWESFDyPcCyQH4ZuZq5JHOgfKKm9VMQWjKawfztNz9TbTcY++FveIp
 0PvIjwzXUfk9U6vpBpcEbucCgP8ZYUa2ylljaWg0MzcLHWhm2+LTLYW0nDJ1HWkEZuu1
 r3Eq6FITIENnxWASvPZ6IYsfioKXVbk4sRrrW2kY6HMtuVunAsi+Dm+0WglZ3UhE+tBD
 54xQ==
X-Gm-Message-State: AOJu0Yx4jfXRlxD/w7BZxrD0RzBvencYv3WxJnY6qkBDVuFEqfP5QL0E
 UxAoGwi8Hm+N6ph+UsPXI8VdJ8g2R4q64hfgP4zY0QFyiXCQ69JfqCsdec2mMLycdIVquLcAVxQ
 =
X-Gm-Gg: ASbGncsIn1JeS00/bklZo40nAd1z3SH4wTH2owcbdyNGsInqN9kdDO3/tTOtKzZ8jM/
 jXSSAYg4DG5Vk/c4NyAqcC8o0lYzwShDj65Wtcwkn9vhdLhYyjXW1j1Q0NszwPThzpBcSW9emUZ
 BIwQgQAk7Irzct8Z1I0og63bzn03UmOGaIHhA0EzY6fznhkdAe9OLidCJxiEi5P+wl55qjlWjo2
 ji4A66BtZh7qeRTkJAMpdg78l9mHjCxba7shdrwMQgTHVWSL7VcPLF0cNGjVnrQ/7Awy9t/9rH3
 kWNB3/0sA7fE+hnwkzNzOqzoPqBGRkdPnYKPHM9uJ8570oOJLm7P7ocKLO0NiUfEJIvz3h+IwWu
 qMEFlXqZDqgU1IECe45oR39StMA==
X-Google-Smtp-Source: AGHT+IHXOqWs77UKGZPp8Y9tEWMVAD1CMUERiuXc9aUZlnsb/7nAwtFmHFsaVjTU96h/GZeBgzhdGA==
X-Received: by 2002:a17:902:ebc1:b0:221:1356:10c5 with SMTP id
 d9443c01a7336-22ab5e0fc51mr86442895ad.9.1744184363733; 
 Wed, 09 Apr 2025 00:39:23 -0700 (PDT)
Received: from meena-ThinkPad-E14-Gen-3.amarulasolutions.com ([49.207.50.235])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1e51f7dsm638592b3a.144.2025.04.09.00.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 00:39:23 -0700 (PDT)
From: Meena Murthy <meena.murthy@amarulasolutions.com>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org,
	linux-amarula@amarulasolutions.com
Date: Wed,  9 Apr 2025 13:07:51 +0530
Message-ID: <20250409073750.1561127-2-meena.murthy@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744184364; x=1744789164;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tFOdb9jdChrWH2TQ7V/Ymq0M040keiQ81oFAMJOR/e0=;
 b=UI55U1aHOAYf5PJjdv9sRPWfbaLOmY2sieUwjzmQOR+LGfTf2mCgrxz4EwX77O6f8n
 muBm3YEkDnHkJk3E3dlpDjBMQ4BEWKbjj2sbvyf7JZ7dYaDodJyu+pOhOfKSUeNAHuGc
 ju+GJh8OFKVMS8pm1ZcoAgGWHhpzTHuWZ22a4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UI55U1aH
Subject: [Buildroot] [PATCH] configs/engicam_px30_core: bump Linux to
 6.12.22 and U-Boot to 2025.04
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

The patch bumps the Linux kernel to version 6.12.22 and U-Boot to
version 2025.04.

Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
---
 board/engicam/px30core/patches/linux/linux.hash | 2 +-
 board/engicam/px30core/patches/uboot/uboot.hash | 2 +-
 configs/engicam_px30_core_defconfig             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/engicam/px30core/patches/linux/linux.hash b/board/engicam/px30core/patches/linux/linux.hash
index 2fb158b70c..b8704508bc 100644
--- a/board/engicam/px30core/patches/linux/linux.hash
+++ b/board/engicam/px30core/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
+sha256  ab48800ab49985a78d2318ae8ac5f28fd3e123ea17357ef21498105a53337336  linux-6.12.22.tar.xz
diff --git a/board/engicam/px30core/patches/uboot/uboot.hash b/board/engicam/px30core/patches/uboot/uboot.hash
index bc999536af..80ea21b7cb 100644
--- a/board/engicam/px30core/patches/uboot/uboot.hash
+++ b/board/engicam/px30core/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index feaa8b3302..be5c56e19f 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.22"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="px30-core-ctouch2-of10-px30"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
