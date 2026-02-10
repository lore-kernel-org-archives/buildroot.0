Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CA8E94627
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA7E40C93;
	Tue, 10 Feb 2026 00:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js1yZ_Fc1SfZ; Tue, 10 Feb 2026 00:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1340040C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682072;
	bh=fob5IpMXQG41TyoH0ur67/aywpD7F3QwrJ4ndd4OQGI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L7IPrVrXvsQ0ADJY1kRFRwXOrJcdCZsBSrZWOeXwwrOE+pbHmjYN8LXA+nCjqEp3d
	 i0z+FGpYF0trcZk86M8ylBXDl/4Glybi7wcop03tvR3nUL1xG/CztdnC0RJlC/lsRa
	 WSyHqlmcBJlZFGR56z4shZqde4bsH8DrOxad0dDHnB4MamThKP48g2xzp1esLxVl48
	 GePiGkLTdX9u52Q0Cs0IEOR0LCBn/NxWXLsTJOlo72mz4fz5Ac32ovL1jeWx9jiskn
	 Cj3vVA570vROaAAQ3/OuYggljEzAMmMY1Gh5ArHvWhs7zXzLX3CejldLMlodozgSMJ
	 L6dzaIqv+R8xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1340040C64;
	Tue, 10 Feb 2026 00:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 285B5219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1699B40592
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7Hl1BotoAri for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 055AE40180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 055AE40180
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 055AE40180
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbI9vmsgx; Tue, 10 Feb 2026 01:07:46 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:32 +0100
Message-ID: <20260210000739.3810940-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEMHzqnfwX4o+wGyNUavrHrAz7QNqxD2sgNCmUlM817Jta96G9gDhpfmzCD6GTE8XWRjkrvhP0huF4XXSWNI0k28fudFCh340C9z74XGS4iO8oCOb3lD
 VbiF8MTxxyBoZtmjLlZP4J+QfRrB8g0bW8jb4h37qlIAjI50sLAn04KFqJf2QrudKqcVswrujVZSiAhs0a/3RGSQaVTtEI8bHH0RxitvZRyiquxILlmtDcsv
 Ib2f9s0woVRWJKpveHowrBFC3dEIqofyPKEW6ZbkSqsGK5rgGUIFolbDSP77FoKBDjMB2JHttMXQMnAvQMnujmaklUuWRzrpiS+XY4MIjlNlyjk7X3i4hv60
 XorX7ty+vA5yzNyrRQYDNjT077YEV6D9yS06Br4C3pSOGA0RPhRawlfT7gEWMuuG9yWMdlMmTT2jUG0WgRYBITV5Cy8YlJLTL9tuHI/Gx43OWxmtexG+Poid
 fSXwJe1KOnJ1+2kRv5HPXOfekG/G85HweI3R5X27GUxRv8OJ2xdAtdXFM9FGxdQ7v7P/TPxscRfGxXV7FKQmGzNCsy281eJvi/6EsXzZVzERmHWEdTvMcnRJ
 R78=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682066; bh=LENiEsEglnrkTx9UgRzwb26mr5e+yMZmoQESMYLHHmQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=nibivooP+ueSWkwx8IcqtV/D7p+qjZSvEmx6btTgbwpEnYb3mBBxymm4DTW7/E/DG
 LGVvkgMaj+lB0zOmQxlR8RBMOuY7Dm8/a+INHjmLONoCYRFWRK7VWzN6km1dwoxLYj
 MDiz1J0foVasXlXtdHuqx6c5mM/HdNR1VqWK9ogmhfqaoeqT3B2B4i5G2YG3mrL4+R
 p0y8QUpYhpdA+Ze+wEVywbOZy7NpUcLNcnH8HcNpXHUgw1sCsVjx8YYgv6e53gsbr1
 /vQudscHrrpt5AZs1VRph6/ASVIPn+s8xSFlig5wkOCQU9S4ADjwueAdh5Adbc0mmo
 IaqPXORJFtfag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nibivooP
Subject: [Buildroot] [PATCH v2 06/13] configs/imx6ullevk: bump Linux to
 6.18.8 and U-Boot to 2026.01
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
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                                 | 1 -
 board/freescale/imx6ullevk/patches/linux/linux.hash | 1 +
 board/freescale/imx6ullevk/patches/uboot/uboot.hash | 1 +
 configs/imx6ullevk_defconfig                        | 9 ++++++---
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2aa2f8ff2b..f30e2c0792 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -106,7 +106,6 @@ configs/imx6-sabresd_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/imx6slevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
-configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
index b138642633..88f216fc5e 100644
--- a/board/freescale/imx6ullevk/patches/linux/linux.hash
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  2166d92e5631ee11bd249d492a1f4009c7635ee36b835fa55384b4ce41e8a63f  linux-imx-lf-6.12.49-2.2.0.tar.gz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
index 5d57adfa22..c8c173d501 100644
--- a/board/freescale/imx6ullevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  212ea4d8d442153ab732ab724282fef64450e9dab5cfe9565eec4f618e305a80  uboot-imx-lf-6.12.49-2.2.0.tar.gz
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 38ea8f6940..279fb89b9d 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -1,13 +1,15 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ullevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
@@ -20,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
