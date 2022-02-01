Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54397C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF1D60D54;
	Tue,  1 Feb 2022 22:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOubUqQeMY9u; Tue,  1 Feb 2022 22:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFAC60C20;
	Tue,  1 Feb 2022 22:02:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB67F1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99A5B415D3
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iq_sbD6_MzeY for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:01:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 796B1415D0
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:01:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a8so58358138ejc.8
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PrPO/sjFDQEsQg7sbA5d7rWoliZsTco3M8+nk1rGMIQ=;
 b=PIRCugt6t0OzYwkFS7fre9HmN45VATZg6v6cNmQigA/eMI+yH1r/ElFigxRZufeQJZ
 vgGWbqFx0JU2EET/s87j8YjG3ujuzZiZ5OxQgv0sLsI6GR8Ns78YAlt/hqfB6a7J7PDS
 WnwIrXAhfajJpyHT7GRBLy+vUOlwAKXYdtyoFo2DN8JgEVU13cmw/Qk6nFtEaZoRflqK
 +vQG/xzd3Ps+Fl6zys8Xhcwf/Suo8REZiT4yJ9nKEso8kAkL8890ggojSy1k41NgFup2
 R69nb6DU8m/bcERh4mkO7TwlTyVh+RCXPuQ4ptpV+46M+Mj2Ss5Pep0xB6FLgrNwlELX
 TyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PrPO/sjFDQEsQg7sbA5d7rWoliZsTco3M8+nk1rGMIQ=;
 b=QuhPjzBtXo66Eh5XOnWbxnS2DOlXNhZdSvZGiiZJWfBQx94mV2ZWKdHca7+v2k5eAk
 WWG9WyvZqdILUhaTYeMElVpW6pm+chtNKx1viHgsoK7azxLU6gqlXv2FpjQ0R4EgXMUY
 fSeSeDeMEO3gdq3xIv1gyyO+jXCSTZHdMfjpx+675eElAsxcE8WE2RpZrVd+r3oQqS2B
 QESObfnj4RwGYcLEer9O9ZYXF5kbo05GxNNjl3/iLsKmfLmqhnYJI1DN20pJx5fCABTt
 /K1ymo+3hWWA/WeNTEj1SKm5CfcGcm/VsP0X3epmhSiicqDGrvqcDoQicwkDLpC4+5f3
 WU8w==
X-Gm-Message-State: AOAM531YowcqhUkCKsnZZEuVOncYlFNiR+YaxFgqMcQu8JSJnhv8k7Td
 v0KYAK162loUQhnH586jZN70QA==
X-Google-Smtp-Source: ABdhPJySKwMX9lHca38hhE0J7cZy6cv7op3xxYpEU+/nEZQXoCHyhnDSloy6Fjcp8M7puTBDXz2HJQ==
X-Received: by 2002:a17:907:3e90:: with SMTP id
 hs16mr22835975ejc.731.1643752917661; 
 Tue, 01 Feb 2022 14:01:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gv34sm15005046ejc.125.2022.02.01.14.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:01:57 -0800 (PST)
Message-ID: <0e736882-10dd-ce89-4430-25cef83d9c2f@mind.be>
Date: Tue, 1 Feb 2022 23:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220126051808.26581-1-kuzminov.sergey81@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126051808.26581-1-kuzminov.sergey81@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/orangepi_zero_defconfig:
 refactoring, bump Linux and U-Boot versions
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/01/2022 06:18, Sergey Kuzminov wrote:
> Changelog:
> - Refactoring configs/orangepi_zero_defconfig.
> - Linux: bump to version 5.15.16 (from 5.12.2).
> - U-Boot: bump to version 2022.01 (from 2021.04).
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ux-extras.config => linux-extras.fragment} |  0
>   configs/orangepi_zero_defconfig               | 32 +++++++++++++------
>   2 files changed, 22 insertions(+), 10 deletions(-)
>   rename board/orangepi/orangepi-zero/{linux-extras.config => linux-extras.fragment} (100%)
> 
> diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.fragment
> similarity index 100%
> rename from board/orangepi/orangepi-zero/linux-extras.config
> rename to board/orangepi/orangepi-zero/linux-extras.fragment
> diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> index 1c107b10e6..5aaa1566c5 100644
> --- a/configs/orangepi_zero_defconfig
> +++ b/configs/orangepi_zero_defconfig
> @@ -1,49 +1,61 @@
> +# Architecture
>   BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_VFPV4=y
> -BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +
> +# System
>   BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
> +BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   BR2_SYSTEM_DHCP="eth0"
> +
> +# Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Filesystem
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +
> +# Required tools to create the SD image
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# Image
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
>   
> -# wireless driver and firmware
> +# Wireless driver and firmware
>   BR2_PACKAGE_XR819_XRADIO=y
>   BR2_PACKAGE_ARMBIAN_FIRMWARE=y
>   BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
>   
> -# wireless support
> +# Wireless support
>   BR2_PACKAGE_IW=y
>   BR2_PACKAGE_WIRELESS_TOOLS=y
>   BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
> @@ -51,5 +63,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
>   BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
>   BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>   
> -# spi flash support
> +# Spi flash support
>   BR2_PACKAGE_MTD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
