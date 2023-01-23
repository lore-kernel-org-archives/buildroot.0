Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F339C38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 12:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACDED81E48;
	Mon, 23 Jan 2023 12:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACDED81E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBXWPDSr9OjU; Mon, 23 Jan 2023 12:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05DA81E28;
	Mon, 23 Jan 2023 12:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05DA81E28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C20A1BF59B
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 12:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 280EF81E08
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 12:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280EF81E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wG8KZYlN8s7S for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 12:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A303281E00
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A303281E00
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 12:19:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qx13so29856900ejb.13
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 04:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVzQNJPbU8vKw8Zo7RIpiDQa9AC0bOdFDPXd39QEzaM=;
 b=keWtkdgb29KrJv79XzvGvhMzOqRffDYHHaEqcVHgOC9hJfOHfXqot+V5NjaXYA9qDC
 1awb6jERzwZAOqkCaHYDe3En5/cQjZ7BPG23cqNwlMY/tTN1KL6mqzx1qMDw3AP8soYG
 9Y8yEz6vrNMMHAhDI+K7/FmknZZ5qmh37OHMgwNCmvBAqg3nvwjy0M9wePMpXPNbu3fo
 PTEqTZM2M0HaMlJ/9UPFO6jei42H+qHiiNZPTS/akCenaMedOdNBoOuRPPxdOrMncV4K
 Tcqrls/QyBWh7G8crnyAUuvnnOcIsU1Nm4RdafdlLMlax7YoRrN+nFYHQ2lGd5ZpUnL6
 1E6A==
X-Gm-Message-State: AFqh2kr7fqZyKROFl9LvdhKjclal+8MAW95nxyI3vtYY2DHpCz5EGT1J
 vj7C0Mt9tfz2KeEy76qtcEwESsVdu2D/gw==
X-Google-Smtp-Source: AMrXdXuU9ypkRoGzJKAePgRNaPzRFJaRc2CuyCKDcEWbAqV/3d9gc+XNGpcce1Le9D/4Iu/g4E4+yg==
X-Received: by 2002:a17:906:c9c2:b0:86e:a8d8:19b7 with SMTP id
 hk2-20020a170906c9c200b0086ea8d819b7mr25137206ejb.71.1674476380683; 
 Mon, 23 Jan 2023 04:19:40 -0800 (PST)
