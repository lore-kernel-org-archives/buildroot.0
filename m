Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4253C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 01:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FB26141A;
	Wed,  6 Dec 2023 01:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60FB26141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJ4zDV05ulOW; Wed,  6 Dec 2023 01:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC57613FF;
	Wed,  6 Dec 2023 01:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC57613FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33C821BF34C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 01:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E08613FF
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 01:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05E08613FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhsatVWJSewN for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 01:24:11 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6557A613F7
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 01:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6557A613F7
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5c206572eedso4003555a12.0
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 17:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701825850; x=1702430650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0IqQXK00vmKF7kBLfZsjVO3lCIZXgAaOsPtxtF1MVRU=;
 b=xDNGi2X9eeFxfnh8cLBIUncnLxy6sinppw2JgZPu++zFXFD1FoZMM+QecNZtksLVTQ
 fFr4WWXLgz+vLmK8oYbmodKtXd950iFW8dHOJ2TdPfRqv3B3Y4s7BbkQe8fD/9ST488h
 5v6NmroU8xKHsuXrzwKlc6Za973XYCf9gwQ86AmBcKGbRyNccQXN3omknTEu/QN2gGaB
 H1WmjEplySACkI/Teb4xl9pyQh044JxFwo+koL6QIVExZ2Ykhdxm+KUMQW0extUvt3lM
 3X0AT78ADfeXwf1xSLsVmqltbQUCw7tGCHcavppxhaIMA9c9jwTPO48KVP7O+Ij+aLZc
 0+NQ==
X-Gm-Message-State: AOJu0YxcfH3RtpwUSzM/E3rr3wcXEzBdos745AppdRwk3bKtnbGvzAvv
 FQcxhmbQ7a3htlftpG97RpPVvoMxlyo=
X-Google-Smtp-Source: AGHT+IG0Q2SJQTS62jcjHtbnTajMtPxFGHkIPKyENFD1xOyPeT190zJm9W5/fI1gwboRHcRE2bgDRw==
X-Received: by 2002:a17:902:b48d:b0:1d0:6ffd:e2eb with SMTP id
 y13-20020a170902b48d00b001d06ffde2ebmr126494plr.133.1701825849784; 
 Tue, 05 Dec 2023 17:24:09 -0800 (PST)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b001d07f28461esm6161047plh.279.2023.12.05.17.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 17:24:09 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 09:24:03 +0800
Message-Id: <20231206012403.722101-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701825850; x=1702430650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0IqQXK00vmKF7kBLfZsjVO3lCIZXgAaOsPtxtF1MVRU=;
 b=V4lzyVlGilrXvlhEdetY0CDg/hW3rod1xYwejFevXWrGaZy243vMZfr5p1acINnSaa
 msGLbmCo06ghUciR9cZuSeSoNpKrGrpA10V6r1aw1j00nrkbE6Iu2zpdRwXun9vCBx5u
 a0UrsyCuIVSuvkBMbsdeidVKEvCW3L001OvhDOPVqs8bRD9BmfYr0aCz1JVblo0SN/2z
 S2nJoJ2XARm8Ku7EdJCZrKMxXJMnO2VVh+8Xd39NxjZHohSpRAVa+jeChDWBkNNQO1MG
 +J710hZPWesjBW4ipnyvazA0GcHp8vhNQ2Asqx5JoS+BcqZkpo/nofk3LnOLI91UUYmq
 /ItA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V4lzyVlG
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux
 version to 6.1.46-ti-rt-r13
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
Cc: Scott Fan <fancp2007@gmail.com>, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The linux defconfig 'bb.org_defconfig' is the best for beagleboard.

To load compressed kernel modules, kmod and xz packages are needed
because busybox doesn't support it.

Bump U-Boot to version 2023.10. The uboot-tools package is no need.

Tested on beaglebone black.

[1] https://github.com/beagleboard/linux/releases/tag/6.1.46-ti-rt-r13

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 configs/beaglebone_defconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 7e006e7a85..e2d67019b1 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -3,11 +3,8 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
-
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -20,8 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.162-ti-r59)/linux-5.10.162-ti-r59.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.46-ti-r13)/linux-6.1.46-ti-r13.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -34,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -48,6 +45,9 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
-# Supporting host tools to build FIT image
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
