Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67708C77B7A
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 06:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75C66FE80;
	Wed, 17 May 2023 06:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E75C66FE80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksHdp-Eome1N; Wed, 17 May 2023 06:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38AC2611FD;
	Wed, 17 May 2023 06:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38AC2611FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9668E1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 06:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F613611FD
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 06:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F613611FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xzFwGkGBiy3 for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 06:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0D0610F4
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E0D0610F4
 for <buildroot@buildroot.org>; Wed, 17 May 2023 06:46:00 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aad5245632so3530885ad.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 23:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684305960; x=1686897960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgJpdDgLJ8rs0AsTgOjq7pa6tM2EFk+RfMWKnT1JKr8=;
 b=jQSTCMzxceCzKSSMYBcAvMNKjOE41YHSLr+dh5On4FEZO4GTfhvwvDgxxX9uc4kOnF
 GyNiK7nQlrjw1h+OC3vtoCdxS/5MrxqnG6ANV0ZanqBeFgsjHF8FQno2JsL0wAQjM/Dp
 5AQ9Q8loFhoab1bDbLJdYkjCceKRn3Bkiv7/2od/QNkX+Vaa9p76I9HZIIFA3zupJqfg
 Qk3OLj3YqAHp0WAKjYPTlv4hdnz+QFz+9vUnMSrAOFfsYGsNNkIrZC3D9Cuf6y0Tz+jm
 nYQtcDUFqHIhn933A69F1h9qNzIIx8qYZCqeCUoNDsa54a/BiGOZbRBiVxgG8EwUpOwA
 1HnQ==
X-Gm-Message-State: AC+VfDxM4u7uqTSzQWr+2em3Zg0ZorLajcsIKvbaX2kj9TnUGRxqPLMe
 6OLEqYuH4HsjzmyXQPnTOQaGGGMGug8=
X-Google-Smtp-Source: ACHHUZ6IoLN8FTwE2dD8e+CyCEu2QnOBkXpz6fIqtLx50w1+eNTGxWrQRTf3Z8UuQuYKYXLCCYs6Pg==
X-Received: by 2002:a17:902:e5c3:b0:1ad:fa2e:17fc with SMTP id
 u3-20020a170902e5c300b001adfa2e17fcmr19498878plf.2.1684305959898; 
 Tue, 16 May 2023 23:45:59 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-16.three.co.id. [180.214.232.16])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170902988300b001ac7c725c1asm14813836plp.6.2023.05.16.23.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 23:45:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 82EF710627D; Wed, 17 May 2023 13:45:56 +0700 (WIB)
Date: Wed, 17 May 2023 13:45:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Message-ID: <ZGR4JPCvobetfREP@debian.me>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
 <20230507214317.409305-5-bernd.kuhls@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20230507214317.409305-5-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684305960; x=1686897960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rgJpdDgLJ8rs0AsTgOjq7pa6tM2EFk+RfMWKnT1JKr8=;
 b=Gsc/nmx/B+rM0KNKppafUkfIY6y7AWZqkGrcbTmKJgQamHbxr5I0d+McDShBqC+Woh
 YACkzQthMNDmDFVHEOUyPiSEi3IgKlUi8lSIkhPD7Q3ZRcA2C+mNm8CV2FWehu/xZbKz
 H2pm+yTm77YeQUjZJiITQNtSBzRp3uMxTivErCu4L53dFYLjsaWh7oBcL+1NwP29cxQC
 4ikJEl0fl7909yYua9Bk83oZAdEjSaJ61nXUm306PkyMU0sJ0GCu9I1K7JhveXFwUvWN
 MsOeo7x3sBlz4jT6D3feK7SSa21hqkteFhER2cxjxE3qzS3D4mqb3zc/hPZHhDm/vdD1
 qemg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Gsc/nmx/
Subject: Re: [Buildroot] [PATCH 5/5] package/gcc: add support for gcc 13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: multipart/mixed; boundary="===============8952826064101562368=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8952826064101562368==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XpyVDDAMMiXB7VJC"
Content-Disposition: inline


--XpyVDDAMMiXB7VJC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 07, 2023 at 11:43:17PM +0200, Bernd Kuhls wrote:
> https://gcc.gnu.org/gcc-13/changes.html
> https://gcc.gnu.org/gcc-13/porting_to.html
>=20
> Patch 0002 was not ported from gcc-12 because it is included in this
> version:
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3Dee4af2ed0b7322884=
ec4ff537564683c3749b813
>=20

Toolchain successfully built and so is package/git with the toolchain,
thanks!

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--XpyVDDAMMiXB7VJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCZGR4HgAKCRBCNk3+7YYO
dP7bAQCgcYDCxwYptirDSN90vaf7WyB0QvUAVImSrCdMHHdtsgD+JbCleBKLONyr
YmjFAX7ZSBb1wavHDNTjWQbYQUI+Ibs=
=Wazw
-----END PGP SIGNATURE-----

--XpyVDDAMMiXB7VJC--

--===============8952826064101562368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8952826064101562368==--
