Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_PH_BODY_ACCOUNTS_PRE,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574B8C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 20:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1D460F5E
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 20:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A1D460F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8379608B5;
	Wed, 28 Jul 2021 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9yBOC9t9W_P; Wed, 28 Jul 2021 20:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5EB0608BE;
	Wed, 28 Jul 2021 20:27:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4910B1BF2AF
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 20:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44AE783653
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 20:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QagNPdH0gx1 for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 20:27:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7898831A7
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 20:27:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0B1F7200009;
 Wed, 28 Jul 2021 20:27:29 +0000 (UTC)
Date: Wed, 28 Jul 2021 22:27:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Simon Doppler <dopsi@dopsi.ch>
Message-ID: <20210728222728.12f04f5a@windsurf>
In-Reply-To: <20210430105647.1702322-1-dopsi@dopsi.ch>
References: <20210430105647.1702322-1-dopsi@dopsi.ch>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] board: Add support for Seeed
 STM32MP157C-Odyssey
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Simon,

Thanks a lot for your contribution, and sorry for the huge delay in
getting back to you. Your patch is really mostly good, there are only a
few comments/questions, see below.

On Fri, 30 Apr 2021 10:56:53 +0000
Simon Doppler <dopsi@dopsi.ch> wrote:

> STM32MP157C-Odyssey reference:
> https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/
> 
> Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
> ---
>  board/seeed/stm32mp157c-odyssey/genimage.cfg  |  22 +++
>  board/seeed/stm32mp157c-odyssey/linux.config  | 182 ++++++++++++++++++
>  .../overlay/boot/extlinux/extlinux.conf       |   4 +
>  .../linux/5.10.1/0001-sdmmc1-broken-cd.patch  |  13 ++
>  board/seeed/stm32mp157c-odyssey/post-image.sh |  12 ++
>  .../stm32mp157c-odyssey/uboot-fragment.config |   1 +
>  configs/stm32mp157c_odyssey_defconfig         |  31 +++
>  7 files changed, 265 insertions(+)
>  create mode 100644 board/seeed/stm32mp157c-odyssey/genimage.cfg
>  create mode 100644 board/seeed/stm32mp157c-odyssey/linux.config
>  create mode 100644 board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
>  create mode 100644 board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
>  create mode 100755 board/seeed/stm32mp157c-odyssey/post-image.sh
>  create mode 100644 board/seeed/stm32mp157c-odyssey/uboot-fragment.config
>  create mode 100644 configs/stm32mp157c_odyssey_defconfig

Could you change the commit title to:

	configs/stm32mp157c_odyssey: new defconfig

and add an entry in the DEVELOPERS file with your name/email associated
to the new defconfig and new folder in board/seeed/ ?

> diff --git a/board/seeed/stm32mp157c-odyssey/genimage.cfg b/board/seeed/stm32mp157c-odyssey/genimage.cfg
> new file mode 100644
> index 0000000000..227fbb600c
> --- /dev/null
> +++ b/board/seeed/stm32mp157c-odyssey/genimage.cfg
> @@ -0,0 +1,22 @@
> +image sdcard.img {
> +	hdimage {
> +		gpt = "true"
> +	}
> +
> +	partition fsbl1 {
> +		image = "u-boot-spl.stm32"
> +	}
> +
> +	partition fsbl2 {
> +		image = "u-boot-spl.stm32"
> +	}

Are you sure you want to stick to the U-Boot SPL booting process, as
opposed to the TF-A based booting process? ST now recommends using the
TF-A booting process.


> diff --git a/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
> new file mode 100644
> index 0000000000..f15a096d91
> --- /dev/null
> +++ b/board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-sdmmc1-broken-cd.patch
> @@ -0,0 +1,13 @@

We need patches to have a proper commit log and Signed-off-by line.

> +++ b/board/seeed/stm32mp157c-odyssey/post-image.sh
> @@ -0,0 +1,12 @@
> +#!/usr/bin/env bash
> +
> +main()
> +{
> +	local GENIMAGE_CFG="board/seeed/stm32mp157-odyssey/genimage.cfg"
> +
> +	support/scripts/genimage.sh -c ${GENIMAGE_CFG}

This should not be needed, you can do it directly in the defconfig:

BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/terasic/de10nano_cyclone5/genimage.cfg"

> diff --git a/board/seeed/stm32mp157c-odyssey/uboot-fragment.config b/board/seeed/stm32mp157c-odyssey/uboot-fragment.config
> new file mode 100644
> index 0000000000..a278ce9e23
> --- /dev/null
> +++ b/board/seeed/stm32mp157c-odyssey/uboot-fragment.config
> @@ -0,0 +1 @@
> +# CONFIG_STM32MP_WATCHDOG is not set

This issue has apparently been fixed since Linux 5.6, see commit
fe2e655666f3b3bc5ebc38036585fe9e0bbb7e30 in Buildroot (applicable to
the STM32MP1 DK2 board).

> diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
> new file mode 100644
> index 0000000000..b001757bf5
> --- /dev/null
> +++ b/configs/stm32mp157c_odyssey_defconfig
> @@ -0,0 +1,31 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_CCACHE=y

ccache shouldn't be enabled in a defconfig.

> +BR2_GLOBAL_PATCH_DIR="$(TOPDIR)/board/seeed/stm32mp157c-odyssey/patches"

$(TOPDIR)/ not needed.

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/seeed/stm32mp157c-odyssey/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/seeed/stm32mp157c-odyssey/linux.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-odyssey"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/seeed/stm32mp157c-odyssey/uboot-fragment.config"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_FORMAT_STM32=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-odyssey"
> +BR2_PACKAGE_HOST_GENEXT2FS=y

This should not be needed. We don't use genext2fs anymore in fact to
generate ext2/3/4 images.

Could you take into account the few comments above, and send an updated
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
