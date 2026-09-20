Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62311C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5210E80F29;
	Sun, 20 Sep 2026 12:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPl2Mr0yRTuI; Sun, 20 Sep 2026 12:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B3B1480EF6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909028;
	b=M+yVYtcrxusVrZWbVnixwyOfM5WQy/BDj5PWD/uneU1VZnpv0WqkP3Qwind1c9MQ1Tiu
	 alur3FUPn/K3Bzz7/xFKVxBiHvM9kzJbBl9c1DW+ZzZEu6JQy/jszSnERytZimjzhq0Dm
	 Kz2OnX7x4+/w4mPaRnnId/SveWjUcA9lcuTlvmLZqTQyIneDSNt3VPxvtJuIy4y1jxw3g
	 VvKnV2PhUUsjMo/cVuPJSJ+rfH5Fjie7OjoyzcUoa/IeoVkOLcMoLQW8P08gTOr04gYV0
	 VFl49BX0lPEfl21fq5vQ2IDxiDbJK1tOkhIPd8RyOxTjqO4eWjLz//ceFwsFZXOHIZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909028;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YmM3+beye586abXSvOc5kH3FwYf9L2MuBdz23p0km8o=;
	b=Po1xy3ikNQr074laRS3LyvFW0AQQam+E0bNjGvRPTb9VxDbYujHMwDEvgAIP92aYXMw2
	 i/nGkhdLFc8/drNubyu47kdHLvMpO7+VMzkmuya6q51YFknwjStqM4XLTX2hf3FBBzgJC
	 +Yor7YL/r6yxs0xPtB5mGC6M9p37uO1OPkxWcBd1ACho1otFGpzbWpa2dglsm8/0YirTp
	 jpThzRUJd5q0utRI4VzXmqH4fEow1DHQX5wvouUP69oPaZ1+Zyp/ceG+nn8FYHxQ0+UtC
	 LSopA68MmvQ4qtPWFlJHn7+jklf8241iRL32WOvjRuD1UEKZCVc8LlVW9zC/rvX/Wdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909028;
	bh=YmM3+beye586abXSvOc5kH3FwYf9L2MuBdz23p0km8o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O8zyjC6mdqO2dWOgsqFmPvX9v2nSFNbmiULQue7z0j18ENitca2n/e0Vn2vI3I8/U
	 Zb30DeZVqXV29KSkh77URHY9Dkby9d0MoaT9+y/FlE7RpP0Q5EFsTp+LnBcQ9UGNxl
	 m1Wxuz5OR3NB5Oo8viDFd0PSTXVt5iRj96yNmylAn0RCrfkRXEbya4pVlgXL6bqUWu
	 cUldAa/BDGNttJIOVUrN9uz8ISnGfgBfdu8MvZ2kyPYdGZn3+xqWxzleHkkNEwZZ7V
	 qr6ivjQwTOhKWqXvO3FNXgmGT7wE2VxnYgYjfSVWO6qktrIaL4Hvdk513IlbsG8Tga
	 vUqs57MNNVZQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B1480EF6;
	Sun, 20 Sep 2026 12:57:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7EB737A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC6C400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATot89P1ZK_O for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6F7E04005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909025;
 b=nENLIEV69ioZBGt5pxlZdfp7mD6rJevnaQ68wBQu31j20K0m0qlBN/LfWjDe1durd72i
 u3YnNeOGpa/ldY7pp7cKBsCw7wV0wSd+BZA0YJLw8gUMurs+fRncYWWvncjIKRT+yQJtm
 O5vjIZ2fBW3O5+mWZe2cQFivWx3zc+63w5NY2MM1lbY8YTGWRly+RpWeLMFIlAopVYw0H
 jC0V7i97v9x+6wbJowGNTJ+fOycyHDGG8JNkR7gq/W3iiZ37EpQLdkLKfwJ/h99ePlcsB
 F2iFZhMtp8fDK1vmbd1XH3meh5/+km4mV9BeMAIEydtgTY9PhbfgpuZc/0dKCAl3YGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909025;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=p5Ri6jlEh5Aby3ezbfvbh96GphiVbCuJhK7+xuZUHPg=;
 b=oRpec0gKLtQ/cArsrhB6RNRWvGA9++aMmA7jpKppDx8dH0r6woeF/w/hpn0fYSNqdFMI
 eU98iRfr4qp1fEyqgHP1fTqCcAtCHTDhhNr3P4eeL30cNCCxNtxGqRYSVrJwRzNt0VxUC
 XD7tfWl2ncrw8yGvqtbXF5e/UyBiWT4KfgxeWO4Xv+krifx+XdyLT8qWd4WbdiwB1vC4p
 pv1ksu84xcxUieybt1jt3dzFCsQcZOmZ1Jt/YdUTlMyaT9FgPNs8XqmbrTqRqHx8JCqYM
 8po9+9zU0H7agY2rHpou7GyV5WSo7BXkcJb412arh/amjbQzVMyhfY3r/8G2mpq2Dgg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=E20ioBmA; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F7E04005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:57:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DC0DBC5CD5C;
 Sun, 20 Sep 2026 12:57:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 034F0604C9;
 Sun, 20 Sep 2026 12:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87B771032829C; 
 Sun, 20 Sep 2026 14:56:49 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:56:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_X4cOrXODsCUlW@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-9-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-9-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 08/77] package/jwt-cpp: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 19, 2026 at 05:57:33PM +0200, Bernd Kuhls wrote:
> Needed for domoticz >=3D 2025.1:
> https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb2734=
61bdbf50a82
> =

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied, after:

- Adding a gcc >=3D 4.8 dependency since this package uses C++11 (at
  least according to its homepage)=B2

- Adding an entry in the DEVELOPERS file, assigned to Fabrice, since
  he is listed as the maintainer for domoticz.

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
