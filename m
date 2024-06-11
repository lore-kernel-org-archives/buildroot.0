Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BCCC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C8460F0D;
	Tue, 11 Jun 2024 18:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsNceAMIcTsh; Tue, 11 Jun 2024 18:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BB761024
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BB761024;
	Tue, 11 Jun 2024 18:02:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DB911BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A38E402A7
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCQw37396OA1 for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDA14403BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA14403BF
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDA14403BF
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2c2dee9d9a1so2568798a91.3
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128940; x=1718733740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2M8b13f1yLXSfS5IEGfwpKnC7HlhBnACcX5nxaSi5ew=;
 b=JsKvG8uGgXak2PqVx9EFq7XIRq19rG7OT0ghnLKoA4SiqiLJyMPetBovZtY7975GIm
 DAASxRPv2OtqYyc/Ji/UXGKbTIkwYQzbdPEJHeMPgUon0RbX2306KuflS0gVtsDTdfWC
 d+iSEgATpy5iJimdQfGtcfJrDqhJRmOCit9cxhY1xWqzlURkLi2EXisMgl6TPPlDeDVi
 3crxJdDYwt5AGNgxfEHS92GaV3096Tk4FFOVm1IDwLSsIAjZQAw4N1T91ifRC1bJ72GV
 LiZ5xQu9GWjyuUgJ2Aoo0fq/NcmetP4+8upSLOTKpIyL3Pg3r1yS7WcKYV9+dfsTtcXB
 85kA==
X-Gm-Message-State: AOJu0YyD+0aksWFAphONVO+B+Sgm598Ba8KNtsUozAYYUoGtks/Q0GV9
 j4MMUF61+gidR3yZOssDgafbzPUuWoAafmyur2YpI+Akdm8XOz2WG6X5WCfS
X-Google-Smtp-Source: AGHT+IHytuB4d0FNUCMG3PjZ+PDssKNozijCSxRlvW85+vtkw8yNt6Q4sA8PH64zwEX13PQ3GEhfrA==
X-Received: by 2002:a17:90a:eacf:b0:2c2:d163:d761 with SMTP id
 98e67ed59e1d1-2c2d163d873mr8606179a91.47.1718128939994; 
 Tue, 11 Jun 2024 11:02:19 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:19 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:02:06 -0700
Message-ID: <20240611180207.2138847-8-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128940; x=1718733740; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2M8b13f1yLXSfS5IEGfwpKnC7HlhBnACcX5nxaSi5ew=;
 b=fD/dREQVFvgf/qlS28KHoFcodIOBxrsw6hAJ+EDxcwgsEGqueIg30myX3nWzxVzZMW
 MxYmlqspYDBH4qxWtS2UO+LashrxPNYOYp+hlfoVst82rfrMFNRQxL2+llxZxqM9AzEW
 ru8qi7GAtHqn1hBm7PFKjHt+9g9iqhvsSqaG9SRtuUpYZDI53WxsyOwmOa8/qZDPeDsr
 62z/PjFEgm2o0avYZfB8AG/7RKP/SuXxjrpLLZDIJZhO6W9FeltSe3kg2JsX0Bm80jrn
 FHnu+do+ttiqJrOU1B9dkVm99jH4WtkFpK7TeovnHtEjJ+3IGP3m6j8E5mQXjOZoyowx
 Pksg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fD/dREQV
Subject: [Buildroot] [PATCH 7/8] configs/nitrogen8ulp: new defconfig
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

More details on the platform here:

https://www.ezurio.com/system-on-module/nxp-imx8/nitrogen8ulp-som

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 configs/nitrogen8ulp_defconfig | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 configs/nitrogen8ulp_defconfig

diff --git a/configs/nitrogen8ulp_defconfig b/configs/nitrogen8ulp_defconfig
new file mode 100644
index 0000000000..4ce6c29387
--- /dev/null
+++ b/configs/nitrogen8ulp_defconfig
@@ -0,0 +1,63 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a35=y
+
+# System
+BR2_SSP_NONE=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP3"
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_BOUNDARY_PATH)/board/boundarydevices/nitrogen8ulp/mcore-binary-copy.sh board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_BOUNDARY_PATH)/board/boundarydevices/common/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8ulp-nitrogen-som.dtb"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# IMX Firmware
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_UPOWER=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# ARM Trusted Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+# Latest revision of branch boundary-lf-6.1.55-2.0.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/d18357b7.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8ulp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8ulp_nitrogen_som_2gr0"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+# Latest revision of branch boundary-v2022.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/e3228228.tar.gz"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+# Latest revision  of branch boundary-imx_6.1.y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="boundary"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8ulp-nitrogen-som"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
