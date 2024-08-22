Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAB2C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 14:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6E781291;
	Thu, 22 Aug 2024 14:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oB8kEW3NHXj; Thu, 22 Aug 2024 14:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D78281298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D78281298;
	Thu, 22 Aug 2024 14:37:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1B31BF36D
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375DF81291
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpgbPtWOObDE for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 14:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 908BC81298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 908BC81298
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 908BC81298
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 14:37:45 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7143ae1b560so383798b3a.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 07:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724337464; x=1724942264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bis+ofh+ycFx6lD4tTiTlt/qEDvOHPFDC4ui8X4k1CM=;
 b=tKbBMMji0J7wMc4FWOd7jdZ7WW7h6xjZMTrxGhZSpBwUvzNZezgn63QAJ03ZCcRv7k
 iKoGPlLjSyDDTvOGgZ6Zpf0oybUw38cwxOQsI0erMsEA8x8BusZiyV2ZvdjovKknzNvu
 x+HxMAuhdL+vcqUQcv+tukTyO/oUKtmCsSHa7lnUc0STqvZ/Hq+g1j7wjbDvU8tixstF
 mtf2bLYbfu5M6R8/tK39KCj8xZ9/AyjMXYNB0+HUeMJLAVmVWO1rWXVFSOyOpn0CvdP9
 JsC3DlhayDPqRohCLQR8AMftuYhBez2EEw/OAQ26FufmyL5uq3PXiNmZHDjA0qUUUIOR
 qJYQ==
X-Gm-Message-State: AOJu0Yz1XYssxZqUro6ZYGarb0CHukbRvREmZCoiyKyHj2W6xM/ukJDE
 QHf//4B1QzCqjYtMc5Q3zgU37ctzpQY/kiQDMr+j2XrcocohtTXq/kt+Lg==
X-Google-Smtp-Source: AGHT+IH5GlpsJFfisCcfs0DfmjVzbs0lCq74kmBbe8jYxiQtSOsX48LKZnbYa0PxWQpWj0oOqSdWgg==
X-Received: by 2002:a05:6a00:c92:b0:714:2dc9:fbaf with SMTP id
 d2e1a72fcca58-7142dc9fc7emr5121852b3a.18.1724337463607; 
 Thu, 22 Aug 2024 07:37:43 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fae3:17e0:b5c:9a6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-714342732b5sm1499435b3a.92.2024.08.22.07.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 07:37:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 11:37:38 -0300
Message-Id: <20240822143738.3031317-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724337464; x=1724942264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bis+ofh+ycFx6lD4tTiTlt/qEDvOHPFDC4ui8X4k1CM=;
 b=IGxwVUfDWBfUMK5GveKjp+8Ro0ZOoz5AYnX/lS4npbtqO+b9162H6j8pRvO4odInoo
 Sn47v+EgOEJgwSFxVW6Qsx88gY6bCyM0ZQ3vdW0XP0W1Gx1MChD3vBRtkYRUm+KxMSXS
 VmR0eWbmcWwDPtE8n2toN0HN8M/BKPAo+0HgCH73eVXE7t+OPMlyurYQn2bOdVkKV76C
 Vw3sWLarHNTI0IqrVf+xrKMNoDhtMTxTzeRIUiYBaOfDSHqTzPcUZosMWxl4xHEeFR8w
 tPg++WtbkDL+yphHN0rtCOui3tH6cDoK6iD04yRodFHwW3flNvVanFoKledg0mTnFRq7
 EJeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IGxwVUfD
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: update U-Boot and kernel
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
 configs/imx6-sabresd_defconfig     | 4 ++--
 configs/imx6-sabresd_qt5_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index d38478a6df07..d5a8b110a762 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd nxp/imx/imx6dl-sabresd nxp/imx/imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 56470e27a9c3..0db5f707abd2 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -29,7 +29,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd nxp/imx/imx6dl-sabresd nxp/imx/imx6qp-sabresd"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
