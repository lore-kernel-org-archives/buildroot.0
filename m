Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87667D4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C07F6F8CF;
	Sun, 18 Jan 2026 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reJs1pM3l8Qj; Sun, 18 Jan 2026 17:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46E7B6F8D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768756933;
	bh=PlWwZ6cPOdRHLZvsorbFSVOR1L/mNJu0BC3V33YZx6w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZaxcGqDTaxHna6ZRicZqx0KXUN7wMBnPpSofqVDXyvUDAgUZouvcLyqwh1+GF7ERA
	 Nc4yTYQX8ZC6ng5qxX9BS8GNVhGnjsVxdvEb8BVZx/zEvBsDeyUuZnC+zfvsjjAahn
	 ofb6JOE4fZQY2ochw4SZhgpJLvzhzikVjEtFhcNlzroBGs4Tp1QcEB8iMjU0fNjCke
	 kEfzmcSi7jjSmUmEqmj6B0hOhk9J1uW839ZuYEpP9nIw2BCNYGc4kgnle4Q0PEE5BI
	 m3RupDfYPAh6SdBGcdpAxgfMvDOmGnTjcHhQVGSM11PuBxJ9H2luB0iIcOzGfWiu3r
	 BW9mx9tRuOtkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E7B6F8D1;
	Sun, 18 Jan 2026 17:22:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A1EA2CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7A6427AD
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtG0qaBTvScT for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 17:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23A01427A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A01427A8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23A01427A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 17:22:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3542013F8A2;
 Sun, 18 Jan 2026 18:22:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Jan 2026 18:22:04 +0100
MIME-Version: 1.0
Date: Sun, 18 Jan 2026 18:22:04 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260118155501.2379846-1-dario.binacchi@amarulasolutions.com>
References: <20260118155501.2379846-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <0a245ac36c1aedf900067e3e7fefd6e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768756926;
 bh=YpDzgs/lA15GehUZNCCcgvUyx9mJnw4mJaXTLxuKw58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sYfJ0ZEhc2DwRAdw4f6UdpReXFT5w0WK1an/4zHjQA4D9x3ozBvKEi6DLciCOQvyO
 RUCepwarIgD2eKuRSJlxCI+qkPxfYDUu6igc4EQAdBD8dPVWvplbXScV5t/LZhhZQR
 hI7yTBZh7Trz33gUScQqSNZztvn8e9/hQWR/3vAIvzP5bcNo8WKQ+w06PLVhPICOuF
 oBNnBUdOqKapneSwnAbVut8PfPCUPNvliDyhwvYIllbqIxUrjYFx9ZGPDKhWwoHyqp
 Ukrvktf5KDlaxHbDg+KiakKf2arszpYULUqXggiKvLfkfdWdxhFwl7ZRcPCGoZeuuW
 4hS7QGVCaehMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sYfJ0ZEh
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: new
 defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Thanks for the patch!  I have few comments, see below.

On 18/01/2026 16:55, Dario Binacchi wrote:
> Support STM32h747i-disco board. It includes an STM32H747XI SoC with the
> following resources:
> 
>  - 2 Mbytes Flash
>  - 1 Mbyte SRAM
>  - LCD-TFT controller
>  - MIPI-DSI interface
>  - FD-CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>  - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[...]
> diff --git a/board/stmicroelectronics/stm32h747-disco/flash_sd.sh 
> b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
> new file mode 100755
> index 000000000000..db51fa7b6689
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash

This script does not really needs Bash, so it could be changed
to /bin/sh.

> +
> +OUTPUT_DIR=$1
> +
> +if ! test -d "${OUTPUT_DIR}" ; then
> +    echo "ERROR: no output directory specified."
> +    echo "Usage: $0 OUTPUT_DIR"
> +    exit 1
> +fi
> +
> +"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32h747i-disco.cfg \
> +  -c "init" \
> +  -c "reset init" \
> +  -c "flash probe 0" \
> +  -c "flash info 0" \
> +  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 
> 0x08000000" \
> +  -c "reset run" \
> +  -c "shutdown"
[...]
> diff --git 
> a/board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash 
> b/board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 000000000000..5808d92afe89
> --- /dev/null
> +++ 
> b/board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash

If we switch this defconfig to use an external toolchain (see my comment
below in the defconfig), the linux-header.hash is no longer needed and
should be removed.

> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
[...]
> diff --git a/board/stmicroelectronics/stm32h747-disco/post-build.sh 
> b/board/stmicroelectronics/stm32h747-disco/post-build.sh
> new file mode 100755
> index 000000000000..45100509411b
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32h747-disco/post-build.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh

Could you add "set -eu" here?
This will make sure errors will be reported to "make" process.

> +BOARD_DIR="$(dirname "$0")"
> +
> +# Kernel is built without devpts support
> +sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
> +
> +install -m 0644 -D "${BOARD_DIR}"/extlinux.conf 
> "${TARGET_DIR}"/boot/extlinux/extlinux.conf
> diff --git a/board/stmicroelectronics/stm32h747-disco/readme.txt 
> b/board/stmicroelectronics/stm32h747-disco/readme.txt
> new file mode 100644
> index 000000000000..7125d4d12604
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32h747-disco/readme.txt
> @@ -0,0 +1,32 @@
> +STM32H747 Discovery
> +===================
> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the STM32H747 Discovery evaluation platform.
> +
> +Building
> +--------
> +
> +  make stm32h747_disco_sd_defconfig
> +  make
> +
> +Flashing
> +--------
> +
> +  ./board/stmicroelectronics/stm32h747-disco/flash_sd.sh output/
> +
> +It will flash the U-Boot bootloader.
> +
> +Creating SD card
> +----------------
> +
> +Buildroot prepares an"sdcard.img" image in the output/images/ 
> directory,
                         ^
There is a is missing space here.

> +ready to be dumped on a SD card. Launch the following command as root:
> +
> +  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
> +
> +*** WARNING! This will destroy all the card content. Use with care! 
> ***
> +
> +For details about the medium image layout and its content, see the
> +definition in board/stmicroelectronics/stm32h747-disco/genimage.cfg.
> +
> diff --git a/configs/stm32h747_disco_sd_defconfig 
> b/configs/stm32h747_disco_sd_defconfig
> new file mode 100644
> index 000000000000..8c3db61d108e
> --- /dev/null
> +++ b/configs/stm32h747_disco_sd_defconfig
> @@ -0,0 +1,31 @@
> +BR2_arm=y
> +BR2_cortex_m7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y

We are trying to move all defconfigs to use Bootlin external
stable toolchains. See:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Could you remove the previous line, and add instead:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y

> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32h747-disco/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32h747-disco/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c 
> board/stmicroelectronics/stm32h747-disco/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
> +BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config 
> board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32h747i-disco"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_EVTEST=y
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_OPENOCD=y
> --
> 2.43.0

Can you send an updated patch addressing those comments, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
