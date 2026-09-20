Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017CAC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0FF180DF4;
	Sun, 20 Sep 2026 13:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5KbDAHAlZpE; Sun, 20 Sep 2026 13:19:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EB10480E17
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910340;
	b=cQUrv8m5wcjqw3OSLJ7eoI+siy1s7fViF1m6l/riqYc4SBEWtcgS2iTHwJdAn1u07h6k
	 UP5V0kEopkbYiyAUwEOosv1zUciHgpNdcEQGg3mlApb1rfjqEu7EMq36YvCyjNH93cR3n
	 GNcESyGI4FSnsUnF6erPXRS8evEPBpTARGyV1TW8YuTGbNh3DcOBxosJtUXxXwERQtDDm
	 gN1rBg/h7TqXAFccAVKSyg6Re7L3FVug7Vb2MrLTJ/cBwVAgJSHddYwg/LP4JmfNVUrEo
	 2MZSefiiPoN+X85exqqEXnj1TDJRBNlucXhG/GZhl0dNFPN1C6GhL+B/VIBXxf7BrDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gDNspovseLkh/5t+mh5nn2VZLhkyRDk497yEZVBNvkU=;
	b=F3gSJ+3SqwAJEJPdz3XSiSeI/3aQsje9dYPvw0mkVzZx29YHSEyGjEm76tOeWSsOUpt4
	 x3QnGFK1bikK9XG6sjW67hXdygjwCb7j0VPlb1UEWtINTwiwBbrCNVrtzP/KpD00qjzVF
	 vNntaFVbxRHyw/X8Ex3XoimkYthLkjHlXWH67rMZsNhA+Iet4wZnkmcer5goZ6+9KCVeT
	 1sJERYdsNuUo/QbIaLrMYiVDxfM9jEXRIwow57IpcAWYYdXCG8Fm2rMevU8hmV7REk+eO
	 eGVedYs4Pzq8kGRbsKRaWWh4l9SdMaBxfLVK0zbAd/glq2J//T1MgGVYIjR8x2WLvaw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910340;
	bh=gDNspovseLkh/5t+mh5nn2VZLhkyRDk497yEZVBNvkU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WJ/3obvxNJ1lNQ6dZoQGmjnVOGfULrOdVRIK6d4OlCfQr/LqMpsojxyIUap1c8jfe
	 Pdzrj4sXFMGTEP+Mfj3I6UJFEaOFrw/mQ3rKn42tI6MV6KdVdUoBuDZRhC8bcj3Egk
	 ycAeJgnNzi+x23frdjCChOxe/VUaouBZXCR7FEpJFHwOifHYqr/Okj6Y+zsN5HHjNM
	 HOhMbv/eBnQOUJ2FDAUUNtRhhKMZvvnlijCouO0nsEaq7eHaNmFxrhpqU4MLOQ39OZ
	 8vieHnBM7sWW9Pf8KDCJ7A2jopV/XOf65fszrRvkW/QBNYPRzlLTp8at+2jx1Koo9B
	 fOPLp6q7vx90A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB10480E17;
	Sun, 20 Sep 2026 13:18:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25E3B392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23B7D400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zr5UIBi489Gx for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2D7EB4005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910337;
 b=BMdpRPddIIfLVcZYdI4cOsb9ia7KTUMadhNHsX1TcpGR4IHq1uteK/lmG8KfBQCavXPO
 CqJWNXZGu7OeJJPEufxubOzjiPenTiwDk+Bl/jhdt+0DTfN9JhH8O3jWPE9MOtbsz9ZrA
 ib8IJcS+v1rAYQONUUidFb2TDxR8HT2Heqwz8Y5/Wif+vMKVNEgNKYIUNs3TQhIjUkvUN
 qs66keAbSd9lq51qVp75WwBJ3o5Wr9DGMLSqyw7sFXIjlNYxnmFUX0ZcuBH0nk2QjDJk8
 aKUsNhDZxHGP4iVKdCojvRaPVP9Iqls4tmRwIMUYXknYr+1Z5BLfYzFprIcwDf0iVWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910337;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=EYH/7E2UF3SLIGRspMXA7Do5pVJFi1dEYivQOYwet8A=;
 b=I5icuduLJ8ioKG0Jv9WAaWgJd0kjDIRMILVgTVudiGZUL8/jvivgKqJ4jppAqTx9TrZQ
 h+az/VmcoagExzab9DLLlzIjTdneN14eRLps8NWHOGb+w1DebhcgELiYllvugbia8jqh4
 UEVTEpZPRq5y+VahYzw4HDcIP3XL6q819QqD9Z8+jHxvkfIi5iu++gUBQqS8ZKDAVGa2J
 TVS5Ma/TtFKcisjZAHogW/fihTIcXz3SYt1dMIN4iz0Jl9QycY0LYJZDVt4l71QIkNreI
 zaZJTz5uT4e7x/m8Mkgcj7XEH9jHqPi+e6EP8xyGnI/hgOMeY5udMtW72SNqYckbI6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="IN/ePzFp"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D7EB4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:18:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B112F1A09A4;
 Sun, 20 Sep 2026 13:18:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7BADC604C9;
 Sun, 20 Sep 2026 13:18:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB6231032906C; 
 Sun, 20 Sep 2026 15:18:45 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:18:44 +0200
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
Message-ID: <aq_dMD0Kx85LeNIe@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-19-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-19-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 18/77] package/ibrcommon: update patches
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

On Sat, Sep 19, 2026 at 05:57:43PM +0200, Bernd Kuhls wrote:
> Replaced patch 0001 with an upstream commit.
> 
> Added Upstream: tags to patches 0002 & 0003.
> 
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
