Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1641FE94625
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC3EC612C3;
	Tue, 10 Feb 2026 00:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w21AHkPhGykj; Tue, 10 Feb 2026 00:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9790612BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682080;
	bh=0IEYt5dfAEfLCb42GBVnKJCWNMO5WCA/lPjmEigUwd4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rSHQvxkl88WN2D9WG65Id87sCFJnJnjE+w1ZI5ZLHeRp5j84ZL5exiqXSXEFRs37l
	 zWmra2x+v2tVCnMSav3zOpK4OPp/PQdU2BEBOmjQV8I0VdADPdW6ypCUQLrx6cT/2Y
	 39RJKJGl/gW0qFQD6sdJi/O7VL3ZK93MKSfuYRL4OkPEV3H7+Tcl7cDmIj2vaoLcGD
	 pky6H0+k5IxQT4wyIq53GqoLS3yJym6VPlDNk9MXrxhGdQy0ApF9nqDWJxLL7RDrUP
	 WtQDpcTjWGE2wIyO0U3KS7GFRZKEjez7idot3Rgs+LgPa9iOEKTJdL7n4efkM/1z14
	 Tm+iTFT9yKz0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9790612BC;
	Tue, 10 Feb 2026 00:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E9731A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0331240C33
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADxPjRxWPqLV for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F6D040C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6D040C4E
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F6D040C4E
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbI9vmsgm; Tue, 10 Feb 2026 01:07:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:31 +0100
Message-ID: <20260210000739.3810940-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBtf0e1gav9S9A8FedqnhBd3yaiw9mKo6rJyVByk31MXhnexwb3XJBAzuCvCCRVf3IIu9vKC3zzlh11duY0gO1MQv9Fo97JO/T1aAs4VprYeP4jZBXMm
 OTzOBtQtt+SZTZtFWSYDSX626Qz8olY5iBdX5miO2QvcscWx5BNc+ncznNBFD+4E8gqPlQsp1B1LWrym2nEO1dTqsO2I3qD5CTYr5AgW8LsPh9TFBq/6f6Dq
 XfPdLu4A+Lvckl/KaTiAFcqmBmlfhN5wE/XYkp8qw6fVmRflUGvAg1E34H0/36QZRRLg2RtFvGciH0EgLalkz4xg/4ifrk+6JH15iWP4vidXDCyJOmY9ErFS
 ZhWhR/5NkB0/m7wx8sFv1N1T7RxFyCazXbX0m67JtkKg1dJk3uTJ2gEpgWblsHViTLG6i5Y9YKClmcKDUO9l/Ldn2m2DLo9TKVsNp+FcMlvEOTOh39iDfqGA
 N3JNfBam2ehheYj2N3FOuRuqLAuHALgbyBFqct3S8DhTiNcKEIVQEDdgmDRKBBfe4IYm6ObvOp4h993C+GVNo7bJSzZRaexDdozzUhEozYCKWOTLSQdfdxIT
 Gqg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682065; bh=TUAaVHbHncUKJX2rudK/JiYX8rgomjmGiiXxQ515UNI=;
 h=From:To:Subject:Date:MIME-Version;
 b=bcIx6Kz2/WkK8EEad1xNa7ztpGt0HTOxOQ42z3a/bKD4FQ94iazOt2tRGVjXtQ/tA
 APUSxG+q7gQEHjn3VhInqyly3ZegK1/rWC+y4jdTtNO+aBA0MI95QgRszitYC55R2a
 Okjvneb3LPrYc9w3DPIbdMpqwvmPmlyMJau+FK4864ehIYaivigvNDj0SyyflvFvLP
 U49MI6u8FnSQJN1FLKQllsO+BKJ9OM45Y6OQIxlXxvdApHzCpv2XAA6XLbAnszYrj2
 y1uYPx/wssFlN72MlOljyJ9ockuafRBwb07cJ0W0t29aTsm+fORm0jUt4hnmXnapXg
 W1x0M+T9qpbEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bcIx6Kz2
Subject: [Buildroot] [PATCH v2 05/13] configs/freescale_imx6ullevk: bump
 Linux and U-Boot to lf-6.12.49-2.2.0
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version lf-6.12.49-2.2.0
* bumps U-Boot to version lf-6.12.49-2.2.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/imx6ullevk/patches/linux/linux.hash | 2 +-
 board/freescale/imx6ullevk/patches/uboot/uboot.hash | 2 +-
 configs/freescale_imx6ullevk_defconfig              | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
index b4f534dcc8..b138642633 100644
--- a/board/freescale/imx6ullevk/patches/linux/linux.hash
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
+sha256  2166d92e5631ee11bd249d492a1f4009c7635ee36b835fa55384b4ce41e8a63f  linux-imx-lf-6.12.49-2.2.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
index 309a684c2d..5d57adfa22 100644
--- a/board/freescale/imx6ullevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
+sha256  212ea4d8d442153ab732ab724282fef64450e9dab5cfe9565eec4f618e305a80  uboot-imx-lf-6.12.49-2.2.0.tar.gz
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 3d9e0869ac..99bbff605b 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.49-2.2.0)/linux-imx-lf-6.12.49-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.49-2.2.0)/uboot-imx-lf-6.12.49-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
