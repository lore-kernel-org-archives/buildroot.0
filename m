Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5F4C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 20:01:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6316961212
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 20:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6316961212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C1B9606ED;
	Mon, 23 Aug 2021 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5uDEo0-1lVI; Mon, 23 Aug 2021 20:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B624E60767;
	Mon, 23 Aug 2021 20:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3A3A1BF375
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D33CC60767
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 20:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPmbWpy0vhxE for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 20:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D01E606ED
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 20:01:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id cq23so27932832edb.12
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 13:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5HTJRaz8bIYBXXH2NQdindRrdJAyy3ivXfFLQ1vFtNc=;
 b=Wsvy+oe3jKYKPAb+PexPmMhRb0WaouZCY6BBjhvArAYcbEUOmK6Ilmy9oAsl+VGU4h
 TYN0JULhGaYQLuZucMsWqpAgrroEN930ar5Gk3LzwsZYgkBH9Kq69pxbcbCeeC8GbMmX
 cueciAU9DmDR5CZWpmpsuD0Yvj9XpNLpkplrtFvU2YrjcqjkaSSopqdrHGRNbCnaeYwy
 8EQItJ3qpwCYIHvaGl+5d+7pN0JgNuv1akVS1TiNLJ6S+ieP8xRSkxZbGwuFux5AMld8
 WNj8ksydOI5VVZ9VqW+VcqtCwDLuUJ5sm2OfBNvG1BKqBafH/etebXdemO2Ueu7wyLUR
 S7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5HTJRaz8bIYBXXH2NQdindRrdJAyy3ivXfFLQ1vFtNc=;
 b=Knmsd1q6poyX2yP1I5oCm7Jc5008gvTsqtN7bQrlSDKWAhokGnFZVIpEp5VAynuKp3
 zC5QPUqL7JzHnepFLomd28jIiAWOqgEeK/q2dIC+/Abi3sRPABHKN5JP1bwBWPY7JKlE
 1NWvjqlqCBryAMxCJ2nEejo+3kS2QqnAcnbnmRT7QHGw+GYnBxRzjbFmcEXlI0zDybwg
 nNzJWemfMFjY1cYMCyH1eq16NGkWy+yUxKopoLMcUOphh7yHzaR01/EKR3Wg0hc+rrH1
 QheM5GlwIhdTWSGgV2pL35nm6p7E/xTwyTkXcdW+kUaizrMOZoLp/mHm7A5IU3hgSCU/
 dzQA==
X-Gm-Message-State: AOAM532pwc4dZTyFYSTx5CAC50byWiQj5QN0c7ky1JvSdZlakt4UENDo
 t+i3bDwZ+pMBqMQda/kdCz3q4Q==
X-Google-Smtp-Source: ABdhPJxXhAK+tC9JI940wdED16VBQJVK2/QWArykCrvbpjvy97zsFOG0xZvdC5f84d4hAsQZERAmOA==
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr28063621edp.146.1629748880312; 
 Mon, 23 Aug 2021 13:01:20 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v12sm10091389ede.16.2021.08.23.13.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 13:01:19 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CA04665D-1E5D-400A-9CA1-860F8579C01A@benettiengineering.com>
 <20210821213303.283387-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5cba1f8b-1434-c38d-1b86-fc380b9de458@mind.be>
Date: Mon, 23 Aug 2021 22:01:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821213303.283387-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2] toolchain: update gcc bug 99140
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 23:33, Giulio Benetti wrote:
> Gcc bug 99140 has been fixed on gcc 8.x but reappeared on gcc 9.x while
> it's been fixed on gcc 10.x+. So let's update
> BR2_TOOLCHAIN_HAS_GCC_BUG_99140 accordingly.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * gcc 8.x works, gcc 9.x doesn't, gcc 10.x+ work
> ---
>  toolchain/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index c35c52d142..d033ce3962 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -165,10 +165,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>  
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
>  # Error: branch offset out of range on Nios II. This bug
> -# no longer exists in gcc >= 8.x.
> +# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
> +# fixed on gcc 10.x.
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>  	bool
> -	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	default y if BR2_nios2
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9

 Unless I'm very mistaken, this is basically saying "depends on any GCC version
except GCC 8". However, from your commit message, it seems it should be "depends
on GCC < 8 or GCC 9". To simplify the logic, I would say:

	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
	depends on BR2_nios2


 Regards,
 Arnout

>  
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
>  # ICE: SH4 -Os causes internal compiler error. This bug
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
