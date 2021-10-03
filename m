Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CF1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:40:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE41E61361
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE41E61361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80692424F5;
	Sun,  3 Oct 2021 12:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DY3Zr6rI24SX; Sun,  3 Oct 2021 12:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DFC4256C;
	Sun,  3 Oct 2021 12:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91D681BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F96E4256C
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1sd5YW5I5t2 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C1C424F5
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:40:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v17so24954275wrv.9
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7V8VidC0RWV8T9ZJ68mtl2Dfi4iK3tP2O8vLkXyLoc=;
 b=RqQioDY3zrkCl2n3LZw1tMP+dVvBvi/8YLFPlgK7az3WkNnwRYgLpx+cVcB+R4u/KC
 WoLDH5MOyJb0N2GbLhIfmhGmiAFtUlgt1W03P2XTfuJ79ve+3i8JeJRwX6fJOcE8vwDS
 Iu56lWjW1kOR44Orh+V9b50/mNO4lJIFZ7CnmLdK76ACLFK7wO0g5HQIO2YEoV3Gh8FE
 XbMwUnC3FtLuxWtkDo2KwcQbF3VE+7rvO8esfxS8J8sQymJGWOjC4DCV8DWGKePfA67A
 SqTFx0yvm1HfTxhqvf7Sr1pZ+mL52GFEPjRkqvvNTY1YRyhDD20BTGM9EaOHB7yOGeaH
 Bbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7V8VidC0RWV8T9ZJ68mtl2Dfi4iK3tP2O8vLkXyLoc=;
 b=vHNhrx1uWpn6zYyJJiLCyAls75TJWPJBo6eDsFY83U0pDN/lGJDn/+7698KwvkVM9f
 FPxCvi5Uhl76u0EoN0lCrHTq7aWjyhgKSrelIA79JZOAiNKzMahZzW69U1PfGahCGmFV
 zmhDyHz5BHERdBevM6RsWs2qwDmqxXDBqcB6QN1Hz96KQ5wpPOMw3BUgbQBm9XC0P9w7
 VszXFvvzX3HWfxl3yqImRgMezfU1AKs7Zu0Sey7Tc/8cpO3VtK5HcISmKFpb3CTcvJJL
 EdJq37qkTmrYIqJk2fzEi8K6eC5HwKSxo8DV0VM6bIyVWToiOPl0cr2MPFLysSMsXZfx
 otmA==
X-Gm-Message-State: AOAM5302l6GJz4d4Zkz6fZUizV1Bb2r3Yb7JWvfyFBVvSnV6j6IP62xJ
 S1ejw9XKhn6fqvFyGoFy/3aWyfPdyM4=
X-Google-Smtp-Source: ABdhPJxX8sTJ1VGYaSMZWi0G9VRG1nCgczl7rbAjoo7XpX9s5LJScEmKInwTctw9vnbEL57vhzy+Zg==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr8355725wri.75.1633264832435;
 Sun, 03 Oct 2021 05:40:32 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 143sm1258704wma.37.2021.10.03.05.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 05:40:32 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 14:40:23 +0200
Message-Id: <20211003124027.343390-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] configs: remove qemu_csky defconfigs
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are going to remove the gcc fork for csky since it doesn't build
with the latest compilers (gcc 8, 10, 11 tested) [1].

Removing theses defconfigs and the csky gcc fork has become unavoidable
since the Buildroot Docker image used by the gitlab CI will switch soon
to Debian bullseye soon [2].

The cksy gcc fork based on gcc 6 has not been updated since it has been
added to Buildroot [3]. Since then, csky has been added to binutils and
gcc but using the latest upstream version (binutils 2.37 and gcc 11) is
not yet possible due to build issue with glibc 2.34 [4].

Moreover, qemu_csky defconfigs was to be used with the csky qemu fork
(based on Qemu 3.x) added by commit [5] and removed by commit [6].
Since then it's not possible to do a runtime test with theses
defconfigs.

Theses defconfigs can be added back later if the csky toolchain support
is fixed and csky supported by upstream Qemu.

