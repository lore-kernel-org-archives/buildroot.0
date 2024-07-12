Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6426CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F17774129F;
	Fri, 12 Jul 2024 07:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FfJGVjtxwk6; Fri, 12 Jul 2024 07:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A95C412A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A95C412A0;
	Fri, 12 Jul 2024 07:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F441BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 867D2413E6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXqZbz43Sssc for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF9EE40772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9EE40772
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF9EE40772
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:24:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso16210515e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720769048; x=1721373848;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6k8rFsY7MASgcY6Sxhh2JIQehyHATvVZOmlKuIRyBO8=;
 b=vzstUY/uX0dOLZf/ecCU9rlfImYJ5W5uu+eeD0z4EF/YoXIoRN+/sDjz0KWv3JgVgF
 SyHjcoLUyDmSyYp4yI15gIAPU0FAGzYx9GQCc5Fs4OwJxKXw+IjakRHzj6oVEc48qWFh
 5HZpL0AHelF5rqqTW7lPP14cZV5woGifv/uOB89a599UenyvRLlh62Fl6U32dqcXd0Gz
 lvt6lnQM/EuvJBRpa6699CS1CYC8p6sXTAj9f2sYB2mUEqL6yUQrT6ijj/A6tGxSEIGf
 3seuH9ibN2eJCpJdk4r64YxdKjqUxKKivM9Mo7BF32racxtZzPXjlU7gNvVd7Fapvh6u
 uTLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX9ut0Gpz83IEqmJPGZN/YNfWqDPJ7pLd9eqTknBlJQ+FEJapIVyi8JJBFOghMIczGwKOyJbmV+kyG3QYNLD/Yp8uahEyIDw==
X-Gm-Message-State: AOJu0YxgjgHtTmV7BgNu5+slIacDjCyaca+eFWwukXC8ZPu1xLb72oge
 nLKOjCerZvhe5DVXktUJhFl4g59QHWL6ZCFqIllkzxKxdkGVtkbAYp6mxcmEcPLDbmFPBFxEffz
 HYTI=
X-Google-Smtp-Source: AGHT+IFDVkjAHCtXU/M8itxMrh095fSKhZ15ZoMEcpjUN8kLsJj9YSOBmbAAX8P2RcPxRslFMPryhQ==
X-Received: by 2002:a5d:4b03:0:b0:360:866f:5083 with SMTP id
 ffacd0b85a97d-36804fd7770mr623410f8f.32.1720769047691; 
 Fri, 12 Jul 2024 00:24:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e08asm9503691f8f.11.2024.07.12.00.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:24:07 -0700 (PDT)
Message-ID: <b9d0ad68-2a5e-4b6e-b2fe-10c082908b83@mind.be>
Date: Fri, 12 Jul 2024 09:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240616141043.2775083-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20240616141043.2775083-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720769048; x=1721373848; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6k8rFsY7MASgcY6Sxhh2JIQehyHATvVZOmlKuIRyBO8=;
 b=J0gTMq7VcLzGYyoIwJdNJLTAx+0Rq6kTUTUXKUdk0M3+k9nMxfEuHDtUTi5ciCkHha
 gJjMDmvNBUoF9UEBQ5JSr8McGGdwh8GP0ecYMu+G5sNSNGUvQ8ol4D9xlULvVZW5PJ0W
 Z+HobyPa/gbEOHphj0j086SxXnHhHIQchNwrHGR1mB8HS/CcM0s4p1T94ZJLJr//IO0v
 S/ewtKd3C7cRcjzUkgvpYBFXTLp0bCP6UGh8iIQzDOZFToo/0QmOhXdxprEpfuDicZPo
 HtO1FEgK7TQ3nHVzsvehI/DLn4xDA/lSD8MFFi/zxNmCZOsI4ddGa7baFePcduGUGxg9
 guUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J0gTMq7V
Subject: Re: [Buildroot] [PATCH 1/3] board/chromebook: use global-patch-dir
 for kernel patch
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/06/2024 16:10, Yann E. MORIN wrote:
> We're going to add hashes soon, so we'll need to have that directory
> populated with hash files, and it would then be a bit confusing to not
> have the patch file in the patches directory...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Alex Suykov <alex.suykov@gmail.com>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                                            | 1 -
>   .../linux/0001-linux-4.15-dts-tpm.patch}                       | 3 +++
>   configs/chromebook_snow_defconfig                              | 2 +-
>   3 files changed, 4 insertions(+), 2 deletions(-)
>   rename board/chromebook/snow/{linux-4.15-dts-tpm.patch => patches/linux/0001-linux-4.15-dts-tpm.patch} (85%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index dd1fd31e86..c39c6a257f 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -26,7 +26,6 @@ board/canaan/k210-soc/post-build.sh Shellcheck
>   board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
>   board/chromebook/elm/sign.sh Shellcheck
>   board/chromebook/mksd.sh Shellcheck
> -board/chromebook/snow/linux-4.15-dts-tpm.patch lib_patch.ApplyOrder lib_patch.Upstream
>   board/chromebook/snow/sign.sh Shellcheck
>   board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch lib_patch.Upstream
>   board/cubietech/cubieboard2/post-image.sh Shellcheck
> diff --git a/board/chromebook/snow/linux-4.15-dts-tpm.patch b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
> similarity index 85%
> rename from board/chromebook/snow/linux-4.15-dts-tpm.patch
> rename to board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
> index c71ff1b584..01f452b563 100644
> --- a/board/chromebook/snow/linux-4.15-dts-tpm.patch
> +++ b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
> @@ -9,6 +9,9 @@ See https://code.google.com/p/chromium/issues/detail?id=220169
>   and https://lkml.org/lkml/2013/3/4/242
>   
>   Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> +Upstream: Not Applicable
> +[yann.morin.1998@free.fr: add Upstream tag]
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>   
>   --- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>   +++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
> diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
> index bcb94b716b..50e355647c 100644
> --- a/configs/chromebook_snow_defconfig
> +++ b/configs/chromebook_snow_defconfig
> @@ -1,6 +1,7 @@
>   BR2_arm=y
>   BR2_cortex_a15=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +BR2_GLOBAL_PATCH_DIR="board/chromebook/snow/patches"
>   BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>   BR2_TARGET_GENERIC_GETTY_TERM="linux"
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
> @@ -8,7 +9,6 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
> -BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.15-dts-tpm.patch"
>   BR2_LINUX_KERNEL_DEFCONFIG="exynos"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.15.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
