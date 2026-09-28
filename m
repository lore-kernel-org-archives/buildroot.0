Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C492C9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 12:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 104BB80CF8;
	Mon, 28 Sep 2026 12:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA4lPkiDz7eY; Mon, 28 Sep 2026 12:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F1C9080CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790598798;
	b=XcpRL6G6a19Ur/0RQ/vb9hrWijLvbdohRTHzGvVceDKiOpXmLPRtQEtM0VA2VFCJu4W+
	 NkQX3HXQmYjaPFJGLTjLaQpBFklMJc7SJ2Hrw+61CDhFsZQOTVY1nyMFfqFl5P+jiOh2P
	 z73/KfwnT6GKVMqmG1uBtJjZ0yt+TU31XXH0MrdARbAUyS37Sv3AVG7IWKqGBT7caazZG
	 mM3P9LjswSQNECEH+xDlV2/fZpak9UsPBE1SbSVsTpb5jq4blSg9qJLpo1xZOgwQ+nRIo
	 3HTR4cPQ0RkHvdD2sEQfZ8ZXi51EwU9rkl6nd++E89qCIuHyNVBOORCWe4Qv0zNB0Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790598798;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IBU7nncnoYIMZYlVPMgXWCzCsBnlKqlMjICIQHbu5CE=;
	b=hd3lYLfR8P6pos4e8aiFeoS0FLomFssUUp02cVkfmTh8E5XkR3OZGzS/vqWRScaL9fxg
	 e+IJkSTKKqgnAAiAw8TlXcydo1KwUwjvBvqsm43T7ZfIHGxqx9H6JTXyx89J1bxnszSf8
	 +LshVpGNUos8nrjc2N2rG5WOlzBuaNcfT/Wp8sg1CLnOYMVEvqm0V3K1dw94OaAeDmD0T
	 qLUXNP7LfaJE1QNUiHZ/kmGy49Rc1PDNPyarATU+wosZTP8Q0ZayysqqD5O+70hdXvcCB
	 BDJtupW8yGN5jkudWgTLWOC6pUlHLdByG0eF8K750hjbDcv60cnR1Kf9AGDl6XbuxEA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790598798;
	bh=IBU7nncnoYIMZYlVPMgXWCzCsBnlKqlMjICIQHbu5CE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FI5NrOxJ4iA1oIMc/ODDukHQo7Jl/mUbURWd0ti3010xFk9h2sADsNgr7i2vFObrf
	 60qgAr38SkQjUn6dt65bbzjYQ/g6+CrP3mOKROxzjqG3IZGFB1fg5TH5/gKCMcsdwk
	 LAulHjO22YPe5OlKwHpS/lmwkiDH3IJLH26rkVZwFlYaNogf2v76fn24LzwObVJrNr
	 1flBxZivOfbTMm+Gp1o7nadPw/79943vm2cXb11aHqQcxThc4k1PCD0DnH96Sp/e1/
	 DZGOdtEsJZVq8S7qmGOshMM49YPGVkyWB5dP4kZCXqaKByCvdVQrZaF+g9ihympYl6
	 F7z4R0RN/F6Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C9080CEE;
	Mon, 28 Sep 2026 12:33:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBD5361
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89566401CA
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mb-kR4df4no2 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 12:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1D30D40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790598795;
 b=n5z37qKQ09iiM7hZsAXPAMO2jil2Sfw9LA4vI0Im2u2NuLVODmMmuo7v+AnUUmhaQOXe
 88N9pPXdkxng6KEKf7tKm/MutIL2jweWs2GOb8XH4vcPB4noWfX+uMXtoH4O0dsCBhput
 3bPUGnLUCb9qdTY0/3FnXGSH0vVuO3dj5BJfD94cjHxipzymQVA+byNEgVxPHle2koHJW
 0UqKVUJ7n6VTflXLMWDJQSgjJtnq6sAE7YeypSnXgTF1ixkgrTSe5T+WEz77Hebif83fe
 4yh29tV5I0bpjwn6nLdldrhOz2rMYjy1HL1JGsl5ZLOgbMz12a0+rCZ2EXRAF30fa+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790598795;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MOUBx/scu6VIycwoiMrT6YvCAt+Y0LN+1fHfPi2cQ70=;
 b=FWObdR4pNglusSk1hEdnC8MqfjVn6ZTERJrKo8LylQ4eLHEKVpNMf2tT7bQmacT7dCo6
 Oc85h1HhReMLDjRk59iBc+3d3S8aX2aL19DaQwlQ301vvx3igDHZa+4axOPPyrkVMHM/o
 /k39jUB8G0+b48M6Y2cPvlrrK1ObuLUvEvlQIVHa99DFeqX4uN/2zJEa8QdcRfOwwYKDR
 mFYquQNsOqYqjXT+/I8LpAM6m6xDJ7n+QnMET6C5DQ9cwDrBtXcdme1At9Uv6ljEuOly9
 tAu3zbUoGueloY6Q+BCpLdBkZYtkuFLUbs0nRyrE68H1DcVzLKhi0f6ddHBi0PP+23A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xonVxBkx; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D30D40024
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:33:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BCFBE4E410AB;
 Mon, 28 Sep 2026 12:33:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 71DC6601BD;
 Mon, 28 Sep 2026 12:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 513DC102F1EC9; 
 Mon, 28 Sep 2026 14:32:55 +0200 (CEST)
Date: Mon, 28 Sep 2026 14:32:55 +0200
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
Message-ID: <arpeb3GLaNUsHAPn@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-61-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-61-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 60/82] package/omniorb: Fix build with
 OpenSSL 4.0.0
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

On Sun, Sep 27, 2026 at 12:42:38PM +0200, Bernd Kuhls wrote:
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
