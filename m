Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256DDE81DEB
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 11:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF74B60F76;
	Fri,  6 Oct 2023 11:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF74B60F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7A983MToIIf; Fri,  6 Oct 2023 11:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13AD160EF2;
	Fri,  6 Oct 2023 11:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13AD160EF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D781D1BF4E3
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 11:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA66183B6F
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 11:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA66183B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ol8DuTJ4jqQK for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 11:42:35 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76E7883B5E
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 11:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E7883B5E
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso2681387e87.3
 for <buildroot@buildroot.org>; Fri, 06 Oct 2023 04:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696592553; x=1697197353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/apvXQe0z2VJ+EBCb9ANvO1mYMCqOM1Pa3bLxgqPRFk=;
 b=rfnHrrrA01+XLjgUSSR1rpWJht63gm1V12WcXDK2nWzTj9avkztmrpYerqsE9cH1Ui
 AVcJmfoorSUCmXFMWnaf7HZdFTtXlNLgImDj+GzamcTRF5aripO4F2hCuBWKtyDqqLf3
 vQxCa7GxgdPAXvnrGzxCCLZajbvO65yAKbRBwT8RY+i1ezAAw0mEf+ivwRFmqOTiVKHL
 TmzAQ/Kf5Ip9rvv61UFTS8u4Tg3C2XjQUK3SeYTzeOvINVXKhjK2z6Pvi7XybM/nKNHd
 oiPREGu7PvLAGdDfyFU+QDeRjtZsATtvfzhEI4doJUAfPk1FJbRjXMvkGhNRCr9Shwg/
 XHkw==
X-Gm-Message-State: AOJu0YwuxRdsxg7QuIdQp5BuoPjWtJLo/gJYVB7yxEw1rZcP0UhU4L9l
 15GUulIiD7RjsQMQ2uOFhq8/5t67Ozw=
X-Google-Smtp-Source: AGHT+IFP5xteb5dd/e+1F0rofTEQ5xA7toSbRSEzwFxmpdgZryODUWjdgZteL0N3Vikn6VKkutwCrA==
X-Received: by 2002:a05:6512:3488:b0:4fd:fd97:a77b with SMTP id
 v8-20020a056512348800b004fdfd97a77bmr5762093lfr.50.1696592552518; 
 Fri, 06 Oct 2023 04:42:32 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056512092f00b00502ae64f46asm272782lft.126.2023.10.06.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 04:42:31 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:46:09 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <ZR_zgRyH8g13D2y4@gmail.com>
References: <20230918084825.786715-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230918084825.786715-1-marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696592553; x=1697197353; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/apvXQe0z2VJ+EBCb9ANvO1mYMCqOM1Pa3bLxgqPRFk=;
 b=lrPaDqOnRVJHAGXbJ8BvarmNGqND7slIT8E1yEgpue5/Fmeok00W7PWU2wicBO4nf9
 20aAHkOKambOLzvolj5WgcNa3lcI87LpsbVBidxcmtzcZpb8s6h9CK306zrDj7DiQOqF
 qOAidZYr9ENzvJbrKM3JWepj5Zy2srFL8244nsbBD1/SrlEnJ5yzSi9w5VIcCPSl7f5m
 sCTeovNYdm4gORfhPRcnShTRtMf0TFtoG5a7TKlKjapy8bxd5RWQetdhUGf7EtvY3qkI
 HtaEs0q0bBH9DCQYbGOYShQSmwaZW/VREHmb3Um0+OC5wG7ZVzLNv1Y5xGAc+PAMvYz6
 K6/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lrPaDqOn
Subject: Re: [Buildroot] [PATCH v3] package/criu: new package
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
Content-Type: multipart/mixed; boundary="===============6050209783335439246=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6050209783335439246==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MirNQ5KRK9WC1pDd"
Content-Disposition: inline


--MirNQ5KRK9WC1pDd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Julien, do you have the posibility to run test-pkg on this patch?

I still get wierd errors (related to host-libzlib (?) ) for the
bootlin-armv7-glibc toolchain.

bootlin-x86-64-musl is 'OK' though.

Thanks,
Marcus


--MirNQ5KRK9WC1pDd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmUf830ACgkQiIBOb1ld
UjII9Q/7B1Vh7qu5THbMNsyAe9oU5WZQ5sNqctibROHAd2a2TaY+BwMiJhyMKh/V
gKDiVLijak/WI/gf+qup/ZjVHL8en5RBDjhwEs5gpkEz+LKxUP7VWzjPrJJ7zkYL
/fQLclPsJ8PccQ6jgTtedA5lmeCNtrQ3vgsVKPjSAlpVDoxMjfp6VtIPW8DICrPG
Jdt93nSxNwafDP6Yy2J1I0sa59T5iDB6Kzu+/YGAijodlry9qh51z91VB6HiZABH
c5Z5rJr3tSgmCUu6v9AAFTKMAh1SdHbjdtC5FDuNnDgwOVGE77in1vYzWTQ9th3V
84SD/ZsmJxiv09hJmMsUvxw9FakVQKG2IygmGtfSifY2nXCbXFCxWF5hfdyW/wlX
a1YQrNIZR8n5XZzXgiEGj9QHHrrPPb7y0wo1O9ad8OHPh2GITJdpkA383sUMwqTP
jvvd5suouIbgGDEXN5imkVRrLyZUkPuzacZca9Hv7KjN6kWwIzARhZeU45kf6Gcl
3GLh0LvnIyUk8TQmbQGaR2bbcencoMr9eXY55Szv13myIc0gk6RzwJTTne8BnRNv
oLkS+5g3rhIwFOa6daty1xYlrZ1TPWIfiSs9E9PGSt9HM0BnCuWw/fxL9d3ES4xZ
LZcsG78c762J4r+mSpGli9YnbrdrXWohAQOWwdRrHY0RAvuXtjw=
=ic8F
-----END PGP SIGNATURE-----

--MirNQ5KRK9WC1pDd--

--===============6050209783335439246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6050209783335439246==--
