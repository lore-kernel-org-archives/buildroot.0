Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D77E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 08:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D439982212;
	Mon,  9 Oct 2023 08:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D439982212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCuvtXHgBeF9; Mon,  9 Oct 2023 08:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBEFC82200;
	Mon,  9 Oct 2023 08:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBEFC82200
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA6631BF3BF
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 08:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C110860BF2
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 08:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C110860BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqH9S-xN-ZDZ for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 08:26:06 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BB4B60BE6
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 08:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BB4B60BE6
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5041335fb9cso5340401e87.0
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 01:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696839964; x=1697444764;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8ed6zof7QGNPmIjQJ2e0POSsoPrSWEoheZdWJqAMug=;
 b=fZ3JZZjBNWFvGBu2Q8tXB2hQ1kFUS9OCsWrGAhM1j6oU6BkaSk7ezvJpWS/cRq/U4m
 Dxgv9pM+TOyNH4i/yB3utgwax8+j235VbbyFqIOx5CMfBqil0WiTvu1EgEwoE6CpSVpT
 Nb26RivxZaS+n6vgXWfV2LuVUhdOSxDZ6Is4BzuFLyIcS+4zz5BhED5Oa5Vcqwof/TDf
 t/UK3CH9vJ2yR1mtBaYY6l3s4UQpAZtEyzR314mIu56HmD7uapNvlxXhr6rOmtYWiPxz
 y+HOpj8AFywis6ALaSiq8GrvbU3z8aE1bbNMOoIgLjV33RFXVVDeV2fEDfTDZU2i3e62
 JRYg==
X-Gm-Message-State: AOJu0YyWk6NjLeZrRcJBGFoBorLKHv8hNt9+IqaeMmNzt79VymYf2pBV
 5WIXVVPPc5pWAb6yppsEFaM=
X-Google-Smtp-Source: AGHT+IFa4wqEKuIB4Aa3PMq5yHhxV3EnCx5mhO3eLDaxz8EMIKdKWmqEyAAeJ20tjy9/CHTnPAoOIQ==
X-Received: by 2002:a05:6512:2017:b0:503:19bc:efb with SMTP id
 a23-20020a056512201700b0050319bc0efbmr11708344lfb.29.1696839964008; 
 Mon, 09 Oct 2023 01:26:04 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac24c81000000b005007e7211f7sm1378082lfl.21.2023.10.09.01.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 01:26:02 -0700 (PDT)
Date: Mon, 9 Oct 2023 10:29:40 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZSO59B783UDZGL1m@gmail.com>
References: <20230918084825.786715-1-marcus.folkesson@gmail.com>
 <ZR_zgRyH8g13D2y4@gmail.com>
 <0d205f8ab83f4f387912227cbb95238c@free.fr>
MIME-Version: 1.0
In-Reply-To: <0d205f8ab83f4f387912227cbb95238c@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696839964; x=1697444764; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t8ed6zof7QGNPmIjQJ2e0POSsoPrSWEoheZdWJqAMug=;
 b=HsntczkIRrkCY6g7+JnSYrzSXgOTJwfjlYtiWo/5y9f9kJC+Vfku8B7ng90UiMfjlH
 jibVFb9fhlypBPxMqh0es2Gp0uBYaeNKrE7ol4RMFAbBS/+79dY2/Rkd39Q9sRQvkoWP
 QNxEjWTahQJaIZ9DxX/pf3IaFw+ZmWKXN3+7DOfMRcElG9m7CJzFp4yHLu+ZAFtbpRd+
 qmBhpfV4L6Vrm4cAKjeW0NmYPng1/rGhtg7ftpnemb7CLGT0TRzFFOrQx2/yfbuH7ufn
 NriIYUmiyFhr0QVrs9R572NHZDh+xSLz7lADeqAbEbAiQMaZd+sAG1Ga9VLUO7EEEPX2
 fEOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HsntczkI
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8503226608153545422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8503226608153545422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zcsD8JADDeOqUMwI"
Content-Disposition: inline


--zcsD8JADDeOqUMwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julian,

