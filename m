Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EDBC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 12:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6696F60676;
	Mon, 13 May 2024 12:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbtRzvzXcgqM; Mon, 13 May 2024 12:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B24606AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B24606AA;
	Mon, 13 May 2024 12:34:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABBAC1BF35B
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 12:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9812F4079E
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 12:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTFCy0KD82XX for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 12:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FD9340790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FD9340790
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FD9340790
 for <buildroot@buildroot.org>; Mon, 13 May 2024 12:34:49 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ecd8f9fb2dso1177295ad.0
 for <buildroot@buildroot.org>; Mon, 13 May 2024 05:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715603688; x=1716208488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0IL890cry+sLWajeDjPOotMi+zx1lMiA+stwMaxqzgg=;
 b=Q28Tv2QbW+GnRP5THT666LOouK7WL/z9TeX6udDW29vIKz5+zL58EgFmKAtDpAPjHc
 GVM5xBsAYYVBp8mYhEQwNYBxS4m0peRzQ2Tsf2fijDtOiqiE3YFYTeZdHB/bQ+CgNg9p
 ltST01sU5LxpqPvY+YINrLiEVSSqEm4X8DYOLex3pXCVVJBPp0a4wen8jXR/Ly9bVNdn
 9tJ/AFw7A3ui/6aCUcdEU4uVancL7eaJnbgrFcegQMrXswZzekK2WQonH3sTnIpxT1q7
 u6/S9eHarqVuakja+HqPz9PzrgqBjosShwnlrrOxxqiDr+KRh1IoMxAISdwFlNS92yHE
 hgzQ==
X-Gm-Message-State: AOJu0YwdhC/4DTFtt864nyqbFfCL6WM+bBRTnvDnHwpEFOLfPlEr+b1e
 JjqqIvZsZJQ9Cr3DjeWX/PPjMzgZPIzzK6QWsu2Ik9LiHqREJw55yke8yA==
X-Google-Smtp-Source: AGHT+IF5qAkDEeYYpv8i/s+C01NdIllP+Tl1FFjxZ0Z/qTdSl9sDlRCXa7kVtY4lINaz8RABjJR57Q==
X-Received: by 2002:a05:6a20:a122:b0:1af:5385:3aff with SMTP id
 adf61e73a8af0-1afde1bca05mr13296020637.3.1715603688160; 
 Mon, 13 May 2024 05:34:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a537:d479:4ca7:2ac8])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b3493asm7280476b3a.191.2024.05.13.05.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 05:34:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 09:34:42 -0300
Message-Id: <20240513123442.213242-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715603688; x=1716208488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0IL890cry+sLWajeDjPOotMi+zx1lMiA+stwMaxqzgg=;
 b=U8hMABwsqic/wsErb9i4kuc/s0h09zZou/37hwB2omCwDkePTYrDRKBScHsFud8NHu
 cbPXqCHkZrVjlFJWfZWGTfM5EARIvs6jMvIwBvdEdyc64jQqilJzJBzcNnklM7mx9akd
 2+4WuOuaftE+QJFpd/y0KSa8s7jPIynhE647bhIbnYgyDUX/l2XuvxI+ddCOPftZodo6
 r637+VdSaQu5+ray0xTUrv11rVt/iK8JCi1bTUeqQQg9j0gK0z9bQ9igNqugYagZAprh
 fuGu6uCPL18yEV+k7H5ZIV/Tj3YNoTgNtfHUi4iPsc1WYCTATAe/EVDxcA7aRHu1xFM6
 qpGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U8hMABws
Subject: [Buildroot] [PATCH] configs/freescale_imx93evk: Update to NXP
 lf-6.6.3-1.0.0
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
Cc: Fabio Estevam <festevam@gmail.com>, ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update kernel, TF-A and U-Boot repos to the NXP lf-6.6.3-1.0.0 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/freescale_imx93evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index fa1696788464..f30bafd9a2c3 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93evk/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.55-2.2.0)/linux-imx-lf-6.1.55-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.3-1.0.0)/linux-imx-lf-6.6.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.55-2.2.0)/imx-atf-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.3-1.0.0)/imx-atf-lf-6.6.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.55-2.2.0)/uboot-imx-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.3-1.0.0)/uboot-imx-lf-6.6.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
