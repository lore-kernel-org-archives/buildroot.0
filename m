Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D17D277E1
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 11:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7187F40B96;
	Sat, 10 Jan 2026 11:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNkE5XAckNXX; Sat, 10 Jan 2026 11:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBA640B78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768043947;
	bh=n1PAaz21gpFf4NaAZDSxBl6ylrbb+ffanEfPRW+951I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MtoHLeTA5dZpoOrfnIcGONI6dCbc4s9Dhd4XaR+lxJa1H+e3lpsk/mnz1sbdTiNU4
	 0soHv3sN7GS6YDpWXu+5PUmfWnndA74PS6u0XmXLB1K1QYErj4PLdjJ4O1La4Qn1c2
	 0flUHL4D/wShB8CFylNl8Wyk6+lAzCzeOzVyjr9ll7yhLLelx9twgHjyNfg6JXmQ/h
	 VHhnBimh51i0QscA+M3IBsNgwGVOQc+qmblocT9C3AAUDvPMuRwt9oU9QFMIb5/sdz
	 6p+5BRrPRtrVrmX4/yBl1Nc4+/Olh97iuEjxnlQGioQE8gUCLKOwgtypraBQ6zTbrG
	 IohB2RZmYuCHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DBA640B78;
	Sat, 10 Jan 2026 11:19:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2715C18D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18F5660809
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqU9X7QSvNio for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 11:19:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEB72607EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB72607EF
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEB72607EF
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:19:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6505d3b84bcso7898357a12.3
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 03:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768043941; x=1768648741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEX29kUm4YplB0um9u1oBr74dWmrQzAgcUnKzL2URPg=;
 b=ZAYIDmFtyX8Y/Hw18fzRR7mcY87K7/cHNAMjITc62XevXkEztzbwCzccWHjYUwAhf6
 0h/Yl94AwOvbF5Fki6r76kAlK9PPozRu9zRVo6rX3ZC4dfpBjp+kEqfvO3hKduC2SC8R
 iQtegxIuvrHAoNNP0Z1J8CpvvqO8GfEJS9qKe9/Pxuf6tWZwfDr7ljTY7URexJs48SpU
 ljSMWq5WrYpIVc0n0CcqHI2262sTBbc9waWOI7sftGYp4ntZRDGBJG8BahBPCIMWngqp
 1E2E8p8Jy91g+hxH0QzizVOi4hyHDyEJ+c76juZZ8zIyj6zP1nCqg8pX+WCyjthC3r7V
 NBfg==
X-Gm-Message-State: AOJu0Yzp9KGkz3zUTU8lf4j0mIx0Vw8S2fKB2hJeRRQcgkyZqfs3SSa5
 dgZoV310E27YlCr6HjEQsjFhqkiJOt/wZrZu02PWfT51ClERGF8P/pRmxYMmFL9ul4pa6pik7gr
 1uvbe
X-Gm-Gg: AY/fxX4GafSvaA5agCak6NVyc9cm4KFq+BKgCmTxRyelomFZ7OX9VfxKLhnTQAPKoN9
 jtY9easjbXaiS3LAI/A7592s8hd6RKCGS7zP5LOj+I5Jl4P/Zn6AmH9MgZ4ZxAzp0fDKEhPCYR+
 RydemSbJHwELzdosArHLXyneazm85jhnYwLnphw9CbNX63duDUsqLEM5MEQ3wVkA16rRKcEuNxv
 RyJK8p0njiyrB44ue1VzdzDyYVRawMW1qHZ5ev1CeJtRN/+q3ebOAF6TJOAhsd3YIlgfOZCRtRz
 E91b4MwYuiMz2qDNw+1cfV88iOxQfQE/fEai5Qp2Cxl4OcSekW7DUAKMjc1gtqbYW0CaNtGbVSV
 5crK/n+10m6/D1obFD/3rD8vp1jMXgnEwMSzKoXCcKSQGQLJP8jBn9k6zCD+gb/80hSethyczxv
 RQYKCMVVNcJ7gtkZ5jUOe7yQcL2y+XbdkZ4+aqohFBUo4BfnH9ZdMDS6GK1sDBaPmY9ucnr6TuO
 HGL5X/EhfhVZKl2heIgkY02CARyekUyECbb2vUM3OpQHBmQXamtPRofp0Oo/m2zoXk1kt38qY7f
 KCVz0sUFsX4=
X-Google-Smtp-Source: AGHT+IFvhkjnWAWIJsmwcWDsfJWS7j6vGX8+fXhtcC/aeuSD5yDDVH+Lg2sC+4hbs4GZteXGs4w0Sg==
X-Received: by 2002:a17:907:7288:b0:b7a:1be1:985 with SMTP id
 a640c23a62f3a-b84453f3c88mr1085333666b.65.1768043940442; 
 Sat, 10 Jan 2026 03:19:00 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a51577bsm1348693666b.56.2026.01.10.03.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 03:18:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 10 Jan 2026 12:18:57 +0100
Message-ID: <20260110111857.170161-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768043941; x=1768648741;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dEX29kUm4YplB0um9u1oBr74dWmrQzAgcUnKzL2URPg=;
 b=AbxsOf17rFH9JUItlApucn1sZ39q6I0huDESKHul9pEvnJhUy+m+Ho/ylCEf9z78FP
 Q3snqDdtLDXsGiPNDS+zRiwxm5+wQfPZ5dAe6lwzAyZifafQs5iEJl6mw2webrRTFRae
 j7xLQU4Qi+fCXcdndyMAG9a7bX/D0DueBCJW8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AbxsOf17
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump Linux
 to 6.12.64 and U-Boot to 2026.01
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

The patch bumps the Linux kernel to version 6.12.64 and U-Boot to
version 2026.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index b61e87cec65d..cad9431c7b7b 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
+sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index ee8fb9bea39d..c497b78b8ccb 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.64"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index 1abe3a531a72..640c00fbd2b5 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.64"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
