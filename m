Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAB4E937F8
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DFFF616B5;
	Sun, 12 Apr 2026 17:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_tY4rn8aWXq; Sun, 12 Apr 2026 17:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61EF616B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776014028;
	bh=DcDrowd51uWqMiCDzIqjr6c76Xl03SbsDwWL+dOQx/Y=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=i2GwS9LmSnknPq8zuLivpw5Z3nrcMxttvnyEZNUGjtTYi1PYvbcDZZg+B5afA3QAq
	 rAN6Avm4IuCZXkq6mbH3mt5sCgNt38TzjIBowd9fNHfUstLJ4ofNVujPYl/k9Rj6ov
	 rHQCyVK7gSGTNjXfEShNBGWE/7gIgE+NLBbb3dYKQ6qxeOWs/CnfG64BzpFQ2Evuww
	 fWhbD/HVjLmc1XM9GGCdxc0uHVg+8NvCGG8Tx7frN3ouQKcvNFOTk/4V77LWJkez2m
	 9H77peSHbpSDRM+uJ7qFosBEv7q4j93E9aku+P+ujWgg0YMjyBqTEJ7ARfxI4VWid+
	 FkpOGvkaKVx7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61EF616B6;
	Sun, 12 Apr 2026 17:13:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECF60194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D281D421AB
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDidepoRWGab for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB65B40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB65B40024
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB65B40024
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:13:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso32947505e9.3
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 10:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776014023; x=1776618823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwCXJ8a8tRoOTMBKGz497TlY5Ynm83EfMVzFFeEKL6g=;
 b=COXGW1il0Xw/YGALME/UcCDD6G1mxYYtslonZeDfRj8GbjaMq1jZe6AwfpoK0ZOaqP
 kUd/jp3cGCSfIyWEBGfAQzw4CUUVLkbaDH8hzvFq3mdukDyxKy0+z97L+yAwkqKsfvMt
 Utbvm7JwbBvYImU90xl2Zt8ZYQhEn9UzHtQtzh3I5ZcMyVizP8N+Jj0zcje3VUM/D/lx
 UMHjkudnAYQV8Bh+VB9378s0bUxL8Hjk+NzXUDBHEFRF677gi/xvjYqMg8yCfIN5nDkM
 oOGXrsQITyyJyRy5SFQM0Jksef/aq7EVJOqY0+ZZYVFmD/gf0695jAkjpD06jXuPyFOf
 /hQg==
X-Gm-Message-State: AOJu0YwFcZn82BbLLqAzGiTv9ecC1pKoeb3zCnyDHk8eJVDSftVaWs8w
 NxGq/JraiJxnB3JvM9ZgKoWhPum6AosHxiPTlGInIeC/F30Q7gfdmNgiz7QEbJGN9p1UCy2nE3u
 S05RkBDg=
X-Gm-Gg: AeBDietHSdeCqnWEcS4TObzrmfL0QzdpEFGwi7D4v8VTjkcOWvF2LneTqdqZ2i0+BZ4
 KeaCTBUhk7i4e/SzXa/UEewJEB4QbCtyesaZu4jcEwFvoEqAJOoBgCcUKHkckHWAihFQE6sfpdP
 1IxioH4qTX/PK3V1nDDIK2bX6JkjbiHWO3LtfukIsBiJNukOSaod+tvKSIaqxOITn1cnfi/3K11
 WVPJ6ewIUYjTextCFuG81ANXYNg7FJfivgkZgXCNmjYCdgv2HMh896KVC3Ox33VrKYPAnSQIEBt
 sHaSsTMDd8spN0YTjTXFvv7UZv/Ri8BzWLFr4WEFCoJPHwX90c1SglTNZh/UxmKrB+Xb1Uw4bRM
 BkXw5/qDd3AMZbTZ6Hv+v40FieL1Uk81vCzRHwb/VQrtKWwSb2V8OgogBrJ5NH60RM69C0bt1qq
 Uyz6diWGMsXPBrgZho+98fB5wmTIjq+YNmleEJvqyvs1qTwOz+vO3hWMbgvgxopOHCKb7kPY59o
 TiD6mPnU/ogo8M+9f6+uUf9mw==
X-Received: by 2002:a05:600d:1c:b0:487:1108:48bc with SMTP id
 5b1f17b1804b1-488d6836d87mr107460315e9.17.1776014023156; 
 Sun, 12 Apr 2026 10:13:43 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5347ea5sm265323235e9.8.2026.04.12.10.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 10:13:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 12 Apr 2026 19:13:40 +0200
