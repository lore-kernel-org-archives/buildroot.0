Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6024FCFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 14:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2673060716;
	Sun,  6 Oct 2024 14:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKUglx5QuOeF; Sun,  6 Oct 2024 14:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0757560729
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0757560729;
	Sun,  6 Oct 2024 14:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06B981BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA041810DD
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xv_4PzjzsGf for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 14:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B207C810DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B207C810DE
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B207C810DE
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 14:03:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37ccfba5df5so2436194f8f.0
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 07:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728223431; x=1728828231;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ipkObKJ8kYtyJRVqWGXSzsoi7qMIW5MKhzc2+61ES+U=;
 b=h75VGrNBzabERuRkN732iZl8hVGFC/UxVRj6A23p/X7kuttVwZcxxxvMMa+cGP9dKH
 9B5fxLnzIZ5N/g2c6ad8LkWUVY8mUfi7yHQvU3XLqENw1yoxQgmQRE9s11zXke2TphXa
 n6bnCT3X4zgQPkhgM0f6pZG6+Vz5Uuf7KCFxPyRHmhOlMneDh6dUw1wd1vnFERMopqrI
 IWCAJAFiugm+ByKpd2pMS2Bsd8MY7ajpIGid5JpsthMpj1CxRvL4e3+/igRsb+1V0DPS
 Caz1mCVaTCYvlttNamX1Q59wFGcynwpXxNIDIQouzmRrzRHmCw+EszLClXXF8yGs085I
 7vGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw1cnsw2Xz0vJonB8bey+BJX9bSI7qD4r30ajc7DGV5toru6h9fXMOamIp+RC789tsD31GVi7LLZ4=@buildroot.org
X-Gm-Message-State: AOJu0YyAVlzoWJeCvJ5jpv3Jh2KBLo9LdnkQeGPHjyAiz1tpMNm7ChAc
 1UuC1y7z7gYikfL4D8vbvgLDui7zPYP8JufrqYmKeCTZlcEeFGm3/AvQvml3EVE=
X-Google-Smtp-Source: AGHT+IHbBzsosyULN81iQptxq4iSqgRaKKZNEQukrlz8thOQetvSqzIkygetbPOK4XmnyrkhLRAf2A==
X-Received: by 2002:adf:e6cb:0:b0:374:c45a:8afb with SMTP id
 ffacd0b85a97d-37d0e6f0549mr4608206f8f.19.1728223431342; 
 Sun, 06 Oct 2024 07:03:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1690f79bsm3719592f8f.18.2024.10.06.07.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 07:03:49 -0700 (PDT)
Message-ID: <017e588b-01f0-48e1-8f73-9fa5b60e850d@mind.be>
Date: Sun, 6 Oct 2024 16:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20241005191043.2141597-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241005191043.2141597-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728223431; x=1728828231; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ipkObKJ8kYtyJRVqWGXSzsoi7qMIW5MKhzc2+61ES+U=;
 b=JaWGFGzt2uMSc8BAf0/SNAd+2EVzJIxsDKhfpq4eR84kfv1BBMajgMIVT6PAJGn2YR
 zAArEwy9TvRyU4csuREp7y4u91IzZ/SXhE+merQpBFSIRDPybTAoDHix1xGHcDfglrYw
 uG0UspVhlv/N3L9ue5Z2SLTL60HGxa6uvgy16NV1van4w5DXv5kM9bbXUQiV4Gg5LDER
 x+nsEVY8MAgIYGk7NDN7VCPzOzOhkrKTY+yNo9wJ2/seWcu+nFp/qF0vnhWFUhGCLOIN
 OpNAUAcxijWGk/1hTJg7S5ugOQ3Sc53HJNRpMvI27eDqNHjFn4Gv9FOQUxIJbpeH1AbV
 jX+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JaWGFGzt
Subject: Re: [Buildroot] [PATCH 1/1] board/stm32f469-disco: move kernel and
 DTB to rootfs partition
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2024 21:10, Dario Binacchi wrote:
> The patch, following the suggestion expressed in the review [1] for the
> stm32f746-disco board support, moves the Linux kernel and the related
> device tree to the ext4 rootfs partition. By doing so, the vfat partition,
> improperly called u-boot, no longer makes sense and can therefore be
> removed. From now on, U-Boot will load the kernel and the device tree
> from the ext4 rootfs partition.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   .../stm32f469-disco/extlinux.conf               |  6 +++---
>   .../stm32f469-disco/genimage.cfg                | 17 -----------------
>   .../stm32f469-disco/post-build.sh               |  2 +-
>   configs/stm32f469_disco_sd_defconfig            |  3 +--
>   4 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/extlinux.conf b/board/stmicroelectronics/stm32f469-disco/extlinux.conf
> index 1c2db4383ba5..65aa286a7a9d 100644
> --- a/board/stmicroelectronics/stm32f469-disco/extlinux.conf
> +++ b/board/stmicroelectronics/stm32f469-disco/extlinux.conf
> @@ -1,4 +1,4 @@
>   label stm32f469-disco-buildroot
> -  kernel /zImage
> -  devicetree /stm32f469-disco.dtb
> -  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
> +  kernel /boot/zImage
> +  devicetree /boot/stm32f469-disco.dtb
> +  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
> diff --git a/board/stmicroelectronics/stm32f469-disco/genimage.cfg b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
> index 517ead7751e6..e911a94e46b5 100644
> --- a/board/stmicroelectronics/stm32f469-disco/genimage.cfg
> +++ b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
> @@ -1,24 +1,7 @@
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"stm32f469-disco.dtb",
> -			"extlinux"
> -		}
> -	}
> -
> -	size = 16M
> -}
> -
>   image sdcard.img {
>   	hdimage {
>   	}
>   
> -	partition u-boot {
> -		partition-type = 0xC
> -		image = "boot.vfat"
> -	}
> -
>   	partition rootfs {
>   		partition-type = 0x83
>   		image = "rootfs.ext2"
> diff --git a/board/stmicroelectronics/stm32f469-disco/post-build.sh b/board/stmicroelectronics/stm32f469-disco/post-build.sh
> index ec20fca7d964..c4d155f350d7 100755
> --- a/board/stmicroelectronics/stm32f469-disco/post-build.sh
> +++ b/board/stmicroelectronics/stm32f469-disco/post-build.sh
> @@ -1,4 +1,4 @@
>   #!/bin/sh
>   BOARD_DIR="$(dirname $0)"

  This line was triggering a shellcheck warning, so I fixed that as well (and 
updated checkpackageignore).

  Applied to master, thanks.

  Regards,
  Arnout


>   
> -install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
> +install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index c00c043896a3..97dbce5d46c1 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/busybox.fragment"
>   # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>   BR2_TARGET_ROOTFS_EXT2=y
> @@ -26,7 +27,5 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
>   BR2_PACKAGE_HOST_OPENOCD=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
