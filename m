Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A065C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A930D60F13;
	Fri, 11 Aug 2023 20:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A930D60F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vxR_i1oVVrA; Fri, 11 Aug 2023 20:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3BC9613BF;
	Fri, 11 Aug 2023 20:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3BC9613BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B36DA1BF588
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B1CF41E8D
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B1CF41E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owKAfbyKO-pf for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 20:06:45 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A42541E8C
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 20:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A42541E8C
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c1d03e124so304617866b.2
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 13:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691784403; x=1692389203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QbWk5MHjZol40d51g4H5EaYmuH4bdL9LZmemag1dpv8=;
 b=L2Q7IT4Umeh1TpGNPcXCaKySGDTAMwATXQ3uyPLGKShYKvxpSwG0kKs2+UOud++tG3
 DVlb8IP1V35gwv/qp26IN9LZoXbS5WuyA/qP+MTxwrJ8qUe3+gFPn9EaxNI49lv+f0G1
 McTZnSMh3Tr4hYkpcIoh4mlFpPhbeiMr5UNtbGipqzxG3FqbDy9FO3mtuwcNheWbPUzU
 gkXdTILbhRmv2zrMHDJSkEC5UEyUwpISw8swcpLdFEDcGyunhPxVripkCFiEtgr6vjDC
 hObew4SXLJYkVqEjY9UquX/8EHYdoRkUHwhCXDVKuKhbMKwURM/cUCHND6enCN+8HWmv
 nPSQ==
X-Gm-Message-State: AOJu0YxxcEye/KfmpZ8fGdPLSFviXJ1Pp/r5dlCkm15by+Yr/2rSB9MS
 L4b/7ibky0bh3rO9BbY+CvNnGQ==
X-Google-Smtp-Source: AGHT+IFlzM7bGC2e/I+U1rj7x2T5SR4M8HTDbfOrHkxst2yF3/OOBVu8kw33atz9Apuo/p8IZyBaxQ==
X-Received: by 2002:a17:906:8458:b0:957:1df0:9cbf with SMTP id
 e24-20020a170906845800b009571df09cbfmr2570663ejy.19.1691784403474; 
 Fri, 11 Aug 2023 13:06:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a170906244a00b00992d70f8078sm2594678ejb.106.2023.08.11.13.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 13:06:42 -0700 (PDT)
Message-ID: <de5cac45-aa70-b155-d7b6-f29006d4214b@mind.be>
Date: Fri, 11 Aug 2023 22:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691784403; x=1692389203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QbWk5MHjZol40d51g4H5EaYmuH4bdL9LZmemag1dpv8=;
 b=G1Z8UEk7ZWKrY2fWa1jiTUpVMgKHciaob6Ja0J5Kp/5AGiMTDfjL3NUhVRG0RraHxJ
 M/bctNCfb7qwUPmFXXTbxnvQzkYBeMwR0xrh4K86XCwDFqO29CJ6KOxvmPBOWS0CNUQj
 NZgH2zz04zvMHG+n1WpZY7LDfvmZtB/qHsYbT8KLnhxZsXFZFTaWJca+miqP49PThxxg
 lOhUoh6tN4ogax6h7Zby27kQR73Aphwn5CjgoJ7tnagTyNYIe3SY193dGmOFjQHp4ZsN
 vNc0WQ8SarWnm+IrbyQEMkNRxP+j7SvsY7jNd/eBdsf8Q7wN8jLOZllOROHA1Nj67P0m
 ggKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G1Z8UEk7
Subject: Re: [Buildroot] [PATCH] package/crun: allow building with uClibc
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
Cc: Christian Stewart <christian@aperture.us>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2023 23:21, Thomas Petazzoni via buildroot wrote:
> uClibc now provides fexecve(), so crun can build just fine with
> uClibc. However, argp-standalone is needed, just like it was needed
> for musl.

  I believe this is going to create problems again, because we have a few 
toolchain configurations that are used in the autobuilders and that have really 
old uClibc versions.

  As I said in a previous mail, we may want to drop these and move to bootlin 
toolchains instead. But then, for some of them there is no bootlin toolchain 
equivalent...

  Also, those autobuilder toolchains make sure we still have some testing of old 
GCC versions, which we probably do want to keep.

  So, we should either:

- update all the autobuilder toolchains with newer uClibc;
- switch those toolchains to bootlin toolchains;
- switch those toolchains to internal toolchains;
- add autobuilder exceptions;
- add some Kconfig construct to identify fexecve availability.

  Regards,
  Arnout

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/crun/Config.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/crun/Config.in b/package/crun/Config.in
> index 45c86f0655..1b69034459 100644
> --- a/package/crun/Config.in
> +++ b/package/crun/Config.in
> @@ -1,8 +1,7 @@
>   config BR2_PACKAGE_CRUN
>   	bool "crun"
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> -	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
> +	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
>   	select BR2_PACKAGE_YAJL # libocispec
>   	help
>   	  crun is a fast and low-memory OCI Container Runtime in C.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
