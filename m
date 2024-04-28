Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121AEC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C388A60633;
	Sun, 28 Apr 2024 18:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7IG6xFNI74b; Sun, 28 Apr 2024 18:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD84260635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD84260635;
	Sun, 28 Apr 2024 18:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161F61BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 030824016F
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGdt1AzURXQ7 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A15C340105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15C340105
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A15C340105
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:20:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34d2178fc7fso57760f8f.0
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714328416; x=1714933216;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mHbD+cPU8PurLDx1ZlbBkWOjCXQ32j+a2dFhJZ+AzUs=;
 b=Qx1weO3nMm4LwinUbR9ESr8lB6QfAFDrxcVl5CRh4E4HpNvJtpiPDcpcICkNKYveqd
 1FQyCCFWHodALiS3hb6qIWEfCSOBLjUUqUKuLdNb6J4+FhSsLTNzrZgGOAZvlKxVtu0p
 3m05Xbvg+NR3iMKrkKc5GrA9tPeL3cBOyw3Dav6ExccP09efuo/rXIODswyVGbSAyZLx
 ZeNz77nte06G+MBCvUSZta9wKWFufgFeAho5/FXTNx6nhUdX4qZt53aJxlt4PhcousSz
 P+t4DtW6avu9zSu1BfPwJi8KdBcZbq5Qrybg74pJp42NW7PKZKHPH6TFWXSlwAu10hL4
 UoNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhgTy3HEhxbvA7CPipdsVvBK3y2hQGpPqmPNz6aAxdAWQTrlm7+WdCTRHrFnWjPvfD1wxRRa9iwyEA5QG9rfQqatFLZp6zoA==
X-Gm-Message-State: AOJu0YwGj7AK4DyAs7gLucvLjMqvNXBFh/DzbE08CbGCGyxOBPgnjInq
 SWS40ClnuVt+4HQF43pmMHCeORAKG0biV4oEvrMfA3S/Z5apMvrypqJyc9HLvYTd2EfXGnxuzkA
 V
X-Google-Smtp-Source: AGHT+IEvyKkfUZou/cZ20T7hhtcGKlUuwhY9yAKQ6wl2nGPlfVsyGij1dbu7NdnbxyevlP/9mHImEw==
X-Received: by 2002:a05:6000:4e8:b0:349:f220:a1cd with SMTP id
 cr8-20020a05600004e800b00349f220a1cdmr6314530wrb.27.1714328416149; 
 Sun, 28 Apr 2024 11:20:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bh18-20020a05600c3d1200b0041bd920d41csm6221232wmb.1.2024.04.28.11.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:20:15 -0700 (PDT)
Message-ID: <59f91e64-5418-4c2f-a8ff-9bd3b26511f3@mind.be>
Date: Sun, 28 Apr 2024 20:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>, buildroot@buildroot.org
References: <20240414190644.1059171-1-tekieli.lukasz@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240414190644.1059171-1-tekieli.lukasz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714328416; x=1714933216; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mHbD+cPU8PurLDx1ZlbBkWOjCXQ32j+a2dFhJZ+AzUs=;
 b=MEUo77ErKvPGL+inXL3D+HWpQSscvuB604dnjTgkMPjiAtbF61Zux8FnNED9qAca75
 0aK4IEK+gI3iW2Z1jONbWPfcvY6dFHElD8Ggw2z2aS2hq4Xg10QLelgxKmUp2WrljfDh
 d/0BiXtBLNzU8HJ7fyAjih6NPy9bvazm8MSiIfWvK9tELlYAtFLfPPTzH/74RoZAC2l9
 ixDXrVYgUJskVQ8pZC9zuoKE/KOPnv5n0HNVexvX78UsctR0lLpMzytNS9VUU4oL5mMy
 O72hNidC+gY0xbvgo4O7tPtLKyKKuluO/zsIdibE3hrqF6wjwKT+SiddTSjYLQfxHrO8
 uZPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MEUo77Er
Subject: Re: [Buildroot] [PATCH 1/1] board/visionfive2: add spi-nor image
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2024 21:06, Lukasz Tekieli wrote:
> Builds the spi-nor.img together with the sdcard.img.
> Readme is extended with SPI NOR flash writing instructions
> and recovery.
> 
> The spi-nor.img layout is based on the following document:
> 
> https://doc-en.rvspace.org/VisionFive2/Boot_UG/JH7110_SDK/boot_address_allocation.html
> 
> Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>

  Applied to master, thanks.

  I've added the following paragraph to the readme:

Note that Buildroot puts the bootloader both in SPI NOR and on the SD card,
so after flashing as instructed above, either boot mode should work.

  If this is not correct, could you please send a correction?

  Regards,
  Arnout

> ---
>   board/visionfive2/genimage_spi-nor.cfg | 36 ++++++++++++++++++++++++++
>   board/visionfive2/post-image.sh        |  4 +++
>   board/visionfive2/readme.txt           | 25 +++++++++++++++---
>   configs/visionfive2_defconfig          |  3 +--
>   4 files changed, 62 insertions(+), 6 deletions(-)
>   create mode 100644 board/visionfive2/genimage_spi-nor.cfg
>   create mode 100755 board/visionfive2/post-image.sh
> 
> diff --git a/board/visionfive2/genimage_spi-nor.cfg b/board/visionfive2/genimage_spi-nor.cfg
> new file mode 100644
> index 0000000000..8b1d13989a
> --- /dev/null
> +++ b/board/visionfive2/genimage_spi-nor.cfg
> @@ -0,0 +1,36 @@
> +flash nor-16M-256 {
> +	pebsize = 4K
> +	minimum-io-unit-size = 256
> +	numpebs = 4096
> +}
> +
> +image spi-nor.img {
> +	size = 16M
> +
> +	flash {
> +	}
> +
> +	flashtype = "nor-16M-256"
> +
> +	partition spl {
> +		image = "u-boot-spl.bin.normal.out"
> +		offset = 0K
> +		size = 512K
> +	}
> +
> +	partition uboot-env {
> +		offset = 960K
> +		size = 64K
> +	}
> +
> +	partition uboot {
> +		image = "u-boot.itb"
> +		offset = 1M
> +		size = 4M
> +	}
> +
> +	partition reserved-data {
> +		offset = 6M
> +		size = 10M
> +	}
> +}
> diff --git a/board/visionfive2/post-image.sh b/board/visionfive2/post-image.sh
> new file mode 100755
> index 0000000000..3da106dc26
> --- /dev/null
> +++ b/board/visionfive2/post-image.sh
> @@ -0,0 +1,4 @@
> +#!/bin/bash
> +
> +support/scripts/genimage.sh -c board/visionfive2/genimage.cfg
> +support/scripts/genimage.sh -c board/visionfive2/genimage_spi-nor.cfg
> diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
> index 85be1d5dfc..31edef02e4 100644
> --- a/board/visionfive2/readme.txt
> +++ b/board/visionfive2/readme.txt
> @@ -12,12 +12,27 @@ How to build
>   $ make visionfive2_defconfig
>   $ make
>   
> +Once the build process is finished you will have two images
> +in the output/images/ directory:
> +- sdcard.img
> +- spi-nor.img
> +
> +How to write the SPI NOR flash
> +=============================
> +
> +If you have a booting device use u-boot and tftp:
> +
> +  # tftpboot 0x82000000 spi-nor.img
> +  # sf probe
> +  # sf update 0x82000000 0x0 {filesize}
> +
> +Otherwise, follow the recovery instruction:
> +
> +https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/recovering_bootloader%20-%20vf2.html
> +
>   How to write the SD card
>   ========================
>   
> -Once the build process is finished you will have an image called "sdcard.img"
> -in the output/images/ directory.
> -
>   Copy the bootable "sdcard.img" onto an SD card with "dd":
>   
>     $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> @@ -27,7 +42,9 @@ Preparing the board
>   
>   Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
>   
> -Change the boot mode pins to SD card booting (RGPIO_0=1, GRPIO_1=0):
> +Use the correct mode for booting:
> +- SD card RGPIO_0=1, GRPIO_1=0
> +- SPI NOR flash RGPIO_0=1, GRPIO_1=1
>   
>   https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
>   
> diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
> index c8576a35a7..699ea8dd4b 100644
> --- a/configs/visionfive2_defconfig
> +++ b/configs/visionfive2_defconfig
> @@ -2,8 +2,7 @@ BR2_riscv=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_SYSTEM_DHCP="eth0"
>   BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
