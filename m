Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC71DC021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5678114F;
	Sat, 14 Sep 2024 18:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAU5pITnOVnn; Sat, 14 Sep 2024 18:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81FB58116A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FB58116A;
	Sat, 14 Sep 2024 18:01:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1E81BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B80A8114F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7gHQi6cmxtK for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63D708110E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D708110E
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63D708110E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:01:54 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-20551eeba95so17614195ad.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726336913; x=1726941713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FFYtLfMwSAqZ28ahc9Z+q1GEwBaoh2IOFx7K8UfRCws=;
 b=ak7mbYplSw4P8VQmvXWUkv2Byi+zm0lA7iaSBBx2jl2/o+vgq8OLIM8zbUYJYCtkTu
 w9S7JBZVCG0y4tSgJFlCT5JHkVI61FyoX1tgYN+3WWP9NrfYum2mb7dx6RgvD7qUGYeN
 PREKWTm6sR+86CBeTrYNHbRyaLo7ZSQ8I1bewOXXl8XERXNBpZWphDfDNFLpNletggM4
 6wMHM+Zha9dl/dXiqDxtMTfTCAPebyU6ZyBOhMvC3eNzTugsAnCSdaC6Od8PAWQ85j+1
 6CIhe/CcDCXUnp4rLbdx4BHbRfv06U8vn2E5kR8xexJjaJ2BQhZWhs/nDRGT/gDwsdYD
 tfWg==
X-Gm-Message-State: AOJu0Yzi8qFjjW0z+pP1mdqOd34e29Vc02AVlF2B8feRJd1Ny72Se9Ml
 T+W0nkuYe8Fbe1PhOOzKU0fE4bU7s4PIS/3mpXW+0m0Va7Hm9tCi5Tq0TA==
X-Google-Smtp-Source: AGHT+IGJZbLEg3BDulrVfuW6smRM63mh8an/V3ae36jQzycHxQiJJH04OMUqhNK0qY2gxrASA1WB4g==
X-Received: by 2002:a17:902:f541:b0:202:348d:4e85 with SMTP id
 d9443c01a7336-2078296a9a8mr90817145ad.39.1726336912625; 
 Sat, 14 Sep 2024 11:01:52 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9233:d58b:c846:bbf8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946d4df9sm11839545ad.168.2024.09.14.11.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 11:01:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:01:48 -0300
Message-Id: <20240914180148.2447072-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726336913; x=1726941713; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FFYtLfMwSAqZ28ahc9Z+q1GEwBaoh2IOFx7K8UfRCws=;
 b=aqVW1m+Q+jI6igHkijZP/1W2D10Z4mjhxYLaZ97ndNo2SlqwzISKFARMRIQKIZX+Vh
 i9mqMQtj3OHj6/ey7Fjf5iNeyiJVBFOpp87fru11mVNMnQF15kt9OvKPCSvKfLu0GNXa
 qnP6UP06K4iezgW9/mHOxgtJKwaHYrYIRi/yEoIdS1FfExys01GrTV0REENW7E0hFv1K
 Y1pWuOvjEZyHt5dQCq4UAUXIC5AnE0r0J9bgFyyhfy7Mi/nMG7ec9wkg8gslFlVFPzoz
 AIXMV5B/H6JAVQlEjFLU7sAzM5ia8aF9B6cX5SIV4mbD5DJQ1rcTeqE+LdE/ZoezIreO
 MpMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aqVW1m+Q
Subject: [Buildroot] [PATCH] configs/imx6slevk: Update the kernel to 6.6.51
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

Kernel 5.15 fails to build with GCC 13.

Update to kernel 6.6.51 to avoid the build failure.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199854

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6slevk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
index 9448267e2b28..d78f2ecff0cd 100644
--- a/configs/imx6slevk_defconfig
+++ b/configs/imx6slevk_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -16,10 +16,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.51"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sl-evk"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
