Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91253C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F2546FB17;
	Sun, 18 Sep 2022 10:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2546FB17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rx9Cgnl1p6CH; Sun, 18 Sep 2022 10:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5222060E36;
	Sun, 18 Sep 2022 10:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5222060E36
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0BB81BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFC0421E3
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFC0421E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnoqOHiyJesJ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:23:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76EDE40981
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76EDE40981
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:23:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e16so42747372wrx.7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TSA3UZsmDqFx7idgXUSdjNxlF8V4D1Y1xC4hwddTHRU=;
 b=YHD6AORrK55lKs+HIlbR9OlZkBvbCOy10HlMK3SdbYqiR5rwftNuBIhkB4xCp5WUgE
 HVUx5k5lirK9zM7WKtU3QeCVuEvbOqu+vUg+muPzT4MQwAb/nSKrBg6aC3KyD2l7h3x2
 IxcyutpEa73/fw22VuQusPClf5+dX677QFwvHzSSRbheZUfiNyjSiI+wXHk26x28IepT
 PwmY/T/8GXZN8s1n47GPKwRUo17jxwy43lInCd1f8eky/uKFXxQ45zrhGCvC0vs1Z/ix
 PrV123DDkxOCBnIboqnh/Tfq8wlUF9G02JRmu6fpxOGRv4yNE93kvZ0lpmAGO36wwJoe
 34zw==
X-Gm-Message-State: ACrzQf3eDOdZY5/gqwEBOvRwNNFH2ahfy3IkLgSQAGvL0XfNkmqVSiDq
 Lh4g9gvpRLat+f2GRjNg00IReQ==
X-Google-Smtp-Source: AMsMyM6cyXrbYH7HZvJfD3wcCl6L1Yz1LGVytMKC2Wix3NErw9xjHCM5UkcvDfoy5vWuVxm41QPYTA==
X-Received: by 2002:a5d:47c1:0:b0:22a:5858:993b with SMTP id
 o1-20020a5d47c1000000b0022a5858993bmr7566451wrc.99.1663496628588; 
 Sun, 18 Sep 2022 03:23:48 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a05600c34c700b003b4ac05a8a4sm10782934wmq.27.2022.09.18.03.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 03:23:48 -0700 (PDT)
Message-ID: <c1b32b94-df43-96ad-72e0-8a6592e042fb@mind.be>
Date: Sun, 18 Sep 2022 12:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220729000904.1295295-4-joel@jms.id.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=TSA3UZsmDqFx7idgXUSdjNxlF8V4D1Y1xC4hwddTHRU=;
 b=VRW048iNx4QJFjD4/PgIRoDw0DivDWdf+BQT7596MT8UYWuOwTaweDI82P0vP6v/bn
 6YekjMbVZvyWULfmZyWxDBmgCqAyqlwiVXLydr3rn6DdxR0lmqlX6OLoCsxHagPJ5jxx
 oS4aD72WxU7DSaAwqb6+yVuzaUiNzv+uneW5rNBVNKCPcumqEZcCmwuu6Pp5N20263Ff
 k7pqoomWje7BogDbvr5OIgHgZevvKxIiPfdDQBpYWgErDenn0KW8ZntKzYC8XZOFuNGs
 Cl817QmnNhuYZyabZHBBSRr2CWCphFCFuyqsUHueafz+SQ709+Vs+nHNr6E2FBCoVEWk
 IFmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VRW048iN
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 02:08, Joel Stanley wrote:
> Invalid configurations lead to build failures, such as trying to enable
> ppc64le for the ppc970:
> 
>    http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c/
> 
> In order to run a ppc64le userspace a kernel that runs in this mode is
> required. The only CPU supported in buildroot that can boot a ppc64le
> kernel is Power8, so mark all of the other 64-bit capable CPUs as not
> supporting ppc64le.
> 
> This drops the comment about libc, which is true but doesn't tell the
> whole story.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

  Applied to master with some changes, see below.

> ---
>   arch/Config.in.powerpc | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 8d392bfde814..7c6ae84348e9 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -71,11 +71,9 @@ config BR2_powerpc_604e
>   	depends on !BR2_ARCH_IS_64
>   config BR2_powerpc_620
>   	bool "620"
> -	# No C library supports this variant on ppc64le
>   	depends on !BR2_powerpc64le
>   config BR2_powerpc_630
>   	bool "630"
> -	# No C library supports this variant on ppc64le
>   	depends on !BR2_powerpc64le
>   config BR2_powerpc_740
>   	bool "740"
> @@ -102,6 +100,7 @@ config BR2_powerpc_860
>   	depends on !BR2_ARCH_IS_64
>   config BR2_powerpc_970
>   	bool "970"
> +	depends on !BR2_powerpc64le

  As suggested by Thomas, I changed this to positive logic. I'll also push a 
follow-up patch that changes the rest of the file to positive logic.

  Could you (or any other powerpc "expert") review the conditions to be sure the 
architecture selection options are correct now?

>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   config BR2_powerpc_8540
>   	bool "8540 / e500v1"
> @@ -129,21 +128,25 @@ config BR2_powerpc_e6500
>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   config BR2_powerpc_power4
>   	bool "power4"
> -	# No C library supports this variant on ppc64le
>   	depends on !BR2_powerpc64le
>   config BR2_powerpc_power5
>   	bool "power5"
> -	# No C library supports this variant on ppc64le
>   	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

  AFAIU, all POWER CPUs are able to run in 32-bit mode and I believe it's even 
possible to run a 64-bit kernel with 32-bit userspace like on ARM. Is this not true?

  If POWER5+ really can't run in 32-bit mode (or this is not supported by the 
kernel), are you sure that this *is* possible on POWER4?

  In either case, if the current conditions are not correct, please send a 
follow-up patch to fix them even more.


>   config BR2_powerpc_power6
>   	bool "power6"
> +	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64

  So here I wrote the condition as

	depends on BR2_powerpc || BR2_powerpc64

because I do believe it supports 32-bit.

  Regards,
  Arnout

>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   config BR2_powerpc_power7
>   	bool "power7"
> +	depends on !BR2_powerpc64le
> +	depends on BR2_ARCH_IS_64
>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   	select BR2_POWERPC_CPU_HAS_VSX
>   config BR2_powerpc_power8
>   	bool "power8"
> +	depends on BR2_ARCH_IS_64
>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   	select BR2_POWERPC_CPU_HAS_VSX
>   endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
