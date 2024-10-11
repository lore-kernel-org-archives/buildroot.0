Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D0CEDDB7
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 07:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FD081755;
	Fri, 11 Oct 2024 07:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1LF8Clscm5I; Fri, 11 Oct 2024 07:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A04B881FD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A04B881FD0;
	Fri, 11 Oct 2024 07:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 075461BF37B
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 07:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03ABA81755
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 07:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QebC7mMCwM5o for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 07:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0D2481FD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D2481FD0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0D2481FD0
 for <buildroot@busybox.net>; Fri, 11 Oct 2024 07:05:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-431137d12a5so15150165e9.1
 for <buildroot@busybox.net>; Fri, 11 Oct 2024 00:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728630305; x=1729235105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STzO2C0FoYFKnHehkhr62RZ7pLnhnA0B54iVk2XE/gI=;
 b=N11PJOZp3J968OhAFd4qPgRI40zmrj76g3LO7RA4z1w6tUkjqQ8gSqFZKi9DcHVgnr
 zNg3ravgYzUV1uMVdZ+NKCYMBG/cji/xkJsI9bd4L/XOVgIQtZp4Uaxa93pjxdXEXMJd
 B8gnZ61gyG1+pplcG89ztUfZM/VuZau/IGpFDVqy22JzBNj09i8mz8/29oogdO+XhZzY
 ueUh99sIs0i/+sFu+lyxlKHCLQTWFtA9z5/7zBcxXIDNDDIx4udpHpU12vUMaaSTj5u0
 o3YhUXFeJAtC+2doGIeSpQtFvXjn0645PhhLhDB5Sdir9nHMJyA2M1mddmsFtZKqoVbo
 DjgA==
X-Gm-Message-State: AOJu0Yyys9blLaA5PLeMMBdmiMECsiuy5kBcrBtHJUVXnwfZR83kPnLq
 tOUAJsPVfEwXqQYdIg9WU+JMN9SHH1g1RF0E+rfWKyJguZG3OLwDOWWsD/IEqPtNxjtPDeP+FTe
 cJQ==
X-Google-Smtp-Source: AGHT+IGOeYN5/C//XGsYgOkB1VAtezfPzVGMRWvKOG0h1m4e9edT+IRv3wO990nIkQ0gk5JcZbFG4w==
X-Received: by 2002:a05:600c:4fd4:b0:42c:bae0:f066 with SMTP id
 5b1f17b1804b1-4311decaadbmr14148505e9.13.1728630304626; 
 Fri, 11 Oct 2024 00:05:04 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311830612csm34226805e9.25.2024.10.11.00.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 00:05:04 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 11 Oct 2024 09:04:19 +0200
Message-ID: <20241011070420.251202-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1728630305; x=1729235105; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=STzO2C0FoYFKnHehkhr62RZ7pLnhnA0B54iVk2XE/gI=;
 b=L7o+7OCOAE1h0EKSQOGrgX+OhIHJ4YwBLv16RVBGWvG+M+TG+pQWypOIcPBgoX+tlc
 4YrLI6mYBPf/YUkzXaaW7Cg57D+akVRtoePE0ThOgZSaRmLKFYw7hz5HFKks1IxGQIX5
 mf1BxvXnNM1Px+eSjAaNpFinpb/VQ7mz1aMzUosoTfi+fDj3BTuij/wyn3NfV+s4t1ZA
 WJGI1BAG94PEWfCxrfq9MJDEmaLBVorZainzW1JSUBVkcAhG2vMoJD+gOsNLN2NrLw27
 sjzf1tnAwiUh+btdenOF5muaO1wdWJUlGnh978ZplFiJfVTODyMsgh8EOxvzqTqjMYJR
 K9dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=L7o+7OCO
Subject: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino_lime*: bump
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

now, U-Boot needs gnutls (mkeficapsule)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 5 +++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 5 +++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 8ffd3e4fbc..4769129ac1 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b9676828b737e8fb8eaa5198303d35d35e8df019550be153c8a42c99afe0cdd5  linux-6.6.36.tar.xz
+sha256  5fae869d6a24055c16ffc2d92669e3fb2b258e34d36c850bb8cf9def417ecfa0  linux-6.6.54.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index 7269980104..8491435683 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 82064078cc..efa2b6a249 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,11 +26,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 2e72a6def5..f376c6cd3c 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -26,11 +26,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
