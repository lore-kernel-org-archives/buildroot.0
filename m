Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77DCD5CC81
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 09:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E7E80B14;
	Wed, 30 Oct 2024 09:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqKx0NMFZT2u; Wed, 30 Oct 2024 09:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 704208104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 704208104C;
	Wed, 30 Oct 2024 09:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B902B494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 946E740543
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-8qM5tgv6HG for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 09:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7445F4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7445F4007D
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7445F4007D
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 09:55:36 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20c714cd9c8so67654045ad.0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 02:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730282136; x=1730886936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mX5v0ykDurekOPHa7VWRrccaw1ndQpWiCiBTw1t+Dg0=;
 b=tRsAPUeSZC40O0Z8hhpq1ubfZZFw0yTF6L2wfTVMHa/FUiYLZt1uyXy6iskmCZmkQz
 JYlOInhqSRlgwAY9KFAc0L/DU6sJqgcG9HbN4rUipFMY/6+y63m0alsbDNfU5u5zwyuR
 y3rJ92zAGwpWhHndtUmAJ5Ar2ZbPO5KvgZxQXdVDWD6ZADyxfEcOqLAwKDslTz14DcRj
 DqlYvDeZ+FvbM5P35R40u27kyrQbpVMNj1K4u9Zd+3/gMEpPlk6xvyFC1XpYwNWN7uYC
 Tsnur+NMuhV4ql92e44CNzYA1mFnHOTc+D5RX2t/3IfvfZk0ibZEwrpZ7qTcUIqdtJrr
 IjqQ==
X-Gm-Message-State: AOJu0YzkYxvTJ9y2gcltYdz6uWaD6b2w3qsa5dWDTz/I2zJPCspZWJr1
 sQ+Ke8CdfsWSBqIQhdu0ecP3IB3jeWb4tDsHE0VdxoyQfn9F3dqfNm/klg==
X-Google-Smtp-Source: AGHT+IGdeCe8kpVGTslQJwhK9RTGFZ9UUX8b7Slome281yZoiHac3nc7JhOV9uLIan4qVMfPJoywmg==
X-Received: by 2002:a17:90a:fa14:b0:2e0:7560:9338 with SMTP id
 98e67ed59e1d1-2e8f11ac90cmr14799432a91.25.1730282135442; 
 Wed, 30 Oct 2024 02:55:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa2603fsm1246634a91.17.2024.10.30.02.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 02:55:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 38CAB51F4739; Wed, 30 Oct 2024 16:55:30 +0700 (WIB)
Date: Wed, 30 Oct 2024 16:55:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot Development <buildroot@buildroot.org>,
 Brandon Maier <brandon.maier@collins.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Message-ID: <ZyICku0zbnvGpGB9@archie.me>
References: <20241020092527.734923-3-bagasdotme@gmail.com>
 <20241028231334.30d80be8@windsurf>
 <321d4dd3-10ad-48df-8155-27bd529c590d@grenoble.cnrs.fr>
MIME-Version: 1.0
In-Reply-To: <321d4dd3-10ad-48df-8155-27bd529c590d@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730282136; x=1730886936; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mX5v0ykDurekOPHa7VWRrccaw1ndQpWiCiBTw1t+Dg0=;
 b=idyS0Urzo3IzsliQ2AK/91imrLbVwVq5eTSSzMCZsfwKPiPIZStKL8N32qLajpp9z3
 UMeoxdRCNViGVf2tsAgY+Py8B2RrfwIhjGsIHqeQxrs6C86zic8BV7/nM+VhY7nnQFxp
 8dPZ/lH1kdXDdr5c1YZYfIKPP0Tbz11YY0uHJlQfN9zapneySDQmY13A/TbmBjNr9AM3
 PHiP3tgSErO5LFcVkfM7w2uQ8Lbpr3HyTpslRsTL23jQYcUkejs0/PriyS4k46YpIAeu
 z2orH9925tiTJTzwHgIbnuRsX15kLrGJ9Rf29e88j9u94qHhugmbsXvM3UtP5cNEaOzs
 g5vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=idyS0Urz
Subject: Re: [Buildroot] [PATCH] package/git: fix wchar-less uclibc build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8408135566291522122=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8408135566291522122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="79ZaJjNTuFUVzvED"
Content-Disposition: inline


--79ZaJjNTuFUVzvED
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 11:39:49PM +0100, Edgar Bonet wrote:
> Hello!
>=20
> Bagas Sanjaya wrote:
> > +Fix the build failure by only using wchar_t when __UCLIBC_HAS_WCHAR__
> > +is actually defined.
>=20
> Thomas Petazzoni replied:
> > The solution isn't really nice, because it adds some uClibc specific
> > logic.
>=20
> Indeed. Note, however, that the patch is making its way upstream:
>=20
>     https://lore.kernel.org/git/cover.1729506329.git.ps@pks.im/T/#u
>=20
> (long thread, search for =E2=80=9CuClibc=E2=80=9D to see the relevant bit=
s).

OK, I will pull from upstream instead.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--79ZaJjNTuFUVzvED
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRbrR26Mw290jZcYHIVJRcAOONI5wUCZyICiwAKCRAVJRcAOONI
54v1AQDMpmlKPn/v2Vd4dJfta0FWBNmNs1feW8K/Fqre42KphgD/a/sDtpl3R6YC
dZjDdLPQQclrU4YayVp1uf/iLh8bVwc=
=3ooe
-----END PGP SIGNATURE-----

--79ZaJjNTuFUVzvED--

--===============8408135566291522122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8408135566291522122==--
