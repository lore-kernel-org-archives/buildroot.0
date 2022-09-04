Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0452ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 14:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D79480C3E;
	Sun,  4 Sep 2022 14:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D79480C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id As4gklSELzed; Sun,  4 Sep 2022 14:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08813802EE;
	Sun,  4 Sep 2022 14:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08813802EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7B821BF4D7
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 14:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00AF40580
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 14:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00AF40580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjrqfqJ8uUDz for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 14:42:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EAAA40571
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EAAA40571
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 14:42:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e20so8210266wri.13
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 07:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zG0MUQBonDp0IYBXqf2Dnq1bUQdTZsxAaY3HuYcbCrk=;
 b=phd29mgQbxPuBJGTq8MaBvOBcNAqBZOIPO4dluxudKdcMQ+O46aBPs7SS6Sb/tCAIA
 GF6nMY1tO6zJkFLGJjKRXxepM5tTPQakErKfUmbvs5m7B9xyI1ha+LXv9H9LL/GgYkav
 9ybWg3oQ3jy4ZnVj+DuU0FTWFpXCgJWIL5mwW26VWRPw8YAL4REh87gV83ldt1COoyG9
 yyHGygUZTBXfYyqEbeItnTAqJ8ld552Fqfxene01SwK4zwq7BNf4KEv1cYpVFFnYR48c
 RHRumxsoLlhpdIEUg0ZdcwTB2Ryq9/0qC6gSO2OjvIYIXG0E1OK3Iaz2efUiMmVv2bpI
 +JDg==
X-Gm-Message-State: ACgBeo3HljmEBDoLuSdXlWkN9g3c7BvQp2r411k989RXiboHSoxdtyAX
 /yoMQ1Y1wHTH6V5jjGhgbzBiFfG57Ok=
X-Google-Smtp-Source: AA6agR4l3YBjh6cCMexQTcmpbV1INufL3U+wZzbFYu5kYD+LHPZkQwC6tDmeGtLWxbU2zUkOvM9Gig==
X-Received: by 2002:adf:bc13:0:b0:228:6d28:d2cb with SMTP id
 s19-20020adfbc13000000b002286d28d2cbmr1312919wrg.375.1662302557304; 
 Sun, 04 Sep 2022 07:42:37 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 y2-20020adfd082000000b0021d6924b777sm6277072wrh.115.2022.09.04.07.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 07:42:36 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 16:42:33 +0200
Message-Id: <20220904144233.2795176-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zG0MUQBonDp0IYBXqf2Dnq1bUQdTZsxAaY3HuYcbCrk=;
 b=oAWMCrwAsGITb4Lj008b4BuSvcr1DxH0yr3cgHg+OxhdY6Yv7diVs1r90Gi6RunAKM
 8kFbYdGqNC/zyKpJ95Z6wKsE25QSCa3d0daUdGGBzOllgeIE1hVPjFNL8TClFSwHkOo5
 EF77h0LoQLSm+aYedteQ7x50i+i5oC5DBACgUVX48+YS5gQcRFIitzoVp6CG14XJiWG0
 61UaWNqp2T+m02StczLwDbRvNwIvwq0uzM/vMtn3CfRk0pzHkad8HwtAWiZSL4yxcryP
 Np++jcV/EG7wfllF6SVt7ZYsGp7U0R+ePGjJC1DhmEJmLw+28ncSkI0xPGxAtE49VbDh
 emgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oAWMCrwA
Subject: [Buildroot] [PATCH for-next] configs: remove uClibc config options
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the switch to Glibc as the default libc in Buildroot [1],
all defconfigs expecting uClibc with wchar (or any other uClibc
specific option) should now select BR2_TOOLCHAIN_BUILDROOT_UCLIBC too.

Even if all defconfigs has been tested with uClibc, maintainers
prefer to not enforce a C library and use the default of Buildroot,
which is now glibc.

This commit remove uClibc specific options BR2_TOOLCHAIN_BUILDROOT_WCHAR,
BR2_PTHREAD_DEBUG (required by gdb) and BR2_TOOLCHAIN_BUILDROOT_USE_SSP.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2911738579

[1] 4057e36ca9665edd5248512e4edba2c243b8f4be
[2] http://lists.busybox.net/pipermail/buildroot/2022-August/649998.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---

