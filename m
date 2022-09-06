Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5C8ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09D0812C8;
	Sun, 11 Sep 2022 08:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C09D0812C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPAGVD0gtEuT; Sun, 11 Sep 2022 08:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BEA812AF;
	Sun, 11 Sep 2022 08:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89BEA812AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C51F21BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5AD0410A4
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5AD0410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xu_JXm6e-Umr for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0745841496
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0745841496
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E647D83622; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 12:26:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20285161549eb695c678e02b5c173fccdce59896
X-Git-Newrev: 4ebc9d0b85deb742a9df727a32ab2fc8b0989d30
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.E647D83622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: remove uClibc config options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ebc9d0b85deb742a9df727a32ab2fc8b0989d30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the switch to Glibc as the default libc in Buildroot [1],
all defconfigs expecting uClibc with wchar (or any other uClibc
specific option) should now select BR2_TOOLCHAIN_BUILDROOT_UCLIBC too.

Even if all defconfigs has been tested with uClibc, maintainers
prefer to not enforce a C library and use the default of Buildroot,
which is now glibc.

This commit remove uClibc specific options BR2_TOOLCHAIN_BUILDROOT_WCHAR,
BR2_PTHREAD_DEBUG (required by gdb) and BR2_TOOLCHAIN_BUILDROOT_USE_SSP.

Since glibc always has argp built-in, also remove the standalone one
from affected toolchains...

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2911738579

[1] 4057e36ca9665edd5248512e4edba2c243b8f4be
[2] http://lists.busybox.net/pipermail/buildroot/2022-August/649998.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998@free.fr: also drop argp-standalone]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 3 ---
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 3 ---
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 3 ---
 configs/microchip_sama7g5ek_mmc_dev_defconfig          | 3 ---
 configs/minnowboard_max_defconfig                      | 2 --
 configs/pc_x86_64_bios_defconfig                       | 3 ---
 configs/pc_x86_64_efi_defconfig                        | 3 ---
 configs/qemu_aarch64_sbsa_defconfig                    | 3 ---
 24 files changed, 71 deletions(-)

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
index 2b4e234297..4c842f2bb0 100644
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
@@ -47,7 +45,6 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_ARGP_STANDALONE=y
 BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index f9aa6cdc05..5f6eba482c 100644
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
@@ -50,7 +48,6 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_ARGP_STANDALONE=y
 BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index b1b22c1312..64df7b4d13 100644
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
@@ -42,7 +40,6 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_ARGP_STANDALONE=y
 BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index d68846e553..2fca9873a6 100644
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
@@ -42,7 +40,6 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_ARGP_STANDALONE=y
 BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
