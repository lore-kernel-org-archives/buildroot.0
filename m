Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89353C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4593F600D4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4593F600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1940740694;
	Wed,  4 Aug 2021 01:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTjcHzzJ5iKv; Wed,  4 Aug 2021 01:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8527400C7;
	Wed,  4 Aug 2021 01:21:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B27A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4FC7835B1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPzMKYDNRjjm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0DEA837A4
 for <buildroot@busybox.net>; Tue,  3 Aug 2021 21:49:28 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qk33so648696ejc.12
 for <buildroot@busybox.net>; Tue, 03 Aug 2021 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E0ViVrMpeQ97dq89bPBPhFyo2JED96undTIK96GFC0c=;
 b=AJKVtzoy+EsKRKlZVEfeU9YfTlTMwDsEMVoHhvQx1grKcD34zS403w+OOJgqiqNGz5
 1+6fL9B33lN8UxDcQierDgMyAwNzpDPZzHt0T+xhxE5frH/beLY+OSmwPAa10nYalyCd
 tePtLZaLpD2UFNQLNyojg7DY/+b6hRDVzyqT6ELiP3KxS+p+Od/Y697RQvOAXHBIiP+R
 qWyH8AfIwLvW0x4FNMP3qB2rjPMabKtb0Nk9wIBQp2YDJ96aOYKH37qelcgqI2Sd2h3k
 OELhlAjMkdiphc04N8GahMB+57rOFgXUuB8y89b3lD2isNdBU+J4m+HAxlAWCU+6aKxq
 EKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=E0ViVrMpeQ97dq89bPBPhFyo2JED96undTIK96GFC0c=;
 b=NA8m71iWNFnkduhPwRFo4KfTu4V+dAHbQn3bePPpdslyRL7NQuiZz4kq2BKOfV00xn
 5/kGUNnoM6gnDeMc+8Swd5CNnFmeT/HSCl1dD+qgE8lknEt9HXg/bdbf91FDeEkTSt83
 dIJ0n4AmlgN8WzYxo80A3tXRWaNlzZUbyOhcplyPVRF6Axvn/+nh0ktuXoy24irC6+xo
 vAAcMQWsWsrW+ydVusHSYX03I4LHFiNte/4Fwk4GQ8VwiepYCcF1PsutvhJ0G9KIwzB2
 RivwSve+iJPH6Qhxvz2ddRFep0RHpuq3ntk1C41+rdSQfXmwkw/SBcXIZ0B3FYG2OKC9
 wJlQ==
X-Gm-Message-State: AOAM531m/wNErAdrg7+yjE0sjzBX6vRUopf4eeupFlbpoTaygXTVxpv7
 cJEiq/aQRAVCmY+9MdQw00iZqnOZMwOraVTVkC0=
X-Google-Smtp-Source: ABdhPJy/2v/CmKWm3dOpqbm/+B67Ibt4+yG2suy+khE+92ZiNt/r1PQW1JRFd05iA1NsEHG4x03Vnw==
X-Received: by 2002:a17:906:1789:: with SMTP id
 t9mr22827293eje.61.1628027367170; 
 Tue, 03 Aug 2021 14:49:27 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o7sm46023ejy.48.2021.08.03.14.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:49:26 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210725111231.359830-1-arnout@mind.be>
 <20210725111231.359830-3-arnout@mind.be>
 <20210725175709.7338b4a5@x230_1.trabucayre.com>
 <fd67895e-5c9e-62bc-7a4b-dd41bed13c0d@mind.be>
 <20210803225739.15e612d5@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5dbd8521-3ef1-2330-2d98-56fc934badec@mind.be>
Date: Tue, 3 Aug 2021 23:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803225739.15e612d5@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v5 3/3] package/armadillo: allow to select
 between lapack or openblas
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 22:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 26 Jul 2021 08:24:37 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> fortran is only required if lapack has to be used: if lapack is said as optional this is
>>> maybe not required ?  
>>
>>  Oh, I intended to insert a comment there but apparently forgot: We need either
>> openblas (which doesn't require fortran) or lapack (which does require fortran).
>> Therefore, on architectures which do support openblas, we should have a comment
>> that just says "C++", while on architectures that don't support openblas (but do
>> support lapack) we should have a comment that says "C++ and Fortran".
> 
> ... but this is exactly what your patch does:

 I meant a "#" comment, not a "comment" comment :-)


 Regards,
 Arnout

> 
> comment "armadillo needs a toolchain w/ C++"
>         depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>         depends on !BR2_INSTALL_LIBSTDCPP
> 
> comment "armadillo needs a toolchain w/ fortran, C++"
>         depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
>         depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
>         depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
> 
> If we're on an arch supported by openblas, "needs a toolchain w/ C++"
> is displayed.
> 
> If we're on an arch not supported by openblas, but supported by lapack,
> "needs a toolchain w/ fortran, C++" is displayed.
> 
> So it all looks good to me.
> 
> 
>>> It's an open question:
>>> until now armadillo was always built with blas and lapack support provided by
>>> clapack. To avoid breaking current behaviour (lapack support) why not
>>> considering selecting lapack package unconditionaly and let user choise for
>>> blas support? I know the main issue is the dependency to fortran...  
>>
>>  What you're basically saying is that in the choice between lapack and openblas,
>> lapack should be the default, right?
>>
>>  Can you maybe explain a bit what your original reason for this patch was?
>> Armadillo basically hides the BLAS implementation, so unless it's buggy, you
>> shouldn't even notice which implementation is behind. Also, the lapack package
>> itself says that you should not use its BLAS implementation but you should use a
>> better one instead.
> 
> I was also confused by Gwenhael's comment, including with his reply to
> your question. So at this point, I've applied your patch as-is, we can
> always improve/fix later on if needed.
> 
> Best regards,
> 
> Thomas
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
