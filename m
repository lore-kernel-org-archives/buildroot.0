Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85793CA5FAA
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4212C40519;
	Mon, 28 Sep 2026 21:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRely_aPwFc5; Mon, 28 Sep 2026 21:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 50D50403E0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631665;
	b=ezZdswp2iD1ODU12S7Emj4BW+tAGQ8LQ2tU+4EIDKTdBDg+jiEnuUpCxbaiB7rTTxgz7
	 XNQRRyVqzE4jSrBSL49mr6rdq3yHklsnzmcHNWpx7lN2qQ8XA+T2eNa1id5AUvNOxujNJ
	 UvTiG7lMwLpXXY0qjU44C5pJ4HM+cKzbywDs7Qm5eW86Ctoa7VB4+yI6LO1VN3LdC3gLA
	 EFHtVSxijnYPzeJBGDU4AM+xXg2HVGEIsqvI2cN/QqSZzXCaEGnc16Ygh2lsN0uoNg2HF
	 MmkhAf2UCTxK4/L6KMUXdKG7LDMN8ypDSch0BmreIWEL/4OQdGIvFk1vmFFzTYt9Jag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uQp12e/AStvjS0GEmoHxiBMDmoYPXFp2EUKVnLIKwTc=;
	b=gXqglX2l1xFnIemnafcfJkLSAWjb5+4Yp4adf6pua8Wif7vTmIBbVBO4NBj2vvqME/hn
	 NU8kdbd7lnifTAl0WUNpQmUb9L5XU6k/4OdO3YN8jP+pVCfDN9BQZTJzD12ABYsBz5HFY
	 luxyD8lVm9UfXzHosHovgTsBMurqSPjMaOTlgrMGMcTeub1RCwwb8pY/6ig2FOl+hVB6J
	 zXaIpGL0FoUoPgiWfjrHViY5LF+phEi5tNCS6w01ux8kj52w4Q57OMxOmMJisuhmDXPdM
	 r9KPMbZXL6rIt7YA9Ovor0ygjNNaGJKDlMArgbD11z67Tx9p7HMgHF+N2/5gRNlp0iw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631665;
	bh=uQp12e/AStvjS0GEmoHxiBMDmoYPXFp2EUKVnLIKwTc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GVoyZkSiMVIiUC//whaMqmSZpENSuGZ5PCkH/pSxnucqFiwWNtIpl82+ybESqi0LK
	 sJukxjUKqIvsA5KMApUX0fuCLZ6U/OsFbFWiW0lr/XUFuW2qb8SI0iXEe2UofzXFyk
	 7x6SkMeIqoAOEi+xgpA6gHquc5W9S/XTRFgiVLtrvy79Dw0riZ4M84Gry0/fxc7LEC
	 vaLZ6ClTua47gpbBLnWtsW15jqPW+i0Fq9dJOYttiKbK21GwARHWQVc5UddYWgn4MT
	 DOI3MlOGO/YMUUQNQu+Vl19snEjqW3Xfa2sh8eHlKBhBhyvqnJOkyOwNz3DGIUWVSr
	 ZwA4ACFaCORWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D50403E0;
	Mon, 28 Sep 2026 21:41:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 335C172
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198F1403E0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TK2157tO4lZ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:41:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3426B403C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631663;
 b=SU6/ilZqPu1+5g55h3Oi7X9QBCwkS4GXcDk9+C+bnHy3/YD75IijVvoIU9MgxNhejEWs
 SRHdUAdThxUMw98kJ82lMxz1Ojr+UAMbagMTLbOiZqCU1hkdr3C2e1WHglHe7j93fdPvi
 HHH57gk+kNsAFrDxNsAYyBN6sqET/FV0tQqFeJHOw/EBzZwkL8RObVF6saKyl+d42Ey/O
 x7sj+iyOnE7hsyFQ9xEhFEH80huY3PpV1O0PbagBlqDCzVxN9n898x6mXI1maeENwErk+
 fU+LH340NwuUbYJktpi1Py/2SfXIKg/fP1roxS09oV/9EcpaTycnxAXP4VtczNuWmHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631663;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OqVU4/DaecHVCBhQ8PehdHYzUpCtCquOTlio7n9Uv0c=;
 b=ldZe+yIZAC3L+1v7dafBnm+fP3yKhim9VcTfhipGR47AK5QKpTa83m1iXi7KzIxak7QZ
 OcSABFTJ7Olv5FjiBYeOh6VGlbpb7N2ppIegRXyX0fZTXm4O31DTG+2f4NM3blOkScZSF
 I5tBDsvwEbfSkN4TLAd8HPhqx92lRm9mIe2q22yIKjLtCepRrqQLKP7pzhSa60na8KCiu
 fFb5WmQ+QqVm1NQbm8R0DMaTXVs7oDYmcAkvciBcpB0PM7aK5aKI3hwz0khqQCcMHA85d
 /xPSRJNBIwBsvDSQ2iC7GY8uLKSMlC3CiwGaOsIfqbMjc85oYmJcO8L3l3x8WQ28plA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hzawE96G; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3426B403C8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:41:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E60324E410A4;
 Mon, 28 Sep 2026 21:41:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D1F6601BD;
 Mon, 28 Sep 2026 21:41:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87637103296C4; 
 Mon, 28 Sep 2026 23:40:49 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:40:49 +0200
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
Message-ID: <arre2qPfku08STQu@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-29-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-29-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 28/82] package/poco: convert to CMake
 package
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

On Sun, Sep 27, 2026 at 12:42:06PM +0200, Bernd Kuhls wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Currently when building with make, the cmake config files are not
> generated. This leads to problems when integrating the package in an
> application built with cmake.
> 
> The CMake build system links the PDF component against the system
> libpng when POCO_UNBUNDLED is enabled, while the legacy make build
> system always used the bundled copy, so select libpng for the PDF
> component.
> 
> POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
> defines rather than CMake options, so pass them through CMAKE_CXX_FLAGS.
> 
> Poco is built as a set of shared libraries, so -latomic has to be
> passed via CMAKE_SHARED_LINKER_FLAGS as well.
> 
> Disable File2Page along with PageCompiler, and tie the ActiveRecord
> compiler to the ActiveRecord component, to match what the legacy make
> build system omitted.
> 
> This patch is based on this one:
> https://lists.buildroot.org/pipermail/buildroot/2026-April/801019.html
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
