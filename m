Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC7FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D7D60F93
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63D7D60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3510A40892;
	Thu, 21 Oct 2021 22:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-0YcGL04pvO; Thu, 21 Oct 2021 22:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9288E40649;
	Thu, 21 Oct 2021 22:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9D291BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9B3A605EC
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TOOgpSpsBWK for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E7260613
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:28 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6tmSRz6; Fri, 22 Oct 2021 00:00:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853627; bh=djrJ46clJXKeiw21yN84qZTWqOf5zE3ZO0z9LRohHv8=;
 h=From:To:Subject:Date:MIME-Version;
 b=U62VD6FCAo+o2N0egC5yUuwm7POfK1/wBkpLph8a0H3gcNwV6Yb2doZ6ZhwB7q1cG
 n/+R7hrMcfyymLpOrzY2AMcTVkzKTnpRASUxBJ6kWKXKcya1oiTtxqFsyNksCIVuQW
 w3YUknQVRi/rcVtFupaOKX9/rcx4DjVHcD9GKfU/x9BoIcFiWwGi+oMng+YLTBVzQx
 J8bT6iJNt3bsee8T96w3hObhQNhXoqXtzVNEDUjE/pRLF4RDRjj32QLIdmey60ZqKo
 mmlgD6MXxfjStTvdthefq+5wjK8x9MvPUGVZ+w5pWWnJt3wp9WTwnusYA+6UDjSth7
 QCWbz6nlHD9oQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:23 +0200
Message-Id: <20211021220023.68288-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLYSjqivIXxLHHhu5D6D0phdQpLVYtewZL0Wkj7fQv0DPa8mK+POYnhQXj0PKEiJkpavATiV42ZvsTRY2wTMTmVgLyqsG0tUvyDq09oDTMUoRiBkYgnt
 Lt4aW+5B1BHY1Qo+9F7vJgEOf4xAAVXE7j6tqJdtqpZCTQvPbkzxUF+8fAaoae1aHE9fIm9fO6Q3TVYGSLhTbaGYNPWalE5g7z4pxVX+D7FipaWI0ofhzf39
 88QVEYs9FlK4fO5vCnohFu3Fuvlzb29FT246gdp5QmorSummq6jSHxEq6cxi8CH2wOw33Fg8W5QOCUwql8GvopOj2PNKiPfnVSWYp5npnicfIxHn99I2UeD5
 f9L/ecjAnLJlf7wN9dYnyC5IFYxb6mCOABgdtyjZLj2WJuUXV8G5dtopzMSc/Gs0jsNl7jvn
Subject: [Buildroot] [PATCH 8/8] configs/olimex_a33_olinuxino: bump to Linux
 kernel 5.14.13 and u-boot 2021.10
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
 configs/olimex_a33_olinuxino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index 6262b30d26..e2474db2ec 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="A33-olinuxino"
@@ -16,7 +16,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -30,7 +30,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
