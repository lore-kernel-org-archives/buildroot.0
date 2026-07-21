Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91817C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2446D607FF;
	Tue, 21 Jul 2026 09:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGcVHi_szxQB; Tue, 21 Jul 2026 09:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577946080B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784625742;
	bh=KQ5RaLDq1LK0gbi7Af1OhTQWze7UmQ0NcXVexDCflXg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N1wgKf/BgLHV3KO0ccNDlEL5v51OBLCpUyfKyLMUJbrdPvkRsDUT0SQebzG+/CjaP
	 uZoNjF657PLDlhicfH5IqAGoJp90QzOiwh/+dYavA10TmITheSFTikwL0AzKb3piMY
	 A8VbLc2C9WlKpGtDBmDvJg4G5KZS9C2YvoPwDSWZuEWofag6rE5JXBAr+629kN9jW7
	 iDQksVGPNkfBg4sDuAp7N6P85wGXZUqoyZMBX9b89OrFIXJjUaRcrrYRSlukqAu16M
	 vtP5HLlTK7RWaq3teqiZ51gUpq3Ccz9OKw2M2n31bLek9MCnTzHuUVDMB5OxyUSdG2
	 q8cQJ0hzySo7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577946080B;
	Tue, 21 Jul 2026 09:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 314279E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 230656080B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWRDPDmZTwqR for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27637607FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27637607FF
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27637607FF
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:22:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so25804775e9.3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 02:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784625738; x=1785230538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QJkhvlMOBPUTvkrCVucH0EgrrzhWlU3EalSAjpEQZc4=;
 b=ZM7VATh3LHtcpvLBx9oDFdToYQhML+VjJxyaVatle6ojwKJpSmeNynqPj43l46Xc74
 E5oJAkrkk0nbU7KVhqnyAL2HofKfN32VdOUZjy0e8iOk4Zyyo98Lqf/FOmQWVBF0wG8C
 nKqg+BgTvROeIByUW0HmYFwc2yvqYs9eFWwsoSKWUU2XwlOg/aPqK4GwSR1EC4xyii3D
 cPx2re0z37vL+ekK78cZYXWHZ0/fotJDQNw81da5AEyInOsjJC8dNq1ywkjJ2F1SKrws
 rcy86UqvmB4q4Yka/atd4/I0JVk41DgEQVIreqaWucMgM19AGGNOPf5gqUgEkSW3+vU5
 5OCQ==
X-Gm-Message-State: AOJu0Yz0BuAw4OGT9FPHgVdFE1vCfUAjsq8b1E00uPT36W1Rsd89gvjb
 tHWSl1HT6Pb/a80tzxoO2QpEJV/Fq7d96rTdzkwBYbPYlS5uYiHZeVFNaBzm/XosUVUqq6i9f5H
 zqJNl
X-Gm-Gg: AfdE7clwbRXiGh66bA/p/etGt/i2xOn05hO3ClMIS/y21GIYDIwuI9WuBOxda8LVkK+
 G/y4D8upd4/8S1UK36Ms39n4wyIms7CqI1lPKncLPKzj/UOrfaXTu1V/h4U+IVNyIlRn4QVPiQe
 e3o7VNE0ITEPDhUaUUThIv+xWdV2J0oCq21sYN4kOVsNNDh58hyFvcMttAr8OBMjRDg6AVCIQtD
 wrf3w4xWKAcHBJEG90ZpcnqAGy1oOfJ/wmw4LXVtNzDwFIkmrxHd/0RfqNk69TmSNL3F5jlgh5/
 8Xju6KijbnQahMrbKYqjAp9R5O5Z6vQQLGCVPfRqijFTv8PtK+86YTf/3FZdGoRl/zTLQvPqSK5
 SxBUtBa6FxXKB38dyxH5k1iSbj39FbLVEjUJ3fhwkxM4bHFrK/SOnrBMlcmoWlqIWBnk5o1Uwpa
 sxjhJ2Dav9vQdZpMnhPv3aPocP/6PIzzgnygKG9PcbZ8C8I35l7NtYbfGztYjw8tLnZSZDHTarx
 HhqxQmBTx9MUQpqWlIa2YiypR+wlo6em551NOKNiBxPhveT9DeBwEuAPQGU9b+oHQJ86f6q6b4y
X-Received: by 2002:a05:600c:19cc:b0:493:b877:fbc with SMTP id
 5b1f17b1804b1-4954a402fcdmr227181445e9.21.1784625737809; 
 Tue, 21 Jul 2026 02:22:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm84732445e9.1.2026.07.21.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:22:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 21 Jul 2026 11:22:13 +0200
Message-ID: <20260721092213.1282012-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784625738; x=1785230538;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QJkhvlMOBPUTvkrCVucH0EgrrzhWlU3EalSAjpEQZc4=;
 b=SM/s4Ex2cRmtgLWdhIHWeygUXVhhTl9HxMWWrdIbGrlHrIjWSEr5/ciM7ikk/KB1OH
 akMKsyTUJ7yuaqB6/O08km/tZE2kO4fqH2U6ZHTHx7v+sFpAR7yZ4+rT4G1N4oHpRHg6
 bLTe/ufYt/1hkB55dKdpHqpLTKMWX73/xWxEk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SM/s4Ex2
Subject: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: bump Linux to
 6.18.39 and U-Boot to 2026.07
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

The patch bumps the Linux kernel to version 6.18.39 and U-Boot to
version 2026.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32h747-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32h747-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32h747_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
index 5ae723bc6f3f..0daaa94e97fc 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
+sha256  a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0  linux-6.18.39.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
index 0a95020e0099..cd882aa5acd1 100644
--- a/configs/stm32h747_disco_sd_defconfig
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.39"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
