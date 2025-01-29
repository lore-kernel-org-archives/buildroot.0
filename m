Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FC2C02192
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 09:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1302C41278;
	Wed, 29 Jan 2025 09:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxWf0MnQul0e; Wed, 29 Jan 2025 09:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C622404D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C622404D0;
	Wed, 29 Jan 2025 09:57:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4E1320
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 09:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DD3540339
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 09:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou0tA96pKYmw for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 09:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7DE14034C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DE14034C
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7DE14034C
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 09:57:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30225b2586cso5038491fa.0
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 01:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738144643; x=1738749443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DdWvnZmxMYSIg1sC1iEi04RWyp1m2ldptvwCA6kdg7M=;
 b=R52iBCaMSZbVwdq7bmbWefPwlv9rIXU//GNYSr/NhlJn6h0GdpBQIgO9LyOfVzY5tV
 DwOwuL5dOx5oyrdeUC/quntna4hhAZDDN6HQQOmNJcHsO4qCdh94Cnn5nfpRG0sZMjwK
 GuQUEZqk4yQIv54DX0uuEsPcaHnPQuWLGw69IoE4NTawrvkRkb+fR6tEAe7ioS/Tl9Xm
 2aBdBgLIC4vADPt/3ABfqgQqn1aFWSal4aUKDt5t5PudmLfei05NipVZuYX11ZiyjYDu
 mrQAwd4lVh1SAyG0AqJ8+zISE/XAXU1fUNWPnoEwVY/oD8wTU5mEJbodm6RIiHa418iS
 41IQ==
X-Gm-Message-State: AOJu0YzOhvW0Ova1Q0jXcE2DyUmqTcjTtQVzlGOaxtQ7YFXATEmnAXxu
 JTMvxmvXlnLwD1CHnCZ416s7vlOMGojtks4c8ylYaokP4XjFAv6QaTkd7cLEapsSGuNaJrm95B6
 T
X-Gm-Gg: ASbGnctrndCYIVWKp7qCg6v2csbej+5MifFCzaBLBQTsKSa5Iil/RgX2xiJzQAx4cY5
 1JKQXsnwXqGUe+oCsHxfUbyfNNHOWoMwP+PE4i+nBkL1CPCQN0cXZm1RQALJCV4SqRYnRnCSb76
 zqY1GuVkyaILiIuP5eD74cjbUnd31ZhKTjuATfwoRT54Z7FYKM7n2RzKl9r7zl8F6siPzorhl4d
 1G3kANR6Z14eD/sFIosWzzmtchT5+339Ki1pGNmBZWHFbdGn+Yuva1/FnNMukPI7lO1JbRpcBzc
 7wZVF8ooSPBys9MnemT6BkjLR+vazQXhyMUzJD4WL8fwzbUY3G28DMAnCdALaS4UCdnBZ6Yl3XR
 AG4Pf
X-Google-Smtp-Source: AGHT+IE3/a9Ps/FDaqKzUOOAhY5nLsI9D+nYSVSXmLCCRMZM11BoEeADUTUQqPyUJSfbaUVm64EEVg==
X-Received: by 2002:a2e:be28:0:b0:2fa:c185:ac4e with SMTP id
 38308e7fff4ca-3078dfc305fmr21849101fa.13.1738144642867; 
 Wed, 29 Jan 2025 01:57:22 -0800 (PST)
Received: from P-NTS-Evian..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc1953esm21191371fa.86.2025.01.29.01.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 01:57:22 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Wed, 29 Jan 2025 10:57:16 +0100
Message-ID: <20250129095716.2511434-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095716.2511434-1-romain.naour@smile.fr>
References: <20250129095716.2511434-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738144643; x=1738749443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdWvnZmxMYSIg1sC1iEi04RWyp1m2ldptvwCA6kdg7M=;
 b=3xPyXzigimIuidllmaSHqtV9aAHJoMF3g5eTV8HL2jlm32xwIxW6HAWJrgU/3cDBNN
 FL2iudmNECftdAYP1sLxv7MM19o/O86Tsl10AOowPGoRBMVToa0TIAPitv3iRGT5BhOF
 hFNt6XkYRUN6DQYOovgEiTJtLZ7o/V05bF/Rs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3xPyXzig
Subject: [Buildroot] [PATCHv4 2/2] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.12.9
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the newly introduced BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY
option to provide the Out-of-tree Device Tree Source file with
its vendor subdirectory that is needed since kernel 6.12 [1].

Revert the sama5d31.dtsi include path update added by the previous
kernel version bump 6.6.12 [2].

As noticed by Michael Walle, newer OOT device trees should use the
same #include directives as the in-tree device trees to ease
sharing the files between u-boot, linux and OOT external trees [3].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] 8fb5209885 ("configs/acmesystems_acqua_a5_*: bump to Linux 6.6.12")
[3] https://lore.kernel.org/buildroot/D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org/

Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts     | 2 +-
 board/acmesystems/acqua-a5/patches/linux/linux.hash         | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig                | 6 +++---
 configs/acmesystems_acqua_a5_512mb_defconfig                | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename board/acmesystems/acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts (99%)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
similarity index 99%
rename from board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
rename to board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
index 411d1942f5..60be8a67cd 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
@@ -9,7 +9,7 @@
  * Licensed under GPLv2 or later.
  */
 /dts-v1/;
-#include "microchip/sama5d31.dtsi"
+#include "sama5d31.dtsi"
 
 / {
 	model = "Acme Systems Acqua SOM";
diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 4b20a009a7..7a4c4e57c9 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index b102dde0ba..8a1f6328a0 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index da54eaf620..b47daa15f9 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
