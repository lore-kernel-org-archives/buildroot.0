Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092BBFD5F87
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 06:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2EC82393;
	Wed,  8 Apr 2026 06:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLqZTHn8vRPq; Wed,  8 Apr 2026 06:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D462A8239A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775631432;
	bh=67lZXi8XRM2c5Hmfhf7L+4t9AvcP+FvrvshUOqH1HHU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qJCQDIe9nsT47qI/69537q+NPa41/gzMu8ye9E4m+eNi/4HCUDKfIvWViapQG4eQ6
	 nImMvOTsM7QjYg0lrvZsIRXiwk3jlAqybrsL6XMUNbaNhQIa/ei6VtXTAiHB8vfvgI
	 8Hh+efNDKF0xsLozEd8Vio6w2SnEb8qdd2MUb7I84TqaoWmE4fHYWiTif71DuIiLEo
	 9oYDj4qbpRYyuv4mjeB/35wRwHfPMHiQbJn9g9JG48963hGWbooEmwu3avy/fwsvib
	 Sxl66NjrrIK7gGvBQgN0/x29iSXw9TWB2dqjgbsHbnVT67JYEQUyxeC8DH6fcIj2GB
	 H3PwQn+HjdMrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D462A8239A;
	Wed,  8 Apr 2026 06:57:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67B651F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4982B8239A
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lg_ST0DmQhB1 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 06:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2393D82393
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2393D82393
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2393D82393
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:57:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cfb723698so5041110f8f.3
 for <buildroot@buildroot.org>; Tue, 07 Apr 2026 23:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775631427; x=1776236227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxjHW8u+YcRMrAGufOUQwIs5OlCAQRMglH1ihL/NKIc=;
 b=AI6jRJzaBm9kA4wKk5Ym2XdmuuW0kDKx41hoIeqhwv/GOwXqGwFlUzQaqE3xKM6dgF
 FnP61nacqFUGOn4izL5lQVZORkzcn3kFP3QRZ1o0ZjMrhOUPYUTm8jCEn1aw5qLVfhjE
 cnrl7aRlMhrTPqoJOozTAQc2XqTEbGG1jnQWg8fh7XpjDD0Vok7Y/uq3UaDmTxJCkGAI
 yGJZS14/J1mheGu9z5GpIEtFbj+fCnLf/pWN3iNoWePdq+YlsMEarF1ciAmEFy1l0KY8
 rC0eAJ5MdCu+4X6G9bfmj4kJYfcpmUw81VTxfBEFPee7I4GvKACiBDTXh5QZdpzTxFMY
 ui0A==
X-Gm-Message-State: AOJu0YwAa6phG4vOhls0iV9u/MJss4nQejP/p+e/Felf+EGWcPvUksdq
 92s8sfVzw4Ey1RiqBVPebZfU12wjuVwXfRUPdkg2vLeCeBstuAEnvfLuvcUhVbPA4P7wufYGQFP
 E5Txh
X-Gm-Gg: AeBDiesy6pm3hr1FGIOhiR27Zrvt8vsOCqe5oH9xJ+NrQUce9eRxaobySzuPItvfE+7
 0y1VQytilNDvQQiTVIvlkvV+WyMmZlpD4QupR8pByJRpJum0qUsreslJixwhnPsIOUtC7Ha5k2g
 lqU3WxoEpoiQcvsLl+jUI8X12q4aKUMfRIHhei8k52Gx6F2ZKD2U4xwJ6BvNksX51NPqTyhVwTX
 SZ0GSTwPgcX3Qt47SqV8hhzcqv4dd9u2tvrU6Dm/HllNKPpUUPu0VXsu7I/uGr68JldbpeLhZsj
 9GNy7burgMH2hf0V09evRPrC2JUFV0Z940nePJxY8l3jVDmKGuv3yqEiOk8cnstsyGjCAC9Bl8O
 mlRmfKWdEF+y542EkOBrIMP1cZNRyi/lSn8gw1Ge7nOOCz3q2B7ASJWYRgAzMVz+TL2l2T9oZSV
 563RxNpGY77uzWtf+wNsGh9nCJ0Lv/dLZ1Iq33PmDzmSmfI6vKdxP7E8YJvf4+9iAKh+k7MUAq4
 0+Bsopofhbu+SS3ShBlx+xL4V4aeYiIzFFlM6MVWht5waX1iqix0ZZAJ5abWRUKpBSW1IIZoSCQ
 vYEpQdN1y6A1X9ecQZi9Lj6hiU4aYQ==
X-Received: by 2002:a05:6000:1789:b0:43d:1bf6:30f7 with SMTP id
 ffacd0b85a97d-43d2927716bmr27933048f8f.18.1775631427556; 
 Tue, 07 Apr 2026 23:57:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f7d4esm49032613f8f.34.2026.04.07.23.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 23:57:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 08:57:00 +0200
Message-ID: <20260408065700.2978798-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775631427; x=1776236227;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxjHW8u+YcRMrAGufOUQwIs5OlCAQRMglH1ihL/NKIc=;
 b=SUCI2L2EMj1ZqKIzYHg5H/og6+e8jJnA59nss0go1146LgUvhuY5LqFqArBf5O1M+I
 ipmwZuZ49Lc1sA6+Wo92HoCtu0jYlT/wVqKdNGQ0bt9vlFqHeTfymasSVSiUGJIf5Y0r
 yE8+rMajJIbNQX71vjsqfpSOnAX5W2Z2xbQbE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SUCI2L2E
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to 6.18.21
 and U-Boot to 2026.04
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

The patch bumps the Linux kernel to version 6.18.21 and U-Boot to
version 2026.04.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 99ac4fc57ea8..72849b3e27b1 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
+sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e5d063a57f41..57dab7abaf8a 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
