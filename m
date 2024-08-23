Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570EAC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 106EE81337;
	Fri, 23 Aug 2024 16:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPiXGkFG3o4y; Fri, 23 Aug 2024 16:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 304ED81338
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304ED81338;
	Fri, 23 Aug 2024 16:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF0651BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC360612F7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nysImqvuOAy for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27D22612F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D22612F6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27D22612F6
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:20:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C6EF20004;
 Fri, 23 Aug 2024 16:20:25 +0000 (UTC)
Date: Fri, 23 Aug 2024 18:20:24 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240823182024.66981be7@windsurf>
In-Reply-To: <20240822183742.3550055-3-dario.binacchi@amarulasolutions.com>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
 <20240822183742.3550055-3-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724430026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5k6i2Hl5mWsQ3yU7EIQW4XYDPNE143TDKW8GdH5w2A8=;
 b=XWAPpelLjmrthJA/Zk48x3PSL9Gx2hDEc6iFspZ5O2muGrJTeBV1bHg0PO7xIDGd5QnRj9
 QiNu9jmgPjVqZBGleNd8w8hPidMO7bNYQW6EQPCenxMxO461TA2YjSwzJOtv9yOIo1u6y0
 oK3TZvMpj/chtef3I0wipEQM4T2wE5n/LSTV7l92LIRR/i91jFFjds5GDJTquusm4Icnjf
 H343eQnSN5nR2xcaNQ7WKBdTcadl+PGdCHdJmnSxsdwf8ScrZQdsjYmy+1Gh+jGtGXlHse
 TGaXoI1vwLfGhmJEzCXzhDE/9PqwCTCg3Qp6fHlJ7lm0S94PCwhOlRwamhcadQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XWAPpelL
Subject: Re: [Buildroot] [PATCH v3 2/3] configs/stm32f746_disco_sd: new
 defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 22 Aug 2024 20:37:41 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> diff --git a/board/stmicroelectronics/stm32f746-disco/flash_sd.sh b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
> new file mode 100755
> index 000000000000..4fe85448f984
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
> @@ -0,0 +1,22 @@
> +#!/bin/bash
> +
> +if [ $# -eq 0 ]; then
> +    OUTPUT_DIR=output
> +else
> +    OUTPUT_DIR=$1
> +fi
> +
> +if ! test -d "${OUTPUT_DIR}" ; then
> +    echo "ERROR: no output directory specified."
> +    echo "Usage: $0 OUTPUT_DIR"
> +    exit 1
> +fi
> +
> +"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f746g-disco.cfg \
> +  -c "init" \
> +  -c "reset init" \
> +  -c "flash probe 0" \
> +  -c "flash info 0" \
> +  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
> +  -c "reset run" \
> +  -c "shutdown"

Could you keep the indentation consistent? Above you used 4 spaces, and
here only 2.

> diff --git a/board/stmicroelectronics/stm32f746-disco/genimage.cfg b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
> new file mode 100644
> index 000000000000..6743d41972c0
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
> @@ -0,0 +1,27 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"stm32f746-disco.dtb",
> +			"extlinux"
> +		}
> +	}
> +
> +	size = 16M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {

Why is this partition called u-boot? It doesn't contain anything u-boot
related.

> +		partition-type = 0xC
> +		image = "boot.vfat"

But why is a VFAT partition needed in fact? Why can't U-Boot simply get
the kernel+DTB from the ext4 rootfs partition?


> diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
> new file mode 100755
> index 000000000000..2894ad851c66
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +BOARD_DIR="$(dirname "$0")"
> +
> +install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
> +
> +# finalize the init script
> +INIT_PATH="${TARGET_DIR}/sbin/init"
> +sed -i "/^# Clear memory to reduce page fragmentation/d" "${INIT_PATH}"
> +sed -i "/^echo 3 > \/proc\/sys\/vm\/drop_caches/d" "${INIT_PATH}"

Meh, this kind of sucks. tinyinit does one thing and we have to undo it
here. Not great. Can we do better, i.e decide whether it makes sense to
do it or not? To be honest, I am not sure if this is really useful to
do at boot time.


> diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
> new file mode 100644
> index 000000000000..8c92afc5740e
> --- /dev/null
> +++ b/configs/stm32f746_disco_sd_defconfig
> @@ -0,0 +1,32 @@
> +BR2_arm=y
> +BR2_cortex_m7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f746-disco/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_INIT_NONE=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f746-disco/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.165"
> +BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f746-disco"
> +BR2_PACKAGE_TINYINIT=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_OPENOCD=y

If you drop the FAT partition, you can drop BR2_PACKAGE_HOST_MTOOLS=y
and BR2_PACKAGE_HOST_DOSFSTOOLS=y.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
