Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6DCA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF09D40CFC;
	Tue, 19 Aug 2025 18:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK8zT6f3jKCZ; Tue, 19 Aug 2025 18:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF68640C3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF68640C3A;
	Tue, 19 Aug 2025 18:15:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4179EE0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B8C60BA7
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LM35w_kdqaF0 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74A1F607C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74A1F607C5
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74A1F607C5
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so762915866b.3
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627302; x=1756232102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=te/tXIrPY5+8M+c2P5F7cWUB84VNY89dLYpzjNjvOHM=;
 b=SLb/nyFZcDnNm7rc5jWgHv5ve2F7oJTta0W4S678yikQm8TQywVz604YXyk7K3/RaK
 /rHdRbmcF7WO0/181CDNWHv8A9R9H5gwOvKYqNxyRuVK9rxg23lth9COdCmolbbMCL/G
 NMfNvM0D8f906Bvn09ThmrfygGCXOY0CuRxw2CH+VL9EPfkt6EnZh87BumIclmS5MxB/
 S/4ygMO5107KmLsxew1fRC3u4D8UWdeGMthF6GZGcIyM1XsmnUF9S1nosp7alhnUGD/s
 Q+jq+a2ZW0r/EG4/dHP1nrV7lb4pTcQeTRXkfUDzBI+zWoh/GMlwD5LFp8ds3c7U3QrX
 LvDw==
X-Gm-Message-State: AOJu0Yx91i1Jmd9dk7E9k2DbzgUycjjYtKX0H6AE9ZOKXeP+AMyIcC7O
 xtBoXWPLM2ecOjxt22Py38fQ9cxeTT2zcfmGcew08qwhtcZSuGag3/TCQqBcH2c8Ekt6eiWMMCu
 Wwjjz
X-Gm-Gg: ASbGncuJNKDm+VSrBkSQhh4VRcfXrcnzBFXAlvfzvrAuShqOZfVnS2c5xeMe7qweHYx
 cfbURJIeVkqjc8x8Vo/ZHu/QIaY7cZspkfcXbMKVvlqUbxCSH1BMLeJHwqGlsIgKQDJLvkTWWsG
 w9Lgac0kozEb9DnZePOe9XBbmwLmciGZk3RuKFBlJF3/5SxCiJvhc2l9U7BWsvIWR3Vn9oW7HxZ
 ILn8/TY9lYTwji6RHu3HKlma5e4v4cd8kgOdpAGU5DFdLEGMUSyP8MUHRuQMl2QhvNvdyQrdDSa
 IzfA2hIgKThA9oe+Ll8VyaXeunuH7CJDUw8efcg+JBbK+6W56kC30M8XXntS1t6MOLcfkzLQFMd
 jajH5psfA/Hbc4qT0lCtnyZYC93TDdqlBAsX9FEZNLFBZkrzRqGp7gdr56pcpRwplIXenkFSnQ5
 pbRZ8m8e2RxOUvafpiIARX
X-Google-Smtp-Source: AGHT+IExBuIENRsKNXtHZd9L2EAroAP+SvfqkTnLmJv9MZ6+MiUXFhTCO23ezlt5W5DbmfumvTlX/A==
X-Received: by 2002:a17:907:1b22:b0:af9:5867:163 with SMTP id
 a640c23a62f3a-afddcfb55e1mr295084166b.42.1755627301711; 
 Tue, 19 Aug 2025 11:15:01 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:15:00 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:48 +0200
Message-ID: <20250819181451.3012126-4-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627302; x=1756232102;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=te/tXIrPY5+8M+c2P5F7cWUB84VNY89dLYpzjNjvOHM=;
 b=Yyx+45CoSAf5vbmBA2fLZdy0fD0m5Rr0KVouHLB2m5+7+WhLLbe1mYzw0LW1y+T1iq
 rsSZ2zh2mel4qYmZdH3aAPEaAEDUbMk/hetf6/Uzr94ocS4RdcYXuxzTn4cWkTZm41WK
 vFh61PEtBy/2/RcSByMbi3PTs6Swxg/BoLwRc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Yyx+45Co
Subject: [Buildroot] [PATCH 3/6]
 configs/engicam_imx6qdl_icore_qt5_defconfig: bump Linux to 6.12.36 and
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
version 2025.07. Drop linux fragment patch because it's totally
no documented.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 board/engicam/icorem6/linux_qt5.fragment    |  4 ----
 configs/engicam_imx6qdl_icore_qt5_defconfig | 16 ++++++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 board/engicam/icorem6/linux_qt5.fragment

diff --git a/board/engicam/icorem6/linux_qt5.fragment b/board/engicam/icorem6/linux_qt5.fragment
deleted file mode 100644
index 5c0505e510..0000000000
--- a/board/engicam/icorem6/linux_qt5.fragment
+++ /dev/null
@@ -1,4 +0,0 @@
-# Currently kernel mainline exhibits issues when running cpufreq as ondemand
-# governor on mx6.
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 8b0c8bbe28..bfe03d725e 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -3,8 +3,9 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -13,13 +14,13 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/engicam/icorem6/linux_qt5.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10 imx6q-icore-ofcap12"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-icore nxp/imx/imx6q-icore nxp/imx/imx6q-icore-ofcap10 nxp/imx/imx6q-icore-ofcap12"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BITSTREAM_VERA=y
 BR2_PACKAGE_CANTARELL=y
 BR2_PACKAGE_DEJAVU=y
@@ -44,17 +45,20 @@ BR2_PACKAGE_QT5BASE_GIF=y
 BR2_PACKAGE_QT5BASE_JPEG=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="130M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
