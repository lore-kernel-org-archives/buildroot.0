Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF693C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBE6414C9;
	Sat, 13 Jul 2024 14:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVLAMTjA3DRc; Sat, 13 Jul 2024 14:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6DAC4156F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6DAC4156F;
	Sat, 13 Jul 2024 14:01:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8692D1BF861
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E185413DC
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PntllQ9GbYvZ for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2D59413C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D59413C3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2D59413C3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:01:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so15404295e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720879297; x=1721484097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RF+RerQ4S00vlFJuKvwPZMaWaAZ+GrOaqX5zUYQPC5s=;
 b=UocINBJDbK2V5vAReRro/ROYyFng7+eNbQv799jiLcGP8+NXv+MJ3WlwWkeKqeh2F1
 CylDAeUGJIZmSi28TP+kYQS4Cl62kB7H+vJ5A1S8JXAO1s2jYPXhfC7kr3RVVk9rHHuu
 waxgHLKLcauJn4VBW1lOCDyMHI65SBYJmwvXIMcmA7It6Px4IYj++Wi+avaXW6n6noDy
 aaEwcadOjetclBDiZI0A4FS2T9IuE436f8ckhF9QYujv0d/ecFRNE4tPZiOz9gs4+XW5
 OhFVxO0om86CTO6nDv7Av4o1M+SGL85pa+JQgwtxYcXEiqT/P0KWrd/rStUSshxIP1O3
 fY5w==
X-Gm-Message-State: AOJu0Yzo9RDTVakV5Kvmcn1n17PVl/tdtP+4wK/OYW/4epaMl8lxE1EO
 Uejlib7uzQs/dib5/qRTY0t2a432AlFpJbv2cq5k28cmT+iZYr1WFkx4GTQZgDE8Gq3g1ayp9kH
 H1fE=
X-Google-Smtp-Source: AGHT+IGcwP9zVqBuZfYr3FyNsG6aLxBTj3LugcMnp8S56rnQy3B6d+h2cA9ysrq7jPGebxOpxUqJqw==
X-Received: by 2002:a05:600c:214b:b0:426:640b:73d9 with SMTP id
 5b1f17b1804b1-426707cf873mr95925975e9.10.1720879297212; 
 Sat, 13 Jul 2024 07:01:37 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm55342055e9.26.2024.07.13.07.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:01:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:01:31 +0200
Message-ID: <20240713140133.2107977-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240713140133.2107977-1-romain.naour@smile.fr>
References: <20240713140133.2107977-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720879297; x=1721484097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RF+RerQ4S00vlFJuKvwPZMaWaAZ+GrOaqX5zUYQPC5s=;
 b=vsY3sFxSlGHi/iNjigG4IXDKBJkmKVhR8PYEJXnIh7guOREba3T+q61jwmtBYYeMuL
 MdByj7MjrvfcVXiwOtpdzCA9AFf0z2ZWkzH9wWa0Ak/3XPnqnwNra3fhajaIQU1+Vngz
 OUWir9MSx5CnFDEyHAnc4m8XgRAsKnoyeL1VY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=vsY3sFxS
Subject: [Buildroot] [PATCH 3/5] configs/beaglev_defconfig: remove defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The beaglev_defconfig was meant for BeagleV-Starlight prototype waiting
for the arrival of the official revision. But BeagleV-Starlight was
never produced [1].

BeagleV-Starlight is nowadays superseded by the Beaglev-Ahead board [2].

[1] https://forum.beagleboard.org/t/the-future-of-beaglev-community/30463
[2] https://www.beagleboard.org/boards/beaglev-ahead

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |   2 -
 DEVELOPERS                                    |   2 -
 board/beaglev/extlinux.conf                   |   4 -
 board/beaglev/genimage.cfg                    |  12 --
 ...iscv-Fix-build-against-binutils-2.38.patch |  58 --------
 board/beaglev/post-build.sh                   |  11 --
 board/beaglev/readme.txt                      | 124 ------------------
 configs/beaglev_defconfig                     |  43 ------
 8 files changed, 256 deletions(-)
 delete mode 100644 board/beaglev/extlinux.conf
 delete mode 100644 board/beaglev/genimage.cfg
 delete mode 100644 board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
 delete mode 100755 board/beaglev/post-build.sh
 delete mode 100644 board/beaglev/readme.txt
 delete mode 100644 configs/beaglev_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index b49d8d92b4..1052a6f90f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -12,7 +12,6 @@ board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugg
 board/beagleboard/beaglebone/post-build.sh Shellcheck
 board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
 board/beagleboard/beagleboneai/post-build.sh Shellcheck
-board/beaglev/post-build.sh Shellcheck
 board/beelink/gs1/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
 board/boundarydevices/common/post-image.sh Shellcheck
@@ -143,7 +142,6 @@ configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/bananapro_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
-configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 806c01e2a8..181e5ef174 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3067,13 +3067,11 @@ F:	package/go/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
-F:	board/beaglev/
 F:	board/stmicroelectronics/stm32mp157c-dk2/
 F:	boot/beaglev-ddrinit/
 F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
