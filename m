Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39081C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B4560F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91B4560F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A2A46072C;
	Fri, 23 Jul 2021 22:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Ynuob8zVeKN; Fri, 23 Jul 2021 22:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F9CD605AF;
	Fri, 23 Jul 2021 22:25:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B03521BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC58A401CB
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNz8MtK0OYHI for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5550400B9
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:25:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ga41so5683735ejc.10
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kK3zjxXNiMbXhXkFxKK4NMlqzu7ZNzLKwUDkhof8qXU=;
 b=biAVhj1f68j4wMSECKwjZWrbWMxPPBWUHPCWFm9JSSm48w2ApLawyul74Xs5AINHZO
 RFEe9GaR+zfOKK696MllQDjJIL+gUWsThf8H6cMNAKH1Kz7pM9FS20U4VrKRFl2KSz8f
 IS+x0Lm8H71Q1GV5soeaM03zXOFH1ohqNGNog2hej5erObQBp6y818lXQPZD6o/0sml9
 jDN40kgaRpjgvLkjK1tzwEBi1PrMADhxh+mWI1GJOyk+HaQWo6d1sF12sCGyY0dcfuux
 mXUhwmI7fJlXTk4LRa2zSJTMC1xzPIPFiPfY6+j5zXCtGsseo/Rc/vb0bObepFYRXv4J
 rXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kK3zjxXNiMbXhXkFxKK4NMlqzu7ZNzLKwUDkhof8qXU=;
 b=KtUlmznMIThk0C1YFfAUEGt4a5/9+fDdxqoeUVUIzYe9Ty3uRp8cXL84EF9PKSC2Cv
 gEm6kq1xTHLWF1JLIk/iwJ/WFYKwJ9eYZmKhPsmhTD7rr31RwJ6V/MJtxyi6eYmBynBJ
 mS/Mm2PuGlQuyRZgwJqD6AIgANJ1JXvHguALUpBAqtB54/KgPz8daZmKfzxbAM3b9yYD
 LnfE9lMf+VqPMSrltAbNYm8EstMbBbHed4Tq8dFdOqE+s7uXkr4/T0XQ2BMU2JXf+dNg
 jXpIL1VPbjBJlA0zDElI2KBkyeeAd4I7CvW3CBYcs33k2klCfBSlSx7o3GD065xYF0wE
 FY0A==
X-Gm-Message-State: AOAM5331GB4Ccqryl2Lr4yR+Jq5WNoVRl+aBh+HyPIX+Yf9/AvIOvNry
 la86zTEnk8q7dzOtlVWzF8oXwg==
X-Google-Smtp-Source: ABdhPJy0V0hTzhtTVIJ6gUD9UgAhzmi/Gh5HoKVe2kbCWkRdARRiKb7BtfjntmkC8S7hYLe2L3+Exg==
X-Received: by 2002:a17:906:f6d5:: with SMTP id
 jo21mr6577555ejb.444.1627079128947; 
 Fri, 23 Jul 2021 15:25:28 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h17sm14709078edv.5.2021.07.23.15.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 15:25:28 -0700 (PDT)
To: Damien Le Moal <damien.lemoal@wdc.com>,
 buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Corbin <mark@dibsco.co.uk>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-5-damien.lemoal@wdc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
Date: Sat, 24 Jul 2021 00:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210715004843.337268-5-damien.lemoal@wdc.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
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
Cc: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 15/07/2021 02:48, Damien Le Moal wrote:
> Add two configuration files to support the RISC-V Canaan K210 SoC based
> Sipeed MAIX-bit board.
> 
> The first configuration file, sipeed_maix_bit_defconfig, enables
> building a bootable kernel 5.13 image with the root file system
> initramfs linked with the kernel. This configuration uses the busybox
> busybox-tiny-initramfs.config configuration to reduce the size of the
> busybox executable (to save memory when executing shell commands).
> 
> The second configuration file (sipeed_maix_bit_sdcard_defconfig) builds
> a bootable kernel 5.13 image that uses the board SD card for the root
> file system. This configuration uses the default busybox minimal
> configuration.
> 
> Both configurations share the same device tree which is provided by and
> built-in the kernel. This configuration is set with the kernel
> configuration snippet provided by
> board/sipeed/maix-bit/linux-dtb.config.
> 
> Both configurations also share the same init script provided using the
> rootfs_overlay root file system overlay. This init script replaces the
> default init process which causes failures due to excessive memory
> usage.
> 
> busybox-tiny-initramfs.config and the init script overlay will be
> reused for all Canaan K210 SoC based boards. These 2 files are thus
> placed in the directory board/canaan/k210-common while the Sipeed
> MAIX-bit board specific kernel config snippet is added under the
> directory board/sipeed/maxi-bit.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../k210-common/busybox-tiny-initramfs.config | 1183 +++++++++++++++++
>  .../k210-common/rootfs_overlay/usr/sbin/init  |   26 +
>  board/sipeed/maix-bit/linux-dtb.config        |    2 +
>  configs/sipeed_maix_bit_defconfig             |   23 +
>  configs/sipeed_maix_bit_sdcard_defconfig      |   23 +
>  5 files changed, 1257 insertions(+)
>  create mode 100644 board/canaan/k210-common/busybox-tiny-initramfs.config
>  create mode 100755 board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>  create mode 100644 board/sipeed/maix-bit/linux-dtb.config
>  create mode 100644 configs/sipeed_maix_bit_defconfig
>  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
> 
> diff --git a/board/canaan/k210-common/busybox-tiny-initramfs.config b/board/canaan/k210-common/busybox-tiny-initramfs.config
> new file mode 100644
> index 0000000000..f0367e5460
> --- /dev/null
> +++ b/board/canaan/k210-common/busybox-tiny-initramfs.config

 Wouldn't it be better to start from busybox-minimal.config and just add a
