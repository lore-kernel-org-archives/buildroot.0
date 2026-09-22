Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698FAC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 06:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A7160662;
	Tue, 22 Sep 2026 06:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N6Zs4_fbYew; Tue, 22 Sep 2026 06:48:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D6C56066A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790059730;
	b=WdvIHFffHvE9ZIrf5i0VUFLmwlJbOc/12Uu24MIdb/N+DOeuGVBfWx1y2XV/c/6K6SoV
	 fz1YzvLOKpIMhHaUyPdVfPeWCU+n+8o62CjanOn+vfGfWOMC39Gxnwn9CpHiI5Bm1qbRo
	 rCKKA6QMwCyy3RyYUjN5tzBcEFQj46zBJ2KKBdCHBCUvr7CXCe3dyQusr7qP0UYWYU0GP
	 hrwyj6epK2Uh1J1BHEzSif5kV3626dqj6LuxL/gKxMI7UqgQbyUuYo9FfRcSjz7n3Ys8r
	 peOsdldD1JLaP+FjLhqMNy2bQxXzuF1XXq7HJ2Bf/s3uuiszH4opA62Gz2g4BFt2k4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790059730;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OQrIds6KS+I/bUicffrNtJ5WaRcPrhr8NPu37p+P0W4=;
	b=ojrfHQWw3My7w8mfJ4DumiuXfg4V1ii4lJ0HbwjW6oq2O2ZVMyiPwbMIcnhnbq7Mb73L
	 yayzG8oErxU94YRdvpWSNUh53k/phTUqvjPrlhEezifWDc1DHVBqCw2wJUwnui6oRvDpS
	 exqQ+RIlP7GvZ6IBSAj3qJl8tit4elgHYQ5Q1wRzUq8q5NcdlBNKpf1E5xPBeeczO0V1N
	 QbW1Ud8ZWp687g0NH17bGEDOFm2we4iFAFLMcPqP0uWXpHFANOrDfz1bBrFEhJbDpgGKt
	 OjQvsc6psPNRtdm87c6bnmCT/liFF5Z+fR520pdyLzQDaZ9VVMqxaCOMQyKriJ3yGKQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790059730;
	bh=OQrIds6KS+I/bUicffrNtJ5WaRcPrhr8NPu37p+P0W4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DFppZly8AddBD1PpQu1l9Ozc6Ml2GlPWitaQoiwuJ7m7MdDDR37doST3QeJy//Tw/
	 7YIFrdGhZBjdANPZMNITH8fLZLWC8+jMGSolx/1F6pEIy+G7yM9WJnHuki1AqIuA0q
	 YnfcxQTdW3qGcJkz+uwx7llzBJT4RePK4KrdWFbETfdOTNSMs2DpOFBRq8mb7rZ9qq
	 ZwCOTJYicIntII18ASDPUk+bvCsb2PiQg2h6SQaUG+0QkzK3WSQoUyWbribT14OcvZ
	 D8SzbtrkVTr49oBKKrrQ7rB5OpPSaIfz6uBLgoOwgWn2k2W9ePM4eNmA5LDXCwSISZ
	 ZV1+umhR4fDMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6C56066A;
	Tue, 22 Sep 2026 06:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5CFE34E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBA936066A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLH6lZmmJvXS for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 06:48:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C19960662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790059727;
 b=ZBQ/wiMICtxldIWeNEaddK/1euMhLul0zZ9XYV/Ac2gaJ+4PAuU4g51o3PaztrW/UdqO
 hYBJ2/XG+MjYZjmg7YIX7wuzAjipWiXe6If+jD0tL/FmaXQhvJI5l5eGg6nDIs9uIOl7g
 PGIerXQNsb+LTebWxptu9tB4mp3LHTgcx9mPL/KwLK1e68ighNVCqsajUMGKpmx4fmgAU
 LsplGOiOTJb+kd/AgeRjCXMmgqXM/lSzymEBC2XmZgCrg3CvtLnLMnAiA7V417vuYe241
 XTbYuCQGI4PhV587H5wD/n6BTpyAh29Fy3yuxZ3AYKL/mhz0xjOOhYpJn3Aq1pZi0AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790059727;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=cMJaqEUujUJO2372xFjIApFlP2L6gH5yHcGqENblOqU=;
 b=KuXx39Da7pWy43zIc5CnK6QPT2W9qZcrGIXRW6v3SZPsev98AY9nsRbzW99kksSltwZl
 3khDM3+m79JrXINzHIzGkKLOaz/rRqxKBH8tlxk5b+TIjdinFeB8RKmaWJpC+RzXU2zlX
 caziclyd07rEHwwSnbQ+OOKONw69rpu7ppBYokyHIrcWBHfbKWzecVF+PGDUZKmb9ecku
 A/IUXV3ZD6JQrhSfqZDsvHHoWodz6zldNzv+iWdmmNnw9h/uppZ/fvMyP+GjOhqktxaTd
 w7IipJ6wDOZBVlBJoy3ysO4zZZNTpnQA+N/Yx958BYY9QRRFeBAmWBmoU892OC5C8XQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hRj+81Ks; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C19960662
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:48:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8C1531A0FC0;
 Tue, 22 Sep 2026 06:48:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D23060580;
 Tue, 22 Sep 2026 06:48:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2EF161032920C; 
 Tue, 22 Sep 2026 08:48:28 +0200 (CEST)
Date: Tue, 22 Sep 2026 08:48:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 buildroot <buildroot@buildroot.org>, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Yair Ben Avraham <yairba@protonmail.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arIjwNIjCp-rmGH_@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
 <arFb6txpfwW2SwzJ@windsurf>
 <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
 <CADvTj4pPKx2ZxGH5Cct+0ekDTxFXqPPe6HvhnVKj7ig-+S8cvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pPKx2ZxGH5Cct+0ekDTxFXqPPe6HvhnVKj7ig-+S8cvQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
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

On Mon, Sep 21, 2026 at 12:09:07PM -0600, James Hilliard wrote:

> > Which proves my point entirely. The current system does not
> > work. The exact same problems from over a decade ago are the exact
> > same problems
> > today. https://lists.buildroot.org/pipermail/buildroot/2015-March/108783.html
>
>
> Maybe we should see if it's possible to enable sashiko reviews for buildroot?:
> https://github.com/sashiko-dev/sashiko

On this topic: Dowan, an intern from Romain Naour at Smile, has worked
on enabling AI-assisted review of Buildroot, see:

  https://github.com/Dowan35/BRAssistant

Dowan did send a few e-mail reviews based on the result of this tool,
and the review comments that it gave were correct and relevant.

But overall, yes, AI-assisted review would definitely be welcome. A
large majority of the reviews point out the same problems over and
over again, so it shouldn't be too difficult for an AI to learn from
this.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
