Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC4CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 12:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A05980D1C;
	Mon, 28 Sep 2026 12:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cmaJ6jIPkvL; Mon, 28 Sep 2026 12:36:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5C7FA80D07
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790599007;
	b=sVNkcogB+yYbTqwzHq6NubT4B0z4eVwmOUGVeeb3W2PwPGTaKVAnfbGSRMQrMYSUdNY1
	 2mxAS+7mpWuUfb9VYmGiRkP0EgOwqJA2A7nduwy15fegAnB9XRzPIsCTkUPLxnxnAdhDz
	 mzTZdLlPDrVcldNwwXz+k1c+8erGKq7rZRZWecTtxOPtMA6yml318W1dsaTmIuPN2wkYc
	 VTY+M+radA1lHGV02phgwKjPhjXw9JWLI2WlajgNfX/fDxgv6MqSWr71w/4Pa9kBGUgbi
	 lH448w0YNOL40mzE52NNNeUZoZ1Uv6gRfBjI+qUDaYdN6MHSFck3mDMpFVinnOJqfsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790599007;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VAjxSpGEK/PdLJ9ryT2NLTqsyakp5PDn0/4OSa6yXks=;
	b=H6i6xe8uvIH/6L+uAc8QqOnKrTMbiriZti/PnSpbDyG/vMBr+j/BDhyP7hkqErRXlAYr
	 XqgKHqHp1V754a8CDs1A1RXjpX8gYP9dDO7JJVXHO9DUSL6vL1B2RdMKPs+x+E1p9MKbz
	 uUJzajBmJMDwS0AN8JqpmBY0qpzzlzG+nSQ7WdeU3j9aDblXVdPoXjlTCvA8GRbH4ybtz
	 j+Qi0zIzcOgCxFeMDbNufiVeC2DzNmgcgkzb4vn/xxINtMIJhqPfdmXlT6g0PsXs1IPm9
	 1cABT2J4jfZLDTnG7/HvOOjMegGuEGZeRKPjnfpe7CDh9hAzfAeAJMpLOPJgDbUFxtw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790599007;
	bh=VAjxSpGEK/PdLJ9ryT2NLTqsyakp5PDn0/4OSa6yXks=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WoFGddQPAF6Uh9hFugTuUb8s11F7blPlqJK41N/Jf+PE6pscWJqUtBTJW7IRmZ6T9
	 UWCHBED6SHtZJ+w9YjGrM73BmElDkrIeBS2xtP2qCRLvr5zfc2RJRgXf5ubkQtDFf7
	 ctqUJ0fA7Odoig0DwANddFCjOdP+7n5Al1jKcOOuFb0D0XWOKcJVCzlrUOUAMm1IXk
	 b/lfi98AJXb8nVTIWp6E1qaH3cnYGLg7aXU9BJyBDazy4iNjqTV45fihd5fWluKnOY
	 NYhwm7RGq5FG/uSJp62xD7JPZCS57un+FmzaL/bbgZ9UI5+sc9o2K9WOwGNoSOmNDG
	 w4kiJdU5oku0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C7FA80D07;
	Mon, 28 Sep 2026 12:36:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E58EF32F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB5E560662
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiCqM_pXzHnZ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 12:36:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7D2EC60603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790599004;
 b=Oevwmgc7qRDjMwhVXEYzWHR7uWznXA52EcGuT2TScxkCzbueuyL5OeaGVrBZDiwbpg5L
 GnxZw5FYc7bqbk1tOXssnAwCWnapVmYdg4V1k3dkLSAeeY8mW8GthzBJqb+DhB1oZF3hV
 y7jBQNpMC8IbIwQiLDc8vO40nzacTkX+NYH5tYuV+vvrU4V3MHgXMlM8cSYToxCB2SJmr
 VEXxNh+ATAMWc9jyVhwJwAV3QV7JCXGNizqvILH3JfoWGZ5/EcH/KA4vHQwjAZhBitUio
 hfBTtRI7s9hcyp+07Mrw0v6RiJQnR3lzVvG6jS+7xhmFiVE2ejyh2oN0+JWjmDOkElA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790599004;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=draS2NL1wyGa3pBPps+I0Mvv6Va/MHW/0sXFtcDwLCU=;
 b=H/feNZQPQZXY4k0ahn1DXP4w1ZMuvQ2lyRrgdnd+Dro7kBlczH+ovVDU8r8RBLTJocZz
 7Mqp6N7n+UUBvSAL3pMEO542CtnSrWlskE8+mutTejWCwVCPtKSVli8/sEL2WV/NJJPp9
 L8iv9qRCvl2ORjWRCbHcxoDx22VizexHfULGqxk58ouX1E+ZoK6CfpnycC9NMWcnfuFQl
 OTGC/fo6vX333zFtCRK6N99z9JY7lOClHI1HuO1ZZBG9ABOTvBZS7p7eSDQOOelnEWSkr
 ZLQFaPILZJrbaOIrC8c4SMxRI1iPj+/sKvCFGqDmLJZv6kpVd8FKV8drh/jOpe73F/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IUhOisls; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D2EC60603
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:36:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E1DFF4E410AB;
 Mon, 28 Sep 2026 12:36:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B3FBA601BD;
 Mon, 28 Sep 2026 12:36:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E495E102F1E8A; 
 Mon, 28 Sep 2026 14:36:34 +0200 (CEST)
Date: Mon, 28 Sep 2026 14:36:34 +0200
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
Message-ID: <arpfTQDESmMqhY_8@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-26-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-26-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 25/82] package/libp11: bump version to
 0.4.20
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

On Sun, Sep 27, 2026 at 12:42:03PM +0200, Bernd Kuhls wrote:
> https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS
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
