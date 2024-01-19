Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E82C47DD3
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 17:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BFEF41933;
	Fri, 19 Jan 2024 17:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFEF41933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XBnmjhl5jPO; Fri, 19 Jan 2024 17:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E26D418AA;
	Fri, 19 Jan 2024 17:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E26D418AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9428C1BF319
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C3FE404DB
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 17:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3FE404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsfXYMKn_g01 for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 17:06:57 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 501D940320
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 17:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 501D940320
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d6f7879fc8so1755895ad.1
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 09:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705684016; x=1706288816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxroKtKTdf6D4oYHpeXqYNeCRs0zYOGKSK3BfiirYRI=;
 b=WIOpIZJ+Ca7LSWRhVmsoELQ4Qdz057t9+ckYKnO+Iat9RpFTY1HLSd0um94Kg2mK9K
 xB3vOGZn6js4N5KuBoY4/4uUjUQsnppMP1/NMQe5lpfFP6fd9hKoFcMnvIE6ft0YTqSH
 JvSXf7XDgzvLTSuNTCNYLbNpFWQmFupfJR0EfnrtPD6uRlp6WJdBgo6EyOGzmZ7WbwmN
 D6/9xwDCVPUa0dkQ/QMGgvqeclOYvIXwhuj+kCNjSnezwkYr/o0zNAGtEYolvwcubCrh
 dOIOUtq8JENBhJeoB8o6DdjQBZ99LvM9dS0Dkf0fMi+LHSlPL+43q5Q9z7pP/5pTYdZx
 9usQ==
X-Gm-Message-State: AOJu0Yyti19Uu/qUjAgcZuEYcrbq8l65ucVYO3h8UPVIpdxJx0PTxWRp
 v+c6kP2Ab0pqoykrOeI3U/I2lgAZlYxHbWIpn66YY9KWIW/gvfmBrMJ2C0ov
X-Google-Smtp-Source: AGHT+IEg6bnMf2va5RUqZ47ROJNI6/ErNVvu/2u3IPKvFsBFhNV7OIbd1d9BbidgUg0peGxGuIXCIw==
X-Received: by 2002:a17:902:ed44:b0:1d7:4e2:293 with SMTP id
 y4-20020a170902ed4400b001d704e20293mr404790plb.0.1705684016222; 
 Fri, 19 Jan 2024 09:06:56 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a173:61bc:3362:89aa])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170902b60e00b001d4e765f5efsm3242316pls.110.2024.01.19.09.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 09:06:55 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 14:06:51 -0300
Message-Id: <20240119170651.641923-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705684016; x=1706288816; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxroKtKTdf6D4oYHpeXqYNeCRs0zYOGKSK3BfiirYRI=;
 b=CBGQRXBKaxbrb0iYB+f5WBkTxH096ZEkeB8NGLAVqkdydiLKp920x7+de41T5DK4V0
 Qnf7PoEUG74xj4v5w07Ch18b4CezFExX5CFbTleZeR4JFCsAdlhXHaw6SDB8hJI5gMXS
 WcqTJmxl9dg5l1JrkiVngXdSa8760A3CIeCuPi7a6ZmAktGpeWEtHUxOs4q3b/Ap3PP/
 gF2QC03clGwKan89WwWJtjGzmxefyhdc9StVNeSaNJQrYeVGtFaV7RWV4ssZdocdRz1x
 LvyGebq8hWLQyi1nQxSestJdSyIEI60EX2ucTip8NJqzYJvjIzjFvB2e/GsS39R5Vxtp
 5bmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CBGQRXBK
Subject: [Buildroot] [PATCH] configs/wandboard: Update U-Boot and kernel
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

Update U-Boot to version 2024.01 and kernel to 6.6.12.

In kernel 6.6 the arm32 i.MX device trees were placed into the
nxp/imx kernel directory, so adapt accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 0966719d486b..522173b8ed91 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
@@ -32,10 +32,10 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-wandboard nxp/imx/imx6dl-wandboard nxp/imx/imx6q-wandboard-revb1 nxp/imx/imx6dl-wandboard-revb1 nxp/imx/imx6q-wandboard-revd1 nxp/imx/imx6dl-wandboard-revd1 nxp/imx/imx6qp-wandboard-revd1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
