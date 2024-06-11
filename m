Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50423C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F126E6101D;
	Tue, 11 Jun 2024 18:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecT2LVdJPdck; Tue, 11 Jun 2024 18:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D3361024
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0D3361024;
	Tue, 11 Jun 2024 18:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA4E1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 589EC60A55
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haAiGp6WlsQO for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6696660B79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6696660B79
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6696660B79
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:23 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-705b9a89e08so266516b3a.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128942; x=1718733742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jyn4flUVJWfgb7XJVsso/Zo+QTx7gl0QIAGNTQ86qM=;
 b=RtOxeeLY9no8LP4njZJoBwdb+48bd7kD/lfnNdKxJLXGmcwYnjGGwEH4tOOe5KCNfx
 8qB7WRrYJZj/TBs1DaKSM9vH4bheV0cf5q07zPdxjR47qLN9SFHJdtfkPiIlG3wBOtl/
 ckFCALQH5EQ2jHUQ38+CRnsN5yZ4S8w9k+r9tYx9sq5UhfyhFSmZn+T243MQJEwME8S8
 3WnxmUP27xJ3xMAKDR+guTRTMw1FfaHBpWJusNcaTd/Av00LH3jV0JBiii3MdwQgOimZ
 zFLvLzTMX/GZn6dAtDy7IC3cQICfmzp2AhxAjFdFDl6MS0pFBqbDt/9M5MepBaTnn77c
 zU/g==
X-Gm-Message-State: AOJu0Yzw+KOxIEP9Ol8CZxc8qLQTlOIkFXRD8qIUuf65cI5uyWe1NAG5
 scd3wrfuQoCJuEJIcIO7VoenYpiAygyzuGRB4DgrfhTLaCpqXq6oacU8SiAB
X-Google-Smtp-Source: AGHT+IEjprSXZW1LJ6OpnEh2eevTNQ7BpSZ9nUvQn8z210ArEkK40CEuAoJxoMjsm2N23BHzaHRhBw==
X-Received: by 2002:a17:90a:7848:b0:2c2:feaa:72cd with SMTP id
 98e67ed59e1d1-2c2feaa7b77mr6130063a91.41.1718128942051; 
 Tue, 11 Jun 2024 11:02:22 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:20 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:02:07 -0700
Message-ID: <20240611180207.2138847-9-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128942; x=1718733742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jyn4flUVJWfgb7XJVsso/Zo+QTx7gl0QIAGNTQ86qM=;
 b=ZsrAycDdEw83sFho8FXtm4Ohpx1ugyOBovKpBqxNFYNOIIRhLKyArJ9C+JvpoBymwB
 OW8YXDfwapFSR2xsM0kJP3YEucr6moLjFDYmJqig30sgNH7bwAnbWE2dNJU+0G768vab
 tSb3nDk5IKd5zDBAQ4crJEMtUjv0JPXdSNNEhBWbblNwiZjFoA1KJZBt2O7q7JDJj/Bz
 sVJfJKN7L3nuuDRWE+TakO/PvX1coQA3PcuhTW5hDPADVrLeP6l3QL0UgX/G8xO9EpNg
 G9E1C5AGOjz4ugmtLYrTerhDKi7OSpUiSbIbIzMCHr8l1EPJAESQ2b1aF9SIwr0+l+L8
 RcCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZsrAycDd
Subject: [Buildroot] [PATCH 8/8] configs/nitrogen93: new defconfig
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

https://www.ezurio.com/system-on-module/nxp-imx9/nitrogen93-smarc

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 configs/nitrogen93_defconfig | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 configs/nitrogen93_defconfig

diff --git a/configs/nitrogen93_defconfig b/configs/nitrogen93_defconfig
new file mode 100644
index 0000000000..d97ccd2c95
--- /dev/null
+++ b/configs/nitrogen93_defconfig
@@ -0,0 +1,60 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a55=y
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_BOUNDARY_PATH)/board/boundarydevices/common/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx93-nitrogen-smarc.dtb"
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
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# ARM Trusted Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.55-2.2.0)/imx-atf-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_nitrogen_smarc"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+# Latest revision of branch boundary-lf_v2023.04
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/73dcd1c4.tar.gz"
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
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-nitrogen-smarc freescale/imx93-nitrogen-smarc-lvds"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
