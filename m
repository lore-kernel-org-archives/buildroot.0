Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71775CA5FAA
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E3A6807A8;
	Mon, 28 Sep 2026 21:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6skom3BRmmD; Mon, 28 Sep 2026 21:42:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3FE7A80760
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631754;
	b=mWAPE0lAJTPukJ+TgGMyGc0yHFbRK7d3TQlSgvJwTYE1+Xu45qC/ACuWLWbhNCImrZPt
	 9tYbQ6uaGErY70KaAB6E+IPBT2w2P/T1KgR3HLKEvfNWPEnabiscyZHCt9V7phWozXJMG
	 Cr9nI6e1NJ/TigEeBA6nluWJC1OAGkbRxnrRxO9sM4s/T+x+vb8cOcJMwtSl6eUkqPyV4
	 TcJzwyoDZLSye/eEkwerTomSNjwbNHMq6WDPa9vFqnDbKg5vlYiIBgW0WiZUrdHFMTEgd
	 XFs0t6ogq+IparXMgCUMTv4sKAgZMw4Il8xA7f67j/xXP6HvnvtyIO8jrdAqJ2PrD1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cLBEyRdyak5rtpjGI56s08wCZYVIYXdqTTbGWayJPy4=;
	b=jsPXdF6Ibb6e/jBN50GHGH8YEXrifYFb/Hfr46vL/bhE5LfB58v1jFhXxqNXbyuBqx9i
	 VEwbZwUPGU94Izjw2tuCg8CuhsEK/7yczhXKqhQ0sAvR5GuNwhgWU9VUjNnq6e+DYn0EO
	 ayY+npgDY7ZC6U77TaeAsuog6f0kIqc1JqOXJAzxOEp1Mdio4sUs4VTdmd4X7meFRjcMn
	 3EhqfnGsi+IXWRW1OnS8EHAN0YXdndPGtLecRiksgpVGumyF1XGHNdwl/N7+RXjGdVCrZ
	 lUavNIph9mr+HRLS8J/rf4BmSlt6KmkVcT7hkhfhBRPnGXCZL1a4QJibf6mBk/NRRog==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631754;
	bh=cLBEyRdyak5rtpjGI56s08wCZYVIYXdqTTbGWayJPy4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kAAbMBYW+gV7bYWPSAsIBPW9hZPfobD6y7IyAUlUl8EFSmOKRTc7piN19SCwjzGj1
	 /y9tP3f/yuMGpJoQtw7P1AO2KQ8LcDjSW5JkDy1rwp4GU7NOHkzf0z2l1s/9YYJrLA
	 zlM8weQZ8b7RzEBtk6b87K6k+8zpDnHv/uoiaSI+apee5ECtJA9p36q+F8llG4BkKC
	 eMn1XL3FRnvQdTMRReo382RT99Yq6wZVvhwCiCSSpqwXjvvukl6BDMMTwRkr1ypIc4
	 lZBJ8MZ8YXNKKOX1JhbZ1cHM7QBt5qbk+Q1si29NXPNJOsAAU0XZ1kHixMPDePPqWy
	 3o3OfoJ1f1Ggg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FE7A80760;
	Mon, 28 Sep 2026 21:42:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A269C335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93ADE80760
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z_0FFvG3gKF for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:42:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 353ED8075B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631751;
 b=ICKPR3GCCpYkPl78ixB/lq1+pi8aHhSEUiVE/OzcTUTrd8IObdezVT/hB97iDS+KShj4
 nJ+n3TlyOcBfCnQWaR7I3MMMQlBpd5tXxvALk8DBsCkTJUUSceh2BpBsIPs/uMqluxHta
 skRF7NznkR4kqjmgMmekrhrGkY34qePOcaLH+j8yNrf4czjqvwOIldhReL+mqAyEOjpHf
 dP6bqkb+KBKMCT0UnXNa6X6msxj+BKU85ycmUKOiQPWhAoKPzYgfwZk5bsU46n8JFSaui
 WKQt/rVQPMgaTiINS9ZJZjm+PAFUXC+zB6Uo8JIabmI4aX/KL+L2ca32EWK+f6iWcXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631751;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ItCF21rmNfTYhfwwPlFkQryhh0tPim5T/tS6MX1MgKk=;
 b=YoG3LfGI/oDqI6eNC+otxOo/hejD+yT8vHUdpVmDO3+oCQ4c4aMHRyPQO+9uACOaawDk
 PZWbvWInQD+QbCzQfUeglxaOgdTKxCj+gGDH4Pl/gFkxdkw0aT4p54Uxt9W7rjiirYFfQ
 /mJFG6jmoIKNdp/alT3CWVdhr+jnkKhaHZIv0drE9mXqqLWeBzdRQqsdwL0DdnDG5jCYc
 641G/0tp6dT3aXV+swaKXfIB7BzQAYZ6UcCnRHvZy3aHVBwEMw2BNPuk8EYKw9m50VeHT
 hNVo6Uhcf8af/SOGMIosQyHIlOcBsOZvhieg4NpG8X8Q8KZTScWhbViuGchh98rEPfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zKTHYhkB; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 353ED8075B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:42:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0FB2A1A103E;
 Mon, 28 Sep 2026 21:42:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC638601BD;
 Mon, 28 Sep 2026 21:42:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA66110329532; 
 Mon, 28 Sep 2026 23:42:16 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:42:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arre8lj8jx80KDcF@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-30-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-30-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 29/82] package/poco: bump version to
 1.15.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 27, 2026 at 12:42:07PM +0200, Bernd Kuhls wrote:
> https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Thanks for the patch. In this changelog, for major version 1.15.x I read:

  "This is a major feature release with C++20 as the default standard"

is GCC 8.x as the minimum version still sufficient?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