fragment that removes the unnecessary options?

[snip]
> diff --git a/board/canaan/k210-common/rootfs_overlay/usr/sbin/init b/board/canaan/k210-common/rootfs_overlay/usr/sbin/init
> new file mode 100755
> index 0000000000..286346ddc3
> --- /dev/null
> +++ b/board/canaan/k210-common/rootfs_overlay/usr/sbin/init

 /sbin/init, not /usr/sbin/init. Doesn't matter because you have merged usr, but
it's better to follow the standards.

> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +
> +# Mount sysfs and procfs
> +/bin/mount -t sysfs sysfs /sys
> +/bin/mount -t proc proc /proc
> +
> +# Use the /dev/console device node from devtmpfs if possible to not
> +# confuse glibc's ttyname_r().
> +# This may fail (E.G. booted with console=), and errors from exec will
> +# terminate the shell, so use a subshell for the test
> +if (exec 0</dev/console) 2>/dev/null; then
> +    exec 0</dev/console
> +    exec 1>/dev/console
> +    exec 2>/dev/console
> +fi
> +
> +# Print a fun logo :)
> +echo "          __  _"
> +echo "         / / (_) ____   _   _ __  __"
> +echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
> +echo "       / /___| || | | || |_| | >  < "
> +echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
> +echo "        RISC-V Kendryte K210 NOMMU"
> +
> +# Start interactive shell
> +exec /bin/sh
> diff --git a/board/sipeed/maix-bit/linux-dtb.config b/board/sipeed/maix-bit/linux-dtb.config
> new file mode 100644
> index 0000000000..de2f8fd074
> --- /dev/null
> +++ b/board/sipeed/maix-bit/linux-dtb.config
> @@ -0,0 +1,2 @@
> +CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_bit"
> diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
> new file mode 100644
> index 0000000000..94920c5c84
> --- /dev/null
> +++ b/configs/sipeed_maix_bit_defconfig
> @@ -0,0 +1,23 @@
> +BR2_riscv=y
> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
> +BR2_KERNEL_HEADERS_5_13=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_VERSION_11_X=y

 If GCC 11 is really needed instead of the default, please explain why in the
commit message.

> +BR2_GCC_ENABLE_LTO=y
> +BR2_PACKAGE_HOST_ELF2FLT=y
> +# BR2_USE_MMU is not set
> +BR2_TARGET_GENERIC_HOSTNAME=""
> +BR2_INIT_NONE=y
> +BR2_ROOTFS_MERGED_USR=y

 Why?

> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"

 Why is this needed?

> +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"

 This doesn't seem to be part of this patch?

> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_PACKAGE_BUSYBOX_CONFIG="board/canaan/k210-common/busybox-tiny-initramfs.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

 Why do you set this? No others are selected, are they?

> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y

 This will install another /init script that ends up exec'ing /sbin/init. Maybe
it would be better to replace that /init script as well (just symlink /init ->
sbin/init).


 Regards,
 Arnout

> +# BR2_TARGET_ROOTFS_TAR is not set
> diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
> new file mode 100644
> index 0000000000..eba06bcbc6
> --- /dev/null
> +++ b/configs/sipeed_maix_bit_sdcard_defconfig
> @@ -0,0 +1,23 @@
> +BR2_riscv=y
> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
> +BR2_KERNEL_HEADERS_5_13=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_VERSION_11_X=y
> +BR2_GCC_ENABLE_LTO=y
> +BR2_PACKAGE_HOST_ELF2FLT=y
> +# BR2_USE_MMU is not set
> +BR2_TARGET_GENERIC_HOSTNAME=""
> +BR2_INIT_NONE=y
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
