Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A808BC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 13:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C39E4056D;
	Mon, 27 Nov 2023 13:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C39E4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2RxDPqpv0Ir; Mon, 27 Nov 2023 13:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D888404EB;
	Mon, 27 Nov 2023 13:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D888404EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D728E1BF2BC
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 13:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD0CF60E6D
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 13:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0CF60E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A54JPspPHVg1 for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 13:35:45 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AC4560736
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC4560736
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1cfc1512df1so8040105ad.2
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 05:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701092144; x=1701696944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WwANpS4Wru0BI5OKluIDufHi6OB72Be8k3BirltlQI=;
 b=a6lPdU/GxvqABTqZz8X4jHkJzZDn++KQqPvBCl3iE2qDOEY6YRiYQyN0Caq5bhyual
 zz1skvnxYDB15JpULMujkEDNA/XMTzrN7IEL09zutaPJ3vigyPc04rp2aEaIA28jSGHi
 m2PIiS2TYjnKZxZZQ3b0tslPCILeXHauuYg8J1yGBtwtbDggB9ZZnSwXaDqgkPQ+GI3T
 nmldFmr8T8/TrtlPaPWM0etG7gKfJRL7x31n0yMMes6W/WwAPNUK5X+AuY0yPKPZ7kJF
 0/7tqfV6szqM5L3O0NK5PRMwqoyd4Is/n+CADHogOOfTsTuxMq8ylYcsFazX6TgC2wCP
 Ardg==
X-Gm-Message-State: AOJu0YzFBdvwJFyA9nSUmobWguF84QE2SqQaimo2Z/h/41DO9P8suDZH
 TbAran4M2Bqs0P/gDISNPqks9DrmzrB9KA==
X-Google-Smtp-Source: AGHT+IE4hBcSdfd37H+AY7S5eesRbQdO5KduDus8/fAYfC1O2LnrD1h+AordwRsNMt3UDkAJeIkHNg==
X-Received: by 2002:a17:902:ea08:b0:1cf:569d:937b with SMTP id
 s8-20020a170902ea0800b001cf569d937bmr11076417plg.52.1701092144288; 
 Mon, 27 Nov 2023 05:35:44 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 h6-20020a170902680600b001ce67fab3a2sm8410028plk.261.2023.11.27.05.35.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 05:35:43 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 3FD10101BCCB3; Mon, 27 Nov 2023 20:35:40 +0700 (WIB)
Date: Mon, 27 Nov 2023 20:35:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Message-ID: <ZWSbLOpaihc8RwVn@archie.me>
References: <20231127133043.847846-2-bagasdotme@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231127133043.847846-2-bagasdotme@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701092144; x=1701696944; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9WwANpS4Wru0BI5OKluIDufHi6OB72Be8k3BirltlQI=;
 b=Hz+mfDwF0OGqX+Wz1o3s2pbGIMM7ShgccC3gA0H+KiCRhuThMQjA+3tL3TOUuD6/ZW
 j3yH1GRvxoh0XpIGRrN0wcCxbawNt/ECoIpJfWGwwWxE+HlUJbYgHFpPdvkwCWjQ/2ZC
 ouz+ZNaX6Tr0tJZvSkjP7GNEneomH6TFuAoYJ3qcWz+PeZhSbbUsPX0w1c09BKIzeNxP
 eQL8orGBaQL34AAHsydTKty4MDZKLxU2ugUbM59XbURUNz+mQlme+MO7PZK/qzmd2Gif
 JJ2DUQfsHt1415KYxRUC5LKKifuZU6Dsi2QALmHGs/w9KJlHSdlNitZK0EaRmzUxZJtA
 qPGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hz+mfDwF
Subject: Re: [Buildroot] [PATCH] package/git bump to version 2.43.0
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
Content-Type: multipart/mixed; boundary="===============2023311936435452604=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2023311936435452604==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jBBk9WUv55DCxUxj"
Content-Disposition: inline


--jBBk9WUv55DCxUxj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 08:30:44PM +0700, Bagas Sanjaya wrote:
> Bump the package version to 2.43.0. For the full changelog, see the
> release announcement at [1].
>=20

Oops, the patch subject doesn't have colon separator. Will fix shortly.

--=20
An old man doll... just what I always wanted! - Clara

--jBBk9WUv55DCxUxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRbrR26Mw290jZcYHIVJRcAOONI5wUCZWSbJQAKCRAVJRcAOONI
5/l+AQDFT+64cZfGUF4Q4fGlJnsnsD81Q5++TWJy8yFxiwXphwD/fPs2qNZBX+sN
0tb0nUv8jNfmkgk6oyH9roCQsgMKvAU=
=ptgo
-----END PGP SIGNATURE-----

--jBBk9WUv55DCxUxj--

--===============2023311936435452604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2023311936435452604==--
