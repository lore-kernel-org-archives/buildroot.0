Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD3C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C3240074;
	Mon, 10 Apr 2023 17:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C3240074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7qcHFVIP7_U; Mon, 10 Apr 2023 17:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A9341800;
	Mon, 10 Apr 2023 17:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3A9341800
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AED561BF380
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 882C281DFF
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882C281DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pW9QhdcwOHg8 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:50:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CAF81DFE
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9CAF81DFE
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 17:50:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z26so7197564lfj.11
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 10:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681149025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2Ev5ZyEUdlazVAabw//LmiDhK3PbK6rOR3JGML/DMk=;
 b=M5XxK61a4LjQmUN6TbdrDV4TWEHT+W5gZcpuPXdBMwdA6He52lTq4mVFvMns44X5kq
 B8krE8jPCz8Owl12jFLkpDS/+q8xGa2Og4buTB4koXvL4LtGw/UVPr7cn8h0R11gUZc6
 bA/EDxx52tnzKOmnJwIQNxs87XApZX4v51T6LTd8nVExl1h6wgg4yEwpd0xNHYOH2pe4
 t0803tgqUM2dg2dIxiZnnfYnyxoIWgqbjKJGoLNz5mekQJ5CnWSrVSxeaYpau8WWFJlF
 FaQ6E4txJ/R4cvsuT17bP8nRI5DEQbnZDZIZzxH/cSD6aUssBhSbLmIuje9/4pxsrHhR
 h6aw==
X-Gm-Message-State: AAQBX9emrUzk9N/ggHxIYJwZGyTmZCXWqj8pOeHAjSktn2woDrgwpZfw
 IJEDTqhFdStwbw4E+/l8z1p6ESYHuODKsg==
X-Google-Smtp-Source: AKy350aROkvmldygdLtvJoiyV0kFE9/yzg8LTdNj1dAlII+4qnSVmgaE1nACtNQ0wwIYRLDuoXlLlg==
X-Received: by 2002:a19:7409:0:b0:4ec:8a4b:d9c9 with SMTP id
 v9-20020a197409000000b004ec8a4bd9c9mr1035797lfe.36.1681149025447; 
 Mon, 10 Apr 2023 10:50:25 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020a2e9808000000b00295b842c2dbsm2343994ljj.133.2023.04.10.10.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:50:24 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:50:18 +0300
Message-Id: <20230410175018.2283807-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410175018.2283807-1-geomatsi@gmail.com>
References: <20230410175018.2283807-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681149025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2Ev5ZyEUdlazVAabw//LmiDhK3PbK6rOR3JGML/DMk=;
 b=VJ6ksDDlHppnSTSnXtGlXT5m2rONQ1eqkmRHFOI7Sy6XOq7g8ZNsTicUs8/k3fvvWx
 XIScGNHp9MuAicO413jaLmksbSUADNOXUKuuPJhrdY37fqZMoltbgA1quh/4wDQaQprX
 W2zZ3fK126agWn20jH9MIXaVzOajk9RAZbCB2FhhPmDsK61Q0Ic7hmnEn6BOUOmA8ler
 ExUBpJyquJ6NkMS75Lo3hV6R4T2od4pGkd+R9kyKefAIJRJvLQ0ERVQ9h6vsk1tJ3SIL
 eqixaSp6hm56MDdIWqbAFLtrM6Qwg4e0hbA1VnwnLkxJIWBSKp/QnY/lfKE+Wqcquh+i
 Zzww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VJ6ksDDl
Subject: [Buildroot] [PATCH 3/3] configs/orangepi_zero_plus2: update BSP
 versions
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux kernel to 6.1.14, U-Boot to 2023.01, ATF to 2.8.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_plus2_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index ef171c3ad3..377e9f1c59 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,14 +2,14 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
