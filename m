Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9511D29C4C
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 17:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B48080730;
	Mon, 19 Jan 2026 17:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxGcOFlUpt0o; Mon, 19 Jan 2026 17:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE88806CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768842261;
	bh=VbMMeTpAgVWL9oGcB2RrplGl2tWnUm0f7/Wf5vx+NjY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f/8K8Eiz0uyClL2QMC2cDzlBTY7r4WIXFlB007etdBcWDBj6b46YlS6DaKFS65M/9
	 OSRW8ZrsymHc2GwGdsjS48wKciS7ffv9hUcQZRg88BOYexs4DOXM+jWW8m2NdXSYpU
	 pGN5FNEPPIVezS/9XSZ357DcY/AHtfJOEjFla3gAWAmWmCQxy+xeDcGNC7eX+3KtCe
	 ILusSAIP+AiCu1W144i3xYheo9pFv5qR21wdnkV3dtYPOHqHyGwrtlPsxV8lyPn9Ym
	 qy2lYSR0fSJjzgvVA5iKrO4++BGeUg3tDD/c1OCsfzchi0nm+Kft07bfjC3UFp6kYS
	 0Uhz/877SEJ9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE88806CF;
	Mon, 19 Jan 2026 17:04:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C57C9160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A9341749
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKOWrdFnP9y4 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 17:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46C4E41746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C4E41746
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46C4E41746
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 17:04:18 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6505d3adc3aso7086760a12.1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768842256; x=1769447056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8cTsXlHIlJSFTsXDFM1O6Pyd1st6KyEek9+avhCWpk=;
 b=Wx/3sVUB+G0sEzv0CDwLeN0PVrx4f151FFqG6ckeKPpWuTiHfG105jl8RQik3+yrMi
 Aw5TeaYbJ+JPN3x+YwSMlrAmbSIj1EqCtOa5436SBYoF0oY8SkR8Eil+Dx3hMGwtGU+e
 TkTFKghlpkkXHlrllbhQpUqvrAVSDBbSfVM2smPJytozAk7wsRmCsSSBPVZyiGplMiLr
 WBCXZ0kFWdGKZz24uRwzhRUD/pnGALPZkDGYNbvzFuer25UoH3ZB1yNLJL18zFhYUB6S
 eScRAbxCvVmryaYSsUWCRfnhxbPJFidEc5bjjeMqT422Ab32aOQa4bHplroAqec+28UP
 pH7A==
X-Gm-Message-State: AOJu0YyjY77svX8ht5kaw19+rnpgY+iphnazQd7JxNBG4zij4tORt3vl
 5WvbTvgTYajs3eU2h5LzPFRmelWF9dXkf92xtBuRCHXg8xlS4ygaVgrAxW6nKUdgkW9cU+e/ATm
 AQahM
X-Gm-Gg: AZuq6aIolBbjr9NX6BtXnCwYzhYStAF26t3AJoHPJ+Uo/57l7wZaKVu/I5V43zftDap
 x7MrKAb0UKNhyRtTOBKk1fAIP/ZoW2uJ6zIQgIxW/t6N6dPKKgP/Q5SYQAR3Hb+NcDLmsWT+Mqs
 fJHZf+6dO1pid2myGt1wrCTTb1VVhU+GQ6REJYCIRsWW1M21SBStBkONNHaXlXZe8e614dVLxFz
 A5U6eeJzlTC+XV3SKoeHYkOVBBBHGZcc/0Ag+i64FaNr3oEa9ktJzbFtHgiv1JDIF+hDBC4TCty
 LA8SOczAmJr07CaNBoafeutGadiT5nW/+3IvrF5k/EOW0PXX8kO3td/p2q5PhKUbrVK48jy3eDl
 3p59CkMaF0lfyoheYrDx/3uGqUgDpCaFjlNBgNBvlciGBs/K3WJnaq3XciNqnXv8KZgnJOTkMbK
 RgwPAINXQqH2ETKy4Pev5+AzGIoEUTtV5GySgaTQzGHnYkTyi4rWjpb44B62OqSU2gDQnc6LPdu
 U5uy82wroutrhQOIECX/gTIU1+8gkCbDbGEIR3pfT5Gia0sNGKkPTkM+NCPBrZoQWGhPVmC32w/
 T6hDHmTUEei9mDjJrPXFlNqOD/BMRo8s
