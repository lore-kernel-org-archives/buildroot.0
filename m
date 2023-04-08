Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCE5C77B61
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 02:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9263F420E7;
	Sat,  8 Apr 2023 02:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9263F420E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8dIjio8WkwI; Sat,  8 Apr 2023 02:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593AD42134;
	Sat,  8 Apr 2023 02:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593AD42134
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B29FC1C2EC3
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 02:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C0E74036F
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 02:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C0E74036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_S24v7KFfku for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 02:36:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75C8F400EC
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75C8F400EC
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 02:36:16 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id b3so238143pjq.3
 for <buildroot@buildroot.org>; Fri, 07 Apr 2023 19:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lo9I7t14+MLMMReA2uC0ZXTs381tkL1SNdo2L8cW+A8=;
 b=iEGr/42RGGiLHYrLB7HMjcTI2rve7HrvJKbldxKp9usGMQteLkKUWKlC3NIUtdCSZL
 OoyrUuKWQKd7S+soOC2J/IIiYQrW6n7j+Rsn1o3UH8BCLmrsZ3ogw2qRTlAizc6D8yrk
 r9OjKllfDV7k0DVEgSf7GuJNBWRYeRxjC89dn3qOqF364+DzeNoJAPN6YP9LQj4aGu3d
 NF4hbOuqW9tAs9c6JUQL55R1ZUBcWazxHJBczKCkc3G8oHdIB1R4VTD+qwCKheZSJZ79
 58FwKwrnM9E84f2Iv1Iohd254Pd9zIYAO7UinGUBy7L//0iRj4N/OdDsZd2dkJG99taW
 LgNQ==
X-Gm-Message-State: AAQBX9cOZMypoHqbUv99vkiRukxfqKj5n+UqCPiH6FvY0suHnUlvwo4A
 OApu4DETbJxso/6BxaIwZpo=
X-Google-Smtp-Source: AKy350Zj3eT9u+JBsK5070O9jvcn0BiqD1sFYcT6DZGLufwnm3b2s4UTC6nPg/N2oiN2FdJtzcpFyw==
X-Received: by 2002:a17:902:e405:b0:1a4:f1cd:c286 with SMTP id
 m5-20020a170902e40500b001a4f1cdc286mr554211ple.9.1680921375824; 
 Fri, 07 Apr 2023 19:36:15 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-90.three.co.id. [180.214.233.90])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170902654b00b001a19f3a661esm3512570pln.138.2023.04.07.19.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:36:15 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E7B3B1067FE; Sat,  8 Apr 2023 09:36:11 +0700 (WIB)
Date: Sat, 8 Apr 2023 09:36:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Message-ID: <ZDDTG7pp7KsrClHE@debian.me>
References: <20230329193028.775041-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
In-Reply-To: <20230329193028.775041-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680921376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lo9I7t14+MLMMReA2uC0ZXTs381tkL1SNdo2L8cW+A8=;
 b=nTSjN4eTNCWja7f0OOLFAn/HYQAqKETRBRS6297SgGTDIepMsxtsXpND/Ib547/jB+
 GpBSLcN6qM6c2e7t9WkTrTZJVAW2mWzvy9bCnhqpixyqPz/Hn1CMlSUjDzXQHaZ9XQwE
 4Ym2GxK96G/YmUXWEkbCGyqnF40BAyeTg3Grd8eOY7biGNCY+v1xe2kmqnrh1atYR7jT
 lYzZ12hVg/JAuptTMdOerP0F3aVuQj/PWuPMs5X+6Sz8C3JNEsXkyYLqGfQmvWcpy6/Q
 //k7fSoh/UxPEFlnQ6Srovi4rfXKi30CG2mX0K0h9HxZ5TnGnFYtRWef3djsiX/jDsNQ
 544Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nTSjN4eT
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: bump to version 2.37
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4873297749419072815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4873297749419072815==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HQ/mdyO1uU90HU0h"
Content-Disposition: inline


--HQ/mdyO1uU90HU0h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 09:30:27PM +0200, Sebastian Weyer wrote:
> From: Romain Naour <romain.naour@smile.fr>
>=20
> See:
> https://sourceware.org/glibc/wiki/Release/2.37
> https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00000.html
>=20
> Security related changes:
>=20
>   CVE-2022-39046: When the syslog function is passed a crafted input
>   string larger than 1024 bytes, it reads uninitialized memory from the
>   heap and prints it to the target log file, potentially revealing a
>   portion of the contents of the heap
>=20
> Remove patch 0001-Revert-Linux-Implement-a-useful-version-of-_startup_.pa=
tch fixed
> in 2.37 release by [1].
>=20
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249
>=20

ping?

Or has this been applied?

--=20
An old man doll... just what I always wanted! - Clara

--HQ/mdyO1uU90HU0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCZDDTGwAKCRBCNk3+7YYO
dO4AAQDHGQ24+L81/N0bMWnt+ked6cVfXMmd2nRmQFeUDu+7bQEAyl+3c3sJ7cJW
EhLHj4gihbBBmcgwni3O7JqaCz6SoUc=
=w6rx
-----END PGP SIGNATURE-----

--HQ/mdyO1uU90HU0h--

--===============4873297749419072815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4873297749419072815==--