On Fri, Oct 06, 2023 at 10:35:14PM +0200, Julien Olivain wrote:
> Hi Marcus,
>=20
> On 06/10/2023 13:46, Marcus Folkesson wrote:
> > Julien, do you have the posibility to run test-pkg on this patch?
> >=20
> > I still get wierd errors (related to host-libzlib (?) ) for the
> > bootlin-armv7-glibc toolchain.
>=20
> I ran a test-pkg on this v3 patch. I am not able to reproduce this
> host-libzlib failure (both on my host system and in the reference
> utils/docker-run Docker image). But I do see a build failure with
> the bootlin-armv7-glibc toolchain in the criu package:
>=20
>     cat > criu.config <<EOF
>     BR2_PACKAGE_HOST_PYTHON3=3Dy
>     BR2_PACKAGE_CRIU=3Dy
>     EOF
>=20
>     utils/test-pkg -c criu.config -p criu
>         bootlin-armv5-uclibc [1/6]: SKIPPED
>          bootlin-armv7-glibc [2/6]: FAILED
>        bootlin-armv7m-uclibc [3/6]: SKIPPED
>          bootlin-x86-64-musl [4/6]: OK
>           br-arm-full-static [5/6]: SKIPPED
>                 sourcery-arm [6/6]: SKIPPED
>     6 builds, 4 skipped, 1 build failed, 0 legal-info failed, 0 show-info
> failed
>=20
> It fails with output:
>=20
>     /home/br-user/br-test-pkg/bootlin-armv7-glibc/host/bin/arm-linux-ld:
> ./compel/plugins/std.lib.a(string.o): in function `std_vdprintf':
>     string.c:(.text+0x114): undefined reference to `__aeabi_idivmod'
>=20
> Maybe the SUBARCH make variable need to be set for Arm, because the
> criu Makefile adjust few flags based on its value. See [1].

Thank you for testing, it is highly appreciated.

I will try to build using the docker image as I'm only getting problem
with host-libzlib, even for a clean build.

I will add this for the next patch version

ifeq ($(BR2_ARM_CPU_ARMV6), y)
CRIU_MAKE_ENV +=3D SUBARCH=3Darmv6
else ifeq ($(BR2_ARM_CPU_ARMV7A), y)
CRIU_MAKE_ENV +=3D SUBARCH=3Darmv7
else ifeq ($(BR2_ARM_CPU_ARMV7M), y)
CRIU_MAKE_ENV +=3D SUBARCH=3Darmv7
else ifeq ($(BR2_ARM_CPU_ARMV8A), y)
CRIU_MAKE_ENV +=3D SUBARCH=3Darmv8
else ifeq ($(BR2_ARM_CPU_ARMV8M), y)
CRIU_MAKE_ENV +=3D SUBARCH=3Darmv8
endif

But the Makefile defaults to armv7, so I do not think it make any
difference for bootlin-armv7-glibc.

>=20
> >=20
> > bootlin-x86-64-musl is 'OK' though.
> >=20
> > Thanks,
> > Marcus
>=20
> Best regards,
>=20
> Julien.
>=20
> [1] https://github.com/checkpoint-restore/criu/blob/v3.18/Makefile#L35


/Marcus

--zcsD8JADDeOqUMwI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmUjue4ACgkQiIBOb1ld
UjIqMw/9EOd606Dxsl20NPbM8xCou39UTt34sF561otd+hJHdK5xyDEXEIFFXiSc
zMc631lD2wrdoDbrfb9Wcd8mctd39qTrzTbSBLBN8tyvD45DXXditnla585Cd3zv
O1LeUCdAwnx6V+JbNpvS+AoPl1in3kVqJJRb3sc9vQwUcVJFS4yYPq94/VjI/2hW
hwRemjxBM4UTnp0bfFbHHsH+io1UeTVdbWGPVkFpCrvlEay9AK0wBKJ156j0YdFK
onPbWYEw3cezB22fhELzqUpC2VLmWbPeNvobmkrqEQWGczkwiID/zNbVoi63a4Kf
F48QSky/U/iw0vLO78qKcC+l1aqFdAWL9ZWMk4v+VCxkwyA3vq1sg5X6GjMY0paE
0gqqKFuLL7Xeihy0Myswgn7452+7ves9ADjUx7lLky5e45KKN8bCTfyjBjRJiYSJ
WznOfZ+apmnGh+vRZtWOrjbpVHEUdToOqd63J6wM/ZuHD8Vxk4qko/DzWobi44xo
FHicroVkAtjaco/RMaE4a3ycKpnn8rTg0SPjzeIUNhPfG/xENko5Yhgvgj6Oc9fM
yArhQ4F3jbV6geFXeeHopP5OVkkCYZk/lZFbLpfZaDbzvKpcUSmUGjZjiLhiHK6i
B58KaOryRlirgq4KzCbvhfZmw2b+vKOhvx3AAC9y50GnMNQF9vs=
=VIrA
-----END PGP SIGNATURE-----

--zcsD8JADDeOqUMwI--

--===============8503226608153545422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8503226608153545422==--
