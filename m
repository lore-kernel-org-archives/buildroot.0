Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0B5C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:24:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5539D610A3
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5539D610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F45B60B58;
	Wed, 25 Aug 2021 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vORVbDI8ZGy; Wed, 25 Aug 2021 20:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3327613DB;
	Wed, 25 Aug 2021 20:24:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D74B1BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A5F5600BB
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3CAybBuIcl9 for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54DC360670
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:23:39 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r19so899752eds.13
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cuScj5RKfbVvS7mfdEqTJxI+Er41RsQcUD9MKW2Lzs8=;
 b=BL7tbC7FDvDvtPugeKtoDyfeFUygVvzOjzJPgJTbTdbS0q98iHoWBgWx/CjiyrnXYG
 coCqTpZmAsTElQyiL1O5SCl9/eH+lnIdIJOV1aUpIAIlqbv8RSVDwlLizvrAhd85ZjyQ
 XV76sIYxu2Vie9oiCAf4JMNNeMI53KN9j6aL8Z0bwgFKkDd9/kSbNF8eCkMNQy8oDkK0
 fb0w7+QR/tiJ5AgkJr0jXiABf1v+z5X/n1KALvKan/TH2auKZRR/Wu2y9VY1o4atGl8+
 EYAmvBQBc5kSWbjwDS0PhaXGj/dDohu3ri0h38HEjVQyfR1GY9VbPOHMngdPR9NoeJ9V
 Qy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cuScj5RKfbVvS7mfdEqTJxI+Er41RsQcUD9MKW2Lzs8=;
 b=P1xFomLLn8aC2C7enbwpmJQiwKVJT/V9r8lrE9oRMTx727IVUdvJ3GL47RbrgbK0Qp
 a0MB/+imwaxNa2uvmOazIJkjw1wB6NIT5sYfCdbL7LfC6f39zLq7S584lCwYvZIxc2wI
 rBWspncDnuyJ1OJpUgRT0pyctJSETUVNX+s90e7h+/MIVSGEKF2tlOuOmY/x7JejQ8si
 OfYbX2b++fIPeLBQo+ZSeLyTaLsOm8pW6rSL6Xp1uozuho8uMrmYgCZzWZcfFdBN9rrd
 E24eOAN1jGXYOJI4121xzEwi3FJw5ah6gIFAU/DKYSppgGMOXtqh2WiwspDDFTe9uOCU
 /tVw==
X-Gm-Message-State: AOAM531zgDXNLH0Tyoqv2QdEMT8FrKVra0MO9Oa2ty9pgOuj3H9MTzCV
 +HNdSuhDHRlp1g/NI+lGJKnAOfsqpKS10g==
X-Google-Smtp-Source: ABdhPJyO4pT45pndSGjYwYelQqzWUiJ5bcc3Ei3hiawXh9fRCM9lfWuMcGTSqzOImMahH5trTG0vQQ==
X-Received: by 2002:a05:6402:2d8:: with SMTP id
 b24mr372537edx.176.1629923017576; 
 Wed, 25 Aug 2021 13:23:37 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r28sm544936eda.84.2021.08.25.13.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:23:37 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210825192014.1203727-1-romain.naour@gmail.com>
 <20210825192014.1203727-2-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5e262d37-7864-774d-98dc-0463923fef43@mind.be>
Date: Wed, 25 Aug 2021 22:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825192014.1203727-2-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_{efi,
 bios}_defconfig: update kernel to 4.19.204
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/08/2021 21:20, Romain Naour wrote:
> gcc 10.x is now used by default but the kernel 4.18.10 used by
> pc_x86_64_{efi,bios}_defconfig doesn't build with it.
> 
> Bump the kernel to 4.19.204 release that contains a lot of
> fixes for newer gcc.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/1525741062
> https://gitlab.com/kubu93/buildroot/-/jobs/1525741060
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  configs/pc_x86_64_bios_defconfig | 6 +++---
>  configs/pc_x86_64_efi_defconfig  | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
> index 1c1f7a3666..3290a1dda0 100644
> --- a/configs/pc_x86_64_bios_defconfig
> +++ b/configs/pc_x86_64_bios_defconfig
> @@ -23,13 +23,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
>  
> -# Linux headers same as kernel, a 4.18 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> +# Linux headers same as kernel, a 4.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
> index 984fc8f92f..18d2c477d5 100644
> --- a/configs/pc_x86_64_efi_defconfig
> +++ b/configs/pc_x86_64_efi_defconfig
> @@ -25,13 +25,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
>  
> -# Linux headers same as kernel, a 4.18 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> +# Linux headers same as kernel, a 4.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
