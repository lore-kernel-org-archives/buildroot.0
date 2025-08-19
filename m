Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3AECA0EF7
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2198180D71;
	Tue, 19 Aug 2025 18:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h68_wYdZCqUe; Tue, 19 Aug 2025 18:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E1A880DD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E1A880DD3;
	Tue, 19 Aug 2025 18:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3494E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA3F840C71
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsnZ4hz2yjcN for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB25440C40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB25440C40
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB25440C40
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:05 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b5be5deso7329941a12.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627303; x=1756232103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pd5ANv+AcUhtnxsZLJ0wt4drKjAuqPttiCzaoxRFVCQ=;
 b=kfBQ7sfBcpA/9vQCcETmxQS50TBEpz4vfnri4stvLwe5nhF/zj2wgOwEx2hf/ki24J
 5bSzbaPPIpkLNQjHVyBZv+mJkT9cb1893mCkVwpbDivNudrtspfkz5Ly+EfypIqGSWT1
 ck05d3yVcpiKaqtKt8PEEN1k0eU3bkDcsygFwai2yAumm29p7ZOwvQuhbP6QI0atkVFC
 nrVUOZgY3Cr/Mgx9cWC99P0vD8AUT8X87tl+UEhjV+1Y7wC/r0qzl7t9OC8du870eE0T
 seTIFSzwXFx9P8J9Yse+LOCNKILCt9kzdTJvwImfO/fZqTSCgCxDiXalizDwQiJOEKZn
 0lmA==
X-Gm-Message-State: AOJu0Yze9iJOi/nRnvlJBKKKHGJCAXRmjAd9Rut8qNbUhYaQ0PX7q8+G
 Xdd4tTNoemHr8hbgzzaPP8FN1rZIZwCv/AHoauBoH3IT5gF6yAnfPaNr2HlbQt4UTZtwOie409H
 jeGAt
X-Gm-Gg: ASbGncvbTiApLAwURIOVqpcPuFj6eBLQpe7h9r9F4yzT+Skt59JIBhQPOSq7QMvInne
 FqIEblQjE0fUtHIj7FfGnrhP7UNyHSfeKPnJl8YqGaxoOKzfInJmJHbTEVHTY/iAMqhtf4Qg5Ye
 Cxf3nJ5S8kg/f/3bqn4/t3Z3of6ENuE2jVf11AAbo5G+AmSH+pzAata36rHe4+/fa2X6SCespaZ
 Eutp3ZTFrR4X+NxKepzQ5YnIwwXWhWbJpr3t7d6bdJ8vfJJlcXueSR4qTQSD2LBO7UWJ57QM65t
 3pE2uM3U1GoOOyA7L6qa3rm++dOdiNcbr5U7o9M9j9Xj3l9jKT8x6l6Sb6K0Clxs6d9pirUEf/a
 kVT7mJD13jz/YPuEt4nyBMT6YyL3jEP0Xh3TOKFh8O8rdi1oSG0jyu29LJ6EVoorhFF09kQGiIV
 mbD/4Vd69I/oEdBgNKy9Zz
X-Google-Smtp-Source: AGHT+IEL6g9HaOk3N6bjZHGwMpQEdBdHnhYBcVGl40HqVCByxXPS/Kuk49uHmzauHxD14ax4PgwqIg==
X-Received: by 2002:a05:6402:44c6:b0:617:fe86:6bff with SMTP id
 4fb4d7f45d1cf-61a9752ea51mr213822a12.8.1755627303502; 
 Tue, 19 Aug 2025 11:15:03 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:15:02 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:49 +0200
Message-ID: <20250819181451.3012126-5-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627303; x=1756232103;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pd5ANv+AcUhtnxsZLJ0wt4drKjAuqPttiCzaoxRFVCQ=;
 b=B4dteVBfArFaPkpIDi43oZaeGbogY48bZDUJVGepl8RINh7ZwrT89mJoJUf5Y0TAvr
 2OJUBlxVe02clojERhT6dHlspb+KUC2Q1aldprJWGP3ALKPIwEwXk0AObJy4jJ7Eqn0I
 KX1wzuF9I+vO9Zok5W/07tQxYuhNqU9OQgTFI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=B4dteVBf
Subject: [Buildroot] [PATCH 4/6]
 configs/engicam_imx6qdl_icore_rqs_defconfig: bump Linux to 6.12.36 and
 U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 6.12.36 and U-Boot to
version 2025.07.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 configs/engicam_imx6qdl_icore_rqs_defconfig | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_imx6qdl_icore_rqs_defconfig
index 7d4d4e3df4..bdf252c0f0 100644
--- a/configs/engicam_imx6qdl_icore_rqs_defconfig
+++ b/configs/engicam_imx6qdl_icore_rqs_defconfig
@@ -3,31 +3,37 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo RQS Starter Kit"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6_rqs/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore-rqs imx6q-icore-rqs"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-icore-rqs nxp/imx/imx6q-icore-rqs"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_rqs"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
