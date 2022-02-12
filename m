Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8437EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2469E81BF5;
	Sat, 12 Feb 2022 22:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMGFgVf4_bvg; Sat, 12 Feb 2022 22:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE7C81A24;
	Sat, 12 Feb 2022 22:11:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1E71BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1651C606F9
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIuLzziFNt3n for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:11:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CD6F605A9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:11:47 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hw13so1344428ejc.9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YN/h+jzKzFZ/gXBhM+xGG7rxaUrLYtg/gjnptXUFFwM=;
 b=VdbjM5V1Udjfykw8i09ihR+x00EBz3Q8D8h0fRthfn08Q6RV+v6ZtO84F3QJ6DN34K
 tjbMIW/zaFoEsysUOMZNokx9oguLgxfYcIclTCzQc8UCkhEjOBgzqhU7YRwWaZ5/Bb3e
 tKjTOQctJRIKUr7rcotz9LAM8OAsjkLemJtn6ejo4FAvrgOChhZ8f+fn7OKroVUuS+9D
 Cm3RxrTLMahC9iw97rs8HS1LxGjmHl5Ra5vm65u0zBUlde5RwKlvGiShwPZ7FkTVpao1
 gzcin+qU8Y3J0V2AMfCtjQTPp8Q8gC0apb6waTb8zts1OCBwZ5btGo54A2LPEbHQbko3
 3pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YN/h+jzKzFZ/gXBhM+xGG7rxaUrLYtg/gjnptXUFFwM=;
 b=gMee9dSmb2PrHUcwl3lktpQ8vr3TsAc7qrQgL3XJ7VNcXe/ZoH5mtoqWTYQs3Gq9M0
 KufN91RiWGkOfgG8jDyQlLzCs13CEmGXpsfAKmTQSSe3XOQt8votDP/HG4jOLkkRYq+4
 ymUbm4CSI7oS+ODWf1FPM8j/SQcZqvKhEmbH5MYZpxQ1plJV7J0HaqlFL2H8zY3ws77B
 Wi+fw6k5l/YrBN175SFhJ8PW7w6CgtO/DMMYHZZMqCTe0DxkiFkAWsKb03GwMtz+VQgc
 pEtQNnZ3khh+AjFruWuk3RxOkqdcuC40ZHXeDljezXPt1inu2aRS6sApO2/S4je5YFJO
 mv6g==
X-Gm-Message-State: AOAM53316oiNp47Q2nvweJJNkDyBezLHV0eBfi8HGuXF8k2WfYBjz5OK
 qg84TEttWqVf8qnOA01JIetX0y+xNa+7DA==
X-Google-Smtp-Source: ABdhPJx5ItxtDFuAvkxSKx96QazyHCSGyt/dwc213rECOJUOHkFP+RiMclQqBIAQNKg2QTgjISqQzA==
X-Received: by 2002:a17:907:3e90:: with SMTP id
 hs16mr6169132ejc.731.1644703906193; 
 Sat, 12 Feb 2022 14:11:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q7sm5988554ejj.8.2022.02.12.14.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 14:11:45 -0800 (PST)
Message-ID: <fb84199d-9c72-d918-46ad-cd811ecbedc9@mind.be>
Date: Sat, 12 Feb 2022 23:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220206074853.25887-1-kuzminov.sergey81@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206074853.25887-1-kuzminov.sergey81@gmail.com>
Subject: Re: [Buildroot] [PATCH v4] configs/orangepi_zero_defconfig: switch
 to extlinux
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



On 06/02/2022 08:48, Sergey Kuzminov wrote:
> Changes:
> * Exclude FAT partition, it is no longer needed for U-Boot.
> * Switch the rootfs partition from MBR to GPT for partition-uuid to work.
> * Switch to extlinux, this is convenient for debugging.
> * Create common scenarios for multiple boards to create an SD image: board/orangepi/common.
> * Add BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y, remount root filesystem read-write during boot.
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> ---
> V1->V2:
> * improved commit log
> * removed commented line in extlinux.conf
> * removed one boot option from extlinux.conf
> 
> V2->V3:
> * improved commit log
> * removed comment from board/orangepi/common/genimage.cfg
> 
> V3->V4:
> * fixed Signed-off-by position

  I think I'm going to use this commit message as an example for the 
documentation... Well, if I ever get around to it :-)

[snip]
> diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> index 5aaa1566c5..96f0c3f600 100644
> --- a/configs/orangepi_zero_defconfig
> +++ b/configs/orangepi_zero_defconfig
> @@ -20,10 +20,13 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   
>   # Filesystem
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="63M"

  Why? Increase from 60M to 63M seems a bit odd...

  I removed this.

> +BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y

  We don't do this for any other defconfig. I removed this.


  Applied to master, thanks.

  Regards,
  Arnout


>   # BR2_TARGET_ROOTFS_TAR is not set
>   
>   # Bootloader
> @@ -39,16 +42,12 @@ BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>   
>   # Required tools to create the SD image
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
>   
>   # Image
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>   
>   # Wireless driver and firmware
>   BR2_PACKAGE_XR819_XRADIO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
