Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D6C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  1 Jun 2023 08:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0557942429;
	Thu,  1 Jun 2023 08:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0557942429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JivxMhbMurWE; Thu,  1 Jun 2023 08:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3CD04242A;
	Thu,  1 Jun 2023 08:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3CD04242A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0279B1BF281
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 08:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAC1F40273
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 08:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC1F40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdBCk-epY8cP for <buildroot@lists.busybox.net>;
 Thu,  1 Jun 2023 08:42:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B06640122
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B06640122
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 08:42:47 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2568fc3d8a9so108050a91.2
 for <buildroot@buildroot.org>; Thu, 01 Jun 2023 01:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685608966; x=1688200966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vl959PDixdI+eS/NalHAy1lk9owvjDAGrAklwCnsCmY=;
 b=SlnohNXwvc7JiC4BOnq2YxR2oLbaJn1XujFUw3yrler+0yqclZ0U77Yb++wqXgXofu
 RFgVCiEteobmIBuOjtzmvShUioZN1g3R0ZgEnwD6leBasqkiCGkgEKSUoKriz4q4EYLH
 5jlIJPAtRDH2D92sk0bHRGZxadQr1JTie+C4R51L+JMHYT5tu5sq9PDvrcuHZpGFTdY3
 5uNCsx61HeEkBj0ENSJUTfOR0iKKXoac83xGv7rnwgAklwJzQRExkRtht5Z71nDQqBLu
 YHMx3TyErhj2J+AMXHkMiyBrTAb/TyUjdHBmChFrG4i4YXyOYSghP5Veo0936nQs0VE6
 G9ZQ==
X-Gm-Message-State: AC+VfDwJBNRSjI4FU0HyfK32zhmYNLuK4n0Q3fNwt9DSVs4iYwuGTJam
 H2JL1hpHwFy0paFL3ht6jj8PF3EiB6Y=
X-Google-Smtp-Source: ACHHUZ48fz3XVaRU8pXG5mpSNNlL9sPlCUF6ZfjVFurJe7RdRkBLJNejdxtxCxoO24rN8bKSp5dLRw==
X-Received: by 2002:a17:90a:5801:b0:253:266a:3b00 with SMTP id
 h1-20020a17090a580100b00253266a3b00mr5961771pji.37.1685608966372; 
 Thu, 01 Jun 2023 01:42:46 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-56.three.co.id. [116.206.28.56])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm901824pjk.57.2023.06.01.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 01:42:45 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id A4F921069A8; Thu,  1 Jun 2023 15:42:42 +0700 (WIB)
Date: Thu, 1 Jun 2023 15:42:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: AndreiCherniaev <cherniaev.andrei@kairo.space>, buildroot@buildroot.org
Message-ID: <ZHhaAsLQguYSnB2S@debian.me>
References: <20230531150507.67562-1-cherniaev.andrei@kairo.space>
MIME-Version: 1.0
In-Reply-To: <20230531150507.67562-1-cherniaev.andrei@kairo.space>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685608966; x=1688200966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vl959PDixdI+eS/NalHAy1lk9owvjDAGrAklwCnsCmY=;
 b=bn4hbAbBgBJJltSe1AMtQCh0u0Frv1hU1qPcVWPqyLkscrQgdZLPyiQTxNcGCC9Pd5
 2ZsRBvTb5tmftYsBCvoQskGOhrugqwldU3vj6tpCeTgeS0nDvtdrRQNm3RRpIYEHWzCi
 +sZoY1ghKk7BFsyulR+EQaE68ECSGGSgHhtT1m/MetbKjVlZLq2W42HWM200RXlc/QuH
 vvhZlK+NLLGb4P1vgkckWE0NVGt9Gli1XD9PVItLoiM50IhJXzvQ+7wLsbSQ05YCf6Gb
 y5cUhtuxmjtrFMNRzrMDfqcS1McUmCNitfOFiFzXPdtwuUPJtsuKjwWxYkhfT/J/Abre
 zTtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bn4hbAbB
Subject: Re: [Buildroot] [PATCH] add MMX instruction set capability for
 Geode CPU
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
Content-Type: multipart/mixed; boundary="===============6666858514414251439=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6666858514414251439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DIkDqjsNsHF+ocL+"
Content-Disposition: inline


--DIkDqjsNsHF+ocL+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 12:05:06AM +0900, AndreiCherniaev wrote:
> Signed-off-by: AndreiCherniaev <cherniaev.andrei@kairo.space>
>=20
> Before this patch there is no way no enable MMX for Geode. Modern Geode C=
PU support MMX.
> This capability will interesting with ffmpeg for example.

The wordings here all look confusing to me.

I'd like to write the patch description as:

"Currently, there is no MMX support for GEODE processors in Buildroot.
Yet, some packages like ffmpeg leverage it when the package is built.

Add the instructions set support."

For the patch itself, see below.

> ---
>  arch/Config.in.x86 | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index c770ae3ffe..595db48d91 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -521,11 +521,10 @@ config BR2_x86_steamroller
>  	select BR2_X86_CPU_HAS_SSE4
>  	select BR2_X86_CPU_HAS_SSE42
>  config BR2_x86_geode
> -	bool "geode"
> -	# Don't include MMX support because there several variant of geode
> -	# processor, some with MMX support, some without.
> -	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
> -	depends on !BR2_x86_64
> +        bool "geode"
> +        depends on !BR2_x86_64
> +        help
> +          see also BR2_x86_geode_with_MMX
>  config BR2_x86_c3
>  	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
>  	depends on !BR2_x86_64
> @@ -633,5 +632,16 @@ config BR2_READELF_ARCH_NAME
>  	default "Intel 80386"			if BR2_i386
>  	default "Advanced Micro Devices X86-64" if BR2_x86_64
> =20
> +config BR2_x86_geode_with_MMX
> +        bool "GEODE with MMX"
"MMX instructions support on GEODE"
> +        depends on BR2_x86_geode
> +        default n
> +        select BR2_X86_CPU_HAS_MMX
> +        help
> +          there several variant of geode processor,
> +          some with MMX support, some without.
> +          See: http://en.wikipedia.org/wiki/Geode_%28processor%29
> +          And decide can you use MMX or not
"Some variants of GEODE processor support MMX instructions set. Enable
this option if yours have that support. If unsure, see
https://en.wikipedia.org/wiki/Geode_%28processor%29 for features list
on GEODE processors."

Next time, time to brush up your grammar and spelling skills as well as
vocabulary.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--DIkDqjsNsHF+ocL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRbrR26Mw290jZcYHIVJRcAOONI5wUCZHhZ+AAKCRAVJRcAOONI
58gbAPsHolz8OG7zG2Kd8Fa4bGIYEFvoqbnVle1+n0a9AeMIfwD/YKp38EogPSwM
xa2j43AFmGYT/SCUmvlteH/L46xbpAI=
=eqyi
-----END PGP SIGNATURE-----

--DIkDqjsNsHF+ocL+--

--===============6666858514414251439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6666858514414251439==--
