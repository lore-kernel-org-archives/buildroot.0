Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACC0C433FE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A74A61040
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A74A61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C9BB40155;
	Wed, 13 Oct 2021 19:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXhKumGap6ib; Wed, 13 Oct 2021 19:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CBD640219;
	Wed, 13 Oct 2021 19:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3C1F1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECD054060A
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGkd4KC7f1qP for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:54:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92543403EE
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:54:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y12so15279034eda.4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=azsDQL4rYZQ/XwY0yKTI3wMNOk4DelKBhJ8PeEdyomU=;
 b=KZxAXTKpMBbAfmXisjeqwUYXGkSU9Rff+wRag3NCKpz+K58rTno3e9+O5X/osm7S4R
 BxEH6qI0W/vB2x8pit9YvUNFEI+RUCKvzgIfiGIVZJS8y8FygdrtdPNxegH92U+l5GLO
 vQKGP9x3gT7sLku0yz0LNqa+p8g/LO/gjq9ou/GZ/5QhbpuLluBmUeebrLyAEx0993D/
 5zgkmkv84dVQvqhFO12rg7Ms/aiv9VnPIaNnU1pA3gYicZygsfh7/L6Ow++6lanZE760
 7rTnFJX2X2eohtNq+HQQ4bZspWHnbzbxf46gHgWcFuMGQp8ICG9tOQY9VEJ22Fnrpp71
 C3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=azsDQL4rYZQ/XwY0yKTI3wMNOk4DelKBhJ8PeEdyomU=;
 b=BdeevIh9v7IsFyLW0QVVe+4KAe2C82RjAJCrUl9clRBa+YfTMOoS0/3AlgOVatRrFo
 8UgKXieGoaeRoVjZx84UbcQ3AxSjA3yUvelU7l1PudImPDmFzQRcypYxe61MufPfpBXR
 Y5f+8PzPqG7o2+0CYcfW6V+WBMw1VrHej+46rue0ZFD4MmFbLAyDGBya5J8hrh/jBbmW
 CDoFd5LejbhIYx0fOIrNQHanrdetFU76hefLilhHDuE+rW6JcGDCH2oZ3Za+A+8wRUWB
 dE928CUoH7peDT9zud/LTEk87Tm2FwXLc9a/3Tfc57LafNPwN1Vjc/aAgfDKJP4WioXW
 Zq6g==
X-Gm-Message-State: AOAM532enyQTS09d4rh28Cw3FzqvzUfNxP4pNpoQGh2x/xp1prmpEsHZ
 qVWxOlg5gtuBvB3ZfharA6cDyw79TUdciA==
X-Google-Smtp-Source: ABdhPJzJPcFl8iQdOYNI5dLHm71+OzXteM1+OlCL66H2oG/K3s/w6Hp5jdIQ4tIn5jS2G0K9Hsbmag==
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr1467329ejc.128.1634154865554; 
 Wed, 13 Oct 2021 12:54:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f19sm402187edj.77.2021.10.13.12.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:54:23 -0700 (PDT)
Message-ID: <13f3b40c-a3a0-86ff-4d63-cbcc9dce4ec7@mind.be>
Date: Wed, 13 Oct 2021 21:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-10-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-10-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 10/12] configs/nitrogen*: update kernel to
 5.10.x_2.0.0
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
> Also bump linux headers version to 5.10.
> Based on NXP 5.10.35-2.0.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/nitrogen6sx_defconfig | 8 ++++----
>   configs/nitrogen6x_defconfig  | 8 ++++----
>   configs/nitrogen7_defconfig   | 8 ++++----
>   configs/nitrogen8m_defconfig  | 8 ++++----
>   configs/nitrogen8mm_defconfig | 8 ++++----
>   configs/nitrogen8mn_defconfig | 8 ++++----
>   configs/nitrogen8mp_defconfig | 8 ++++----
>   7 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> index 73dfe2caff..317bf192af 100644
> --- a/configs/nitrogen6sx_defconfig
> +++ b/configs/nitrogen6sx_defconfig
> @@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # bootloader
>   BR2_TARGET_UBOOT=y
> @@ -35,8 +35,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
>   # kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Last version of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> index 8e4b268356..b3d97c52e9 100644
> --- a/configs/nitrogen6x_defconfig
> +++ b/configs/nitrogen6x_defconfig
> @@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # bootloader
>   BR2_TARGET_UBOOT=y
> @@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
>   # kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Last version of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> index 8b152d931b..7656fe20d9 100644
> --- a/configs/nitrogen7_defconfig
> +++ b/configs/nitrogen7_defconfig
> @@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # bootloader
>   BR2_TARGET_UBOOT=y
> @@ -34,8 +34,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
>   # kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Last version of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
> index 438a0bc29e..9e0e0983ee 100644
> --- a/configs/nitrogen8m_defconfig
> +++ b/configs/nitrogen8m_defconfig
> @@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # DDR training binaries
>   BR2_PACKAGE_FREESCALE_IMX=y
> @@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Latest revision  of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
> index 567636ee4c..db5ccef156 100644
> --- a/configs/nitrogen8mm_defconfig
> +++ b/configs/nitrogen8mm_defconfig
> @@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # DDR training binaries
>   BR2_PACKAGE_FREESCALE_IMX=y
> @@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Latest revision  of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
> index 71fb0e7914..95a2a45780 100644
> --- a/configs/nitrogen8mn_defconfig
> +++ b/configs/nitrogen8mn_defconfig
> @@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # DDR training binaries
>   BR2_PACKAGE_FREESCALE_IMX=y
> @@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Latest revision  of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
> diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
> index 14bd26724d..53933b6b8d 100644
> --- a/configs/nitrogen8mp_defconfig
> +++ b/configs/nitrogen8mp_defconfig
> @@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   
>   # DDR training binaries
>   BR2_PACKAGE_FREESCALE_IMX=y
> @@ -49,8 +49,8 @@ BR2_TARGET_UBOOT_SPL=y
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -# Latest revision  of branch boundary-imx_5.4.x_2.3.0
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8961f5c1.tar.gz"
> +# Latest revision  of branch boundary-imx_5.10.x_2.0.0
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/950d5f1b.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
