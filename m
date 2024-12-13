Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E63FE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 08:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA66D84602;
	Fri, 13 Dec 2024 08:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05y_OEX9D-rD; Fri, 13 Dec 2024 08:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A7084603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A7084603;
	Fri, 13 Dec 2024 08:53:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C7AA1146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A11A84602
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tJPWfaECV6F for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 08:53:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91;
 helo=nyc.source.kernel.org; envelope-from=mwalle@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7417845FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7417845FE
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7417845FE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:53:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1CAD4A42820;
 Fri, 13 Dec 2024 08:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D84C4CED0;
 Fri, 13 Dec 2024 08:53:31 +0000 (UTC)
Date: Fri, 13 Dec 2024 09:53:27 +0100
Message-Id: <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org>
Cc: "Kilian Zinnecker" <kilian.zinnecker@mail.de>, "Damien Le Moal"
 <dlemoal@kernel.org>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Niklas Cassel" <cassel@kernel.org>
To: "Niklas Cassel" <niklas.cassel@wdc.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.16.0
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
In-Reply-To: <20241213083430.4121422-1-niklas.cassel@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1734080012;
 bh=v/hhdrtGJr91Ghb4JDEkvGpPvk8fDAIMzTxWhOkjjQ8=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=brzjAkOwLP5pOfSCYtHuYUAG7u8KXseQ/GRjkXyJH4zNER80nwR3YnQ4V2ZTQw261
 G9E8I5uVdxOIBMEN53uXaP1coRiRMdyOfiIvpzv6yrNAwjgO/PCQ8IMDZAVb8oqkpe
 RYeqv4mMVzKlUiuS0Qjrrydys9XYrJDj6WdpKB1YwtowDovkrw3OefWU0hf8XztCs1
 xRS//nSk2jD7OTP7gkGkAXPsELRjqfDYB+9Knclo6YnN2quHgvfefogsHCrvsie3PE
 OcU6U5NSsq+aMuvA1HooeFYPegjL2CIiYQ4L/V+2zoeQdqTl2cWYS4HbfgjjKxFqCc
 GgD23jw3qoZ1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=brzjAkOw
Subject: Re: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0652359859159093511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0652359859159093511==
Content-Type: multipart/signed;
 boundary=dc15459b790c3028afe9ac1864d95c7a0335fa2eb1671dc042c0c8c773bc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--dc15459b790c3028afe9ac1864d95c7a0335fa2eb1671dc042c0c8c773bc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Niklas,

> -Dropped support for out-of-tree device tree overlays, as Linux 6.12 no
>  longer supports building an out-of-tree device tree by simply copying
>  it to the kernel source directory (without also modifying the Makefile).

Why is that? As it seems, it is not possible to compile it by simply
copying to arch/<arch>/dts (which is buildroot doing currently)
anymore. But copying it to arch/<arch>/dts/<vendor>/ is working.
Correct?

In that case, we should work on getting support for that in
buildroot as well. Esp. buildroot is really lacking copying an
actual device tree into that subdir too and currently it's a PITA to
include a soc.dtsi for example. If you're using a device tree in
buildroot you'd have to use '#include "vendor/soc.dtsi"' while in
the kernel (as well as in yocto) you'll just use '#include
"soc.dtsi"'.

-michael

--dc15459b790c3028afe9ac1864d95c7a0335fa2eb1671dc042c0c8c773bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ1v2CBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/igSwF/fx00WYwnnL1EaT1+Ivu/YZEbPmayjv3q
JUrnU2SXKg2YqGo58SlOdsnK5MDLEJ0cAX9iavdAKFwRX8jP7S4yMIRlXdVwn2iy
a+NBJKledRJ13ZD5TmzPui4H67jEZ5q2UBY=
=gmqn
-----END PGP SIGNATURE-----

--dc15459b790c3028afe9ac1864d95c7a0335fa2eb1671dc042c0c8c773bc--

--===============0652359859159093511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0652359859159093511==--
