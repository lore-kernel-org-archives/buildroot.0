Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26AEC04FF6
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 23:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F93240169;
	Fri, 19 Apr 2024 23:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZZfeP4BqaCN; Fri, 19 Apr 2024 23:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59BA040328
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59BA040328;
	Fri, 19 Apr 2024 23:20:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1601BF5DE
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 23:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BC086074A
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 23:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu-XKZdqZynE for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 23:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA2B0605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2B0605C4
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA2B0605C4
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 23:20:26 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2abae23d682so600041a91.3
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 16:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713568826; x=1714173626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLVGHY9KJb8k4WTtWQUTK4+gLzVkRYkLgz589osxrEA=;
 b=OLTQnxiRPokH89PxESDplCHbBs87Buv2h0RoeL526G1LnUZfoZ+m4y4m/n+C/ESzBt
 mmlF8EJtT0cQFz/2ZhfLzhU7y4vbwUlOl9dGZkwDbq5ZpRgiXfFfsFL9kMA99h+naNmX
 9hs/pWIfnpOVSeCvXIEz0RLQcPefFPGGgcirC9dp6W0DId/5UDocISf1MFZIXAHGrU1w
 cvPfeH5SdI8eL5+NVZPrIVAM0jHl3nzg7ko+t4n0h45w7Y5Dp3HlYZnKvRtHZ0w16wat
 6rOzQMUpm2SUCCd2TYCxbO3XC2GFycRZy8Mx5/FmCoAXUNdp84GfF7nQOpvv27BgGgck
 A34w==
X-Gm-Message-State: AOJu0Yw1Q2sO3zGBybc4Rb4rwdV8NEgFUEZ3Oe0TBxKOv97Rsw+nIf6s
 Nd5lTYHiA3q3u41jm2oRgQlURxb/fEsRQYMcUt9HqPX+UnZT6Xvg3jbENw==
X-Google-Smtp-Source: AGHT+IGanpa22IRdgIFroDMjWt1Iftd4mSe6clSUfBUUvIJRqWZ28yZxKPZg/X/yvkVnZe+FAlpyCg==
X-Received: by 2002:a17:902:7b88:b0:1e4:3299:2acc with SMTP id
 w8-20020a1709027b8800b001e432992accmr3798737pll.3.1713568825684; 
 Fri, 19 Apr 2024 16:20:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2414:477:6f03:2dd6])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902e5c800b001e420abf8c1sm3913733plf.165.2024.04.19.16.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 16:20:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 20:20:11 -0300
Message-Id: <20240419232011.959938-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713568826; x=1714173626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nLVGHY9KJb8k4WTtWQUTK4+gLzVkRYkLgz589osxrEA=;
 b=OyDE6lJr+X3M83sI7qPqbZxXzIJvPq4BJfJQtGohbGnk/FJZR9hDCXaSEbZdkPRVTN
 t8U2qJSzrhbLZQNSmCpc8cCf9awnaNOEYYZkaepepfJe0wLnmrbxRHW8usv46mX0WnJe
 Z6MmYxrG5h/GCZCnSXkCrngzInX2qn8EQD+KwHjCWbsOOqyaNWxa4MV875c5LTv1NtKg
 68IyytgPdrVvYtEAAPKULx8IkcKoT8KE3VcfiaDBvv1nQHhFGrhKmO8eKZtLSQUwitYQ
 bh8C/h/C6Fd3BnvJ11m4vm/LUk1gYRYvR62TNZfp71wjsIDmCycWFjr1E2R8LWSQvJgs
 ESUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OyDE6lJr
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

Update to U-Boot 2024.04 and kernel 6.6.28 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_defconfig     | 10 +++++-----
 configs/imx6-sabresd_qt5_defconfig | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index c237c2dc7c5a..d38478a6df07 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -33,8 +33,8 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd nxp/imx/imx6dl-sabresd nxp/imx/imx6qp-sabresd"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index e385e86b81b6..56470e27a9c3 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Additional features needed for packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -29,7 +29,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -38,10 +38,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.28"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd nxp/imx/imx6dl-sabresd nxp/imx/imx6qp-sabresd"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
