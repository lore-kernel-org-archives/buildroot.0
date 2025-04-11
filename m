Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC31CC36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 06:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5752D60E1B;
	Fri, 11 Apr 2025 06:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKc_7l-OVm6j; Fri, 11 Apr 2025 06:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9593F61129
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9593F61129;
	Fri, 11 Apr 2025 06:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D741108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 06:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 832AF40FB8
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 06:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeQpQ2dZ6-uH for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 06:18:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 811F240F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811F240F76
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 811F240F76
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 06:18:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso11865855e9.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 23:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744352301; x=1744957101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VW7GcJdLi+suq9d+yQVjgcz7CitAArIDToVFq4PFHu8=;
 b=INxE+nx/QrGNjyQtFKUXy9uo2m7sXujH4OPE52k//+b0hr2yIAUpqXD/zValYfIo8D
 CoLtT/3HBV41kFMqeGBquZZBHe2FTR3QKN4VVKQUyDvTYWK1msK1kSSOi8ywN+nL0DJW
 h8/RI9L3ZLcUPWPBa74Ywfi+1kVr6C5TXsPkxkbvYTVH9+NaDfQV5oTollsMU+5ki2oX
 +wzZ7XGNQasAGUKhJXBlOYBsgOyUoEbaNCbyOx4B1D11qWkMWiH7lqdPL5PlVbpK7xKi
 ASkwnWdKbzn4s4QktQcxl3lcn/U7d5EmKEAvaoYpE2/v4DVjoqhPg7LTyGXYQ1vvhtYQ
 duoA==
X-Gm-Message-State: AOJu0YzSwuGFzlbajqJ09lA4kSkiMz3hV/JVjTKsd7ZmBD72lV8ZtOdE
 fLAFfD7/wP4bgx/1keeXBXgCphmSN+MnFjXwHpFdBuoN5aDcuCaDQO2BDJilJAAO20K+2Ky/oVY
 s
X-Gm-Gg: ASbGncvrkjCBZoRzSeRfJPNPbUg6yNeEP9ZvaHNnqbVpAtwWMzcYbsqCRVjFsE2BkD0
 771aK6mPWH2Oari8bO9fTIpPE2fCACxZ8mYSGnUvCCRFkkkdGHfRrQ0l13+2m4unY1LaWv0xM9s
 pDFQWvdwdJvblL6Ej5hF4nUJACdNqbMRVFJBu4hKZcQBWIPoJ2vMusuJXfsKUXQwyAhkmMhCPFH
 GdIBRFsQJL3EpA4+AR7eVe5RlXCpOFtbdlMbeiX8owzBAhL+03+6ZMG+qqbzD7VHfNIeoCrs931
 xIfT5YpeWwe3eNV+HrpgdBzKO+Fy9GepEJTsyh1SzKb1uXc7ZnBZFgQo7s3HgO6kUNNfNcfM928
 FGIjerX44VLpl7jg=
X-Google-Smtp-Source: AGHT+IFCw+FxdQCrFylNxFcm4O7a1rZAEf321btEKKUJgJgLgaALoC7uArdaF3TG9bgN5L1ojzZuDQ==
X-Received: by 2002:a05:600c:45c8:b0:43d:a90:9f1 with SMTP id
 5b1f17b1804b1-43f3a9258a7mr7413865e9.6.1744352301250; 
 Thu, 10 Apr 2025 23:18:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.64])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c70csm1024491f8f.38.2025.04.10.23.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 23:18:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 11 Apr 2025 08:18:18 +0200
Message-ID: <20250411061818.2643355-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744352301; x=1744957101;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VW7GcJdLi+suq9d+yQVjgcz7CitAArIDToVFq4PFHu8=;
 b=DrHb14ZZ4yUTZQzt5gG5aTwpr3hHr8wnG8DRIBfhn+WC+ZqM4fDB9/LhqSwhMozaL1
 5+x3HL1xM7E7Cg7BmLmsCFCFpkMJUN9B7i4DmbmEEgwtUzWRQgV2AimmqQEzJhfBxvSq
 8rvCm9jWGuFFApkAzf66bELOMOe4HMSTXqNvM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DrHb14ZZ
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.179 and U-Boot to 2025.04
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

The patch bumps the Linux kernel to version 5.15.179 and U-Boot to
version 2025.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 57c69adb36ce..4e0aeb77d880 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
+sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 50674352d71d..80ea21b7cb4c 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 25b79f0de197..e0c592ad82c8 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.176"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.179"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
