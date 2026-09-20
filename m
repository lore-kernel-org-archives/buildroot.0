Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B75EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 19:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E646180E84;
	Sun, 20 Sep 2026 19:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35akAVb6gTGf; Sun, 20 Sep 2026 19:24:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9AB6180E06
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789932278;
	b=DP/a1hOWtyNycVtiDWw/npU4FYgoOI1Sqch9h/S1TCkTVVTXTgR3Fnof8saqPglGS9Uv
	 Uuqvw366mM4wdUik13ECk9CWwyDb14kdL6T1BP2OtOOUZVagYG1DMYbEfidVW/dtD4rMk
	 Ek9SqymFqIcOtwQb+nsunCVbGB3wKGk//znQdHWAzfEA2wdSsFDUm0WF4dbWd8NSRnETV
	 FY2LBqz/QY4DYdg381IUOMHphfplKDQaJOCLpR2f8iAxg3+f8N7Q/OHRZy8VI2G0mmxMd
	 BPDObOISGv1GNkY3DSRwz2SWIib7fiE98rDHcw2E5t5sdBrnk/dD+CEaKWnoPk1+WBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789932278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1weyzOg236hMUMUBXOEribT2qjZIaTvNu4w1nnV0LCA=;
	b=JVqqYzZGoOa9Ht/Ef88sd5BBXK53WjmRqTEIbJgJAMCSPWjE/lmU1lw1zPip5V5VCr8W
	 ZHTxMTP9VOiZLbQhnw3VCj2+iBs6HNOFtwwoxSWGqnBLAh94KZOKlJSZZ5Na2tZ0UFVnl
	 pqQmP8uZdRpylkb3zqpr6kZOfxghrKGO8I5+Q2v295mOnlhzMAC7yQsunIMOFrYCrtPze
	 3vRP9cgEJ2t3gQk4yxhqmNSudkDvvWdl4OnMHgCZLSCjBuE+hU4RW3JzttzTkSUWCtf0G
	 axYoy9BEVjL+s2zJSA/5yDGP1zNfoUIiPS5Pcjj+wrLDMmDsQw+tXt88ZjJqGpg6KVQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789932278;
	bh=1weyzOg236hMUMUBXOEribT2qjZIaTvNu4w1nnV0LCA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IvSR5qb3yD4aIJB/jD4WaQvW/UVm83zp/2pE4yfedZjiURkAW9+Wb4Q8B4kqz4blH
	 Iq0D4uuBnTa+jPiE1A8PtWWl+PauDNFcBD3z+uPYLDmzv8ZEesHDGEqKWTFRLK0QjQ
	 OYmPyqT7pU2REikB1sk3ifKLmLyEUz0zF5zqi6jkPqN8ArEMVoLeO7+R7xdDeTxfik
	 i+zGWCqItqR2Cwg+KZkgktDqIQ7ahBiG72SpcVLVlrT1JK1ru73yodn1yP2HjR+GJ8
	 PRuCDx2h42a1Tt45PTuGAffV5fB/Gl8ARyhzr7NKDcazIcehJgzP8mUBPYShBBpdI3
	 BLa82veGfaMow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB6180E06;
	Sun, 20 Sep 2026 19:24:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 193D6224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 19:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F30C5606F8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 19:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqPCjBGVgQCE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 19:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A95D96068F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789932275;
 b=j19h/UOkSG536MjHAubw6YLNWwmfZLKIqgdOWw8t5L6I1LV60Hd5likAZ28SXrX2Bjaj
 F/YIXq+lZZ7w0LinEQ6Abkneqe/svygdK5aSRl+tx1GW7IzwnlPGeCxvdWz5X//M7H3sw
 iHgfSQYOVb4T9F+BFnMEDx7OhdAoiSQizGhpLlilFtGxDOSvyCmXSA6VrJ/ObAB5llaT/
 +pvjOhBRZqOZTfm/Em80xSF5EXHSuZMz4+Za5UlsCrxW/A7gsfg3SVW0P3S+MGaRX2fZY
 ffbEvnfINgtMbsNOrLgM6GpMrBPM7wdxUjeytCbGOeolQWipd8wmRTieomUZj0HaLcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789932275;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0RjYWCaGhnyxnsNWL22FChB6/fBKmzz9ZgMiKl4ueSU=;
 b=osXRayTGZ3SUluoiGJZu1ODN2yDuN+4GjUO6+/Ft0cFApSOLp6bkJNMqK5gIFDylZcBQ
 l/q7mJObAsLDiprh4A5vuToG0gEJi53L7ZGOBbMfpk/k8g7H97L85p8DCgi0h2dig9nZh
 0+2IDLIU9nayNbbE+vWZAR3nobiQIhh4e0Lq+R0wN7qI3hyXS8RKD4CIQRzXTrBOVwbuT
 DdPUKTUBFeZh1S4LWNCRydnEM/yrCnxwVOQewDm5drR95EqqxNIWlUtQveay5hN9KWEZc
 S2NI6jpGCl7luOqhUBBAIgLO/JCLt7Lgo7cUXVmJQ7DgD34x0R6SoYT+dMANcTJTbRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=inDM0XI6; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A95D96068F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 19:24:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D8BD8C4FED2;
 Sun, 20 Sep 2026 19:25:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D4556033F;
 Sun, 20 Sep 2026 19:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D280103290A9; 
 Sun, 20 Sep 2026 21:24:13 +0200 (CEST)
Date: Sun, 20 Sep 2026 21:24:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <arAyqIJGFtiS62JA@windsurf>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 00/66] package/libopenssl: bump version
 to 4.0.2
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 buildroot@buildroot.org, Yair Ben Avraham <yairba@protonmail.com>,
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, Sep 20, 2026 at 04:04:58PM +0200, Bernd Kuhls wrote:

> v3:

Thanks for sending this v3 so quickly. But actually, could you give a
bit more time between your iterations? Like wait at least ~2 days
between iterations to give us the chance to look at a reasonable
number of patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
