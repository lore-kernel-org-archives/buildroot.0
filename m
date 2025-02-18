Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F07C021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 01:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D1740489;
	Tue, 18 Feb 2025 01:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNa1is4i5ELY; Tue, 18 Feb 2025 01:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FEB7412EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FEB7412EF;
	Tue, 18 Feb 2025 01:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C45C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098CB40108
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byfTRZqOXCXl for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 01:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A40384010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A40384010D
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A40384010D
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:57:35 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3d193fc345aso12041825ab.2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 17:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739843854; x=1740448654;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g828DjChKtw/1mYi4OS9YUL4yXeJ/7VxSqjahKikuF4=;
 b=qtcpAusnMsBsYLhDonGGikV1Ne/HyC/8d5QUAkgFPujnerCdOtF4nmQG/eferbfNM4
 CD1MxzToOsDRG8jPqvftoct9PWRfmMTXX/wfw1195AvNO9JsXZcmstw2IKcHAVyVoa4H
 zi1ywQNKpHzpwzfa6VniQWGFWaHz8idx71IafGg0bTHZS9FyoYoIv90q64uOsE/jVWYP
 1snzxgYzsIbM9OEl0l6/NL6uVJ5dbmUCx+Xz8mfqi+30j/qmpLE7580aE7PA06MZOMuF
 4nnNNONUaEgN8XnFp/qwnmzcCe3WhLAiZqxWggB91FE8jR0ZzVizfqFVCaf6qYGwrGPq
 N0PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv/48jsGOVt8Z6tI0AclJAgpUdVnNTj2qP/IzVOJDYoGG0Jh56DL/m2BSXmBUhK2ogjY0CpWcAvr0=@buildroot.org
X-Gm-Message-State: AOJu0Yz3SGg/hYGXBAw84P5ddwVYuj5uWA/DBS5S4OqisZc5x93dBxH3
 P9TV/hFc3Wutt+0nHOW56tARZSa4n+s5av0gBNcZNVQ+Us0E5n+k
X-Gm-Gg: ASbGncvjTPhBP35CAnHBj+rJlP+cd27dG+uevzCOPrrDXicEUN2QbdLg9PX1iLsHOLk
 VQ4jw2fmY8UhMog5y2xTirLa4mvsPsw6lyp0O4W9SoUDmok2S9ZzKWS1tBzZQ3am1mZQ/9dmR/g
 IUiD5wYldUvM7KIo5KiUtqAtLKPEEs+U+NOwtQbdDAL/gOPeC7Xuitn22sKYPBPL+W3yeJ6IqEG
 JVOztWu4LQPq2nB+KwZaj1o5tX19frsI4TOuNpk0Y5NU0lwGby7fLc1jwIXhXE5eyWSF91n9ksr
 GDH7gdvZH597ErEuzurq9lQ4LOjEO/3+JaRciagwqhzRuehLWd6E6OvfjT36VtsYCA==
X-Google-Smtp-Source: AGHT+IGmyelGap12M6zqS5wuLoHHFGOH4FKnGS4DfjU2/XEUEF/GrPnIRTSHK2cRhCKTyWs2+Yht2w==
X-Received: by 2002:a05:6e02:1c83:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3d28098a122mr97810705ab.22.1739843854426; 
 Mon, 17 Feb 2025 17:57:34 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d2ac7b8b93sm704415ab.26.2025.02.17.17.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 17:57:33 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 17 Feb 2025 19:57:33 -0600
Message-Id: <D7V767ZDRIM2.3JJN8L2KRHJBS@gmail.com>
Cc: "Brandon Maier" <brandon.maier@collins.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Akhilesh Nema" <nemaakhilesh@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
 <20250111063753.769689-5-nemaakhilesh@gmail.com>
In-Reply-To: <20250111063753.769689-5-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739843854; x=1740448654; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g828DjChKtw/1mYi4OS9YUL4yXeJ/7VxSqjahKikuF4=;
 b=H/3IAtJ5ZYiMmv/YDG5mDqxrO1miTlvsMO4fXsqw5pU870piwwJ4kB3QdNtcr+wUKm
 koMVdHPBEjlU+TLzdE65+KrRoLcFIKf8NPiIKMWnrIusd/q4XqhfecbTMIIj8xDqh77c
 SA9wpgojy5NouZPCqUjKguyd4cUUlRppIMob4RehhSY/S8qtbycVvBOrM5RhDMoxkhL9
 G0SlinfOBfBOTkiIjxzVd11o0P8amxhLDs/T8ZHWksxQD/fLpagS/bxEibhVPugFiIhb
 pgfSi+SP5B/815EExWU08BJkZT3psH48KEPJ31XHtfL695PkptuKpM4JqDhmzBiKEMmb
 hOXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H/3IAtJ5
Subject: Re: [Buildroot] [PATCH 5/5] configs/ls1046a-frwy_defconfig: bump
 BSP components to lf-6.6.52-2.2.0
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

Hi Akhnilesh,

On Sat Jan 11, 2025 at 12:37 AM CST, Akhilesh Nema wrote:
> - Updated Linux, U-Boot, and TF-A to lf-6.6.52-2.2.0 tag.
> - Updated readme.txt
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  .../arm-trusted-firmware/arm-trusted-firmware.hash   |  2 +-
>  .../freescale/ls1046a-frwy/patches/linux/linux.hash  |  2 +-
>  .../freescale/ls1046a-frwy/patches/uboot/uboot.hash  |  2 +-
>  board/freescale/ls1046a-frwy/readme.txt              | 12 +++++++-----
>  configs/ls1046a-frwy_defconfig                       |  6 +++---
>  5 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> index f9af28ab3c..344a6299d8 100644
> --- a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
> +sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
> diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
> index e038c22862..fa38fb1f75 100644
> --- a/board/freescale/ls1046a-frwy/patches/linux/linux.hash
> +++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
> +sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
> diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
> index a5ccd82b2b..a1e3b69376 100644
> --- a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
> +++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
> +sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
> diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
> index 4d1e0e1dcd..1a32bad9bb 100644
> --- a/board/freescale/ls1046a-frwy/readme.txt
> +++ b/board/freescale/ls1046a-frwy/readme.txt
> @@ -13,11 +13,13 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
>    - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
>
>  the components from NXP are:
> -  - rcw, lf-6.6.23-2.0.0
> -  - atf (fork), lf-6.6.23-2.0.0
> -  - uboot (fork), lf-6.6.23-2.0.0
> -  - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
> -  - linux (fork), lf-6.6.23-2.0.0
> +  - rcw, lf-6.6.52-2.2.0
> +  - atf (fork), lf-6.6.52-2.2.0
> +  - uboot (fork), lf-6.6.52-2.2.0
> +  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
> +  - linux (fork), lf-6.6.52-2.2.0
> +  - fmlib, lf-6.6.52-2.2.0
> +  - fmc, lf-6.6.52-2.2.0

The fmlib and fmc packages aren't enabled on the ls1046a-frwy.

>
>  Build
>  =====
> diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
> index 2cf0f9c8bc..52d8f0cc07 100644
> --- a/configs/ls1046a-frwy_defconfig
> +++ b/configs/ls1046a-frwy_defconfig
> @@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> @@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
