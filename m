Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C90C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B7DE6FB0C;
	Sun, 18 Sep 2022 10:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B7DE6FB0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uETpuDvnOaFV; Sun, 18 Sep 2022 10:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DB4160E36;
	Sun, 18 Sep 2022 10:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DB4160E36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78D951BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 602C560E36
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 602C560E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjUnBwl-ToQQ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:43:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4BE60E31
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C4BE60E31
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:43:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso2495204wmq.2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=D+G+F6OHFDia6PdG9SntuNRMOsPWsjC9bzlDQVCu16w=;
 b=uXpIJqVJFzGicRQTLkM9hj6z+NeciEuSyr1PCcY6GOo6htWT3J+39l08OTOOk/+8wB
 /ixT0xvd3doEWArhcB28v6FAG6dm2WdrZ67wTv3k/y3lG3+T15caViu2qQmPtZvKBCx+
 Myqvfqy2UOq3aJpjwkHJMkXQ92ZWNztJxvoeUIs9aPXwimCRctrfdSCOfvN0BmTFASOH
 /nvdPP0PVTXMOmpOmZ711fG7q4Uc0xAOQLHdUIuNbGQthK7chjWZd21i1VcgTU4EWNpi
 calz+A/Ggss41+QX8WuRkH60FwpoUjS8FJtTRkP7tNCncUSAP7HyvxTNngJxiuKCZi52
 SUuA==
X-Gm-Message-State: ACrzQf0EaBSZlqt//6y5s4iHOMaTRorY7NgAkLk+g9GGS+7Ndk5v4CS5
 5bUI6A8Y8mbid0yk4TjlJMDnvQ==
X-Google-Smtp-Source: AMsMyM6pTrajTNFKAtnNIhwT8o5lsNfIkOqDPhOJ1xyvL6kAqY3ihT4OupSKCvHY/W1FeA9aonFIuQ==
X-Received: by 2002:a05:600c:600b:b0:3b4:951c:5dc2 with SMTP id
 az11-20020a05600c600b00b003b4951c5dc2mr8788601wmb.48.1663497823820; 
 Sun, 18 Sep 2022 03:43:43 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a5d510f000000b00228655a5c8fsm10231964wrt.28.2022.09.18.03.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 03:43:43 -0700 (PDT)
Message-ID: <fc5ad951-756d-5d88-b767-65da7faf2153@mind.be>
Date: Sun, 18 Sep 2022 12:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-6-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220729000904.1295295-6-joel@jms.id.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=D+G+F6OHFDia6PdG9SntuNRMOsPWsjC9bzlDQVCu16w=;
 b=WIY09Gk9iY/+8TR7YI6WyqPsf42Id103Bn7qHC26fQg5edkVSpLwEnynRLYvlgFWMK
 xpu9ZiPwSwOQFKSfQlqeBgLnzSs+w1xysO2WhjBUBvjOgap1DWaN1yrQi4EolYTAnMzY
 27gp5daS3zopN3thIfY2jr929kLFiUkKhD4RLAJTAnBJXu0HMVZgL1iAZlViGWTepmsW
 u29yNle6GQpEUI8FC8EGwRXBam/C9co0TjYg82A2kcVTkfHWv4xpcWAm8ofV+jnnMlIe
 F/tu9j2SUZobo5GaI5C99vT/XwPbi//gNLCBdxD+T/5K2xWT600mdVfwh+hWp4TSnmDU
 gqRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WIY09Gk9
Subject: Re: [Buildroot] [PATCH 5/9] arch/powerpc: Add Power9 CPU type
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



On 29/07/2022 02:09, Joel Stanley wrote:
> The Power9 CPU was released by IBM in 2016. It is a 64-bit CPU
> implementing ISA v3.0. It runs in big and little endian modes, and
> supports VSX and AltiVec.
> 
> Power9 is supported as of GCC 6.1 and Binutils 2.26.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

  Applied to master, after removing the !64 condition, thanks.

  I didn't continue with the rest of the series - there are merge conflicts with 
the earlier changes I did. Can you please rebase and resend? And also take into 
account the comments on the first three patches of the series of course.

  Regards,
  Arnout

> ---
>   arch/Config.in.powerpc | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 7c6ae84348e9..4c633c338d86 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -149,6 +149,12 @@ config BR2_powerpc_power8
>   	depends on BR2_ARCH_IS_64
>   	select BR2_POWERPC_CPU_HAS_ALTIVEC
>   	select BR2_POWERPC_CPU_HAS_VSX
> +config BR2_powerpc_power9
> +	bool "power9"
> +	depends on BR2_ARCH_IS_64
> +	select BR2_POWERPC_CPU_HAS_ALTIVEC
> +	select BR2_POWERPC_CPU_HAS_VSX
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>   endchoice
>   
>   if BR2_POWERPC_CPU_HAS_SPE
> @@ -228,6 +234,7 @@ config BR2_GCC_TARGET_CPU
>   	default "power6"	if BR2_powerpc_power6
>   	default "power7"	if BR2_powerpc_power7
>   	default "power8"	if BR2_powerpc_power8
> +	default "power9"	if BR2_powerpc_power9
>   	default "powerpc64"	if BR2_generic_powerpc64
>   	default "powerpc"	if BR2_generic_powerpc
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
