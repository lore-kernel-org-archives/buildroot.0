Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B155CFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 14:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB60F60717;
	Sun,  6 Oct 2024 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjjxV8zksdl0; Sun,  6 Oct 2024 14:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C2260718
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7C2260718;
	Sun,  6 Oct 2024 14:05:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AAC01BF4DA
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C0A810DE
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJvQ3LeNYIyg for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 14:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEE91810DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE91810DD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEE91810DD
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 14:04:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37cdbdbbb1cso1683200f8f.3
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 07:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728223498; x=1728828298;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xm5/EISQnwXqIN9TgKW05NOtUNbLoeSISf0lpGqmCP0=;
 b=n5F7cGq218yKyIQUOB0FlE9mq/GJ5UrAxsvd1u5Cf0rm4JQOyErlP64R635f5/jg6b
 DBfqrUs9RpgVIb32IBinMoh6jMwuGSKBJCVSBHbPYgcXJ/Qj3uZbPUecR+637wNP5UNU
 FLEABShyVb6cYuaIXwiYIPtEDHJCVZYGp3w90BqgXhkXlC4U8pnNf+f2Dz3NvGXUjoMN
 zLtp64LRjvwr5dh8ULjP9Nv2VUekTQMyf9qQ4inLCaADv8FXhKPy5McPTWQYmVaA4nS3
 OHmsUgEB/2TYNzfWIQ4cRYch/1Pa7E8W9k1LdnB7TgjksIWOwBcvJvRc9fsUqmacteM2
 gtwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmL4mFBAzFFx+bTYYqjA2Blt2IUnR3FfN99aEuLSiJ9grSY+dcj2R5eSP30Y1XfX3ls3FnZ36DwA=@buildroot.org
X-Gm-Message-State: AOJu0Yy67sEgXj+XyoMrdvLuncb4/EfZez7li0Rmqke9XLNeW4irmd6M
 rRa+6kR0FOxWff7r6PhLguD+8JHkQ9B/Su/TfG2PjEZH4NMVbRdeuiXU2711Zwg=
X-Google-Smtp-Source: AGHT+IERfQQOK+vePydeqIym4qBE1Rnl0PIgVdpf8mEOCTovvGg1ujSOIAiqU76qmKqTETDxAWE52g==
X-Received: by 2002:adf:fb4f:0:b0:37c:ca01:98ea with SMTP id
 ffacd0b85a97d-37d0e6bbd10mr4475676f8f.11.1728223497869; 
 Sun, 06 Oct 2024 07:04:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86b4430esm65398295e9.37.2024.10.06.07.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 07:04:56 -0700 (PDT)
Message-ID: <7d251be0-53db-4c2d-8ce7-2a7fa553244a@mind.be>
Date: Sun, 6 Oct 2024 16:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20241005191528.2142818-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241005191528.2142818-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728223498; x=1728828298; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xm5/EISQnwXqIN9TgKW05NOtUNbLoeSISf0lpGqmCP0=;
 b=J53dXwGOQXTAzcS7vJ3k20VVXBkn5naOjDvY6/unkz8vCKoobGqTDYirHKnShdXoPl
 rMsP+1a1X+meZ2CbaFvYnQnjkngNr0UabG3md4MmLA+RP+8G+P8wB1ghYt71xEgXSA16
 EpGRLvjpnSfPXZajYttPBAOVBxhgQ51NrgIonOh3b5Apu88rbK61H+Ak5qi+nFcystUP
 jfJlho3dmn2lqDQT2i6Nppc+49Y5iXyTrho+tcXMN4PgaHEPJ0kACQKe45oKP5q4zdJg
 m0puUPxZSzs9I/dTmrJgd2wwJLab9mZur+g5cTrndMSKt7lBNIai7dDG8bxuYbzm8Hjd
 ZcBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J53dXwGO
Subject: Re: [Buildroot] [PATCH 1/1] board/stm32f769-disco: move kernel and
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2024 21:15, Dario Binacchi wrote:
> The patch, following the suggestion expressed in the review [1] for the
> stm32f746-disco board support, moves the Linux kernel and the related
> device tree to the ext4 rootfs partition. By doing so, the vfat partition,
> improperly called u-boot, no longer makes sense and can therefore be
> removed. From now on, U-Boot will load the kernel and the device tree
> from the ext4 rootfs partition.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Small nit: I think it's better to leave an empty line before the block of 
signoff and other tags.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../stm32f769-disco/extlinux.conf               |  6 +++---
>   .../stm32f769-disco/genimage.cfg                | 17 -----------------
>   .../stm32f769-disco/post-build.sh               |  2 +-
>   configs/stm32f769_disco_sd_defconfig            |  3 +--
>   4 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f769-disco/extlinux.conf b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
> index 48483a01fc4e..edc1582615da 100644
> --- a/board/stmicroelectronics/stm32f769-disco/extlinux.conf
> +++ b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
> @@ -1,4 +1,4 @@
>   label stm32f769-disco-buildroot
> -  kernel /zImage
> -  devicetree /stm32f769-disco.dtb
> -  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
> +  kernel /boot/zImage
> +  devicetree /boot/stm32f769-disco.dtb
> +  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
> diff --git a/board/stmicroelectronics/stm32f769-disco/genimage.cfg b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
> index 41f9da512489..e911a94e46b5 100644
> --- a/board/stmicroelectronics/stm32f769-disco/genimage.cfg
> +++ b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
> @@ -1,24 +1,7 @@
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"stm32f769-disco.dtb",
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
> diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
> index c8cca3de8c9b..45100509411b 100755
> --- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
> +++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
> @@ -4,4 +4,4 @@ BOARD_DIR="$(dirname "$0")"
>   # Kernel is built without devpts support
>   sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
>   
> -install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
> +install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
> diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
> index 2ec2687334c1..386a5d68e82a 100644
> --- a/configs/stm32f769_disco_sd_defconfig
> +++ b/configs/stm32f769_disco_sd_defconfig
> @@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
> @@ -25,7 +26,5 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
>   BR2_PACKAGE_HOST_OPENOCD=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
