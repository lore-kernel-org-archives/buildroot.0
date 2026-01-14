Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957B3D39016
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55E6760BE1;
	Wed, 14 Jan 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXInYZFZ7sPT; Wed, 14 Jan 2026 19:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DAE60BC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420504;
	bh=WX9gvJfIEhLHlRArhX2VWwDQRi+41aVgtb2hods/gS8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qqjrDTApjGuvv4IgQSX8k223bbmQhwTtaHuwzAFQ3nRZMIxvL+zchJOHmXwJg5Z82
	 0p8qAMtdxmpWnt6F4YaNskEXQi0k0H/5rGDlBpweLS6Oj3ItenODAe16OuVYBqQrox
	 79CvhOR+mLFGF17xbX3Sk21ynUugRGcgk13/TWc+mrZxjE2HQw1QRzI6EVF34ZkKg/
	 Hqi086953Yrtnp+0wKNA96aI7ameSY/9MpO/zObo2a4JrhJwA9yVMeUN6STbxQJEKr
	 HDzw81XW3PczCsw+iDV724e1Wi/EpTBhhQBZC6QxbAwj4VGrnw4ykKG3CChDvnEj+M
	 a58muktcrQimg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DAE60BC3;
	Wed, 14 Jan 2026 19:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 262B01C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C42BA406FE
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dT47iVMc7ihh for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EE05400B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE05400B3
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EE05400B3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xBvzgao; Wed, 14 Jan 2026 20:54:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:34 +0100
Message-ID: <20260114195451.3978704-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCgihcE5ANmE4LoHgsJ0LdLfOfwXyZ3Wgr7NMVIpSAtKb/gCpuHhOcVSMxAytoPXiqI5fhxDf9hH/9Aico/jP0oh8SMLt12r69TB593xFV12CpUJiwmt
 iVoFKbMBHRwEdRtw+k8RrbLuuXxCxTGgp97TSaP+Qhkb0jMST2CRNv2ZCnezo+D9F+7AKHLxXoKvVVLYS5gdenKcmBwnsA8hDQJYZecQGdpuCEei1zyaoN5L
 WIRs6xIb/ac/arWlhDpTS5YrmAYQjBoM6d1LtjjkdNM/Fbg3i4NRilmcmnrNYL00QzjVKkuhRNkVzBhZrB6aR0IT5qbMcDNDDEnS8zhxKjlz9xPyW1OaWh5t
 pGQELGGZWehu8sRFmI4fLwfYBOMXSGTwEtVweX4OxWANLEdIGPuz4xzRyTtL2ssyOyCKLlXJmIg6Q8tfYxG0mG76UuwiiGOuV0jWRh7Tf7ryOGMsmufeC2Mx
 OCIWZvLYHeWBr+OIvgJDD22Sdok6qgXhQ1IV4NmFWRwf6XImidWQtDBXSkYfAt/CdEOt8TpX/93NQIGz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420493; bh=P4s1GVhr1lBBf31nOuiRrfF8itoj1uXhyncv/d/RFLM=;
 h=From:To:Subject:Date:MIME-Version;
 b=AZ2tY4gcs3df5JxQ4kWU4x/dBSY2upMNQQLkZgi/4kaYnkrUaiMpSdrmHaeDvIzRW
 BHT5Dk+zzi5UnmZEJFiTKGatxE69Z8GGuznMW9bAFPI2zcuzWl0BSwyJ9vWacsh9Ab
 zWjGWHDZDLe5I4RNGUBO7ETa45UD8yYl5xM1D+jNVz7X6LMXFwL9QuvQ4m3lYBaxTa
 bPqz0lSdPXpCrwTHGrI00O75r5xA5r7AHRj2SCMMDVJ/Nwnc5etaq0mOqgv5B/XOQe
 eQsCJLpeXJUrDncmONaR041xsrbx2pp66J8xBTwSYVuv6Bl7wfiZNhK8N6FpHfT31p
 2Bdb6gxEPzpMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=AZ2tY4gc
Subject: [Buildroot] [PATCH 01/17] configs/amarula_vyasa_rk3288: bump Linux
 to 6.18.5 and U-Boot to 2026.01
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
* bumps Linux kernel to version 6.18.5
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/amarula/vyasa/patches/linux/linux.hash | 2 +-
 board/amarula/vyasa/patches/uboot/uboot.hash | 2 +-
 configs/amarula_vyasa_rk3288_defconfig       | 9 +++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/board/amarula/vyasa/patches/linux/linux.hash b/board/amarula/vyasa/patches/linux/linux.hash
index b763fc947a..9f5d285c35 100644
--- a/board/amarula/vyasa/patches/linux/linux.hash
+++ b/board/amarula/vyasa/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  880ace63ca2291b8b639e9bd862cc828649d3e1e00ccfee5861473debd2e4dec  linux-6.1.91.tar.xz
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/amarula/vyasa/patches/uboot/uboot.hash b/board/amarula/vyasa/patches/uboot/uboot.hash
index 5e017f5499..b6a925ea4e 100644
--- a/board/amarula/vyasa/patches/uboot/uboot.hash
+++ b/board/amarula/vyasa/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index f59d78a5b9..be6d714e05 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/amarula/vyasa/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="vyasa-rk3288"
@@ -11,13 +11,13 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.91"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/amarula/vyasa/linux_gmac.fragment"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-vyasa"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3288-vyasa"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -25,11 +25,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
