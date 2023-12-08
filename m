Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D8BC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 00:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E51E2404E9;
	Fri,  8 Dec 2023 00:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E51E2404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGw1f7bdIY2C; Fri,  8 Dec 2023 00:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C718D405DD;
	Fri,  8 Dec 2023 00:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C718D405DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD1F1BF57C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 00:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0295242108
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 00:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0295242108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsdCSjJzDvbY for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 00:10:16 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9C754210F
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 00:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C754210F
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6cea1522303so1094573b3a.1
 for <buildroot@buildroot.org>; Thu, 07 Dec 2023 16:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701994216; x=1702599016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5c2JwUJB/5u5VPOH2zfwuU8JqlGzjn+fqrw0LKgh+M=;
 b=rauMQtfx85gWHuKr2fLuOU86DPdtdQeQbq3Pg4S9CkAz7ESIF+jPn4+wgSkG/VISwz
 oatGEPzYs6Ad6JAGztNMkL0gEu18BVmKel49Sug0+J92xfO+oqW2hYqiIXm1kurtGCz8
 9YJvcRnrNbuGhMnxt7fPBRRe1pZhagD+9PcQjOUfdkJgq3OzGNBF+xoKHS8Z1aYdzpCv
 ElWNiKVJyOrsOI6CMqBcChb0KIE7n8DWVZrn0f87sgyR62qfv3rYqOx2l8WHH0LO8x3i
 kPpjuhyuF65sRWryTp6gcW+5aooUgT6qPwQFaXBiaGuCoEN2XSaYfCjkCeV4+e4j6C6K
 fREQ==
X-Gm-Message-State: AOJu0YydPmeqoRk5LGQGhzYT1BfH7u3pylFuSRpnwzGu4awEU8xzl3VP
 Qdnj/9BxtbeO7r+zl6vBYKYN1xNijl8=
X-Google-Smtp-Source: AGHT+IFtpogfNxo0M6HMr/z8/3DsZe5OwLE5vDMvAnbfz5+iU/mEvbnU+FIbhiZEmpu72Ivqo9NRyQ==
X-Received: by 2002:aa7:888f:0:b0:6ce:3949:2d9b with SMTP id
 z15-20020aa7888f000000b006ce39492d9bmr3443889pfe.54.1701994215685; 
 Thu, 07 Dec 2023 16:10:15 -0800 (PST)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 fb32-20020a056a002da000b006ce7ed5ba41sm345844pfb.55.2023.12.07.16.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 16:10:15 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 08:09:57 +0800
Message-Id: <20231208001001.6549-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206012403.722101-1-fancp2007@gmail.com>
References: <20231206012403.722101-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701994216; x=1702599016; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5c2JwUJB/5u5VPOH2zfwuU8JqlGzjn+fqrw0LKgh+M=;
 b=egOeHFlW+qEY0B1Y5mSAPA6I+FmlHUu1ru4hVEHvrxu8ACHS2swo/lVdO22UIboX3l
 HPPCXLQgnn5I3SdahKMTCw5+HEq3Q/3/7BdWCD7dmkhsv0V4hewmSisJWnWMKf8gP3YS
 EQMjw/+f1jozcFSTVOxEe2YBw97B6Osy/0Ao4M4jaKUlk5VM4HcOZ6u+cIqParoMXYiE
 +GEhw9XblKyMINyz2phz/+S7L+7xIJDJC2hPQh0ZZJ42NTfCj49Mc1gZZmnPxkp1JRwO
 Fjo7bykYn7iVncZm/Qj4USJuxUAUF/q5NzHBW0KFFbeXc1pefGTKakyZmCDXd2yIA1yX
 ejrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=egOeHFlW
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux to
 6.1.46-ti-r13 and U-Boot to 2023.10
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
Cc: Lothar Felten <lothar.felten@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The linux defconfig 'bb.org_defconfig' is the best for beagleboard.

To load compressed kernel modules, kmod and xz packages are needed
because busybox doesn't support it.

Bump U-Boot to version 2023.10. The uboot-tools package is no need.

Tested on beaglebone black.

[1] https://github.com/beagleboard/linux/releases/tag/6.1.46-ti-r13

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
