Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF468C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBEE400D7;
	Sat,  3 Jun 2023 19:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBEE400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYPretQ7qdZ7; Sat,  3 Jun 2023 19:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D38E41E3F;
	Sat,  3 Jun 2023 19:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D38E41E3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3E861BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A377F40571
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A377F40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjervYUL0SOh for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:53:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72964404AB
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72964404AB
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:53:06 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-96f7bf3cf9eso532360366b.0
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685821984; x=1688413984;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FfakROa4y6swBiEhvGjvZj22m2apbw0AgdUAuxstNEw=;
 b=CYyl64Jo9ESg2B2WnGLz3EARU6WdWelPUG/nBAZvi2xXJw9RuKEQezxQXUVZj5EoLQ
 dxkXI6NKZ4CPV6UlczOGO9sBYl+LUJTVX43+gGCCQaF+blIgi5kgt07Dla9DSWJVjfIv
 ZOSEFRY1U+cQD/dKCtqmXAroC6HSSXLRyf87pK1Lu7UFdr+6MwcwDfMq8XD/9aYVCXdq
 kjDOnc0SPmIhXqNOhexWu67kzUWemR15EM3hZkwOQfZu9dmyIa4LE96owAXAFWjhh3to
 jeVzZ3VKXCuPsf8sB383CGCrMYsi4WbNH9GgbFhdJdLVUgCqSSsNOvfxlCEpofnmabkQ
 +2AA==
X-Gm-Message-State: AC+VfDwTGUhKUl27bHbWEjdJld923dCQisOTQ6O5f/YZ8CpepOuwnu0I
 aU4G6ek/tCThHKU8dmYeyx+boJ+bvbA/MpGkwdI=
X-Google-Smtp-Source: ACHHUZ7erJDYwd6Hds+i6ov63pW4i1oDcZ5pBOAQJpyHGsQB6V0jsX+Bu/xZ2OVGyRMHtUIZuQkbDA==
X-Received: by 2002:a17:907:31cd:b0:974:6390:40a8 with SMTP id
 xf13-20020a17090731cd00b00974639040a8mr1985460ejb.71.1685821984501; 
 Sat, 03 Jun 2023 12:53:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dk23-20020a170906f0d700b009746394662asm2126217ejb.53.2023.06.03.12.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:53:03 -0700 (PDT)
Message-ID: <0aa88577-3736-d508-f73e-eae8b9d43a63@mind.be>
Date: Sat, 3 Jun 2023 21:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230516194855.1548486-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230516194855.1548486-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685821984; x=1688413984;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FfakROa4y6swBiEhvGjvZj22m2apbw0AgdUAuxstNEw=;
 b=VALIyk906t8XhmJIF5vA9BzSqRooVQW/OlXUZ9rK/2NW9QGanOFklIEgl1DVu3Vnfn
 YGmmcuO23qZkW+KSFZCqx0M1uhFMBWujILxsyQVKu7hPeXhS2Lw8R/AWBomFCvLCjkpL
 osrZCOSQSEn4VbOwUdSnpWcYCAxJFlTOna4fAVnTMAzcUpK4fzNXo5+LAYTPDKpC5Oqx
 zcK/aZoz7uNd6nCnhiU0szH7MVipkqWvFpSguUFokdUZ1VjSgnqzIAEyaN0GLy+z5V6O
 pBLIbEZrq+ONL+3iTU6BBXaSKk6NV8Kwmrr8SUC8o/2Rv5UArozXrSo04cPs83JIoc3w
 6hIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VALIyk90
Subject: Re: [Buildroot] [PATCH v2 1/3] package/vdr: Fix patch for uclibc
 build
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



On 16/05/2023 21:48, Bernd Kuhls wrote:
> uClibc-ng 1.0.42 added support for getloadavg:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=ad3a130dad88ad7a59dcd965b0cf9bd0d713595e
> 
> leading to build errors of the vdr package:
> 
> skinlcars.c:1105:12: error: 'int getloadavg(double*, int)' was declared 'extern' and later 'static' [-fpermissive]
> 
> since its version bump in buildroot:
> https://git.busybox.net/buildroot/commit/?id=61ae6add9e5d4761536fa4ff24150d5f8f82a61d
> 
> Fixes:
> http://autobuild.buildroot.net/results/d3a/d3a65044fabdafa1b6d75a508eae006a2cfebdc0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied all three to master, thanks.

> ---
> I do not know whether all external toolchains were already updated to
> uClibc-ng >= 1.0.42 so I fixed the patch instead of removing it.

  Yeah, 1.0.42 is just a year old so a bit early to rely on it I think.

> Due to uClibc-ng providing getloadavg() sending 0001-getloadavg.patch
> makes no sense imho.

  True, but it would make sense to add an Upstream: tag to the patch that 
explains why it's not upstreamable. Well, not really important, don't bother 
doing it.

  Regards,
  Arnout

> 
> v2: no changes
> 
>   package/vdr/0001-getloadavg.patch | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
> index 9e6316e284..f6ba84c9e5 100644
> --- a/package/vdr/0001-getloadavg.patch
> +++ b/package/vdr/0001-getloadavg.patch
> @@ -14,7 +14,7 @@ diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
>    
>   +/* uclibc and dietlibc do not have this junk -ReneR */
>   +#if defined (__UCLIBC__) || defined (__dietlibc__)
> -+static int getloadavg (double loadavg[], int nelem)
> ++int getloadavg (double loadavg[], int nelem)
>   +{
>   +  int fd;
>   +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
