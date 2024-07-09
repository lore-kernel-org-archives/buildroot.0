Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8F8C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 16:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D715409FE;
	Tue,  9 Jul 2024 16:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zybNRO9KuU4N; Tue,  9 Jul 2024 16:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45EB40B3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45EB40B3B;
	Tue,  9 Jul 2024 16:56:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86EFB1BF348
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DFF781E17
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9c-HQr-eIfYE for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 16:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85DEE813A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85DEE813A9
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85DEE813A9
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 16:56:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so4043512f8f.1
 for <buildroot@busybox.net>; Tue, 09 Jul 2024 09:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720544169; x=1721148969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EESwq++TrcCgyt9H/N4aY9DVoo96BBVAkNNPmI8FvnE=;
 b=g/iaevtZ2P7LZ8qwwgIVkpgKbpFHEvjzagrrlWlh1XKzB+sz7lSYgGCwwrBCDPGwm/
 dKuZ/EFQJKtSg4wdOeJkCpkJQoQOTIk6EUOZWte9FwvbmhqjwUKl+4d3y3+V8UtzLJGJ
 FE+ruJDpr05flwhc2EfLh6T4xE0HS6LETqCnpuuYanc/VpXchLZ39JvO56ZX3SoJ9I/4
 raYwOk3ZdmoJCR85zUsZDaiTfK7pZx4QsO8nMUwHSbJZkOOupy06OtR4H+NWVz/tpK3h
 882PHPDiEQAVqmKeQLWAJP6CIq8qduul5xF5TWNR7RVx2f83baG5WAXpwAs1qha0/9C3
 5g+g==
X-Gm-Message-State: AOJu0YwILROOVmrNEOrOEjv9XjUslCB7YzsS+eJEV3qQX79rS5J0OXRl
 hgLZLnSYk6ent2kyEIT7LzBRD9O4fO73BkcsWbljNE1ezXMYdv3OzhKWFCpZJ7fKFt3GjmR8Ox+
 QRQ==
X-Google-Smtp-Source: AGHT+IFqzkqZK4BVv33lH9rQk3yOhxuyK8v3+xyPwfr8i9iDk58x02BPpcdhpvvKFK+E5zk+7dU0RA==
X-Received: by 2002:a05:6000:1812:b0:360:9500:9bbb with SMTP id
 ffacd0b85a97d-367d2b3fe53mr2675545f8f.12.1720544169508; 
 Tue, 09 Jul 2024 09:56:09 -0700 (PDT)
Received: from vm-2404.. ([37.66.35.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e1b3sm3024214f8f.20.2024.07.09.09.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:56:09 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  9 Jul 2024 18:54:19 +0200
Message-ID: <20240709165421.2685663-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720544169; x=1721148969; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EESwq++TrcCgyt9H/N4aY9DVoo96BBVAkNNPmI8FvnE=;
 b=EFSJG+aguunateiNeuCwZkJHqxqNe/B/wes3NBXxxK3gqOzov8yLt1nXKcj1IqyrDo
 9Hi6DTDOQDpfAemiwSKLsD3zqmfzxCiMD0un0yjVMOTYhMdZWjUBGOnH7eZ/dbIX3T0v
 nje3pb7WRBXSP0LN/YqBbO2xB4jKb69XsB05hoI1LLO+kVT8U62o5vO9u/P67j8z3HZQ
 m2KtgQt70PM3zBak+bfjHOBTFJS5wV7IxRIWBYDy0T94TJGdH+DsG5vq2viu6FRyNwvi
 ZklIp3LeUdjOIygIdw3P/UYDVHggcgvDgWR7Nn5cdfnpgalftXPBDOGIB0auefsfGWi4
 4y8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=EFSJG+ag
Subject: [Buildroot] [PATCH 1/2] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 04e191b44..f71d2d3a0 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.23"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.36"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 05666fa98..6546cac0d 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.23"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.36"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
