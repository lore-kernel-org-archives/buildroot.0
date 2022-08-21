Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE36FC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CCC760BAB;
	Sun, 21 Aug 2022 15:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCC760BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJw4Zn4H74yg; Sun, 21 Aug 2022 15:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FC460B97;
	Sun, 21 Aug 2022 15:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FC460B97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 312351BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CDBA404F8
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CDBA404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svkClgU_BsZr for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:31:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A105400BB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A105400BB
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:31:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bs25so10457354wrb.2
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MmhvqjdIJkDH08lOAxyCxUm6uXVSRNNYd/N0uxSHrio=;
 b=YkIJGAi/li/pfbVRq2K+61ylZzYYoqhfOjahtP2s7t+/IENX1vYxQzAALqBo5N07N0
 +Mk1yz49CY1LTR0BPLoWvA121LrolsmSqP06kchPqr79eu6dSepgvkqszTLLSyKgedXM
 kWBEt56ZG+3EkatQZpUaaBLr9TysGvaGSfH+XqnJ8SdQF6NWb/wbf6RDosUT2a1snftI
 0Rj6uvm4RuZjrVYay0QLmJnr/T+Y71LAOIgSbJq4AOPvwW1jvat4viwWQ1VAdlNN6WkE
 iEkFunG5udUN5jDvYvOaz9tcERCweQE1JJa23QrdT32L894VViW5XpPQehM4dmjTGTUw
 tk9g==
X-Gm-Message-State: ACgBeo3UaU/qvhyZf/yIyxRRLlv6geOrlfsx10MwvPiMtFRN2gV0x9ov
 j6TxMp3p/a3rJlM8jHF8bFUh1h2nyq0=
X-Google-Smtp-Source: AA6agR7QLqI5DIb8zvZrVUzbcWIRf/tpLOlXESZhqmez/u3MDju4CdK+0tUO1h/J2tuDPELimcKdaA==
X-Received: by 2002:a05:6000:1f0e:b0:221:6d6f:5c7e with SMTP id
 bv14-20020a0560001f0e00b002216d6f5c7emr9126534wrb.256.1661095870654; 
 Sun, 21 Aug 2022 08:31:10 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003a342933727sm2454195wmq.3.2022.08.21.08.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 08:31:10 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 17:31:04 +0200
Message-Id: <20220821153104.239709-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821153104.239709-1-romain.naour@gmail.com>
References: <20220821153104.239709-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MmhvqjdIJkDH08lOAxyCxUm6uXVSRNNYd/N0uxSHrio=;
 b=oZkQ7sCC46e8HeBmATXapozVoIvhA+V0Zcck5Utnq8za92Ce3ymwXW9Qec4sPvciKR
 BTeTsOWvXR7klnhdHUGOGXLInyrBZaVhWEDy0ntplxt5CarLJFmJtIrdYx0DTFdjImHY
 irg8SlTA07y6x3SQnb+2fI0uQtQCCvUPPRUEr/Mu64HIyKh3+f8zcuZVzRmPCScNx38j
 rmg+siy3ZfRWLeFrXwY8PV+1wfO9cqk4WohyK8OudAgbXxgojrpeiJdyRcWBBDTxItmO
 Om7vkYAJpUxc1SiIvqu/ccvDJh5Egih8uvMU05rFLeHCmO0yfGAX+E4t79xiJR6SfbJq
 DN4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oZkQ7sCC
Subject: [Buildroot] [for-next] configs: select uclibc when needed
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
specific option) must now select BR2_TOOLCHAIN_BUILDROOT_UCLIBC too.

Some defconfigs provided by Buildroot select BR2_TOOLCHAIN_BUILDROOT_WCHAR
without selecting BR2_TOOLCHAIN_BUILDROOT_UCLIBC.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2911738579

[1] 4057e36ca9665edd5248512e4edba2c243b8f4be

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---

This also break all defconfig fragments from
support/config-fragments/autobuild, but they are now deprecated
following utils/genrandconfig --no-toolchains-csv option:
aeee90ec109b83c42779e6a2617f7d57e25a2b65
---
 configs/aarch64_efi_defconfig                          | 1 +
 configs/at91sam9x5ek_dev_defconfig                     | 1 +
 configs/at91sam9x5ek_mmc_dev_defconfig                 | 1 +
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d3_xplained_dev_defconfig           | 1 +
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 1 +
 configs/atmel_sama5d4_xplained_dev_defconfig           | 1 +
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 1 +
 configs/bananapro_defconfig                            | 1 +
 configs/engicam_imx6qdl_icore_qt5_defconfig            | 1 +
 configs/galileo_defconfig                              | 1 +
 configs/imx6-sabresd_qt5_defconfig                     | 1 +
 configs/kontron_smarc_sal28_defconfig                  | 1 +
 configs/lego_ev3_defconfig                             | 1 +
 configs/mender_x86_64_efi_defconfig                    | 1 +
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 1 +
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 1 +
 configs/microchip_sama7g5ek_mmc_dev_defconfig          | 1 +
 configs/minnowboard_max_defconfig                      | 1 +
 configs/pc_x86_64_bios_defconfig                       | 1 +
 configs/pc_x86_64_efi_defconfig                        | 1 +
 configs/qemu_aarch64_sbsa_defconfig                    | 1 +
 24 files changed, 24 insertions(+)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 1bd06c51f3..a0664db87e 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -2,6 +2,7 @@
 BR2_aarch64=y
 
 # Toolchain, required for eudev and grub
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 8714463d89..2a66d505f8 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -3,6 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 9481594716..6641b43910 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -3,6 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 38618a5732..83cf0f6598 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 1654408aa5..31f974df7d 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -6,6 +6,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 64455cb2e0..aec1fa366c 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 8f5724d631..21adf0cf6a 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index fab91cf0b3..abebc4c293 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -6,6 +6,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index f9074e9862..6e2115436d 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -6,6 +6,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index e18c83d593..d2a7550e01 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -9,6 +9,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System configuration
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index 2d213e4ab9..4cfbf92e54 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -47,6 +47,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
 BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
 
 # qt5 dependencies
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 312162b7a8..123ff306a7 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,5 +1,6 @@
 BR2_x86_x1000=y
 BR2_GLOBAL_PATCH_DIR="board/intel/galileo/patches"
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 # Needed for TARGET_GRUB2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index d962ac6897..5111057078 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -7,6 +7,7 @@ BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 # Additional features needed for packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 37e415cf32..34071cd5ae 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 555a63e36c..b51b976a87 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -3,6 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # system
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 4ab4c7b03d..c37d16da4c 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -2,6 +2,7 @@
 BR2_x86_64=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
 # Required for eudev (to autoload drivers)
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 2b4e234297..431fbe017a 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index f9aa6cdc05..4a6db15fae 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index b1b22c1312..91d881948a 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index d68846e553..a324e443a0 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 1270f23953..fb9789b76c 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -10,6 +10,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
 
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 # Needed for grub2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index df5988d75e..75e98847aa 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -2,6 +2,7 @@
 BR2_x86_64=y
 
 # Toolchain, required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 18d2c477d5..cde4f05cfe 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -2,6 +2,7 @@
 BR2_x86_64=y
 
 # Toolchain, required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 0d4e8b2c29..9a62f8b49a 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -3,6 +3,7 @@ BR2_aarch64=y
 BR2_cortex_a57=y
 
 # Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
