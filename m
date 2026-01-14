Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B81D39015
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB5381181;
	Wed, 14 Jan 2026 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTKBFFZnGhQO; Wed, 14 Jan 2026 19:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8103812F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420508;
	bh=sL2j/snsWE4uTYeegxlUs3vy3L2xKWZxjXk4jt99LbM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y34RpfGfHJQJkw02jqgsRrW75Et0PCfKdCfu12E16Yn8UXh7+qr0yxxbdkSKBqLnd
	 8WzC+A65kR7mZsWTLqhyvoQh8GEx5EC3Yp0WoPFwwccxbHbREeP9Eo51CdnGREgRAC
	 JABP4ybl8KgJWDvCZ6SgqemKuWOkbEOcvW7o85OblWSerssoEI0iDlByuFER1Oacio
	 k/bT0le5ZY5Sebm256r5+M2rFFx3o+cbedtARQSovEtSh+RWrvlB9PFYmQLH/Uev/+
	 7mm6ftmfAVnbjpsobq+QVYFEwH0pUoT4McrI42qzjj+EzoPkT+gESIRfaF/2H/L0Cg
	 GElTuEQuHITxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8103812F9;
	Wed, 14 Jan 2026 19:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2363E25D
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F2C8400B3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-v348DAHjZr for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B65FD400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B65FD400E6
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B65FD400E6
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xCvzgbo; Wed, 14 Jan 2026 20:54:54 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:39 +0100
Message-ID: <20260114195451.3978704-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJacIROexPyfd38isowX6aXNKKQfPU1F5zwwhT72rw5Vf6bqzR1lJYwWSgh3QW6OcHZF/PetYjMmIJQpmNP+wJ5DgHy11BW2c+RRQTchFJkdGl8vA0iY
 2Fv9UB3Wrp0tw6zGshqOroHBixazkS5HCzHXa457j0KMvEGlxdtH9iEC7GNVv0Syl00rPMzlaZ6gIp4bKgqPB+zmh/p1AmUWz5I3hSD4xgscEjNCyt34Yc4f
 mtNbQCIdFU9NJ/nDUlXN0f/r4L+guZMCJQDm9ry04fVV7/WLkz5vrctonRxCgAaCp/SnRI01pyXW4ruoHlr8wIwMdJ1ARIVOt/uXv+tLS5YZsU+P/Fx7f1sZ
 Ua5AObSGFwSiH7hNfwWtZBCK7pcRC+TL+kmyutS6MhE75BUrmI4h7vHEsAJdStnFfs5JZn+lylUQI1s/COTrh6o2y/fh26iM0iMMYuPE5OSZMZ1cF3GrkIl5
 98ph4LsKd/rcBiTnb8irMAMiSdO2xam4448M8OPLFsK9LJveZlauQLRSLY5Qkft5AMILaQpl5MawuEar
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420494; bh=4Uiwbw1C+ffTkFNWKTktvFliULo23LwDAB2qmoDRmTU=;
 h=From:To:Subject:Date:MIME-Version;
 b=eu8jo+KSqk3b1Lac3PbSJSwbS2pCBDQobsGJ9vTW5vcagHd1Id2sYdnowWdcFQe9U
 6sVAop0h/5vz0MwQBSvdmMpahQWapcS7GJJ8OvMkMG5CYl1qS7yIYTWHKskzMHxaru
 Z6dAtImag3Ga7lMRRj5XesLAgXVgFS2F9L4T9wVsz9lNlLWr3gvFQl4tWEx6+M6rER
 WKbLmXzIExGf6rg2Xo9ddhuVZhA/3vZwBDuX2FZTgMb79DZizuQFadTvd8D9EBoF5V
 LItcxIIO+5pW3KlaiPnynVhidwmN3MO2FzQVZ6Bt7SJfUNZJNT2GEvFEWgzcN/tqjp
 5NaViFVBVaG+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eu8jo+KS
Subject: [Buildroot] [PATCH 06/17] configs/freescale_imx6ullevk: bump Linux
 and U-Boot to lf-6.12.49-2.2.0
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
* forces check hashes
* switches to extlinux

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