Received: from gmail.com (82-209-154-112.cust.bredband2.com. [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id
 ti3-20020a170907c20300b0087190b46ab0sm10731919ejc.76.2023.01.23.04.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:19:39 -0800 (PST)
Date: Mon, 23 Jan 2023 13:20:37 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <Y857le0faKVd2ssW@gmail.com>
References: <20230123083508.3041367-1-marcus.folkesson@gmail.com>
 <167447544877.42371.18235756044763257017@Monstersaurus>
MIME-Version: 1.0
In-Reply-To: <167447544877.42371.18235756044763257017@Monstersaurus>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GVzQNJPbU8vKw8Zo7RIpiDQa9AC0bOdFDPXd39QEzaM=;
 b=i2zpx6uf3mY7kd4TLQAuNxj18W4Qk6TYioiKDw9d0CscHucG88OzcewSzAu8ZquEzM
 Fiuf2GoAIZKZ82k6fSwe4pzDXZmro/dvnsBm1IAYm0Nu1LEtNPIW/q017SrlQAh2rNyX
 a0eiu/KUbBX+s6BR/+dilfc/Nhx8Ms2vYdWQIFAYGeunVET2ZuGaZGI3VvC+HSxythnh
 iPH0Gy4E8+t0kD8z7oquSzVh8mslihXExU6/bGzZP9HZUZ/43Tugq4SYSJYiiGW6PnQA
 iAohEKVi7loOfp3mjkeSRxVA1/8U1t37RapaS6MHzxbUWcOby8ZQfnjO2LDzwbjyzOig
 yNjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i2zpx6uf
Subject: Re: [Buildroot] [PATCH 1/3] package/libcamera: bump to version 0.0.3
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8191313344723733689=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8191313344723733689==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vCsQ4LGH6sIQ85xh"
Content-Disposition: inline


--vCsQ4LGH6sIQ85xh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

On Mon, Jan 23, 2023 at 12:04:08PM +0000, Kieran Bingham wrote:
> Quoting Marcus Folkesson (2023-01-23 08:35:06)
> > At the same time, change site to github in order to fetch the release
> > bundles.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  package/libcamera/libcamera.hash | 2 +-
> >  package/libcamera/libcamera.mk   | 7 ++++---
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libca=
mera.hash
> > index 68c9c1f005..13f6c4d907 100644
> > --- a/package/libcamera/libcamera.hash
> > +++ b/package/libcamera/libcamera.hash
> > @@ -1,4 +1,4 @@
> > -sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e963698=
6e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
> > +sha256  af85008f4e8bf1dc70aba4e5612513371b016788cf3c83343cf2d02483bc64=
ec  libcamera-0.0.3.tar.gz
> > =20
> >  # license files
> >  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da=
6c  LICENSES/BSD-2-Clause.txt
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcame=
ra.mk
> > index 9c03d3a3b3..d00f076cea 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -4,9 +4,10 @@
> >  #
> >  ######################################################################=
##########
> > =20
> > -LIBCAMERA_SITE =3D https://git.linuxtv.org/libcamera.git
> > -LIBCAMERA_VERSION =3D ba6435930f08e802cffc688d90f156a8959a0f86
> > -LIBCAMERA_SITE_METHOD =3D git
> > +LIBCAMERA_VERSION =3D 0.0.3
> > +LIBCAMERA_SOURCE =3D libcamera-$(LIBCAMERA_VERSION).tar.gz
> > +LIBCAMERA_SITE =3D $(call github,kbingham,libcamera,v$(LIBCAMERA_VERSI=
ON))
>=20
> The address github.com/kbingham/libcamera is an *unofficial mirror*. As
> in - I arbitrarily (but frequently) push there and store some branches
> there.

I see, thank you.

I will go back to linuxtv.org in v2.

>=20
> As I'm currently the release manager for libcamera, it's possibly
> reasonable to assume I'll always keep this in sync - but this is not an
> official location to obtain libcamera.
>=20
> If anyone else starts making releases for libcamera, I likely won't
> guarantee that I'll keep updating kbingham/libcamera.git
>=20
>=20
> Valid official hosting for libcamera is currently only:
>  - https://git.linuxtv.org/libcamera.git/
> or
>  - https://git.libcamera.org/libcamera/libcamera.git/
>=20
> Now of course you're free to obtain libcamera from any mirror you like,
> but I feel it's important I make that distinction clear.
>=20
> --
> Kieran
>=20
>=20
> > +
> >  LIBCAMERA_DEPENDENCIES =3D \
> >         host-openssl \
> >         host-pkgconf \
> > --=20
> > 2.38.1
> >

/Marcus

--vCsQ4LGH6sIQ85xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmPOe5EACgkQiIBOb1ld
UjI+RhAAvC0pMSfLH6i1wlHlJckE+nYNbJ5Uw2y08vVTJ54p/zY5bxm5gzmDlV29
mFsx/1DzuIufuq1KzAE5mDHozmx/lkGqgl2HG5SJlTl68SUFA5WJ9IiBz8gCbIUg
MWswICe3GGJZwh3bjwdcR3/5cGhvn92TC0F2AVqd6kc0BwncwUaFswaulp/TxDh/
nuphc3RHV4G8b7tvPR/zDbKdZwXuL2dM8xbx7ZVbveHc47vLjPUv/NQsv4WrrtwH
4Pm1+6p/QEExJ6O8CvLMz4IBhQ1wFB2FDMkpXAOw9qaSobgHcII2M+6zEL52HFAH
+oMHJ20EgSU5O8LaIv3nozA51xsGshJVlSZvvHLHKdLi1bvZ9F7D0Ro5ubvguESx
uwokxh+lOZ0oDDOethoU3A2BsaOE01Yrn//7xIb+qbde0uQP/h8Lod9QnhTnaoMK
qC1QI2tOjoKHRM46iufB6lZfaaIWhDfPgwNwlfkBbSkxggmzrTbDeloGiX7bncTS
lbrhjxUkFhlJKum61nWkf6U7sq5SmL7ZzXmyOoFvwm1ecQsTJtIAhvmY2QHewOSQ
FqHNIvxrNRFHwwbs23zzohLcVbYMH+dv5KgFu5tjfQsGnqRFCfe19E1Pyl8Xz5wA
0Zj2ventciftp27hwtVVb9ZbOeWg44P/QU8e8oa8nIiq29ylpRA=
=GRcH
-----END PGP SIGNATURE-----

--vCsQ4LGH6sIQ85xh--

--===============8191313344723733689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8191313344723733689==--