X-Received: by 2002:a17:906:730b:b0:b87:34a0:78a0 with SMTP id
 a640c23a62f3a-b8796bac990mr903795466b.58.1768842255642; 
 Mon, 19 Jan 2026 09:04:15 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959ca4d6sm1140527566b.39.2026.01.19.09.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 09:04:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 19 Jan 2026 18:04:03 +0100
Message-ID: <20260119170403.2855377-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768842256; x=1769447056;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m8cTsXlHIlJSFTsXDFM1O6Pyd1st6KyEek9+avhCWpk=;
 b=XgZ+EOSaguk49BLiqioeUfI3e7wPgHj34MkX+jeWj8DlxEx63rb2eu3OZSJHWsbYCh
 E+9roHFlZZXmLHqhLetMGWMZY3djehlQAgJ0TEEgey356/awf2HBGWGCo7sLy58KwTwA
 +nQfLvHSXNhhfIWMStNUxkryOIjR9U1NfsKy4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XgZ+EOSa
Subject: [Buildroot] [PATCH v2 1/1] configs/stm32h747_disco_sd: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support STM32h747i-disco board. It includes an STM32H747XI SoC with the
following resources:

 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- drop board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash
- Replace #!/bin/bash with #!/bin/sh in board/stmicroelectronics/stm32h747-disco/flash_sd.sh
- Set '-eu' in board/stmicroelectronics/stm32h747-disco/post-build.sh
- Fix a typo in board/stmicroelectronics/stm32h747-disco/readme.txt
- Use bootlin toolchain

 DEVELOPERS                                    |  2 ++
 .../stm32h747-disco/extlinux.conf             |  4 +++
 .../stm32h747-disco/flash_sd.sh               | 18 +++++++++++
 .../stm32h747-disco/genimage.cfg              | 10 ++++++
 .../stm32h747-disco/linux-sd.fragment         |  1 +
 .../stm32h747-disco/patches/linux/linux.hash  |  2 ++
 .../stm32h747-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32h747-disco/post-build.sh             |  9 ++++++
 .../stm32h747-disco/readme.txt                | 32 +++++++++++++++++++
 configs/stm32h747_disco_sd_defconfig          | 32 +++++++++++++++++++
 10 files changed, 112 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32h747-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32h747-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32h747-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
 create mode 100644 board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32h747-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32h747-disco/readme.txt
 create mode 100644 configs/stm32h747_disco_sd_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ed4bdb0a073..08c98ec53bf5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -800,12 +800,14 @@ N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	board/stmicroelectronics/stm32h747-disco/
 F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	configs/stm32h747_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
diff --git a/board/stmicroelectronics/stm32h747-disco/extlinux.conf b/board/stmicroelectronics/stm32h747-disco/extlinux.conf
new file mode 100644
index 000000000000..36f60e346b6d
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32h747i-disco-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32h747i-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32h747-disco/flash_sd.sh b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
new file mode 100755
index 000000000000..6f2e421aba39
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32h747i-disco.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32h747-disco/genimage.cfg b/board/stmicroelectronics/stm32h747-disco/genimage.cfg
new file mode 100644
index 000000000000..e911a94e46b5
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/genimage.cfg
@@ -0,0 +1,10 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 32M
+	}
+}
diff --git a/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment b/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
new file mode 100644
index 000000000000..846229d0d468
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
@@ -0,0 +1 @@
+# CONFIG_XIP_KERNEL is not set
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..9f5d285c3569
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..b6a925ea4e89
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/stmicroelectronics/stm32h747-disco/post-build.sh b/board/stmicroelectronics/stm32h747-disco/post-build.sh
new file mode 100755
index 000000000000..293bf30cb3ff
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR="$(dirname "$0")"
+
+# Kernel is built without devpts support
+sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32h747-disco/readme.txt b/board/stmicroelectronics/stm32h747-disco/readme.txt
new file mode 100644
index 000000000000..5c565de2112a
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/readme.txt
@@ -0,0 +1,32 @@
+STM32H747 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32H747 Discovery evaluation platform.
+
+Building
+--------
+
+  make stm32h747_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32h747-disco/flash_sd.sh output/
+
+It will flash the U-Boot bootloader.
+
+Creating SD card
+----------------
+
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
+ready to be dumped on a SD card. Launch the following command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout and its content, see the
+definition in board/stmicroelectronics/stm32h747-disco/genimage.cfg.
+
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
new file mode 100644
index 000000000000..92cd23196bea
--- /dev/null
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32h747-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32h747-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32h747i-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_EVTEST=y
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
