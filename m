Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BC6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A15C410AA;
	Thu, 16 Dec 2021 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8wL67OtCcdP; Thu, 16 Dec 2021 19:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC884402A5;
	Thu, 16 Dec 2021 19:37:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C04B1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A3094044D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqnjsD3ITcHC for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:36:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 821B040399
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:36:56 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e3so91868330edu.4
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=395cdJnwpbltMXY3PxwzrNYLUyzjrmDYfjI1z79ZDFI=;
 b=EQXM6TvbM6HUYiM5qnZqo58QVgrkWJNnia338UPcb/0L6qzf7HBvykwfiopfqq0MZB
 CxfqQmXsGkdvcsIE1WFOAhrFGyOTrVbZosRy3Skpmgp7RcAhWE3d2j+ArdDeJkCasIQ0
 gRPYWhXxtJQMuo1ELcnyp/Fp+nMxr7rhLEnX7SQDd9RFS0wq49hKr5dU2bu21e10M5cW
 LpyYxrj1PztsgJgCuB7OMPcm9rfvUDCCEWQyhr5DaKrgzRRLmyJX+dO8J65w9KJXICiX
 Cg95d7eV6HtO3G1hAFAGZbMkUbYFqg6S1HIGfge6ODELK3RW4g+fTiGQmZyd5BhEJVu1
 1ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=395cdJnwpbltMXY3PxwzrNYLUyzjrmDYfjI1z79ZDFI=;
 b=A4B+YTIoofuaOzGelU8bOxB32P/AyvFYsiVqSuiMf7ivZo1VZEIyF6PUWjhk8LTZeO
 ivUharXaK5/PAXwmk44ZFdE9F1RwlsvO9iOZ89L+K0KDWZ5h4a+mqC1/fAInkFo5swox
 U9wwC+TpXSyNXrB26rjFRtSCf8itXsAueJFGT+QJ5r5JKm6WbZ0DD3oqK4SbJ1q47WaO
 ELqU1DQNiMW4cbc394OX3fELgI47Xltlz/073gjQgzru4qD2XR13iLBVgkB/+kgcFfm0
 2rvEbwCWC5W9VUzHH9qLnRMZUDREXcGqzQ4Int8RGTJcrPXP+16YR5+X4Z1yN8jRvYF4
 al1Q==
X-Gm-Message-State: AOAM532v6GuQBPcHDq8rJw/kmfWbgvq7uUasIGt/cR7dIwrerwSUmU4W
 Zp8UD1mOtocBP6FUE3rRR83fAA==
X-Google-Smtp-Source: ABdhPJzHsrXpNtGd2YHzzS7WMcyY1sp/2xdld389KGPeSI/5oT94yQVf60VK5EpAogs1O3qCZ70Zdg==
X-Received: by 2002:aa7:c301:: with SMTP id l1mr21918384edq.20.1639683414866; 
 Thu, 16 Dec 2021 11:36:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x16sm1527060ejs.92.2021.12.16.11.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:36:54 -0800 (PST)
Message-ID: <ba750ff7-648e-e50b-51e2-b75450b6d3e5@mind.be>
Date: Thu, 16 Dec 2021 20:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
References: <20211215212328.572775-1-lothar.felten@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215212328.572775-1-lothar.felten@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/bananapi_m2_ultra_defconfig: bump
 to u-boot 2021.10
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



On 15/12/2021 22:23, Lothar Felten wrote:
> Fixes:
>    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition...
>    scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> 
> Tested on bananapi m2 ultra
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/bananapi_m2_ultra_defconfig | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
> index 22f7974bcb..67ecec424c 100644
> --- a/configs/bananapi_m2_ultra_defconfig
> +++ b/configs/bananapi_m2_ultra_defconfig
> @@ -16,15 +16,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> -BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
