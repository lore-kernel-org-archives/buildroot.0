Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F57CCA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD53280A58;
	Mon, 28 Sep 2026 21:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgvZhkuhlWOn; Mon, 28 Sep 2026 21:29:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E007D80A84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630940;
	b=SW4p98cA43ToccBWv5y7qdrMWG7T44ID3ar/QzAAgj9mxUe8CWm5STCMaIL3mpO1uHhZ
	 veOPIRX4P5cZ+RqrW9pRQOXW8daSq31ixGxQUxpRquvb+Goarp+kOxnj0flNyfJc7u+d+
	 GkVOUCaH8C8VGXf8gQaUunOE7BHHJGqOVuEtoSeuJbt1fdM4uLFcAR9Au9owOoq7KsWSg
	 IrGtZ7guXPWT+Vgj9KzXSdY48Qu7Adp+Y2FxoNYWv+YKwDGgRZgUQmuOwJKIpKbjImVYq
	 6CSrPKHOo1QpkJxEQRP9/zzV1FAlCfN4hwLcLJ/8VE0YKR8zxAPUO/dGbLd96UHEpzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HBysgc1dogyahtzwnFE3YPPiTEDKW+OlHN/2xJpw+EM=;
	b=nEbzZgrjDhBfVHcBodZxXQmOnuUDU3JR9m+UuNY4X5OJODShnp86e02Rizbo2SzAatBx
	 PeQcPXLQRYJLIJ2CTsicnyGgsxqwMNnWm+r6jQkDpBl+B2ZR2YZySBUJ/g4aoAHXpKPMS
	 n259XrIkAR36vP3opp7HWqNxW3Z8LCdULcnJVAfGxQaj4iyVCURpntdp945SbUpUVUJ31
	 aAg4hUiHXa8wPnk9piDntZNHV0MXGrDUnCPA1g7KRqhiM4a/YolgMzBEjeO8nBabJxTU4
	 ZW+Uq5i+0zrvjGg+UhEGGF132Op/3Utrx6o+ZzH3j3EIa9WgFoTCFY8YMnPYPnroedA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630940;
	bh=HBysgc1dogyahtzwnFE3YPPiTEDKW+OlHN/2xJpw+EM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OsL+CRlGzoSO5ZVNHrrUBY8e0FQiorq9vdqnbegwX40ayzO7Ij5WnSzgflSjgc/2P
	 irmUhIidSrCjE4FfLexjrZWEcvWckzoLPmatPrirAxBoOWZSjQ8vd9P3auWGoesPMj
	 XYrHlwUsS+ZCbPV/6y06Bz8D4BRFpmlSpc2bDkFKxdsjvaSEjGEl7+IoTcfr/Ap8w9
	 h1LBveSK8M/kPBgWNDuwfoSyr7DNAQrD9wEnCcJZWRHtG7ngayAkglcCi/ZpTP96ji
	 bXonJJYVpDnGkAo/7+AkpiJnRvEqYsk+IoMxp94QHOT9SYV/tUNdSlC3EgV+sEIG8r
	 TRKSwU4G+AIXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E007D80A84;
	Mon, 28 Sep 2026 21:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 506FA335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41AF980A84
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwqlQgC3vF3V for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DED3580A58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630937;
 b=OBcY0WMWP+/7SDcoxmYFr74MzYCwZupk4Y2vNEoQlQ8IW8TOmDQV2fIWjtgIrhRmEdys
 gtO62KBzuVMPtlqVainxjUfQVFf/m5IjqEAXwRJ23UK9SHfNWeWc/xtTKOEDiFZW973Pr
 xaHiACWEOObKBP62gEGrs1wZX+q05krOWvdAQs/ZRxyqazITbOT40JzK9MLQxWZAT3l6F
 dMaKES6ojTgixnKx9K3dodgTFLNhv74HdDdBuxx6EJZK7NaNXwfa6oOdM4UWY3LOn5tZm
 R7WFzDiIknZLSUtlsnrP3kXxC8LWMmgJ6D91IqFsGcEimJ63skESXAzXoi9lEhvVpKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630937;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0XLgV0t9N5ENYWgJYAkfxz1OfLVNLhB+2PDC5GPlErw=;
 b=ildfdRbVWw983lb0bIJo6QivHeOBw2zrQlX5i+PFwBSR2HXZ7KbReNSJNbEmGlJ2ViFN
 3N7v2KH5pD06ctJ4BGGwn2crV8Lxdt5J6dNI+TocDMVydVEHSuIUqxhWlFbG2QpUxl6l9
 KpIS72Z6My2RemH9rBDBWFfcBEyRe/B6JP4w6rFdpy0Od/Igo7+r5crb0ikCT+B6EAZFR
 f+8Bu08C9+1TiNyKalEL0mxSP3koMs2kfgavD8jevb6GPG+mOq++6oXoYnKEapUIZ3pcf
 H/p7jTmKwzjFTm76q6UcHFzC757fY6gnAWnxHvP5dmjPNtm03zSl+OdmeCITPWGHejg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gpyeNWGQ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DED3580A58
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:28:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6E8261A103E;
 Mon, 28 Sep 2026 21:28:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 344E2601BD;
 Mon, 28 Sep 2026 21:28:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 42B5F1032975A; 
 Mon, 28 Sep 2026 23:28:40 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:28:40 +0200
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
Message-ID: <arrcAuclWw9YZPXK@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-60-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-60-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 59/82] package/ntp: Add support for
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

On Sun, Sep 27, 2026 at 12:42:37PM +0200, Bernd Kuhls wrote:
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
