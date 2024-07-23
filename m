Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B70C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 07:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5136C60649;
	Tue, 23 Jul 2024 07:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEdJvWiz8be7; Tue, 23 Jul 2024 07:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3B560720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3B560720;
	Tue, 23 Jul 2024 07:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55201BF2C8
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 07:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A312E80F81
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 07:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsITcNTP9ZZ2 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 07:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=marcus.folkesson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9743780F80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9743780F80
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9743780F80
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 07:06:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so63758441fa.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 00:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721718409; x=1722323209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gI/PHDvDeruIXqXJFa0rUNf/XJqZgUbo5gEq+s5x4iw=;
 b=w3bYABD6RvxrAgWw8vR1jtBZEazWzZ2nh5k+dCdvIo+UmsAavK3ardM1i9EjQbnSCl
 rZCUbfwcsCDzD8QBlWMVKK3Ot6FWUpZ4R5u5U6EF/os1zh3evF+QT+MvfaajJJl7AfXx
 Zg8GiLtpJdHMuICQ5YP8V8LjaeNHdxzA3a+ict5thcfXvw5A2fR/SDB8oCLXXRwfF2+i
 aHWKz1GLeDAUr67vXdI64zyUHqv3gWpwVRqDWpc9KV5tz96PcY0DGOluB0kQbrrXp7bE
 amwOLmwgxfDIe8W1pWYfhMg+l2HLBxgBTWsaZOHPft/qNMnyABE/kd72KRGzdunb4sfc
 yuyw==
X-Gm-Message-State: AOJu0Yw9EZ2qgiV1A8cSrwhnCzOF1hFwxEDY6/+OgR+91PVzDqtr44+l
 eZ6kaLBx3oFYxS8amiSqAsnhF6la3RKCaaqqnQ0GPk2YhsQXobMJbz7JXg==
X-Google-Smtp-Source: AGHT+IFSkzyRdMGpJD7udcMG+o/FaLaQ6VrM2K3zbLTo6FZ9txrXc4nLYEWegep/0al/J9w0aUGKAw==
X-Received: by 2002:a2e:a36c:0:b0:2ef:206c:37c4 with SMTP id
 38308e7fff4ca-2ef206c3c5amr51981561fa.33.1721718408608; 
 Tue, 23 Jul 2024 00:06:48 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef259f1541sm10365251fa.88.2024.07.23.00.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 00:06:48 -0700 (PDT)
Date: Tue, 23 Jul 2024 09:06:46 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <Zp9WhgqZZdj_etR-@gmail.com>
References: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
 <172164155656.2376022.12341161125478720243@ping.linuxembedded.co.uk>
MIME-Version: 1.0
In-Reply-To: <172164155656.2376022.12341161125478720243@ping.linuxembedded.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721718409; x=1722323209; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gI/PHDvDeruIXqXJFa0rUNf/XJqZgUbo5gEq+s5x4iw=;
 b=EvQzioI1PftG9rB4gjJyiBYU2YsP2LCa4AdHCHHb3/ZkqYwtZbxs+76tvxuX8T+Czw
 ZPgcOGkjn8ffdJZcxHza/paoNbBkkZnuhz1oqdBI3zO7E/Uz2w61BsEgjR71CoXwBfye
 40wxAB9Eu7EVORnvOVWivLH5i1TRiUbF28MRIfjz5H2LEzmJN0a4ZTQ+0nTz8ymTniQw
 /zbgLnUNcL3dVa+BhrvJh2pW8ubAiSRZ0H6T6UYRnxhvDFziRhXRwxQ/fGmogFWW+vzQ
 43AzM2aEwtuNezL+Hl47Sgw5xqCi9uBrgz2JR+RfwSf1X3IQFNgpRYCpwsgfFY+er+7O
 uoMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EvQzioI1
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: Enable python bindings
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
Content-Type: multipart/mixed; boundary="===============8429744507736474364=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8429744507736474364==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QD1T6wquvp+eKtSc"
Content-Disposition: inline


--QD1T6wquvp+eKtSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

On Mon, Jul 22, 2024 at 10:45:56AM +0100, Kieran Bingham wrote:
> Hi Marcus,
>=20
> Quoting Kieran Bingham (2024-06-20 14:49:59)
> > Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
> > pybind11"), merged before libcamera v0.1.0, libcamera has no longer
> > relied on an external subproject branch of pybind to build the python
> > bindings.
> >=20
> > Provide a new package option to allow enabling the python bindings on
> > libcamera when python3 is available in the buildroot configuration.
> > Enabling the python bindings will select and bring in pybind as a
> > dependency.
>=20
> Sorry for not adding you to Cc on the first send.
> Could you review or test this patch for me please?

