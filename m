Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7BEC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 15:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DBB84AA9;
	Fri, 18 Apr 2025 15:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mecq-7Cq_pcS; Fri, 18 Apr 2025 15:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F6184F38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F6184F38;
	Fri, 18 Apr 2025 15:31:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D33F228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 15:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 699C9706F5
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 15:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6eZU1yXXE28 for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 15:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40478706E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40478706E2
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40478706E2
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 15:31:52 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso244671a12.3
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990310; x=1745595110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9eA1s/d33hrOIG8c0qHbDqv8edooL3N3QRpSRzskvo=;
 b=n6N2yoxHgMJ4HhI8lQIMfTncHDPYs+srt5YEWKhpySWlVlv3nIOa6Y+6tsSLOK/k95
 fShPhDP6Qy7HrpZuGCcQP/ul5qgDr81tYczSh040J1Ts9jAWWjkh+8Xv2OS7B4t2NH8D
 jvvXtNu5kACfJj4XUV3GDJR3FzWydU8aCSXNngXb48BsgsXcoqDTuAwgQ/4U42SjjILi
 0dv8US1vr7fXw+cav2IY5abGyb/rFmrgiva/m3WjMuCClMuFiz1KKA0rgaWn/ATCJzTx
 xBV4b9PTDB67Y0DddRNSQhFQE8Hz5+o+lBIjJTjyhPnWZ8HNb1Bis8utu5OXwoWM+BLx
 4IVg==
X-Gm-Message-State: AOJu0Yw67tyOu+I36Bl2/aQh+dHtzniHg37W5FLrIDCCwWU01wBZqF2k
 AgRCpmjajK024J8Rqa7PrakvhcORQ40qWNkpHHpomTvLe2icuScgyNbFHhpw1APjwgB18cYqtAC
 9woM=
X-Gm-Gg: ASbGncubTLJx1fygOCykmrZIyLtzbHB16LoP8CT571qEM02A1RdjoXgSyekR9vvD2Hf
 F2XmP7qqQyS2D/ILhAsUonn3lQC7hi9fErVpQWC25h7QE4wpAlIhtMQgEfaLvAV1F65aise7uX2
 VE6pnvUwJVahhWyjE0S+fSdQFQZzut6ujVY4ueqCHlePcUWwVNCl2x4ywgEC6YGlNy4tFQCbGKE
 9MrflzmuUDWVCFACCxMLWiOWtwg8nt1RpaUdP38p0pNQEWVVzu4g0sA06+BrOjp1VS0bRCPsfHR
 X9rEfAfshvWAMhQtJSmOquUAZ6Hxal+ABFqqAVm/5xY2GpCoCK0YbfKi5B+BQDGuFa4NDhiGpMc
 tjc64KNwZG8Cnadb6Ceo2IK/5UCBJ56M=
X-Google-Smtp-Source: AGHT+IHpZFhywoAlCtdvC15xxjaSBG6iG6XAZqyfEBqARHBFi4vTwHRu2yLHJ+FL6f1Xq8ivErvF2Q==
X-Received: by 2002:a17:907:3e9c:b0:ac3:49f0:4d10 with SMTP id
 a640c23a62f3a-acb74d65b57mr309236566b.38.1744990309643; 
 Fri, 18 Apr 2025 08:31:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6efaa603sm133090766b.176.2025.04.18.08.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:31:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 18 Apr 2025 17:31:46 +0200
Message-ID: <20250418153146.151159-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744990310; x=1745595110;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+9eA1s/d33hrOIG8c0qHbDqv8edooL3N3QRpSRzskvo=;
 b=EUH8a9aL/2S0xBIkHFGAo3WI6N+6bukVvza3WAmCcuOYnt3sxEHjIRS2jCh4xI2Q+S
 HFJuPA2v1fz9L/iKeBtnHGIQUfdJgOBMLbghV1nTVjRWKbn9Jv2CdJ0QT+Av+KQEe0cC
 Drx/EwFjR2O0SQaXAFrlZrOqRZJKEPxf29Mtc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EUH8a9aL
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump Linux
 to 6.12.23 and U-Boot to 2025.04
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

The patch bumps the Linux kernel to version 6.12.23 and U-Boot to
version 2025.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 4 ++--
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 6 +++---
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index 28988ed019bc..0add29fcf09d 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  aee8a844fe152420bece70ffae8525b9b23089aa4da31fa32f30e1859bf93c3d  linux-6.11.8.tar.xz
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d8d95404f8deeb7ff6992c0df855025062e9e8182bca6daa27ef2e9275d27749  linux-6.12.23.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 904fa56c02a3..80ea21b7cb4c 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index c9c0527b1899..0b1334fc90e0 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.23"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index fa028734028e..b00dd03b6995 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.23"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