-F:	configs/beaglev_defconfig
 F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
diff --git a/board/beaglev/extlinux.conf b/board/beaglev/extlinux.conf
deleted file mode 100644
index 9daf6a7581..0000000000
--- a/board/beaglev/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-  kernel /boot/Image
-  devicetree /boot/jh7100-beaglev-starlight.dtb
-  append console=ttyS0,115200 earlyprintk root=PARTUUID=0fef845a-c6e1-45bc-82f7-002fa720f958 rootwait
diff --git a/board/beaglev/genimage.cfg b/board/beaglev/genimage.cfg
deleted file mode 100644
index deefdbc110..0000000000
--- a/board/beaglev/genimage.cfg
+++ /dev/null
@@ -1,12 +0,0 @@
-image sdcard.img {
-	hdimage {
-		partition-table-type = "gpt"
-	}
-
-	partition rootfs {
-		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
-		partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
-		bootable = "true"
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch b/board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
deleted file mode 100644
index 52b496f054..0000000000
--- a/board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 0cf11f3c0478f4286adcfb09bf9137f8b00212e3 Mon Sep 17 00:00:00 2001
-From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
-Date: Mon, 3 Oct 2022 18:07:54 +0200
-Subject: [PATCH] riscv: Fix build against binutils 2.38
-
-The following description is copied from the equivalent patch for the
-Linux Kernel proposed by Aurelien Jarno:
-
->From version 2.38, binutils default to ISA spec version 20191213. This
-means that the csr read/write (csrr*/csrw*) instructions and fence.i
-instruction has separated from the `I` extension, become two standalone
-extensions: Zicsr and Zifencei. As the kernel uses those instruction,
-this causes the following build failure:
-
-arch/riscv/cpu/mtrap.S: Assembler messages:
-arch/riscv/cpu/mtrap.S:65: Error: unrecognized opcode `csrr a0,scause'
-arch/riscv/cpu/mtrap.S:66: Error: unrecognized opcode `csrr a1,sepc'
-arch/riscv/cpu/mtrap.S:67: Error: unrecognized opcode `csrr a2,stval'
-arch/riscv/cpu/mtrap.S:70: Error: unrecognized opcode `csrw sepc,a0'
-
-Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
-Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
-Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
-Tested-by: Heiko Stuebner <heiko@sntech.de>
-Tested-by: Christian Stewart <christian@paral.in>
-Reviewed-by: Rick Chen <rick@andestech.com>
-(cherry picked from commit 1dde977518f13824b847e23275001191139bc384)
-Upstream: https://gitlab.com/u-boot/u-boot/-/commit/1dde977518f13824b847e23275001191139bc384
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/riscv/Makefile | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
-index 0b80eb8d864..53d1194ffb6 100644
---- a/arch/riscv/Makefile
-+++ b/arch/riscv/Makefile
-@@ -24,7 +24,16 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
- 	CMODEL = medany
- endif
- 
--ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_C) -mabi=$(ABI) \
-+RISCV_MARCH = $(ARCH_BASE)$(ARCH_A)$(ARCH_C)
-+
-+# Newer binutils versions default to ISA spec version 20191213 which moves some
-+# instructions from the I extension to the Zicsr and Zifencei extensions.
-+toolchain-need-zicsr-zifencei := $(call cc-option-yn, -mabi=$(ABI) -march=$(RISCV_MARCH)_zicsr_zifencei)
-+ifeq ($(toolchain-need-zicsr-zifencei),y)
-+	RISCV_MARCH := $(RISCV_MARCH)_zicsr_zifencei
-+endif
-+
-+ARCH_FLAGS = -march=$(RISCV_MARCH) -mabi=$(ABI) \
- 	     -mcmodel=$(CMODEL)
- 
- PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
--- 
-2.41.0
-
diff --git a/board/beaglev/post-build.sh b/board/beaglev/post-build.sh
deleted file mode 100755
index fe61fd33cc..0000000000
--- a/board/beaglev/post-build.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-BOARD_DIR=$(dirname $0)
-
-# Bring the extlinux.conf file in.
-install -D -m 0644 ${BOARD_DIR}/extlinux.conf \
-	${TARGET_DIR}/boot/extlinux/extlinux.conf
-
-# To be reflashed through Xmodem, the bootloader needs to be prepended
-# with a 4-byte header that contains the total size of the file.
-perl -e 'print pack("l", (stat @ARGV[0])[7])' ${BINARIES_DIR}/fw_payload.bin > ${BINARIES_DIR}/fw_payload.bin.out
-cat ${BINARIES_DIR}/fw_payload.bin >> ${BINARIES_DIR}/fw_payload.bin.out
diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
deleted file mode 100644
index 472d6b1cf1..0000000000
--- a/board/beaglev/readme.txt
+++ /dev/null
@@ -1,124 +0,0 @@
-BeagleV
-=======
-
-BeagleV is a low-cost RISC-V 64-bit based platform, powered by a
-Starfive JH7100 processor. The current defconfig in Buildroot has been
-tested with the JH7100 chip used on the beta version of the BeagleV
-board.
-
-How to build
-============
-
-$ make beaglev_defconfig
-$ make
-
-Build results
-=============
-
-After building, output/images contains:
-
-+ bootloader-JH7100-buildroot.bin.out
-+ ddrinit-2133-buildroot.bin.out
-+ Image
-+ fw_payload.bin
-+ fw_payload.bin.out
-+ fw_payload.elf
-+ rootfs.ext2
-+ rootfs.ext4
-+ sdcard.img
-+ u-boot.bin
-
-The four important files are:
-
- - bootloader-JH7100-buildroot.bin.out, the first stage bootloader
-
- - ddrinit-2133-buildroot.bin.out, the DDR initialization firmware
-
- - fw_payload.bin.out, which is the bootloader image, containing
-   both OpenSBI and U-Boot.
-
- - sdcard.img, the SD card image, which contains the root filesystem,
-   kernel image and Device Tree.
-
-Flashing the SD card image
-==========================
-
-$ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Preparing the board
-===================
-
-Connect the Beagle-V fan to the 5V supply (pin 2 or 4 of the GPIO
-connector) and GND (pin 6 of the GPIO connector).
-
-Connect a TTL UART cable to pin 8 (TX), 10 (RX) and 14 (GND).
-
-Insert your SD card.
-
-Power-up the board using an USB-C cable.
-
-Flashing OpenSBI/U-Boot
-=======================
-
-The bootloader pre-flashed on the Beagle-V has a non-working
-fdt_addr_r environment variable value, so it won't work
-as-is. Reflashing the bootloader with the bootloader image produced by
-Buildroot is necessary.
-
-When the board starts up, a pre-loader shows a count down of 2
-seconds, interrupt by pressing any key. You should reach a menu like
-this:
-
---------8<----------
-
-bootloader version:210209-4547a8d
-ddr 0x00000000, 1M test
-ddr 0x00100000, 2M test
-DDR clk 2133M,Version: 210302-5aea32f
-0
-***************************************************
-*************** FLASH PROGRAMMING *****************
-***************************************************
-
-0:update uboot
-1:quit
-select the function:
-
---------8<----------
-
-Press 0 and Enter. You will now see "C" characters being
-displayed. Ask your serial port communication program to send
-fw_payload.bin.out using the Xmodem protocol.
-
-After reflashing is complete, restart the board, it will automatically
-start the system from the SD card, and reach the login prompt.
-
-Flashing low-level bootloaders
-==============================
-
-The BeagleV comes pre-flashed with functional low-level bootloaders
-(called "secondboot" and "ddrinit"). Re-flashing them is not necessary
-to use this Buildroot defconfig. However, for the sake of
-completeness, Buildroot builds and provides those low-level bootloader
-images.
-
-You can flash them as follows:
-
- - In the same "pre-loader" menu as the one used above, instead of
-   entering 0 or 1, enter the magic "root@s5t" string. This enters the
-   "expert" features.
-
- - Then, press 0 and send over X-modem the
-   bootloader-JH7100-buildroot.bin.out file.
-
- - Then, press 1 and send over X-modem the
-   ddrinit-2133-buildroot.bin.out.
-
-Note that the reflashing mechanism itself relies on those low-level
-bootloaders, so if you flash non-working versions, you'll have to go
-through a recovery process. This requires wiring up to a separate
-debug UART, which pins are located near the HDMI connector. See
-https://wiki.seeedstudio.com/BeagleV-Update-bootloader-ddr-init-boot-uboot-Recover-bootloader/
-section "Recover the bootloader" for more details. The instructions
-make use of a jh7100-recover tool, which Buildroot has built as part
-of this defconfig: it is available as output/host/bin/jh7100-recover.
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
deleted file mode 100644
index 9984b8b74e..0000000000
--- a/configs/beaglev_defconfig
+++ /dev/null
@@ -1,43 +0,0 @@
-BR2_riscv=y
-BR2_riscv_custom=y
-BR2_RISCV_ISA_RVM=y
-BR2_RISCV_ISA_RVA=y
-BR2_RISCV_ISA_RVF=y
-BR2_RISCV_ISA_RVD=y
-BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglev/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# tag buildroot-20210609 of the 5.13 branch (esmil_starlight)
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,83dba1f25dfc118cacec991c31a7a4cfa7405c89)/linux-83dba1f25dfc118cacec991c31a7a4cfa7405c89.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="starlight"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-beaglev-starlight"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_BEAGLEV_DDRINIT=y
-BR2_TARGET_BEAGLEV_SECONDBOOT=y
-BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-# upstream opensbi master branch
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,79f9b4220ffa7f74356054be25d450d7958bf16c)/opensbi-79f9b4220ffa7f74356054be25d450d7958bf16c.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="generic"
-# BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG is not set
-# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
-BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
-BR2_TARGET_OPENSBI_FW_FDT_PATH=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,64ead5b83959da8eb87b6963843addf5942e6ed4)/uboot-64ead5b83959da8eb87b6963843addf5942e6ed4.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_JH71XX_TOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/beaglev/patches"
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
