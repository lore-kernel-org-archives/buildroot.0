Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C48C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873A561208
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 873A561208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562B940892;
	Thu, 21 Oct 2021 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfDDDrQxlTOn; Thu, 21 Oct 2021 22:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889E14062C;
	Thu, 21 Oct 2021 22:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52FCD1BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4238082861
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_FCxlhxJc72 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2C5882897
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:27 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6smSRyi; Fri, 22 Oct 2021 00:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853626; bh=seill2EeYGtHOcram8qODGZ1IRnTNpPouoNo7Oc9qJM=;
 h=From:To:Subject:Date:MIME-Version;
 b=M1QDI9fHSGukDhx1gTamcEkhNr+xH72+heUytAC3OOgDG+sl0jwe3phO+hZ/1hWkx
 mAcX+mwGA7vu+vt0+wbYyyaX04pwKoKU1G9d+FhL24S5WGmM7Ssu5ipfLslPpaF6HK
 GpdUWk2dibZSTATrL7hL8dHe0x0HeMK27LmobwU6W6ij1OpOu68w2gNY2+0XHnNUMj
 DCwHkr3gGOF7rAKG+VJKkDT0vQJRpInSLTZ2JdDBu2uGnt13tSdcUp7UDUeA+b8gkG
 Lrv4XR3b9dxWBT360nyhCIlHbbQ+0kUgDgP95KlngMLgPAVjW3q14Fln+0le8LGEyn
 OQZUshf5dG9ag==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:21 +0200
Message-Id: <20211021220023.68288-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBepXam1VQFHToa14nI3i4LpWd7+yw2DmaRt6ksWrsrvD5tzpb8xF2znxH2tYemGH4mBj0+sPp7L4rZVt9aaTDBt36wXjHzosCPPPaWgrrTrrhqTS5+b
 jVPHhhRxHmW+PTD1XyWTZ+xI2kgNAYKirMm2Wb8/tiJgJKLdJ04d+EiLdzRk5NpCiH5xUQKPe2MtedYxdsr1KxfyBJsfyLOjRs3AkmrpPszgQw6wDTlyqPt5
 ienL9nKWnwJKBmIXxS31TaRVX3PI/E2XLiT/06fH0cPn+QOoWZuIdji/zHB9v2/C0meFEyfVXxKzGqMcC0Wl6+RX0ULQcIXJirfuuQL+pH70xF8r6Qlpe/QC
 7QcRNB2DCV5eVb/0GL/sRtlT/QY+JACz8ifLzD8nPzeULbm/7PIZAlEFAZyPp0NS6v5AVEYH
Subject: [Buildroot] [PATCH 6/8] configs/olimex_a20_olinuxino_lime: bump to
 Linux kernel 5.14.13 and u-boot 2021.10
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to Linux kernel 5.14.13 and u-boot 2021.10.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 4f410cab90..fb095c8b7b 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -4,8 +4,8 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Toolchain
 # glibc is needed for sunxi-mali-mainline-package.
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.48"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -44,7 +44,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
