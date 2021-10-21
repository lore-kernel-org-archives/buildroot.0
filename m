Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23985C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A5F61208
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45A5F61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2C6402B7;
	Thu, 21 Oct 2021 22:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Px9prSsGSioc; Thu, 21 Oct 2021 22:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 353FC40221;
	Thu, 21 Oct 2021 22:00:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2D8E1BF9CB
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B24D260619
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3J7J85QC3jWv for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0837E605EC
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6rmSRy5; Fri, 22 Oct 2021 00:00:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853625; bh=YnNsLCwuCpuIsMIzeV7d2PKAT52q7rZQaX3XAbGUiuI=;
 h=From:To:Subject:Date:MIME-Version;
 b=cvTlGpRfSfja6yrWE4uOqD6kxHRY86npvLlsusZVtgyl3Kn1Dq7cQ/rFRVH0RjmIY
 RERTGS4WjsdHehbsslr+Hmzv/t8N0fnX6v8PvPPeBvEDf/zvcwd5GuIwqZFH3Fohkt
 TMgXI8bfKVL2d6E91caT75iQajUll020oNNIHl5oTkBY0rz0vO9DBh9E/AlY5WMNS5
 svndNI3JTEDuJ+JNBSdf4M9amoDcSABlI2djPe6EBTBLqkNEyvozPeHYacpEvxwC38
 rh6xnpJZeEJRS65LQO3+EG6zTL+NaBgeKzsYZoQwqnsbIIqpaGLPPKaY7Za5BsV8iT
 IWRPnX6D2rPQg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:18 +0200
Message-Id: <20211021220023.68288-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB17ixjpCNTAegtZMFK48vKr6UGb81nyoNKr23zcak5pH++fFQxwC3lTFXroUykd1Fs79kPUbthgjt26gD5Sc5RjdKbhT6fBODffCqrrEiVm3kbaJD5V
 jdmc3aZa2vR98dvMSvwREye7ue5C+jTmziszTHVPqe/RCgLKHnaH83IRPxwdrv28qwEgPULm+KBmv13vzJ6voXMFiHzo3ysl5M1FR9W0zJ8TCou1dL8z+Aon
 ew6k9OG6sT4Hcr4Ydmmo2p2HALVt7MFoedNU/Xmd7kcDxk/INE8GPOvJsIdLIjOaaFDD+XWqDW+jo2ZAfkuw6p+2XYX/IJrDoa3hsQPUQNbksXSWusYzYWox
 hxPH11HJoGZJixX1V6AK/hv1dpGxujt3MmqubuH0Dh/KQwOGOAnH+1GhvzXZjKMVtvkHXMvr
Subject: [Buildroot] [PATCH 3/8] configs/olimex_a13_olinuxino: bump to Linux
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

Bump to Linux kernel 5.14.13 and u-boot 2021.10

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a13_olinuxino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index df2a722368..14cec97d49 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a13-olinuxino"
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A13-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
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
