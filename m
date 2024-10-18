Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F004DD30007
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 13:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 865E980D3A;
	Fri, 18 Oct 2024 13:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQKQga8EFeUa; Fri, 18 Oct 2024 13:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9809280D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9809280D54;
	Fri, 18 Oct 2024 13:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0BD427DD
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 13:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB2540E85
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 13:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcjK8fTRIOsS for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 13:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1767400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1767400D8
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1767400D8
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 13:35:19 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-20cdb889222so21953715ad.3
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 06:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729258519; x=1729863319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P10x0GBhVw5S96WOq9VjcYB8KqUG/nbKx6K1rGc8GDU=;
 b=tV5gKzbcWGCZWijfwrseUOSrorfnXen3E7LswVNA6bEcIpqrQY1lHCt71ZZ821UsaM
 dtwCzSybl8Ijw03BxgwdqV5YAJfltUDdXbwSACYqeuQ8YzGklRYw/rA7DDFW1IYGkhdq
 HrXN66+59gvzA2Hd4NOGfEzMgI8fiUpYGxSnZmhBbTmJeQtQOJ7LZ2i+Ebf/yB/HzBDb
 6fOaUUNaBcUdZG9tI76L/j4T+GllflmuvrpyMkNIt9ZVG1qnmzlzEO4/6eHO1WbWJ4SE
 +voozpvzGCH7tkms/FMw6N1/MvHTeC/qbZOum/Cx0+WPp5h/+Ctrmf7lTxZwWkqEvR4O
 LJqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR4UpAAvtiyfqTDntvpsegDphgFh/vVM4sg2nUoDB3vqMJUBk1II4eR7NsuF0uFRhTX7q/VG1bWUU=@buildroot.org
X-Gm-Message-State: AOJu0Yz+a7osLvNoaaIWQuQF42oYnu3K0bElmnAGMw8a8xLS1/iZI7Kg
 p/tAQhAxwx9Z9EPOFnoGwi8XoXOpmkebYowar5uf7eFr8axKBYP8
X-Google-Smtp-Source: AGHT+IHgRgE0+bqe7d/12XlzbWzoUACnYzPWJ8kAoa+VQpgJTcSMRmzIWvfHL7qyIgdQ8XCFugzlbw==
X-Received: by 2002:a17:902:dac9:b0:20c:a055:9f07 with SMTP id
 d9443c01a7336-20e5a795a98mr30014945ad.26.1729258518676; 
 Fri, 18 Oct 2024 06:35:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e5a8d63c2sm12527435ad.170.2024.10.18.06.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 06:35:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 1DEE444F5EF6; Fri, 18 Oct 2024 20:35:12 +0700 (WIB)
Date: Fri, 18 Oct 2024 20:35:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Brandon Maier <brandon.maier@collins.com>,
 Buildroot development <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZxJkD8b3ay_dUF0b@archie.me>
References: <20241018043437.28475-2-bagasdotme@gmail.com>
 <D4YXO0EB2YTF.3Q4E8FN1YH9PB@collins.com>
MIME-Version: 1.0
In-Reply-To: <D4YXO0EB2YTF.3Q4E8FN1YH9PB@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729258519; x=1729863319; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P10x0GBhVw5S96WOq9VjcYB8KqUG/nbKx6K1rGc8GDU=;
 b=CzLImxwpLdCyxnw6mN0t7wx8rKb/Udynic/FUBeTxJOCfLZNbbe4pjwDE+98eeCmqB
 F2ST/IWCpFzE+Dd2JqnzjT+Gb/WcPAHCOos8M275v3E+WL/Lm3G46Whnp7t6awUmqM+v
 oTfYthvaIDuaIItRiBDFbaEwqcYUc9SHk8OKvUxxPlz/T+nZQyJwKcksMREHSdkkUpsn
 JiJjh5nGDkQjARh19UbBXWx/H0hwN8jYoig1klpu+WEThBB4jMa2xk5rz0NRVm7/dZoV
 4H3N+p/mWDjKxlil0SWbLAw/Niuf63qcGEc6aXNZAYZwzc0eQCMaP5UOo8OeTR64QD2C
 vR8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CzLImxwp
Subject: Re: [Buildroot] [PATCH] package/git: require wchar support
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
Content-Type: multipart/mixed; boundary="===============7402843759457471190=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7402843759457471190==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NolyrOmNJ9lYTeoV"
Content-Disposition: inline


--NolyrOmNJ9lYTeoV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 12:33:20PM +0000, Brandon Maier wrote:
> I sent a patch last week that did this same change! Thomas Petazzoni
> reviewed it and had some comments I haven't had time to address. If you
> want to address those in your patch, I'd be happy to drop mine.
>=20
> Thomas comments were:
>=20
>   You need to look at reverse dependencies that "select BR2_PACKAGE_GIT"
>   and propagate this wchar dependency. For example package/git-crypt/
>   will need it. And also the reverse dependencies of the reverse
>   dependencies, if any;
>=20
>   Did you look at a way of disabling building the test suite? I very
>   quickly glanced through the git Makefile, and it didn't seem like
>   there was such a possibility. But if there was such a possibility, it
>   would be an alternative solution to the addition of the wchar
>   dependency.
>=20
> My patch: https://patchwork.ozlabs.org/project/buildroot/patch/20241009-g=
it-2-47-0-wchar-v1-1-23c261a5fdc7@gmail.com/

Oops! I didn't see that.

Thanks anyway.

--=20
An old man doll... just what I always wanted! - Clara

--NolyrOmNJ9lYTeoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRbrR26Mw290jZcYHIVJRcAOONI5wUCZxJkCgAKCRAVJRcAOONI
55m3AQD/ZESdGuknZ6sDqTlUbgAo0HBqwa8nlT9lA8i35o9AnAEAwMz5hzuKjbeV
4xKaUZ/Adq2uoZp7TV21QeBtPo0MRAY=
=pBIz
-----END PGP SIGNATURE-----

--NolyrOmNJ9lYTeoV--

--===============7402843759457471190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7402843759457471190==--
