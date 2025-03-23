Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1253C36008
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 17:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EAB96064B;
	Sun, 23 Mar 2025 17:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnV6ra1QzvNg; Sun, 23 Mar 2025 17:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F1E160657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1E160657;
	Sun, 23 Mar 2025 17:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73B8B1C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6550981F8A
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBF0UF0OCrz1 for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 17:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9705581F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9705581F88
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9705581F88
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 17:28:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso22868885e9.3
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 10:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742750898; x=1743355698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjHSHXpL+lxXhRj+o6bxs5EPAi8Fa27qI+9kmKc9vbo=;
 b=w8gSsgAyzje76q5vZwyNTGmh/w0PXrIVBS0O2oZzc3tP8vAvvIr58G1Kjm0GTbK1tx
 qFMuxxZ3d7stZ4VZ9eD7g39F0VvvfPYmt65YL7yO8lz56P+qttbGYlvOGogQnYk/SIN3
 bIGQ9rzX8KesX+yKNDasDmcwqSI7xJNwGo59u+bmghXTqfU3bGSl4t0TkmxTsyvORDqo
 0TTYuXBbxtMKEUisES0d5QXku8EzisN/5bmaPzz2IUHF1CT3oAd+uONszSFnjFWU1R5j
 m8FdTqGoRcVlSUajEc7qP+Lp+c/ukAV7j+l5Ih5oIvjr3ClWfiCsiWLtBvzIrLLEHX0H
 lN4A==
X-Gm-Message-State: AOJu0YzDksPLat35d6hKMDDFx1/Ir1GWF+RBpyTuP0FbBzcJqU/V0Prb
 phLEszMwumsu4wskGbDacPDpYrHY+yPuGH6hnTJ26jTQShmtCQBP5HGynRtp
X-Gm-Gg: ASbGncsP0491J4IAWi8vvQihw4kwL5POv6LCNsbxDFvXTxnaUKQO8HqNippp7KG+Kw5
 FP7sO1cuT6f6hI+R+AUQg+/mYWiKoRpWAlDjc+DrI3nVzNrO56G1TBsgzXbr2QMmbSZks670lK5
 DGb0EtVWf20TmQKExewNiLg9DBtlnXtOMXGKF62oHkRtDgqdP0OXiOW+A2Eni0Yq2WRwhDrbS+p
 23H9uOIEW4NmLEw9cbX65AfWhMLIOxdduVT/wE2StX8YcXduwumWsCOadCJkZDojnSZeffM5wu5
 zMm7VcGVhJrQ7hdeM1U8CYe2vVYrmvDX/t3ez+y7bGdqWsefF9H0dBYtVefXqFhFj7uq2s2il0D
 36W/XpvEMllnSOJIgZT+UxuUdqjK6
X-Google-Smtp-Source: AGHT+IHOaWjRIjLsZy/T+B89gZmbmw2Fyfi4b8HXgerUDpZ3r+eFb77LC4o8gaBTmC2DCZeqvEbrjw==
X-Received: by 2002:a5d:648b:0:b0:391:4763:2a with SMTP id
 ffacd0b85a97d-3997f937afbmr9749507f8f.47.1742750898291; 
 Sun, 23 Mar 2025 10:28:18 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abafed528sm4875241f8f.27.2025.03.23.10.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 10:28:18 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Sun, 23 Mar 2025 18:28:05 +0100
Message-Id: <20250323172806.558397-2-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
References: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742750898; x=1743355698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjHSHXpL+lxXhRj+o6bxs5EPAi8Fa27qI+9kmKc9vbo=;
 b=B2EY47M4yEfbJIfJ/W3ufseZcvbO/bzKRe87zo2k4iET5Jgi7WYdJv7PAeT24F2NBN
 CQ6dkb7omqdNz/r9wUtQZwN3poEWOIs5b1NxiXFAJEc7R4VUnYGH361xAO8dlo6hXgBE
 5RyKvSfcnPHaTwRhO/TDkniqWAOtX6sQI/+kqgwgC5ya1ZnGXMdHLU1f9Fhm+EuY1Jl9
 U2FsInbY24kZnt2zn01+deVuHB8sk67TaaYyueo+nqxnI6cR34qlNmL6okkk4WmGOw+c
 RHfHwxGYivOswPLnJrIbwHrk80VF5mujJh02zTZeMy2j61PEfu/EDDpRhib6LEym33wj
 1s6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B2EY47M4
Subject: [Buildroot] [PATCH 1/2] configs/hifive_unleashed: extract common
 configuration
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

Move the generic part of the configuration into a new "common"
directory so that it is easier to add similar boards without
duplicating the files.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .../sifive/{hifive-unleashed => common}/genimage_sdcard.cfg | 0
 .../{hifive-unleashed => common}/genimage_spi-nor.cfg       | 0
 .../{hifive-unleashed => common}/linux.config.fragment      | 0
 board/sifive/{hifive-unleashed => common}/post-build.sh     | 0
 board/sifive/hifive-unleashed/readme.txt                    | 2 +-
 configs/hifive_unleashed_defconfig                          | 6 +++---
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/linux.config.fragment (100%)
 rename board/sifive/{hifive-unleashed => common}/post-build.sh (100%)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/common/genimage_sdcard.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_sdcard.cfg
rename to board/sifive/common/genimage_sdcard.cfg
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/common/genimage_spi-nor.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_spi-nor.cfg
rename to board/sifive/common/genimage_spi-nor.cfg
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/common/linux.config.fragment
similarity index 100%
rename from board/sifive/hifive-unleashed/linux.config.fragment
rename to board/sifive/common/linux.config.fragment
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/common/post-build.sh
similarity index 100%
rename from board/sifive/hifive-unleashed/post-build.sh
rename to board/sifive/common/post-build.sh
diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
index e9ccb26fa6..45cb8ece55 100644
--- a/board/sifive/hifive-unleashed/readme.txt
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -97,7 +97,7 @@ Adjust Buildroot configuration by:
   $ make menuconfig
 
 Change "System configuration" -> "Extra arguments passed to custom scripts"
-value to "-c board/sifive/hifive-unleashed/genimage_spi-nor.cfg", save the
+value to "-c board/sifive/common/genimage_spi-nor.cfg", save the
 configuration and build. This creates a output/images/spi-nor.img that can
 be programmed to the on-board SPI flash.
 
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index cb217a5af1..f96e171e43 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -8,14 +8,14 @@ BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage_sdcard.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
