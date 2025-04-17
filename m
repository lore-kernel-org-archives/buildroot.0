Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A028C369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 17:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5FA2849DB;
	Thu, 17 Apr 2025 17:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cjjpBJssPtp; Thu, 17 Apr 2025 17:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA58849D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA58849D0;
	Thu, 17 Apr 2025 17:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC3E71F3
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 17:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C925441C11
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 17:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU7KuQzBLJQT for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 17:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FE4341266
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE4341266
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE4341266
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 17:41:14 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso1382638a12.3
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 10:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744911672; x=1745516472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jCvKxcyK4TI3mXh3lc5dNZCJcAGj6/Dvhm5xl6Uzlcw=;
 b=aJ5e8Qns27qa446ozCXtdUxIttr0Sr5qII8OOoxBRob85II5TksvGQ7rT9RRML2dtr
 Qq+7HURR/3CwjGhDxTv4v0EwTKdeKuFDc1E/96vep/yB+FuEKlGjo4JGBDDEvGm1Mies
 lNgYqENKOtYXTklHx2lIc/KeM8l2pNigmIwm5gc5afssZVqU8+7rBRNRwkWCEryUwkkC
 EiANYQQZ67w2O+W2vg6vJfyoBQwl0ix9rXVxdig9LMMxlgiCcEkmTPqsVyyrqWw/VRiy
 EadKWlyDG9qVbQU6ZTG/MNUD/OwU54amCDG7jaEf113tvjgS/G7FDEkMuflyNEMlqR2B
 WuFg==
X-Gm-Message-State: AOJu0YzhgDWM/U+k76yasx/wIu1TGl7Wk9qRksTEtHOWPTd4WJ7J/Qky
 NMWNXQapcpxN71B/xqn8U4tSdZGJzD2258X7ynak+6DMXqyqWmM6lKhP9b2m3jRcu3QHPTqNurR
 h
X-Gm-Gg: ASbGncsaRGpYsnW4SxylaV7wuP/esw97F2MUmLfhAn/1H9+ED4AGew8zkbPxLVHZAcA
 8hOskyEs/0a+vSbsPu4sP2x9T4y+oz1NBBxlGEioam3cFetLk1GNn5WyppPcQ2Ic2+e5yldwGeY
 SbiXOjsk6eeEew7niHYa4QmjVH5UFiHFwUDeVtCBMDy/Z1dLS7To7qllW72sPEDW7yfeXIw+esk
 agfuygRbXFA4coNBUh61m0OV7S4zs7oJ2GACGCuID5OrAS7fSIdY5ctvdqZ+bHi9tcUitjjzaSv
 CpGcYTJWMZwCYfWXbJlzHx2Jvfw2oi9qsxQ30GyimhIp01dHQtSCq1v1JKf5CYG7gCXS5gIUon+
 UlAg3BhRGTP8baCpQmnbYMyS4WibD9g==
X-Google-Smtp-Source: AGHT+IHe00xtu0XnOWImhrYovmuiRmvFa2kR49uDojwJrR+kzMQ7eorpinOWYzXesUpRr32dPxAYYQ==
X-Received: by 2002:a17:907:968f:b0:ac8:1798:f57 with SMTP id
 a640c23a62f3a-acb42ad581emr645059866b.38.1744911672080; 
 Thu, 17 Apr 2025 10:41:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.94])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec0b711sm22044766b.9.2025.04.17.10.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 10:41:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 19:41:06 +0200
Message-ID: <20250417174106.4091085-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744911672; x=1745516472;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jCvKxcyK4TI3mXh3lc5dNZCJcAGj6/Dvhm5xl6Uzlcw=;
 b=SdBnSHOBaCHQdntslwd9XLdenLkaj1SjJuODwF+CkgzT1HwxUa/OdkHzwtBUafi5h9
 QhC5Ku7QVOUxrh6q3VQ2sSkWT56AeJWPX8IwC4WSJv0oz7JFW1tdws1KMmrLu/Ev3Vmh
 JRYfgBd4hf0zzfaLtifvEGkVO8YYudMjbG2jQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SdBnSHOB
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to
 6.12.17-ti-arm32-r9 and U-Boot to 2025.04
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.12.17-ti-arm32-r9 and
U-Boot to version 2025.04.

Tested on beaglebone black.

Link: https://github.com/beagleboard/linux/releases/tag/6.12.17-ti-arm32-r9

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index b7d44129410e..5f6bd2bec165 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c6ee813cc48fe7e308c149798100d621514e832da507e34d1dfd8247ef9ae39f  linux-6.6.58-ti-arm32-r10.tar.gz
+sha256  203743e32c9fba3bb9f965c1b3799977961a9d25071d6d482d96d74adfdbaadb  linux-6.12.17-ti-arm32-r9.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 50674352d71d..80ea21b7cb4c 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index ddeb221e8641..b4035215dea1 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.6.58-ti-arm32-r10)/linux-6.6.58-ti-arm32-r10.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.17-ti-arm32-r9)/linux-6.12.17-ti-arm32-r9.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
