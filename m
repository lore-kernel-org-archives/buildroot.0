Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B271C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E0E60B07;
	Mon, 12 May 2025 16:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCyzAeSeTgTB; Mon, 12 May 2025 16:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD1560AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD1560AC0;
	Mon, 12 May 2025 16:48:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B29A0150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEBF1406D0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTJEsfj4sG_7 for <buildroot@buildroot.org>;
 Mon, 12 May 2025 16:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91958406EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91958406EA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91958406EA
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:48:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so48175575e9.1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747068488; x=1747673288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0aHwgvIDpj9d73OZ+h/noMQMvKfn/FN5qC1UM06RJk=;
 b=o+i5PO2oX350VN+zRKsgiQr+RsD5yTKfZe2n0h0+8C0G/vJ6qoQkckSFQP3fS1FUA0
 KRO7RUWqXxze44FQk3jlCtPKe0yA+qgdgkIhuQpjYqE40BPR3E+CaxMl3yxlXV6DeJRy
 proe9vGwtOTM3y2WsSaCzfaPm2MNoKKFGbd2XwvafqiK57y1qS1PPqfJIdCN3WEVIYT9
 NdCiF2lD9c4t5z2q+f3Pb/lT0AgSme9+FROXxhb+ESDy1BUNjefm47t+RocqKj7f+Dnm
 eQktikKF4k7azUdwgubDXYIdqWF9ZOq3mFO22FDNllQzwTIBUvgITWZtIs9wIXi9Ygt9
 ExPQ==
X-Gm-Message-State: AOJu0YwaSAvq1yAO6ivXq91F+Mprlyl1yznPlNPnOkDH+YdvTRM9s4lz
 1Wtm9+P6D66ZvWulgSp4saTy9kreMB8JVcjHTfAPxA6440c1j8rnziII0kT0TqXTwKavcPCCry0
 smJA=
X-Gm-Gg: ASbGnctFFB2NFx4IdZUrqzFYhxRxtHtNbETLhKY6QsUZtle27XzUQ4xCU4p6yfaojwq
 1pehe9UscMh3krAZvMs05yOSeRusdHxMJ8LahFpnsY/ajulgfDGSIk6Z0mWDpfgRIytKVbiTv+R
 tDkHftlp/iTjEqIwGGLMxw3AjQgRWsuntyi8CiRZ9wTLBMN9PokhOFNw+jMUHJ59hPO8un83u/x
 33S2vILKlbtsEImeMiDvZ+p9VI1hwRZJd1FFxUlMihjd0V4dTp3f5gXP67ux+mHNLJBvCseXJVP
 QWD114Mz4NLGCW8vELnayihsg3Ynp3sB+d0WbAuQbhSAD8N0BVdj3WrJ7NjllBT2Rh3JiDS0Joa
 yggtSg8Kbe6JZfE0DTE7ZKpY61tOER45e/+qGrOQr9qFf3iY2o5EyIGI33A==
X-Google-Smtp-Source: AGHT+IHq0JmpfzlznUyF56zYFC00detVp2sGBVyMkYXK5jJVdVyqMnzfeTWGfuVV/BC+bYM2a9gi9w==
X-Received: by 2002:a05:6000:2410:b0:3a0:7a5d:96f6 with SMTP id
 ffacd0b85a97d-3a1f64b5850mr12020361f8f.38.1747068488305; 
 Mon, 12 May 2025 09:48:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 (p5b26784b.dip0.t-ipconnect.de. [91.38.120.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5c5sm13237413f8f.96.2025.05.12.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 09:48:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 12 May 2025 18:48:05 +0200
Message-ID: <20250512164805.1524044-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747068488; x=1747673288;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C0aHwgvIDpj9d73OZ+h/noMQMvKfn/FN5qC1UM06RJk=;
 b=Vf0iwBt2ZBfdv2iGAWR3TUXaGx3udIJwQyJyV+WME42quLbKHUwkH3DrZq2WZxJET5
 YiFKr8VFrmwM2gNPF9/JKt7PrRpF3S2xE33bEcj2eWX95iAep987O9tnAmsuo8C3knWG
 rRWPNIic+5QVUgRE3bs54H1Tx/prc1XGHsFxw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Vf0iwBt2
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.28
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

The patch bumps the Linux kernel to version 6.12.28

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index e300dfeb824c..8ad0e7d8c000 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  60c70cdd70ddee384c004242e67844e3dd1fe28f75b26b3586859fff0a07bd23  linux-6.1.134.tar.xz
+sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 2169ab446581..2ca98c585602 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/imx6ulz-bsh-smm-m2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -9,11 +9,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.134"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ulz-bsh-smm-m2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ulz-bsh-smm-m2"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
