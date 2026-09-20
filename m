Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A94DC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D064480F85;
	Sun, 20 Sep 2026 11:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQWl_cIESh7D; Sun, 20 Sep 2026 11:48:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9EEBC80F7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789904894;
	b=jcYuNZ4x1Auni30eDWxw11LidubmDtQntZDP3YsiT2gROuaXtq1+6LRO2+EimJhQ3VNf
	 39aRkULTCWQlb2PUuqxfNbm0EHA7OLqk6qOiPZokY27m7kkeyzlczki8EI0LK60c5Vx9M
	 PIHH+/nKVn1AP87VfH9f+eqhED0nves0Zxl46fxRaYQd0twtFO6t/PcBHHU0N0Km5xarn
	 2ajKwm/XN+cKerDydPwTZfgBK9MSLVj00103fXi9Eg36cWWDuLtftTckzunKLJODK7SNh
	 ZwjH9OjMY4WUkDv+S6cOI6IZ33/jPXRLrksSAvSHA9WIlJMponvAqktt9Dr8Vz9XN/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789904894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KmU3/sh6afv/8RGDzI5FflawfzQ71YfZJeQlKhywSxE=;
	b=LsXbQcwjq1Nb4hw0sQJQPBh7zSx+mmfWRQ4gHfXz7DSQ3h8MjArf0ixjKVew3qAsWfnl
	 eJc30M0SAVpQsTLi9q+RsyinbufP4ACYtp3eY3dJ1s7eE9YVY/2bvFj+FQVfrv3oCQrsw
	 8Hqnvld0kc79Fgg8+x3UhZ5YhicG47Gdm95hlylYGUNqwPTNpQAIgY9HjjQqyz34NoStc
	 UR/sOrrOqolYFCSwSC9plBO4//O6/08RO4iS9R3DhFLFaS/DPXOZyRxWfeMQgU7Y0kQEj
	 vssov8tfhPsMqciLLwXUb9YZ71Y+k5f8fI9Qu1LGt0NdIYQI8+DzZ/DJYDP8+Y4j4eg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789904894;
	bh=KmU3/sh6afv/8RGDzI5FflawfzQ71YfZJeQlKhywSxE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DT+3Z3yepVxDWtRdnz+7S897ZE3FaN67lzXrYyBZSXkxs62u8TM5GkhYn64J0UM2/
	 602ndvO2tvixzfGFY9mfyb8J4vt2iSJL+rzZw1ycr018WLpHeBO43RIS3+w+pjDDLx
	 Sj5GMzJl1qlWqLZ79OJotPBcRr/u/vjRiArH3BXrQaYgKoM4Rw9/We1zCVa88HLHhn
	 pt5pgWuYlHPrgj+fy5wCj5HYnBC4CF7o7yANN5v1r2WmkksjPnuTbVvMsoA7f2neWi
	 56w9xKwLJI1G8w4LvFZbkXG+lVUQoHgahe5A3rJGfhKXcncASI7R7hQ4UubSPBKq/A
	 FmshcnMtO9q8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EEBC80F7D;
	Sun, 20 Sep 2026 11:48:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DEB7224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 145E5407F4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2COGbCE1Vlbr for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:48:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B43004077E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789904891;
 b=hj7lqWdN0WKssr7HdJZYd/srIfUkN8QrFFy55kJUZqg8bz1C9QuZAY85reklaSk1lfUz
 +bZnNvBlMrL4ZvWkld1cq1COnkzeZ5Lx/yiA6ZftwDnb8F9VxR933URIW3Bj3Z7gH48st
 MZkZP2eYkp345sDecpaMmC2EPfT0B1sRr9QSsP5yQYdykOz7Z++0wMOcJ/ZaSsyI+wbMD
 UtWLGAC1Xil6zNzRPN7Ey2f1tOyFNjIc/uRo6sThXTGfS/lErFyJyQhRZfuUUVZtzo5h/
 yK7q6JI3NIN3xxNdNlG9V4ZW3+vR8KO/RdNlhoCBTmKlh7YK2jsbk0U/ScrmQpZ5yZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789904891;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=R+QbbBPqaj3J+i3ZjfwheRZkad/ryzrQnvS9TYxj4nQ=;
 b=TQ+952PmSKGK/h80dT46hqxVy1hm8mYLtblU38VvacKNM/Akzv3fsTA89i2MMjYB155Y
 vPVxBwWSUHK6Ef+QU6zhKeI9OaTkccj3eQvJZV/Ye71GBXsuK44+JdyPbSNh0Lo2Xmlm4
 0i+NI3zqLLQN7AYMKAwo/m0/4ofOjzSij2QfFhItxnA2u8kELAMfFeqB3MXFM1dR5QE3g
 3ZuGTGPBWDstF7G39lQlgxE1fhjDuPQOq7aoyLtFVcwxYA7vKOkTjXT/TyVGbnOBfDHlc
 UJFhYTJ07tL9H/UGHKn3vgD5/SyVNEL/jHwARVlxNy1mtVYISnS2EladegdJDDpmosw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oIFxw+FF; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B43004077E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:48:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 76CD01A0969;
 Sun, 20 Sep 2026 11:48:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8637604C9;
 Sun, 20 Sep 2026 11:48:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A866D10328329; 
 Sun, 20 Sep 2026 13:47:59 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:46:46 +0200
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
Message-ID: <aq_HonaqLdAgVTxc@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-68-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-68-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 67/77] package/sscep: Fix build with
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

On Sat, Sep 19, 2026 at 05:58:32PM +0200, Bernd Kuhls wrote:
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
