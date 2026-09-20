Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868F6C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 433DF40611;
	Sun, 20 Sep 2026 13:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCt2Y-5ot_pH; Sun, 20 Sep 2026 13:19:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 68E274080F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910377;
	b=lEXqPAvnNqr4iaY5+TJz4YLw+voAuXSTQJMLi+E8POHe6XAfhWpq5Xhb1ccPYEJzFPcc
	 5rqXyXEShO/tpLHyKImuVuY1eG6gVv+aY/y0yPE3REQSv6ZQy2oYAXdG5PCkWgW9pS5+x
	 LuDly/8RaEJA2fKIMVhHow548ith7TNO9UeYBfGZauvTWM9C4BbzLORASUe9yrDbcIAni
	 D+ZoQJn0L2H5q+k2flAwhgYb8XTMRQ6xzFX/qU9HebU9zxa/Y1V19N9BqzgJ9p1qZm0rA
	 QGYnuMwkxWwEALeZWk5Hcb2oBovbH23S24WgMTHGDaf6EejVcyRR8Av8gWbIaU3tvCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910377;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/FYo4Fydg8C2Q9dIrK8bWyAjSfnTeZWrEllKG6eE6Zs=;
	b=OxSHEcd38R/zOH6u1mAzhUEr6ywsqREf2ZttO8DJ0esqMznJLadB1zIY4uGdYNltgkQU
	 Qbv/Y2AIm8Dk75ow1yO5nGNNNWWvS+XzpocOMnvMwISXUtJO+riZpoSXvC59x2m5azKBG
	 z1nZzgxn+yHIVl62Ofyq+HnT+sx2BJdjGdRc45xlYK96qcuvyXKINdXxrf3mwND2KkkFc
	 /QfDYwxH9oSYx9Qq2zA6JFPZMlDe8P4spieqmoXx4EqTPcbucUjZco9GoC2Iv9dGgzWbq
	 MatCPW3a5kizJyCg4LBi7gSWwK9i4RIMyRpASXG+JhdxTpBdit1xDScPiqLLgfzFDew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910377;
	bh=/FYo4Fydg8C2Q9dIrK8bWyAjSfnTeZWrEllKG6eE6Zs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TJoG4RsXBYNoCl9CcE4N3RpifL6o+63nwdgt8LWXoJNIdCNkkqLBcZzg0b1A5lI0t
	 aio32UMOUIw15+3/BP29bF0StMPbhkMgJy0GL5M2j/Vbah+KO6p/n9A67OQt8cEmuD
	 g04pefNRQPShHH+f6LPUkUXO7I6tyQMr0+voa3gCiWtdFH1dLQ7YHoXDDonOFBDOMD
	 icSaUj7FyqfMuyD/JhP87zDVYjrebfM+2gsarwK1gphtDPQUXNYqMxASMRUkreJexN
	 So/HycCOzcpC0inQkaWX13IJhpsNNcps1D0NzoiDG3UBIxn+HfVOSGbE8JA8+hnCOb
	 84ggJJcUPzjEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E274080F;
	Sun, 20 Sep 2026 13:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A804C371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A75C400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM3zyeZP5zoP for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B402C4005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910376;
 b=qxPV38xf3x1O1GdKII/7zSbv+Y+m2u9nnLa77gI1jOrU9JGLI8iwAH8rdHzRGsTXJXQY
 iq4f1RCvjZxUvEqI9d32FBb6wS0gPNWcrqLBheNWSqwNbsMwSzpIJzHqDii+UYw2ovEf1
 GNaGCQR8Bm1VqJ80DVoAnAYAPFgcWjx4tO587qND3i4ln7fO9zqAmhNirpm8uYZeuvmtU
 +zG9M0oSbAkfi7j3GpORekaU91p2EUTAc1XRCvMDH+tUNvHYy9c8L1gwXlx8jXuXbk73i
 GrxuSRfRYsaVg6suxjmV1IoKbCxMqfh5b9uaxAIlcHyilOo1MVBCe9vuJwBOVtzcH/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910376;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Hg3XmwTEVp+Mh6ywkD78bp3aTFQkd0Nnc4Bg759wZPA=;
 b=Bmf7Y5+EJgwz8/a6KXEwZ27yP5jekANBDmIcy75ViNwJWZvDBEKiI3KF0w9Uems9LsdK
 Zdjh/uIxwBVhnYu928Fv3k3cWhg0n9fYHTPDOTVYeGApfocz/0BJzhKu/o3mh8JLDsnMh
 MDjLU2NeOHwErUDYpP6K+jyFdqg5m7RY7AyjbYWr2az0G4UA5YnUQq08sqWBkcWHkHTav
 +ZZZlusnlNw/k+c0J3lZVYz69i2x5ltJ0uHxxucS44THGIK+VSdL/12Sognpe9arz7b0v
 KLMQCJoGwGGb0nfck/xeVj2FEawRZK0G+siDjrS+5rJWfCg9YLAiTOl1cFsTW9gW9SA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="VoOQ/6v2"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B402C4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:19:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6AD4B4E40917;
 Sun, 20 Sep 2026 13:19:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CC9F604C9;
 Sun, 20 Sep 2026 13:19:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D8EC103286A4; 
 Sun, 20 Sep 2026 15:19:27 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:19:25 +0200
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
Message-ID: <aq_dWoekqbCRzbX9@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-20-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-20-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 19/77] package/ibrcommon: Fix build with
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

On Sat, Sep 19, 2026 at 05:57:44PM +0200, Bernd Kuhls wrote:
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