Commit [1] also break all defconfig fragments from
support/config-fragments/autobuild, but they are now deprecated
following utils/genrandconfig --no-toolchains-csv option:
aeee90ec109b83c42779e6a2617f7d57e25a2b65
---
 configs/aarch64_efi_defconfig                          | 3 ---
 configs/at91sam9x5ek_dev_defconfig                     | 4 ----
 configs/at91sam9x5ek_mmc_dev_defconfig                 | 4 ----
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 2 --
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 4 ----
 configs/atmel_sama5d3_xplained_dev_defconfig           | 4 ----
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 4 ----
 configs/atmel_sama5d4_xplained_dev_defconfig           | 4 ----
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 4 ----
 configs/bananapro_defconfig                            | 3 ---
 configs/engicam_imx6qdl_icore_qt5_defconfig            | 1 -
 configs/galileo_defconfig                              | 2 --
 configs/imx6-sabresd_qt5_defconfig                     | 1 -
 configs/kontron_smarc_sal28_defconfig                  | 1 -
 configs/lego_ev3_defconfig                             | 3 ---
 configs/mender_x86_64_efi_defconfig                    | 4 ----
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 2 --
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 2 --
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 2 --
 configs/microchip_sama7g5ek_mmc_dev_defconfig          | 2 --
 configs/minnowboard_max_defconfig                      | 2 --
 configs/pc_x86_64_bios_defconfig                       | 3 ---
 configs/pc_x86_64_efi_defconfig                        | 3 ---
 configs/qemu_aarch64_sbsa_defconfig                    | 3 ---
 24 files changed, 67 deletions(-)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 1bd06c51f3..443113e47b 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,9 +1,6 @@
 # Architecture
 BR2_aarch64=y
 
-# Toolchain, required for eudev and grub
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 8714463d89..824aa8b1f7 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -5,10 +5,6 @@ BR2_arm926t=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 9481594716..3b2016b970 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -5,10 +5,6 @@ BR2_arm926t=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 38618a5732..85ff29771a 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 1654408aa5..4ee7fca35f 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -8,10 +8,6 @@ BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 64455cb2e0..ef09df3fce 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -7,10 +7,6 @@ BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 8f5724d631..f5aa3e382f 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -7,10 +7,6 @@ BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index fab91cf0b3..ca51ef5b5f 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -8,10 +8,6 @@ BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index f9074e9862..e8d126c7b0 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -8,10 +8,6 @@ BR2_ARM_INSTRUCTIONS_THUMB2=y
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Needed for gdb
-BR2_PTHREAD_DEBUG=y
-# Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index e18c83d593..dbebdf3e37 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -8,9 +8,6 @@ BR2_ARM_FPU_NEON_VFPV4=y
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
-# Toolchain
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="bananapro"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pro!"
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 2d213e4ab9..6d3a344bdd 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -47,7 +47,6 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
 BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
 
 # qt5 dependencies
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # qt5
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 312162b7a8..29110677bb 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,7 +1,5 @@
 BR2_x86_x1000=y
 BR2_GLOBAL_PATCH_DIR="board/intel/galileo/patches"
-# Needed for TARGET_GRUB2
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index d962ac6897..e385e86b81 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -8,7 +8,6 @@ BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Additional features needed for packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 37e415cf32..877903a1fe 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,7 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 555a63e36c..1ce2817d42 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -2,9 +2,6 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Toolchain
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 4ab4c7b03d..6919a60c90 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -3,10 +3,6 @@ BR2_x86_64=y
 
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
-# Required for eudev (to autoload drivers)
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-# Required for sysvinit
-BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 2b4e234297..7fe992e3fc 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -1,7 +1,5 @@
 BR2_arm=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index f9aa6cdc05..8d483287af 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index b1b22c1312..9f784d362e 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index d68846e553..8cf0310133 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -2,8 +2,6 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 1270f23953..83a970f601 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -10,8 +10,6 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
 
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-# Needed for grub2
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index df5988d75e..ec34a41667 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -1,9 +1,6 @@
 # Architecture
 BR2_x86_64=y
 
-# Toolchain, required for eudev (to autoload drivers)
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 18d2c477d5..da05471e28 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -1,9 +1,6 @@
 # Architecture
 BR2_x86_64=y
 
-# Toolchain, required for eudev (to autoload drivers)
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 0d4e8b2c29..609444e787 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -2,9 +2,6 @@
 BR2_aarch64=y
 BR2_cortex_a57=y
 
-# Toolchain
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
