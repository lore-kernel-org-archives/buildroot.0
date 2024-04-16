Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836DCC4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 00:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F4D40199;
	Tue, 16 Apr 2024 00:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnl5m9WPP04Y; Tue, 16 Apr 2024 00:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2873C402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2873C402E5;
	Tue, 16 Apr 2024 00:01:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E05AA1BF947
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 00:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA6F281493
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 00:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQJxyfwHA232 for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 00:01:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0905480E99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0905480E99
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0905480E99
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 00:01:12 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7d6b362115eso66271239f.0
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 17:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713225672; x=1713830472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJLI0dS+szXngaovcv34Uz0/0eg0IsSuIRrdZcx3KgY=;
 b=b1hc4D/txrERysysKp+5Ho05yujBfx8VvOwkYbwmeUjfIR7+yy/ejNfL79BFGWFKUV
 q7+oL7mloQffPYg+Q+/dUBKYY6w6JRV+sZy26SasLxWWK6VYrxyOjkrqABBmpItVd3YF
 Q8kU1mXajsoOcp7pBwBAL1MnWS9rMbTvlrestjlk9xL/RhdXei4TctGhv9FdOIze3Fix
 tD2J1RvpBjBGn3kI3fcz2vzgDdjTSD93rkrF9fXWVs6tyNnzSHD4Cr0T+4RNrrGBiL0r
 SzkMpiG6Ci0sQlUz8byxTP6lSVTk85dvpZkZ2kXZe51brkki6IU61XfHsOmz+wW5QU4/
 mJ9Q==
X-Gm-Message-State: AOJu0YwO01qpO8+yJuiWqWRwWrlw1ASl1WUX/NlB9dLpt+5OevZZWzTq
 FxFiJ6gHqULNAkH5njTeCJnwsSwIy2BuGT3ltZvoe78Ix1fRPzfYDr67nA==
X-Google-Smtp-Source: AGHT+IGwfR9YIaijDSZNuxhtxxnsTOMXsO2B61UisQxqAk5VX6I7vQuYV0lQxu8of+7vZ08oW1namg==
X-Received: by 2002:a05:6602:4ed7:b0:7d5:ddc8:504d with SMTP id
 gk23-20020a0566024ed700b007d5ddc8504dmr10445105iob.0.1713225671624; 
 Mon, 15 Apr 2024 17:01:11 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8353:72e9:781e:a68e])
 by smtp.gmail.com with ESMTPSA id
 b64-20020a636743000000b005f75214ab94sm4333014pgc.87.2024.04.15.17.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 17:01:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 21:01:05 -0300
Message-Id: <20240416000105.95779-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713225672; x=1713830472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mJLI0dS+szXngaovcv34Uz0/0eg0IsSuIRrdZcx3KgY=;
 b=Ux4S4s/uKiC9Pp6EFXpNMfUkHxVZPMqzrJQbjX5Z+R4Wrnm4cPLz4N3xPfPfy9AHrb
 Wtwym3tX0dBZNBEErnSpG6iUDkdBLDc8m3E+vgKy14OF8nNz7ROojLweDFMFuBMGMCHQ
 8t2W3dM8LeqNcRFI43oCiHgDkJKf+GkxgmEzNgzEUw4qMGkbS7KnZ6dMR3kbLYouCYQS
 flLqFssWs57Ejc2qQrK2G1bnu/YQP9L6w8yWem6O8HSs10YfS9UZTJXgnRfvx5wqDrOT
 R3uc5p/iTGVtZMgXoybADc5Fq+6hxrqMz/uC102A6EeYia0lY8ZDC7y2to7PgzGtYr8Q
 k7Mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ux4S4s/u
Subject: [Buildroot] [PATCH] configs/mx6cubox: update U-Boot and kernel
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

Update to U-Boot 2024.04 and kernel 6.6.27 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx6cubox_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index cbd9378064a9..46a1400d9f2c 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -6,8 +6,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
 # Toolchain
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,10 +17,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.71"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-cubox-i nxp/imx/imx6dl-cubox-i-emmc-som-v15 nxp/imx/imx6dl-cubox-i-som-v15 nxp/imx/imx6dl-hummingboard nxp/imx/imx6dl-hummingboard-emmc-som-v15 nxp/imx/imx6dl-hummingboard-som-v15 nxp/imx/imx6q-cubox-i nxp/imx/imx6q-cubox-i-emmc-som-v15 nxp/imx/imx6q-cubox-i-som-v15 nxp/imx/imx6q-hummingboard nxp/imx/imx6q-hummingboard-emmc-som-v15 nxp/imx/imx6q-hummingboard-som-v15"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
