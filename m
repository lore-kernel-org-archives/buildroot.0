Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B0CE94626
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6226860F1A;
	Tue, 10 Feb 2026 00:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58Dr3UG4aZum; Tue, 10 Feb 2026 00:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5365360B05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682074;
	bh=WqcRDobr/ZE7b5XIc7cQOclucpUla4SMPtfkdClnNyA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UdXgiQzGjnKMBLlo0uKl9O/5EJWiK1KCacowQlBFhJpa2suxb+6xeV6aSvLC+hkk/
	 duRr+cpPWjwu1slKXEiNHnb16h0C9bQ3jFhXRQUcFQ1bY6frU/BHq9Xo6Ol13/4O0W
	 to8aaLTvxXC3urCysgUL2O0ljECXFxHwLLMg+FpOrW9apnNT+rO8fGoz6lHL8Z/Kz4
	 DrHj3ElvpvyomHSLKNUu5XuyXymeb/OYrKomDuwvSEN0xXwrzQGOcx2DK81bOz/MQh
	 xRggM2x2Cx/iZ3zZHev+k7ReiOYSwQe7i0m3NM/iLIB5CPNyb8vX1O/KzmHGge2fnR
	 ejuXpJm4C4vPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5365360B05;
	Tue, 10 Feb 2026 00:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEFB1A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9558540C2D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tSLuk2sfCJj for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78AE640C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78AE640C46
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78AE640C46
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbI8vmsg3; Tue, 10 Feb 2026 01:07:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:27 +0100
Message-ID: <20260210000739.3810940-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ2IqfWDInyav9qhFZgZkjH5kRuBDtLtbGekXDHdoZ0+Iv8m6V3LqutOhQot5QsO6GruIOav2HxHYxcRVY/PpCYFvb/PvP93inmW5AbTx/VfD/RMnI9C
 aWr+Y4NpC8bKxvejzqsHQlb1b2wn4QNs8xv0dsnaWW8q6rqCkqez40y2Do5F4Ym2RYaRQmTIM5mkC/xFYxtrz4uItkPQBzYBSVTpGTF45fvrptgwgqp4h2WD
 0NJLRPacDqWu6zIgHY2akW4t0Fvr4rUrfBIG2+2UqXOwvLF4p1O41+9mD+2I9G6RqgV8DHvC2F4P+FeXHIodjoaNQAC47Qb+LvVZp/tGytDVyf0DjVJ6K9eb
 w+YW259OTogW1j5X2cz0lNwDv6/XRIsqc9ujEkc6uc4IpcT6PLa/5zmyBZ73DpiWB0UJD+JUkshYNJ8y3GtdyW3tiOOSmh1ppPODISNHGVZxKsOBzI+i/qTV
 P61mMkSv26jcuRwSfKsQV25u9fd+wK5RVRPlEvCz+9b3xMYAtLFvucUs8o7lWHYNfVzenhW8TDLdGa5TEayp4FMdNsFxI9+g3q2W6Tv2Oh0ToqojKyFkh/22
 vKQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682064; bh=t94QHMEiOJ1QdrymVi0TiACuv478lcOTfZfWME5D7lE=;
 h=From:To:Subject:Date:MIME-Version;
 b=dcZBLccM97mhysSMODJ685B4HBdoVp0ast5VeShsGM8/4Q79Po6KXRFcu2pWoEDtC
 c1fxl4rCQ25yWE/mD4k80xU9Tw5K9GBfwqIKXq2tHWTxSJyf+SpFS5SdDqkyGh9L1n
 96x3Eca0SgIOXvrX/LNvJgFYuvrmol/Ymya6spEYmOsWielV4nR4B5ygShRKCyQmgi
 zzoQOFYKYc9FvH7appgcDGlZ9zuRLEYJuOBV0M1/S+YN7y8VNO5DW5EyV10spBTbPt
 HwiyB6fu1SZ7ssF/GqN+CX6139+fDSMNFbEw7WbVAya6vByjyPRIEozJtw0WeRhQOO
 A3apDryM+r/2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dcZBLccM
Subject: [Buildroot] [PATCH v2 01/13] configs/amarula_vyasa_rk3288: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/amarula/vyasa/patches/linux/linux.hash | 2 +-
 board/amarula/vyasa/patches/uboot/uboot.hash | 2 +-
 configs/amarula_vyasa_rk3288_defconfig       | 9 +++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/board/amarula/vyasa/patches/linux/linux.hash b/board/amarula/vyasa/patches/linux/linux.hash
index b763fc947a..b1a0042a91 100644
--- a/board/amarula/vyasa/patches/linux/linux.hash
+++ b/board/amarula/vyasa/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  880ace63ca2291b8b639e9bd862cc828649d3e1e00ccfee5861473debd2e4dec  linux-6.1.91.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/amarula/vyasa/patches/uboot/uboot.hash b/board/amarula/vyasa/patches/uboot/uboot.hash
index 5e017f5499..b6a925ea4e 100644
--- a/board/amarula/vyasa/patches/uboot/uboot.hash
+++ b/board/amarula/vyasa/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index f59d78a5b9..cf99702d0c 100644
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
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
