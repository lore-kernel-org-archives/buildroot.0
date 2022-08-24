Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0B6C004D4
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB448139E;
	Wed, 24 Aug 2022 19:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB448139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9F-UQNuuKyn0; Wed, 24 Aug 2022 19:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C6180D04;
	Wed, 24 Aug 2022 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61C6180D04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85A3D1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6018F80D04
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6018F80D04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G29Yi0hZSBXp for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:46:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A34F2809F5
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A34F2809F5
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 19:46:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gb36so35482198ejc.10
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 12:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xQwv/Q0Op52bxOLKCbpMIJlolatjYzbeJrXafRvOh7Y=;
 b=XgGoDzhL5hUMTv+TAq0j3NCLY80zim8Vyfll9tkUqOMfLD+8/XFmXYN9gI3rKZ7n6m
 8zbZMKiQG0FB9u7OfoxcNs+lYXOe5Y3jmDARtR+d+1QfqQ73hIfZZTnBckOxc1GCveet
 fanysImpyJrxWx9md+ohnRfSm/rkS6tx9xRhRhhQLLiq9dZi5ZzZZihZfhEAtylT+3v3
 PAmDg97xfhq6Z+E7qT2Q8ZgOQ74ofpk6c5Lcr1A9nRKuvDG896YwOZ5HjSrYF5HJsnsR
 PrcDyNSjd0jxgazclS18yIO5XH9NYmWlILeUqRGiaTcdAqQSGLWllrK45mv0FuD0inWf
 KbmQ==
X-Gm-Message-State: ACgBeo0csgryuvBihyvMeUhLLgrBgi2rc5ndQq65xmmCVPUV1/ra9vNz
 gWLRP7WgTTvneuVkzlSM6+ZcnQ==
X-Google-Smtp-Source: AA6agR53uVqdmBoLkRT76bHfJsPpqWGwL3wGaFSmQd+RgwVLNpjmDEOfPNMXrtK7xTGdvejmc5K/+g==
X-Received: by 2002:a17:907:72cc:b0:73d:5f90:d960 with SMTP id
 du12-20020a17090772cc00b0073d5f90d960mr321393ejc.720.1661370407759; 
 Wed, 24 Aug 2022 12:46:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7c78e000000b004479ef996b8sm430701eds.11.2022.08.24.12.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 12:46:47 -0700 (PDT)
Message-ID: <e98a921b-aafd-d78c-7e4b-84226b090725@mind.be>
Date: Wed, 24 Aug 2022 21:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220824124816.1697526-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220824124816.1697526-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=xQwv/Q0Op52bxOLKCbpMIJlolatjYzbeJrXafRvOh7Y=;
 b=JnlGoX0b48TVtu0VLG1tK1uE1RXRkU4FSMcPe0ouM/qOpyAIm+YKsxPHD8TT5EO67k
 vzwOxjSje1Mmn9vhm/Zw9y/s9EXNyIbpSSDi/uqMK59a1x4gP6fbcWsAjLLyaiOzFyZo
 eF3IMVOQrN5uEgfvxqFu+6h91PhznPqdvL2/SvKa4MukOF4gOZU0Ds/wEbURQk/Fp03x
 IzTN8UQ5kFzG+rPgsa4wejuHGR/Yz8lpFXE1coTkBi3MjHmu3CCiFcltvOVMzf+tmOje
 ZrltXsm8FvbcrdQkzjnSrYwMeCZNyQuM6wY2/vv+4ka729EE2ChcXyvZc+wxH/6ZoqFD
 yGgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JnlGoX0b
Subject: Re: [Buildroot] [PATCH] package/freescale-imx: add layerscape
 platform
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



On 24/08/2022 14:48, Francois Perrad wrote:
> layerscape is not strictly a member of the IMX family,
> but the NXP layerscape family uses some of components of the IMX family,
> especially the IMX GPU Vivante.
> 
> this change allows to use imx-gpu_viv firmware with a layerscape SoC.

  I'm not entirely familiar with the NXP product line, but I do know for sure 
that "layerscape" does not designate a SoC, it's a _line_ of SoCs. Some of them 
are actually PowerPC!

  So you definitely can't have "layerscape at the same level as "IMX8MP". I'd 
rather expect something like LS21XX or something like that.

  It unfortunately pretty much depends on what NXP is going to add later, i.e. 
if they're going to add layerscapes that have a different GPU or VPU.


> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/freescale-imx/Config.in | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 4a4237fb4..18c65d743 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -57,6 +57,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
>   
>   config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>   	bool "imx8x"
> +
> +config BR2_PACKAGE_FREESCALE_LAYERSCAPE_PLATFORM
> +	bool "layerscape"
>   endchoice
>   
>   config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -76,6 +79,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>   	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>   	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>   	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> +	default "LAYERSCAPE" if BR2_PACKAGE_FREESCALE_LAYERSCAPE_PLATFORM

  This is normally how you know the correct designation, because the platform is 
used in some libraries. But none of them for the Vivante, so in this case 
there's no telling.


  Regards,
  Arnout

>   
>   config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>   	bool
> @@ -100,7 +104,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>   		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
>   		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
>   		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
> +		BR2_PACKAGE_FREESCALE_LAYERSCAPE_PLATFORM
>   
>   source "package/freescale-imx/imx-alsa-plugins/Config.in"
>   source "package/freescale-imx/imx-codec/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
