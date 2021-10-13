Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC03C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E9C611CA
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69E9C611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B55240662;
	Wed, 13 Oct 2021 19:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X254DlwNCOYN; Wed, 13 Oct 2021 19:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05C540490;
	Wed, 13 Oct 2021 19:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 477C11BF372
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B6C82EA2
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpe_3e2GrXJ8 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:18:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id C773282E9C
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:18:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ajlum1IbbXvvIajlvmc6pL; Wed, 13 Oct 2021 21:18:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634152719; bh=QZEgMBi4ksBgoKwmho1B+ZorR6SJXGco9/LcPTSmi7A=;
 h=From:To:Subject:Date:MIME-Version;
 b=nqv8lONZSZ2fmyZqT5FHFYWpVKd0x9MMuCENVco/IwaBIfsnRwQ8n5hugezMOpr2m
 A9bVtu9PaTSlavouI3kpMph0pZydJUvKXRIoKqHqB+lHwkis9lu4bhiR6s1YV3CwLx
 0DA7I6xm/q92c1TkRLAMql8nN7yP3MRQVspiVFzyXRCTs46m8fq3cHaPmUEud5Jh0J
 CE4QUImr5AZwvOFf6hrlmEzCbflZAtFzpUVB4mcRgK/NebG6dGkzyg/kMROwl1FuYM
 EPysPDbwwc9VUPMPdxoymSrcxZvMlUCb2Na1NTnUkm0zpp1R78+6r4RnxaXw+mtTNw
 8ZuokMIwhVROg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:18:38 +0200
Message-Id: <20211013191838.1560429-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOaOGyQnF+woJcEo7pn0CapkDey5Uio15VUft94gBzt0p+TY1i53KnbO1fUKGkgfcex9JbZoK9N+tUyxcJYG/SHrcwZXnmOsCsVI9+ilSUnp9p6+AoLA
 khyW+EIEUia73W6213AK3vYFKEJrWlopOEFpgraIZNDGgXZ5JKmu0zhH13NyGqKSFP0xh8uNmiSqYAlLRp1OYf6zBmoIhrpdD2b0KldfN92RT02X3iMnf9Yw
 Eo9gQ9+cW2ycjAKDs8sfP2GiPz5zRHAMzu5kiHbAwMogf4Q8j1Bzq7hBjzwIcePGjEcCwptk9bvQx5Af6Xgazw==
Subject: [Buildroot] [PATCH] configs/asus_tinker_rk3288: bump to Linux
 kernel 5.14 and u-boot 2021.10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bumps to linux/linux-headers 5.14 and u-boot version 2021.10.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/asus_tinker_rk3288_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index e95a19a757..9f4a959a06 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
