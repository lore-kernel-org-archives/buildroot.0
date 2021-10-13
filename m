Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687B5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC060610CE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC060610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A73A40219;
	Wed, 13 Oct 2021 19:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isgeBlHlthLT; Wed, 13 Oct 2021 19:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7981F40549;
	Wed, 13 Oct 2021 19:54:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86C3D1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7273F40538
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGFqRjoqHDya for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:54:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24D1640219
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:54:34 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p13so15179091edw.0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z9l90JrYkcpOQFRZzE+csXwTe5gEIJ9zAQNRYgdG70c=;
 b=EDcgUOIiZmmCKSz2Z31LGBm9k+7ELASR1kEhRLGoAHQTdLgbCLcJwh08+FcwCESNqK
 oq96dgRduRwfsO5ZDAgizeC0peEK3OAxT3qBFW1YuiLkrTCewipVJg3xT0dHhekOxsGT
 FSiiZIC3cgX1CDRtkE9o+Ll+7tZPg+HqGEF2CftTmKvbQgg9MlodeOcLcqMxws1IoHHt
 Ma3Klfy6hZgCzLd9maRwirArKOOJc+IT+6lHAvd5Zqq78f8Tr9rzvesX0Tv2kaVFeMJ9
 ZC52d1S/oh1G6Iaa27r+cifEalt9FXsaG6j/h8KuIdQK4uBlMxefZen9OX3Szb67108T
 pk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z9l90JrYkcpOQFRZzE+csXwTe5gEIJ9zAQNRYgdG70c=;
 b=ob3IQGPoXWJN0a5o866t5x7DOjFzfhG0k5xKWfWYO8I9aO5mg+lb2prAX0CJAw/xlA
 QONJAc4kxEJAGo1hkAIBk7uydsWjpCZQPRu+TRw/WhoYfRGxo0YmSWEHQFMYUNAa7iqt
 BQhoRSOx2uL3MpNbYisFn2ztGen4Fn6wHWnMhv1+4c5Rkn20uoZ12GtqXXcKKDOJzCIA
 LuOfxtDNdGM8ttr00I5ZJuSmYDtiCNd/F5cQ5eIWUzIiW4zlXs6HGwHN9kJcU8FQtNno
 qnOv7oibX2SXVwrfSg1FxEBJJuq6XLB8YQRHaxeXJazuSBafGTwsWFVC5zWhQ7UKbHAl
 KH+Q==
X-Gm-Message-State: AOAM533s3CxNRpq8I2qGNq0tFkB3unUWxE2rVARzYcKh89KgtGzx9SxK
 Qnya2IhNcuUp96GnlmcNzBODhA==
X-Google-Smtp-Source: ABdhPJygnHSkTysvSUzLvkNuAgI2fjzgx2mq7eVfd17Q3ertEfCM42e9BCR/bJPMM8xuwB5MZOuxcg==
X-Received: by 2002:a17:906:80c5:: with SMTP id
 a5mr1474386ejx.119.1634154872227; 
 Wed, 13 Oct 2021 12:54:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm450562edl.69.2021.10.13.12.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:54:31 -0700 (PDT)
Message-ID: <7f3b3d5f-b86c-ba62-0422-3657e922d2ec@mind.be>
Date: Wed, 13 Oct 2021 21:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-11-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-11-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 11/12] configs/nitrogen*: bump u-boot
 revision
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:41, Chris Dimich wrote:
> - To latest v2020.10 rev (f2c92d83)
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/nitrogen6sx_defconfig | 4 ++--
>   configs/nitrogen6x_defconfig  | 4 ++--
>   configs/nitrogen7_defconfig   | 4 ++--
>   configs/nitrogen8m_defconfig  | 2 +-
>   configs/nitrogen8mm_defconfig | 2 +-
>   configs/nitrogen8mn_defconfig | 2 +-
>   configs/nitrogen8mp_defconfig | 2 +-
>   7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> index 317bf192af..3c2fe0cc7b 100644
> --- a/configs/nitrogen6sx_defconfig
> +++ b/configs/nitrogen6sx_defconfig
> @@ -24,8 +24,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -# Last version of branch boundary-v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +# Latest revision of branch boundary-imx_v2020.10
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
>   BR2_TARGET_UBOOT_FORMAT_IMX=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> index b3d97c52e9..9e1d3ae1bc 100644
> --- a/configs/nitrogen6x_defconfig
> +++ b/configs/nitrogen6x_defconfig
> @@ -23,8 +23,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -# Last version of branch boundary-v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +# Latest revision of branch boundary-imx_v2020.10
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
>   BR2_TARGET_UBOOT_FORMAT_IMX=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> index 7656fe20d9..0dbced86e9 100644
> --- a/configs/nitrogen7_defconfig
> +++ b/configs/nitrogen7_defconfig
> @@ -23,8 +23,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -# Last version of branch boundary-v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +# Latest revision of branch boundary-imx_v2020.10
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
>   BR2_TARGET_UBOOT_FORMAT_IMX=y
>   BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
> index 9e0e0983ee..a41e5f04d8 100644
> --- a/configs/nitrogen8m_defconfig
> +++ b/configs/nitrogen8m_defconfig
> @@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8m"
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>   # Latest revision of branch boundary-imx_v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
> index db5ccef156..a635f8012b 100644
> --- a/configs/nitrogen8mm_defconfig
> +++ b/configs/nitrogen8mm_defconfig
> @@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mm_2g"
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>   # Latest revision of branch boundary-imx_v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
> index 95a2a45780..5c2101441d 100644
> --- a/configs/nitrogen8mn_defconfig
> +++ b/configs/nitrogen8mn_defconfig
> @@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>   # Latest revision of branch boundary-imx_v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
> index 53933b6b8d..3c52c526ab 100644
> --- a/configs/nitrogen8mp_defconfig
> +++ b/configs/nitrogen8mp_defconfig
> @@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mp_2gr0"
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>   # Latest revision of branch boundary-imx_v2020.10
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/e05b6d68.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/f2c92d83.tar.gz"
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
