Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC4D59F78
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C16380C7B;
	Wed,  6 Nov 2024 22:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWddGrDPe3iz; Wed,  6 Nov 2024 22:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2677581141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2677581141;
	Wed,  6 Nov 2024 22:02:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D36F6B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEAE84031E
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBezef5SNrqJ for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:02:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7801A4031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7801A4031C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7801A4031C
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:02:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so2804335e9.1
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 14:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730930532; x=1731535332;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hjh6Ukbe2P3d8kRzM8jPoPxRHXDR4sBYk6LwAGpWlGo=;
 b=PWawbz4q5ry2aMA3dohjI4RxpX0VpiN9x03pcroJOQ/tW0HqyCOl78+zPiJ0x8Af9f
 amm4L6MWkq1INzAuX9JrhvLjf/WZwQ1C1L1rrVm6br/mhlloRsF7nQuzDP6DM6tNd7nt
 V/Egr8o7rga4cEMFj3ftBadSIXn86D8Z0QBR7zL8DwYYrjxsjSLq16FQRCc2cXc3Keo8
 bQ5Ct2i9cXfBbcNPi1/h04f9C96tQFbNxwezAk2jn+OMfWwMDftbBQkiUcL4+PFImlGO
 pjwRD9ZVVeI40knVqEuQCaQxUJ1cThTwuk+fRgYX1KrBua4484Zn7iJTba9IbuaiTLQI
 CncQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMXPqkFpfQd6EnJYCFOOB4hST+25qwEiRYkCy7SiekwxjMBYmKb3FiknQs8m5mRFAa8h/CAKvq3cE=@buildroot.org
X-Gm-Message-State: AOJu0YzPL/D7+ORU/DMIPcX/MgovoaOcxHFiUS0zEhxgKGx4AS1NcObr
 1LWYVDMQsxprPWV+1UZvi09vI7AwZs/zqJgVbJo36jgDDLQHRuNYVXaxiQXC3RKyO2qT70i50Lz
 g
X-Google-Smtp-Source: AGHT+IER3iaL1O9XOW4S7WUGP/5YsaE3/nI2llCC5Mn9OYfvrJGaZURvamliH7a2Lv5CCJY2fSDDTQ==
X-Received: by 2002:a05:600c:3555:b0:431:4b88:d408 with SMTP id
 5b1f17b1804b1-432832434cbmr164092435e9.5.1730930532390; 
 Wed, 06 Nov 2024 14:02:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c202asm968095e9.30.2024.11.06.14.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 14:02:10 -0800 (PST)
Message-ID: <64481c7d-8ba2-45cd-8040-3a3da48c8429@mind.be>
Date: Wed, 6 Nov 2024 23:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Bryan Brattlof <bb@ti.com>, Anand Gadiyar <gadiyar@ti.com>
References: <20241010161210.3595876-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241010161210.3595876-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730930532; x=1731535332; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hjh6Ukbe2P3d8kRzM8jPoPxRHXDR4sBYk6LwAGpWlGo=;
 b=KDlXgzpmRhYbdTR9YcRod1T2JENoQAh2hc09aUD9z/ZjFqFIdTSG1nzPGtl+J6YJ7H
 seLPfJdFRNtWCO2zBRYS4KkTrA5uK2CEMDujaDZsNgZPHH8UUjd89G23MK/3XGjB9alW
 iIMYahcos4dr0YLmSiIphXmF4okin10OES9Zh7COVI0KiMJcwlHMUxPaUvubQuyuMVvw
 KJqc+XpFlKLUoB2mIl41yLuh5jA3P/tHtCFOAeUcVJEgXAG8HCJ2DJSlN0d+dNovQeWb
 l8Zp709qjXatr1HIyr1sz2f3v8pmVg9mcJvJwHy9F8/b5PWlHqVXe7ZkU/hxdmxjw/0u
 M8nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KDlXgzpm
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2024 18:12, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.10.13 and U-Boot to
> version 2024.10. As for U-Boot, the new version has added EFI Capsule
> support, which depends on GnuTLS, thus requiring the activation of
> BR2_TARGET_UBOOT_NEEDS_GNUTLS.
> Arm trusted firmware is already up to date.
> 
> Co-developed-by: Bryan Brattlof <bb@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Enable BR2_TARGET_UBOOT_NEEDS_GNUTLS.
> 
>   board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
>   board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
>   configs/ti_am62x_sk_defconfig              | 7 ++++---
>   3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
> index 53eb1438945b..706ddb8dbbd4 100644
> --- a/board/ti/am62x-sk/patches/linux/linux.hash
> +++ b/board/ti/am62x-sk/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
> +sha256  5ffceb2350db1547e69231a63df2d3beed015a313d7d7adf8b5cb71dedaeb16a  linux-6.10.13.tar.xz
> diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
> index fe9b4f53dc63..904fa56c02a3 100644
> --- a/board/ti/am62x-sk/patches/uboot/uboot.hash
> +++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
> +sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index e11b803b73e4..0c37fdc167f0 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
>   BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.13"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
> @@ -27,15 +27,16 @@ BR2_TARGET_OPTEE_OS=y
>   BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
>   BR2_TARGET_TI_K3_R5_LOADER=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> -BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.10"
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_TARGET_UBOOT_USE_BINMAN=y
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
