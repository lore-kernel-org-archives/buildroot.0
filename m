Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E072C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0276B80F04;
	Sun, 20 Sep 2026 12:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqKWe45Gcunl; Sun, 20 Sep 2026 12:36:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F00BF80F10
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907773;
	b=E3P7qol9MS87ZxpY3FxPWwZgwgrRr88AkZ4DwZaJOo4/K5DF+8wvXMTfaaQPYvUwDPGK
	 taA7vqUYTt6KvwQXc6d86i+AoIyY0HJ6HjPqaIidIcvAR2Oj0FLC2OwJ/4vxpMy1rZT2S
	 /hUrGwpSfGjKVJt0hUGRJTvMtH3S38yqgwr3tb3xBNmRQQKofMQi+o+kKw/9biaCrzw6y
	 oDFC5wOi9swuiG26jtAJEwPl52WcmL6yyxznYkHzpTAWkyD8AtOZvVUVSerdmfW3pCm9o
	 IB0qeF3REmXTNNZwWjbQGpuiFLA+gcDzA6BXTar2XdQ0UTL90qH+w8dpGqYCYg6xAiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9r9JgB8NykUYQNgvs8a+oxdYmDzSSdbQjyjZLwPaZhc=;
	b=DH8SQiBI1TZlbokhrh7TqXjE6nFotUQhVq4WKPy/nlN8p7KVVPoLEvdtSl+mmqtcY27g
	 Fwpx0qadCNRMzgcowzPN6zFCyNn+sMQ6BC+93QrTWDj8oM9tdZ72LPSgrMW55gObtjJrk
	 4pwLTEP522b1yrSBtZhAyEhdVNWETJuZ9PhVel9tdlXRK/9feAX6Z5TQUVngYiJnOqfi6
	 nrIe1uaw6GN0ZPp1YaB+hxH816aJN7zH8QjsIxqml9ZKOA87vAvXgd7+sJuL0ckf7gKQD
	 Day4jRCi5cbebni1G6gKkA10Ya0J8pYcvshlP8IuUO/9BGyIDnD9gT/9oVB+ecyDXpg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907773;
	bh=9r9JgB8NykUYQNgvs8a+oxdYmDzSSdbQjyjZLwPaZhc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mFFg12BquL1J2D1LFl4IGmRcjg4/gw80uOR5G1f8Y05zOKhzUxLZaUf4PIcZaAqU9
	 4zl8AMgqTNUDIeIs8bq6NA8oOGYai4jRTo9YHjXO1BQc0dXbXOfiYepHgoWVwzWmmV
	 rrfzhsKGsdbe+Hr4xcJo4UWqMLL3HgZtwXWlTkPOsxmDonHYVpPY3WerDepxoHbuWj
	 wmmzk+OJGU795kykFvl/7TAjN4uerDj0hyuDH7RX1L3cWhtckXqzuJxoa4MCaPA2VW
	 nmnmFO3nUi5UphXMIs3ZE9cktvaAMqWadtELBSDhl4tPbieKK5yG1F6e62hfxCTY78
	 QY5aMfjlhb4Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00BF80F10;
	Sun, 20 Sep 2026 12:36:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C743224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 526684005E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujddCWMppxcE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:36:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F0CC14005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907770;
 b=OO4H9I6oE7syxmuyKv16VQ3qoPn466gRMvpX74VusCxUP/iJv2JaiqDhng+6zORzRM+e
 YxKlJdiJfiQwaFrPQaXC3Bv1GRWfCtjbLbLQr8s01Zr9guDqJKdWS55Xv2VjPVp2HATSx
 NxXIONyyRIbdFe4Gq4oqyNKKaN4BgB4BZfVtFG6OYEgVRHftz6Xu7qeazJ9WH1NP1ARlB
 KeKsFkhDe5NSNeXf8y9noW1i++RsBx+kxH3d8JhxOXJe7g7IQZxD90JcAz7CzHHgBmYOp
 NuX4/xk32RbiU8EbhBZD9Ow+JCR9aunQH8QRLbSed+viJxDVlB/YGMLsaNrmn2hhetA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907770;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6QGjHB0YOUAongGu63bU1lISkI569mC6MKZBgYVEYwE=;
 b=ehZ+A8Ep54+/EINChV9Ti/+b5FH1Apg/5Q2T2+35vzDakM9VQOZlU103NhzOdOnlU57V
 xJGJFRfnQAzl9dydlgsQSpNLO+XedsGODJVDwez/e1rrNMGHT6xElYN8NMHpGjJ+niFFv
 n7QmS1MOuIJHOpqVdnZTTk4iphVzGpDyYA4IiqWHa0b0deFnJ0wyWQIQCjMeUSvN30i2D
 r2v6Pju6q89EFBOxfqrPfFbfIXwLLCqznM8u0OCEpP86n4nI+if0W45OSvqz5EJSof9nG
 VBjBAXyVx+oGfSd6w6lWJHXYyDQEZXQG+Ra917OKiKmzcG4K5LZxPBX/1v/bwt3Hvzw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=o+RrTXA6; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0CC14005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:36:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6016B1A0997;
 Sun, 20 Sep 2026 12:36:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF48604C9;
 Sun, 20 Sep 2026 12:36:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DF8F103282B4; 
 Sun, 20 Sep 2026 14:35:52 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:35:51 +0200
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
Message-ID: <aq_S-488vFzkigI0@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-6-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-6-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 05/77] package/resiprocate: remove package
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

On Sat, Sep 19, 2026 at 05:57:30PM +0200, Bernd Kuhls wrote:
> Build is broken with the upcoming bump of OpenSSL to 4.0.2:

I don't use this package myself, but upstream seems to still be
active. They even pushed some OpenSSL related fixes two days ago:

  https://github.com/resiprocate/resiprocate/commit/10cfb3678293b3485dc73d781428da0205b11144

Maybe it fixes the OpenSSL 4.x issues?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