[1] http://lists.busybox.net/pipermail/buildroot/2021-August/621504.html
[2] 71b83227128be62c169313e85bb8f339f977ad67
[3] 7873a5bd5ebbeb1674293dae6b06b50f0a1f2184
[4] http://lists.busybox.net/pipermail/buildroot/2021-October/624596.html
[5] f816e5b276f1ef15840bec6667f1e8219717ab7d
[6] 58af9a70cc0f195116dedb3fd0e2ca5b4fec9e70

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/csky/linux-ck610.config.fragment |  6 ------
 board/qemu/csky/linux-ck807.config.fragment |  5 -----
 board/qemu/csky/linux-ck810.config.fragment |  5 -----
 board/qemu/csky/linux-ck860.config.fragment |  9 ---------
 board/qemu/csky/readme.txt                  | 15 ---------------
 configs/qemu_csky610_virt_defconfig         | 20 --------------------
 configs/qemu_csky807_virt_defconfig         | 20 --------------------
 configs/qemu_csky810_virt_defconfig         | 20 --------------------
 configs/qemu_csky860_virt_defconfig         | 20 --------------------
 9 files changed, 120 deletions(-)
 delete mode 100644 board/qemu/csky/linux-ck610.config.fragment
 delete mode 100644 board/qemu/csky/linux-ck807.config.fragment
 delete mode 100644 board/qemu/csky/linux-ck810.config.fragment
 delete mode 100644 board/qemu/csky/linux-ck860.config.fragment
 delete mode 100644 board/qemu/csky/readme.txt
 delete mode 100644 configs/qemu_csky610_virt_defconfig
 delete mode 100644 configs/qemu_csky807_virt_defconfig
 delete mode 100644 configs/qemu_csky810_virt_defconfig
 delete mode 100644 configs/qemu_csky860_virt_defconfig

diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
deleted file mode 100644
index b690c7d6ec..0000000000
--- a/board/qemu/csky/linux-ck610.config.fragment
+++ /dev/null
@@ -1,6 +0,0 @@
-CONFIG_COMPILE_TEST=y
-CONFIG_CPU_CK610=y
-CONFIG_CPU_PM_WAIT=y
-CONFIG_RAM_BASE=0x10000000
-CONFIG_CSKY_APB_INTC=y
-CONFIG_GX6605S_TIMER=y
diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky/linux-ck807.config.fragment
deleted file mode 100644
index b6974f0157..0000000000
--- a/board/qemu/csky/linux-ck807.config.fragment
+++ /dev/null
@@ -1,5 +0,0 @@
-CONFIG_COMPILE_TEST=y
-CONFIG_CPU_CK807=y
-# CONFIG_CPU_HAS_FPU is not set
-CONFIG_CPU_PM_WAIT=y
-CONFIG_CSKY_APB_INTC=y
diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky/linux-ck810.config.fragment
deleted file mode 100644
index 50fa1f4f79..0000000000
--- a/board/qemu/csky/linux-ck810.config.fragment
+++ /dev/null
@@ -1,5 +0,0 @@
-CONFIG_COMPILE_TEST=y
-CONFIG_CPU_CK810=y
-# CONFIG_CPU_HAS_FPU is not set
-CONFIG_CPU_PM_WAIT=y
-CONFIG_CSKY_APB_INTC=y
diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky/linux-ck860.config.fragment
deleted file mode 100644
index e8f6af10ba..0000000000
--- a/board/qemu/csky/linux-ck860.config.fragment
+++ /dev/null
@@ -1,9 +0,0 @@
-CONFIG_COMPILE_TEST=y
-CONFIG_CPU_CK860=y
-# CONFIG_CPU_HAS_FPU is not set
-CONFIG_CPU_PM_WAIT=y
-CONFIG_SMP=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_CSKY_APB_INTC=y
-CONFIG_CSKY_MPINTC=y
-CONFIG_CSKY_MP_TIMER=y
diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
deleted file mode 100644
index 5e4cb1871c..0000000000
--- a/board/qemu/csky/readme.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Run with qemu:
-
-For ck860 smp:
- qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux # qemu_csky860_virt_defconfig
-
-For ck807:
- qemu-system-cskyv2 -M virt -nographic -kernel vmlinux # qemu_csky807_virt_defconfig
-
-For ck810:
- qemu-system-cskyv2 -M virt -nographic -kernel vmlinux # qemu_csky810_virt_defconfig
-
-For ck610:
- qemu-system-cskyv1 -M virt -nographic -kernel vmlinux # qemu_csky610_virt_defconfig
-
-The login prompt will appear in the terminal that started Qemu. Username is root and no password.
diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
deleted file mode 100644
index e7d75f5f49..0000000000
--- a/configs/qemu_csky610_virt_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# Architecture
-BR2_csky=y
-BR2_ck610=y
-
-# System
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# linux kernel header, the same version with linux kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
deleted file mode 100644
index df12450a55..0000000000
--- a/configs/qemu_csky807_virt_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# Architecture
-BR2_csky=y
-BR2_ck807=y
-
-# System
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# linux kernel header, the same version with linux kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
deleted file mode 100644
index dd1fd329f5..0000000000
--- a/configs/qemu_csky810_virt_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# Architecture
-BR2_csky=y
-BR2_ck810=y
-
-# System
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# linux kernel header, the same version with linux kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
deleted file mode 100644
index 6edfba4e8e..0000000000
--- a/configs/qemu_csky860_virt_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# Architecture
-BR2_csky=y
-BR2_ck860=y
-
-# System
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# linux kernel header, the same version with linux kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
