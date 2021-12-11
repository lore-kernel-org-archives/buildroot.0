Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81305C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F108260684;
	Sat, 11 Dec 2021 20:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nw8aaSGIA2jw; Sat, 11 Dec 2021 20:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3676A60687;
	Sat, 11 Dec 2021 20:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66A8C1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F18F84B46
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNt5octFeRkF for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:13:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2444884B29
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:13:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t5so39751322edd.0
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PecKyKA3oopVn7Og7wda0r8yRnZGlkCVbu8cNrW9C1M=;
 b=UX8MxlVqweYbuIflaVlRnJmUqlTv/l0q+NgkIjjvjceekPyQMd+2zlcqg68u9/Wlxi
 umKko1cQR/JfnKWr24KsatcNLlZKuv81oX09YW30rdlZvVZ63+4NcL2OUANMQA2W04yL
 F2QJ5yhAAdKy7P0s9fjrBzbx7frFNsv5Fk9cIq8D9H2LTdkTCDjjv0VIpZ0CPcDdFBpL
 rP0FUDAfe/cXZSY61Bd0ddSdIN7fJijJpNM2Ex0jq5QVQJzIa3dI3wT7XeOt8ioZuxl2
 T4lokXHFQGW8Kl0vVlfcRhokq/dmfDReIx/iWu97TtTxG8mLJ89/bKwRvAfmNfIu49+A
 2+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PecKyKA3oopVn7Og7wda0r8yRnZGlkCVbu8cNrW9C1M=;
 b=cm0rlZ1qSntu4n1uiYc0T1EKLa/BP8K1cZSn7vGfyMOrltXbSc7LDyBzMI3dehaOTK
 X63EqJykIvMYw50P8zXKGhRdPOHWNFRgmSgdSc3ZIIjoPiXwgWQ1lglYXd8ypoQv2qeK
 Ls5L9eI6FIbiAkm6MTYSMEUPWj2/9FmUVD340ijra72291IyyPC9ci4hiuoY0VHg9Oxw
 bjJLY1OjgJcszLGzaKtPW6EGjPkcdhdYo/5vx1J5c6Lc3mkIQV+Z2qQEhzJUE4G2GtK/
 ijiSWiKkSb7+sJwjpUHmjQmPSTUaiMgl9SUgda14R4V/nRTReDqqc8fO4du1lMpz2Y27
 whLQ==
X-Gm-Message-State: AOAM530KIAIPflXCUYBEqSBgwNsyjguPPeHlNsVf81eZSRKtPnn8Ke5N
 +cHiegzF7Rozqz5LtSOxUcDUYo4phqzFI/0mQ74=
X-Google-Smtp-Source: ABdhPJxBuq0DRdikKVLJ02/RYbBuuqyWtDsIiUMBTtP2924MBXybgds9MYYLQTnxjgA7RImirPOYOQ==
X-Received: by 2002:a17:906:11ce:: with SMTP id
 o14mr33139262eja.457.1639253620097; 
 Sat, 11 Dec 2021 12:13:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j4sm3607497edk.64.2021.12.11.12.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:13:39 -0800 (PST)
Message-ID: <101000b7-5b80-1f83-53c0-0e8a7b0f733a@mind.be>
Date: Sat, 11 Dec 2021 21:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211124192006.646757-1-giulio.benetti@benettiengineering.com>
 <20211124192006.646757-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124192006.646757-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] configs/olimex_a64_olinuxino: bump to
 Linux kernel 5.15.4, u-boot 2021.10 and ATF v2.5
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Giulio,

  I have a few minor comments on this patch. I would normally just change them 
while committing, but since I know you're very reactive and you would test those 
changes better than I would, I'll leave it to you!

On 24/11/2021 20:20, Giulio Benetti wrote:
> Bump to Linux kernel 5.15.4, u-boot 2021.10 and ATF v2.5
> Note:

  (nitpick) these two lines are not useful, just make the points. Also we like 
to have proper sentences, starting with a capital.

> 1) now u-boot needs SCP environment variable specified that can point to
> the or1k coprocessor firmware while if coprocessor is not used it must
> be passed /dev/null as we do in this case.
> 2) we now use the u-boot-sunxi-with-spl.bin instead of u-boot.itb since
> it's not produced by u-boot anymore.
> 3) u-boot 2021.10 requires python 3 and openssl so let's enable them.
> 4) remove local patches for uboot and linux.
> 5) remove global patches path from defconfig.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/olimex/a64-olinuxino/genimage.cfg       | 10 +---
>   ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
>   ...e-redundant-YYLOC-global-declaration.patch | 28 ----------
>   configs/olimex_a64_olinuxino_defconfig        | 25 ++++-----
>   4 files changed, 13 insertions(+), 102 deletions(-)
>   delete mode 100644 board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
>   delete mode 100644 board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
> 
> diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
> index 44fcb3cb59..9606d26c02 100644
> --- a/board/olimex/a64-olinuxino/genimage.cfg
> +++ b/board/olimex/a64-olinuxino/genimage.cfg
> @@ -16,15 +16,9 @@ image sdcard.img {
>   
>   	partition spl {

  Since the partition now contains U-Boot (including SPL), I think it's better 
to call it "u-boot". (Also nitpick)

>   		in-partition-table = "no"
> -		image = "sunxi-spl.bin"
> +		image = "u-boot-sunxi-with-spl.bin"
>   		offset = 8K
> -	}
> -
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot.itb"
> -		offset = 40K
> -		size = 1M # 1MB - 40K
> +		size = 1032K # 1MB - 8KB + 16KB(GPT)
>   	}
>   
>   	partition boot {

[snip]
>   # Bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>   BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"

  And here's the big comment: this is not actually the SPL image, it's in fact 
the full U-Boot image. I think that what you end up with with this is that in 
addition to this file, there's another file (u-boot.bin?) that gets installed 
into images but that is in fact useless.

  Therefore, I think you should instead set BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME 
to u-boot-sunxi-with-spl.bin and remove BR2_TARGET_UBOOT_SPL.

  Does that work?


  Regards,
  Arnout


> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
> @@ -36,7 +33,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.4"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
