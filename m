Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2561C3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 953DD83443;
	Sat, 10 May 2025 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YpK-inTwazM; Sat, 10 May 2025 20:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB38383459
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB38383459;
	Sat, 10 May 2025 20:50:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9032D154
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75FCA60718
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NQsz8fAps4n for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7837260840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7837260840
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7837260840
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:50:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54d6f933152so4695696e87.1
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746910242; x=1747515042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4PQP1FZ9UjrujV0bH0PC+nPINzzxCzZ4i86UnsGcgY=;
 b=udnbWlmxj7L206RNHX2Oq3KXRDlTbUM64Xs2URSZVTVxVN2z1mrGuYbTI3QKVmtmLQ
 cHv0ZOH3hidNY5au/4IEVJAEBjUPNykeyBsJvg9suV06COwcexXpkgEdH5e7VnaFf+j1
 fichB/eHgsZRti0gIrfQCSSpIcwBij6fP0xTCbfZ9Kg1bx2aSty/1QkVjjhO4AVoXuct
 Bzcqu41dR/LEBMZ2Q8Dmdd4B5SxgFGP8GFDBuWZVWUaQoT1V4eHYyidyItmX4a6djL1Z
 6UDnwh8o4v3PkJgH/CTF/XVxZQDArmz5LNt2WemRZaT4FItGs1Ny1R7xg2HSTepDgS4L
 fA+w==
X-Gm-Message-State: AOJu0YwjJFEgm54VndLcTChYFf+jmeee3kS7lVvxFXsev0sGwozqjIpB
 3n9vHzhh1Otyc6Ix01Z7SsrBZETW/KEDG9rv/ELjivunq87gszvMkwjUfpVt
X-Gm-Gg: ASbGnctkq0mRfEvkewjV9geOaq8b2vw2QG0eaOrC0rjhItzqYHIfdSIzCMj6kYn9r8U
 uAk/d9oPtq4/kvUdQowxO1PiqDpoGJhChG0sTBSMP/ErUT7hPZzehbH1r/2wyzQvePH9uaAjhVM
 E0uf/wzu61TGhg38szw6lfGJBbWGj5AoIsVAdW5E8GrzF0h79ItOCXz7u3KM7xXHRhSS3Ed0jeh
 cmWHjmc66QrQAJrdrR36NUNYyKgZtmFMRKSQgMOrJGRDsoVZinHm5/+cE3j6NuFyKGNm+GagNw6
 L23hLPAkes9P6U25zz2nqXhtVNRZ52U8DtO+qHRSKsrA5rQydkLUYSmlPsCTeijXPlmZ/6Wolrb
 M/uMPRxsoP+YjXih4LACxNE69nwgo7rCa
X-Google-Smtp-Source: AGHT+IEzC57OUoJj7fKjjFoeE1OJ+RQTtdzO/kuE8UZ4qkeHMGbDtri1pMaHR55gI3KMQ60O3O2McQ==
X-Received: by 2002:a05:6512:6612:b0:549:8d16:7267 with SMTP id
 2adb3069b0e04-54fc67ad099mr2405846e87.10.1746910241378; 
 Sat, 10 May 2025 13:50:41 -0700 (PDT)
Received: from DESKTOP.localdomain (94-255-243-81.cust.bredband2.com.
 [94.255.243.81]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6b85sm817002e87.131.2025.05.10.13.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:50:40 -0700 (PDT)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: Patrik Olsson <johan.patrik.olsson@gmail.com>
Date: Sat, 10 May 2025 22:50:28 +0200
Message-ID: <20250510205029.456321-2-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510205029.456321-1-johan.patrik.olsson@gmail.com>
References: <20250510205029.456321-1-johan.patrik.olsson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746910242; x=1747515042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4PQP1FZ9UjrujV0bH0PC+nPINzzxCzZ4i86UnsGcgY=;
 b=laXDgW0CxPCPUWsiIatkFsg4tGSSdK7UJDRS7NRg/qLxy+5MKTlJgi5DeKLSqf1l42
 vrJupzWdLKTh6rbfXVkKuHn9JLzLmr6nXcnnAmAeL/o5Xq8/kySuMtY1waUB1XDhs56P
 OeWQrpFvtDXuHbwYBHqdkN5trVfnisGshLM2LSncFHZt8TiaMupnQTgGdZk8z31C99L1
 8u2DH2z8PrhTjk9WIkL5Rr1/TetZVW2B3Dssx+ZqBWmSdusYb8jpld/GfckL29/FLS4Y
 6GoKnJX4GRftKHU443T6Yzr9p1NvUm9a2q/bMIWYvqKL/xO6K5hVSVgiJ5hEcrplfftu
 3FdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=laXDgW0C
Subject: [Buildroot] [PATCH 2/2] configs: rock4se: bump TF-A,
 U-Boot and Linux versions
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

This patch bumps:
- TF-A to version v2.12 (LTS)
- U-Boot to version v2025.04
- Linux kernel to version 6.12.28 (LTS)

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
---
 board/radxa/rock4se/patches/linux/linux.hash | 2 +-
 board/radxa/rock4se/patches/uboot/uboot.hash | 2 +-
 configs/rock4se_defconfig                    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
index 9108b3e01a..8ad0e7d8c0 100644
--- a/board/radxa/rock4se/patches/linux/linux.hash
+++ b/board/radxa/rock4se/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4a516e5ed748537a73cb42ec47fbbeb6df8b1298e8892c29c0e91de79095b297  linux-6.12.10.tar.xz
+sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
diff --git a/board/radxa/rock4se/patches/uboot/uboot.hash b/board/radxa/rock4se/patches/uboot/uboot.hash
index 904fa56c02..80ea21b7cb 100644
--- a/board/radxa/rock4se/patches/uboot/uboot.hash
+++ b/board/radxa/rock4se/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index a0fbf9b3d5..29437b9be3 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
@@ -22,14 +22,14 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-4se-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