Message-ID: <20260412171340.256271-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776014023; x=1776618823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xwCXJ8a8tRoOTMBKGz497TlY5Ynm83EfMVzFFeEKL6g=;
 b=PDjT61vpOGfOuY5K9b40xfXr2ivHaUQWhFRC4krt86FPWRSS+xD99K1+9QSj6ZrdF6
 6x2A/+0t0isxlURPCdSsh6u1JdFVJ8EKr5UTIeMCyOV7YDXsGfXGDJ3Hmnk6f2DcByXB
 He+x1FucPecQu1CiyryPH61yVmbi0ilUy7Ep4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=PDjT61vp
Subject: [Buildroot] [PATCH] configs/am574x_idk_defconfig: bump linux to
 6.18.16 and u-boot to 2026.04
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit:
  - updates the Kernel from LTS 6.6.14 to 6.18.16
  - updates U-Boot from 2024.01 to 2026.04
  - switches to Bootlin external glibc stable toolchain
  - enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add custom hashes stored
    in BR2_GLOBAL_PATCH_DIR="board/ti/am574x-idk/patches" and removes
    the exception entry in .checkpackageignore.
  - enable BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y to install the board
    devicetree in the boot (vfat) partition keeping the directory
    prefixes (ti/omap/am574x-idk.dtb). u-boot nowadays is looking for
    boards devicetree using such directory prefixes [1].
    Update genimange.cfg file accordingly.
  - While at it, add a label to the boot (vfat) partition to not use a
    generated label.
  - set BR2_TARGET_ROOTFS_EXT2_SIZE="256M" since the rootfs no longer
    fit in the default size (60M).
  - Remove the rootfs partition predefined 1G size to avoid a parted
    warning about "unallocated space within the partition."
  - Update extlinux.conf kernel command line to use "console=ttyS2"
    instead of "ttyS0". Seems a typo introduced with the defconfig
    (AM57xx always used ttyS2 as kernel console).

[1] https://source.denx.de/u-boot/u-boot/-/commit/649f4a7d3ca753991c27c9c159a0aacc9954d96f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                          |  1 -
 board/ti/am574x-idk/extlinux.conf            |  2 +-
 board/ti/am574x-idk/genimage.cfg             |  5 +++--
 board/ti/am574x-idk/patches/linux/linux.hash |  2 ++
 board/ti/am574x-idk/patches/uboot/uboot.hash |  2 ++
 configs/am574x_idk_defconfig                 | 12 +++++++++---
 6 files changed, 17 insertions(+), 7 deletions(-)
 create mode 100644 board/ti/am574x-idk/patches/linux/linux.hash
 create mode 100644 board/ti/am574x-idk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 6599435b62..a708b081e7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -70,7 +70,6 @@ boot/syslinux/0013-Fix-build-with-gnu-efi-version-3.0.9.patch lib_patch.Upstream
 boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_patch.Upstream
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
-configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/ti/am574x-idk/extlinux.conf b/board/ti/am574x-idk/extlinux.conf
index 29e0ecfa14..4faa8f7eed 100644
--- a/board/ti/am574x-idk/extlinux.conf
+++ b/board/ti/am574x-idk/extlinux.conf
@@ -1,4 +1,4 @@
 label am5749-idk-buildroot
   kernel /zImage
   fdtdir /
-  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
+  append console=ttyS2,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
diff --git a/board/ti/am574x-idk/genimage.cfg b/board/ti/am574x-idk/genimage.cfg
index 02a9ffe013..e7ab22f29b 100644
--- a/board/ti/am574x-idk/genimage.cfg
+++ b/board/ti/am574x-idk/genimage.cfg
@@ -4,9 +4,11 @@ image boot.vfat {
 			"MLO",
 			"u-boot.img",
 			"zImage",
-			"am574x-idk.dtb",
+			"ti",
 			"extlinux"
 		}
+
+		label = "boot"
 	}
 
 	size = 16M
@@ -25,6 +27,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 1G
 	}
 }
diff --git a/board/ti/am574x-idk/patches/linux/linux.hash b/board/ti/am574x-idk/patches/linux/linux.hash
new file mode 100644
index 0000000000..020dc72386
--- /dev/null
+++ b/board/ti/am574x-idk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/ti/am574x-idk/patches/uboot/uboot.hash b/board/ti/am574x-idk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..36322a6a90
--- /dev/null
+++ b/board/ti/am574x-idk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
index 5d3ec12ad6..fd8bb4982b 100644
--- a/configs/am574x_idk_defconfig
+++ b/configs/am574x_idk_defconfig
@@ -1,23 +1,29 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am574x-idk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
