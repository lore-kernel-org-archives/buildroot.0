Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED09CC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 20:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F2F4031B;
	Sat, 24 Aug 2024 20:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tcp3LRvw3hYd; Sat, 24 Aug 2024 20:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D514031D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D514031D;
	Sat, 24 Aug 2024 20:41:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E68611BF2CF
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 20:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C09605D0
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 20:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbqi6SouuXhx for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 20:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 390DC605CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 390DC605CD
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 390DC605CD
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 20:41:56 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20227ba378eso28219825ad.0
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 13:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724532115; x=1725136915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zJjtnbWZZXV2CypwTLRayUynv2RL+3kfq36lqGHcUdg=;
 b=S6J+2jxblSoOE0LWyhX/sSkX0QZNlYec8NQUtiATpQrcmBczBsq91KyjhvNEZucL9r
 YmGi0+Hr8PxVKt5STyjCLT0xWVHgP17FiRXG3RvLvWca8wuDjd5/S61nJ5RNcLbaAUB2
 bonfNcQaonMspzyrSVrnXr8FPYleqwUA2kNVt6kjbkqJoQX+EL+4r0ORHh4LyH25kIvt
 6f3Za9IBuWmwiui9HHu4JlpTE4VaJlblekBciuupa5ZSosjSVwFKFd+7z9+YgIw+CHsk
 yBzsoZgssHrco0wGLivkagyaHOoObbbkOduOXmk9gorN10rp2fQk33z5Td/3BnICV/Bc
 mW6g==
X-Gm-Message-State: AOJu0YwkKy4YPcQSIuiJYeQ+eW2Ou72PZen91ZAIkL5ZQ67sfWVRQjE7
 Rga1emX4dRA1NesJVcCqkk8sz9C5uh6m0kg0eR/4M0pOqoTEL2k4J0/Epg==
X-Google-Smtp-Source: AGHT+IFEQz2a8uVt4Jy6UBru++aME7sPWEImM1bwIKF/6Rvi+pyuvcsWOKyk7wOS4ayvojn1VX0f4w==
X-Received: by 2002:a17:902:ec83:b0:202:1547:66ad with SMTP id
 d9443c01a7336-2039e548bfcmr58522855ad.65.1724532114986; 
 Sat, 24 Aug 2024 13:41:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44ec:77f0:fcc9:d01d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385ae7b1bsm45510975ad.262.2024.08.24.13.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 13:41:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 17:41:48 -0300
Message-Id: <20240824204148.1436407-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724532115; x=1725136915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zJjtnbWZZXV2CypwTLRayUynv2RL+3kfq36lqGHcUdg=;
 b=kcUUN+4+ycA4wHRXHjvKVBBn2N7SDegEkxUEFzp1l+YKh2dLDYkRZbdnceagFprFS9
 R4V9N41Pu7XM+xoFhYfto9E8OLNhUqVLPd0ya0Azj2xOH5NdlXBeSnq5ag1kkXuQqXyD
 AzAP8fmGlLY6ebNRbGwtimBVlAadbxmBrS+tspnLoPfw/NrCy8natgXT+OGylHODU+2b
 vvUBPrIsWLcv4ZX2UgyREyoHq25nIW0KvGObWI2oeA15VnI1WLb8viUAdY4bLukrNDiN
 mQZj5MCzt1T+xw7ROLz24mH2CAW8feP7eVaET3hMubJt9d7X5gLRYUFP3qei8C4+39a9
 4szA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kcUUN+4+
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: update U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to U-Boot 2024.07 and kernel 6.6.47 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabreauto_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index 24b3fd387f90..337a5ae9bbef 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_NEEDS_LZOP=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
@@ -34,8 +34,8 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto imx6dl-sabreauto imx6qp-sabreauto"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabreauto nxp/imx/imx6dl-sabreauto nxp/imx/imx6qp-sabreauto"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
