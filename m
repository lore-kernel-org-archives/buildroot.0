Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96F6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D0460698
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43D0460698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE3B6400C9;
	Thu, 21 Oct 2021 22:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJhzZN53wlFy; Thu, 21 Oct 2021 22:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D872C4077E;
	Thu, 21 Oct 2021 22:02:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 861871BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2388400C9
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwl1jgotFec6 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C6AA40221
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:27 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6smSRyX; Fri, 22 Oct 2021 00:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853626; bh=g5r4LT63VBYsMWD0LHLZh5Bi4Cw5B2gtBlqslRCLQyc=;
 h=From:To:Subject:Date:MIME-Version;
 b=TyYCDwRR645FuCtuv6j0t2YlrLTaR6ZZAuNX95g6CS3IiG0NN2/sDQOa8CRSAcBz7
 drKepF71tCVljiSAyTTcyqj0xVhWHdQBwQVs7D4bDyDzwArbaFE/SneSPgoq3lAbv2
 W7osCgk2JrYwh0rcvw33GdqqXRnLxwu9OkoUcxdVKYB1QL6/+YwdNldxYVFF9uF+Qi
 nEkH4h0eJQj403kiWocVaw6ksvcDhNwDmOBGf8fyVl439TKVv5/PHSaYlzJFKjr+TN
 TsYDhsMDcdIvguSmOVIVMcwUy28L8VXmn3soTxpOU2+KCB4So36b/pR6uGB2jBQ7Hs
 j3zxCBvTsKgMQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:20 +0200
Message-Id: <20211021220023.68288-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBepXam1VQFHToa14nI3i4LpWd7+yw2DmaRt6ksWrsrvD5tzpb8xF2znxH2tYemGH4mBj0+sPp7L4rZVt9aaTDBt36wXjHzosCPPPaWgrrTrrhqTS5+b
 jVPHhhRxHmW+PTD1XyWTZ+xI2kgNAYKirMm2Wb8/tiJgJKLdJ04d+EiLdzRk5NpCiH5xUQKPe2MtedYxdsr1KxfyBJsfyLOjRs3AkmrpPszgQw6wDTlyqPt5
 ienL9nKWnwJKBmIXxS31TaRVX3PI/E2XLiT/06fH0cPn+QOoWZuIdji/zHB9v2/C0meFEyfVXxKzGqMcC0Wl6+RX0ULQcIXJirfuuQL+pH70xF8r6Qlpe/QC
 7QcRNB2DCV5eVb/0GL/sRtlT/QY+JACz8ifLzD8nPzeULbm/7PIZAlEFAZyPp0NS6v5AVEYH
Subject: [Buildroot] [PATCH 5/8] configs/olimex_a20_olinuxino_lime2: bump to
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
 configs/olimex_a20_olinuxino_lime2_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 84f2661184..248e5d7207 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
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
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
