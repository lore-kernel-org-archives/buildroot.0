Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F78CCA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E32B40547;
	Mon, 28 Sep 2026 21:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Guma4pjlO99r; Mon, 28 Sep 2026 21:30:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 622A940523
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631004;
	b=PMYp6ZSosYWB6+jEZA9KcpLfSVBP7rFihP5SXboTKkmDB0+zOOe0E8vXwTurB/4kDdtN
	 xzjsTr75Lp8jL0rJvu510yWQ2BTvmlJ2IZ3ndwDfXK6ucyxGoxQdRz7IpXf1gzl866Wzg
	 FmW7VQgdfmgXxAwdMHCTH5kDUnOlLCuXJR6vGMmUmSQH0gw2yVuhWVYJbtedu523poXvt
	 zEMdKlmP62hFD0Rtw2jKiQrokd3nbbfaH3DcO41s56Bhg04tXNHfkTaFqBpTFai2DDwfg
	 m0ceVhu2ONxwYn5rOT8PG5MeOqkMFXoDMWUvmByjRXd19wN2RRkgNEhVyBT/pka0fOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jIIj8nTlCOvyaMDwSiO25bpbgfOemCS8BG6FNcFr48c=;
	b=MdCyQQ+oTNrWedvgIIpJaY2N3ENW8o57hJgm/jM00jM8yUWVc7psxy7GcciD4FiLT6j4
	 cxyHJIoGRy5ZYoGIw86q+RzDKRhVlTlIiXOZbk77Xjmhszmp6jQZ9KnbTRi+XSJp6Ej88
	 CKI3tc2MqpTbGKNQfczq6Co2943WxC/vXkwDeYfQXUIT96jmWetJebrHV/WnK89J4101m
	 WH8s2REfxa9H8w5lbUHSCzLjY1rCRTQhJtIvIfMWMdhL+djnaVDra75iehWiQjAbc/2z0
	 h/gIzwXNn8ZgkvJ3ic23fDuh2Pg7icbRGEWKHFmgR1xriMJj4pS1ATY5hzqWXQTPppg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631004;
	bh=jIIj8nTlCOvyaMDwSiO25bpbgfOemCS8BG6FNcFr48c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qJEtzf2PrcO6uBzv+1D3BHwMJYko2/1k0EC7XUs8NDPNGZDC7dBHdaYRNZMZVMysS
	 Jg5q56gzktVN5V/TNDkrxlqlxifFfbi2+nMTh7w/LiCU1JYedFupGKh74hZRt59NoY
	 TkLUqQ625DPdA+LU51npCcqS0we0D+3Wn2GWKd+PRxfLLIC2PEFxYYpOUB6i4vb5tB
	 6qU8cm4604ut7XykHUs05T2Mxv1LBOYF32YSS99AG6jwVBG0+xA12SBTMB8PzlaQWX
	 gHxrcWLxV0HbkNjbh94itW1Nh829dBb9Mre07GKSm/erp/SBRRCJg1ztPLeGdb3of0
	 u+HRfSGAyGFtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 622A940523;
	Mon, 28 Sep 2026 21:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2C061
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDFAB80B33
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLq141S5URDa for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:30:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC8E880A58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631002;
 b=XFU80kox9bm32Zac1TRSCPPk4oUHhmvDpaL61S2iW2Z7saIXNPVSjF3Kq0AjIZEoKtdj
 c0ZjlMR6vO3Kq2e+YMcomJj4KV19CtTIVFeJ4dcE8BI+CXeGOarzQqAe2hITT8jiOS2pw
 a1/6zkxrTdStZB4crOC0exeZWizrvhsHsbpo0h7m77UabIaH3gg/iiv9q8XLqhj4VOu++
 fraPsQGqn17ABblLSqLU08PJ7uUEyT7MJYXihuEA6kyzrYRLH2iuTBFo5pfL8FUi58ENp
 Y+slJSKLpAgXG3N0I7QXRG0cjNMJhR6txkJiSdNhBGmUAk7fiaFc+sREnLla9s32rkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631002;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1oyH0pvaUY56fmNA4g5GhEy2hXTtn3ue8iRfae16gJA=;
 b=qpwzXNxqA/ZqXBSktx996/L4Vl+0v5sFnCnsqv6mj5611ZqE31/NgmsXEtYS0c3o3vd4
 mduIyo+MdEtLMpVp54TZ0LQgDUddxlvLm/FYtDaR3k6upy7kTKoFH3uFwHi6ZbHR3NH8q
 LCuL5VQdcmN8nmHCQVzV0VAAr49uCiMD+qoI2CmAj2PWDB9Fh7faiEGG2eCywcLcKp+UR
 XOcapeJk8+BHkuOc1ehB0q7cdCpDLjqk8YGJK7I3biR9vYJctX7jSh4XFhKvPWZBcoHlR
 izKtvhYT4UhLp5KxUSZi5UuTuFSQ7uuwqe9ae/7zD3RqfHyKuysYxlQmlu7rNkTUlBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sHC3kdl7; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8E880A58
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:30:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2D4561A103E;
 Mon, 28 Sep 2026 21:29:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED828601BD;
 Mon, 28 Sep 2026 21:29:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8DC14103296C4; 
 Mon, 28 Sep 2026 23:29:46 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:29:46 +0200
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
Message-ID: <arrcRcNPnmXDhAz9@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-33-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-33-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 32/82] package/daq3: bump version to
 3.0.27
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

On Sun, Sep 27, 2026 at 12:42:10PM +0200, Bernd Kuhls wrote:
> https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md
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