No worries!

>=20
> --
> Regards
>=20
> Kieran
>=20
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  package/libcamera/Config.in    | 7 +++++++
> >  package/libcamera/libcamera.mk | 8 +++++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> > index e84b8d342eea..4699e382c760 100644
> > --- a/package/libcamera/Config.in
> > +++ b/package/libcamera/Config.in
> > @@ -24,6 +24,13 @@ menuconfig BR2_PACKAGE_LIBCAMERA
> > =20
> >  if BR2_PACKAGE_LIBCAMERA
> > =20
> > +config BR2_PACKAGE_LIBCAMERA_PYTHON
> > +       bool "python bindings"
> > +       depends on BR2_PACKAGE_PYTHON3
> > +       select BR2_PACKAGE_PYTHON_PYBIND
> > +       help
> > +         Enable libcamera python bindings
> > +
> >  config BR2_PACKAGE_LIBCAMERA_V4L2
> >         bool "libcamera v4l2 compatibility layer"
> >         help
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcame=
ra.mk
> > index dfcd340b75a0..100934a97d6f 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS =3D \
> >         -Dandroid=3Ddisabled \
> >         -Ddocumentation=3Ddisabled \
> >         -Dtest=3Dfalse \
> > -       -Dpycamera=3Ddisabled \
> >         -Dwerror=3Dfalse
> >  LIBCAMERA_INSTALL_STAGING =3D YES
> >  LIBCAMERA_LICENSE =3D \
> > @@ -45,6 +44,13 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
> >  LIBCAMERA_CXXFLAGS =3D -faligned-new
> >  endif
> > =20
> > +ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
> > +LIBCAMERA_DEPENDENCIES +=3D python3 python-pybind
> > +LIBCAMERA_CONF_OPTS +=3D -Dpycamera=3Denabled
> > +else
> > +LIBCAMERA_CONF_OPTS +=3D -Dpycamera=3Ddisabled
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
> >  LIBCAMERA_CONF_OPTS +=3D -Dv4l2=3Dtrue
> >  else
> > --=20
> > 2.34.1
> >

LGTM.
I've currently no hardware available to test it, but at least it
seems to build as it should.

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--QD1T6wquvp+eKtSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmafVoEACgkQiIBOb1ld
UjJ9Jw//ZCSR3NZgw4kiNZF7naFpSW4vDsQ/ALi2SpH2beaF/NmOsVLQJzCI2e9Q
NkWtDtDJaPZkRoKSuTjgZIsdyuVfGGkLfLi3mNstwDKfWhlgHa2wPMKM4RBeyq2E
1qSqZ7ck2BkdpASJG+WyCoaSv+R4VvC4Lhr6yl8tFcS/1euV2CpEKaY2H92KhX0b
PUC8WERTklYFhw8ugkd0fSmt23Sfzqy2XSjBit/rkrhhEi+xtdf8c4L9bPe13cdt
4MW0dxSA6oVCtKA4wF2SBKQ5Q9SE76wFvI66oTOZ9de5V3ydjvVOuHEdhinmR8mq
1w4fjGJwJRRsT4oCdvDrwWRyZqvcStoo7FfP4jjKFj4KNOf6jv0TfpWWVwTMS4nV
UT94jfDSUxvPZBF0jpbiBsJiO2dlCGhnYXAiJ/q2UvY99eymbUqbsaJkZJBboFEj
v8yfaYzXKZcyWVwqiFHMEKjC5wdNA7DmV+i39MKvO4cnMll5mwrOua07B+vwhbVo
Tz3odIlk1C/YvhzAsYwMpM2qguKMml0JVoxpiONJBEM4p4fxl6nOc4mUVnj8feXR
dHXHEkV4CwwbngvBOEr90v2jJaE5Yzio4DSfLTSU6IRXpTI5pY7pbXUBasuYXmSz
75LYCYuzkp3TSe3Bdw1e6e5q91PptYTWuFtXQFrXGaDZmvsegdo=
=AphB
-----END PGP SIGNATURE-----

--QD1T6wquvp+eKtSc--

--===============8429744507736474364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8429744507736474364==--
