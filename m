Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F077C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F7D40BFF;
	Sun, 20 Sep 2026 12:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyzxLWSxmNlr; Sun, 20 Sep 2026 12:59:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F5F240BDF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909156;
	b=CaBXdz9MXnB3oLmnl0b42dQopzDOaOLU6p9KvIak1KptIVyRzpnsCP/3ZTOQBiI77emw
	 vTKSDJBnz2kIOyEwl+xKkuvoXPhLQrr7nciVS0N9krr+6Z81sdq+PcouT81j0uBbhwhGP
	 yP+udWHxcfFVxjan5dgr8l7NJX0+XtsAdR/iFis1xEP45Cr9UPz9HXjrDM565xtQL+DgZ
	 DtM3InviQoaTHva7qPq9cd25yG/YxDyHvVmkoDmg00bZmTIabIOXpKd2IqR1xKwx7x9+z
	 Fwuf5Nl4Vjx/WIt9HtkF6a7Ll88zbrQxCHGO+uIEkv5zjahL4s+AUExs2aKAwRPUcNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dP+Gi43hN/bSy45mXk4khH73pIcHyMdkrylOZKlGupo=;
	b=bxYDAacYia3+i6VornZ8NCDzEp7YDe0oUal0bezJtctFvQi1GKYJCdZ5p1vxpP1E2VfR
	 MQklXJmyuXMaew+oSxGAI4rLh4gvj3tyRK5OLnFv5jTnaUYA8OTbU/wbWRKn3E2iDvYjc
	 V71IIKLW+s5DunZDN48KBVA4nK9bDwdz4GrcFUX4FgasMpLjxCsmCtg0PyYhn8RjERMI6
	 fejYxLyemyPsshk/OY93KiO9yTxoSCDKyOvRXSYnIZNWQhwqCh89A+bpPYb8m3omdJhcm
	 rWiBKMkbKHuvOtpo42lKUi7gChfr8bD0egCFX+jvLQx54Me8ErME3EfaYqi5bLhm7Jg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909156;
	bh=dP+Gi43hN/bSy45mXk4khH73pIcHyMdkrylOZKlGupo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qDrXm2YzjP/c5Pdwa/j7cbQ/axt7XABjvWMDQam9hsjLTcurjaIOIxRYH1E+Wusdi
	 6F61hFflv63+4QFjbA0Yz+yg/VbzcFPROzQrBc6NeIDfHentNSs6TZR5eAbJbVXBcW
	 MVrPNR/gkQ4/sXS70qKyQ1bP7x9P1cyhHA7Ijg8RDq0LRjoKua8D+7GUtVAU8Ljx4A
	 kO5ul9+PfeYz6OOMY1oiO5BU0wPz9E+mw3NvYdgrCnRaV/yHwftqzrlbIglHOk+LEZ
	 KitjJX3kPIpOjmI4XIKNqqNCQRWHT987h0CSkQz1ekE8fBpqhR6+2QBJDKly/Q591k
	 Qr7iYORNKQYiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F5F240BDF;
	Sun, 20 Sep 2026 12:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A5D3AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED98A80F29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZc1EcXEX1dl for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C6C480F21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909154;
 b=Eli1j71fQPWohPOpUJ9w9NE0yUbtBvhkkdog+uhUlJVGD1Wg1wAKwdXOl5xSn7vne4o9
 WHIUox8USw+P/5i3uqwRxeYL8NsS1L3OoLIj+/tX+YtSrBVken8zTnbaTpRhC+P8veRse
 NQZJXlBKCEtShY2ks0r0E6Cce9ht5iE2pUPBIy3WVQBkk9QBvkwwecKPbsGd5XruwBn83
 PhPFGciF3NWP/3Bdk2dNLaOtZi4QyBAlF9nXDOoMHCQ+t80hIjRO9V77SGUOdZPuioEXn
 IgVMM/ulSv2zYF+WytPz+E4f0p8UGHUZ5pOgTJZfSVhInA52CsTz3DfYFrKT6w1OxAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909154;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=EXsygHvYLiqi2b/djqmnbHcio57y4w2c+j0mIWjkY24=;
 b=i7rxsh+i8m5naDDT/obyRT+jx2KVK786nxmKa7JcMdfPyjDbX5MU395BXtyrJ4TpnK/J
 0J4Q1gm4V8n9+fkLmUd7D8ZroXtPe+CNbkDq+7SzCm2S74jcOK1pAk70D6SYzF8rJ8RAJ
 boaR/ojrQ3WMVPjf/dvLUjQvv8Ud9EdGIcfJbuOygwLgD1T786k1fNlCHAUU3AhI3+k3g
 5Rj9WZk2Rd5AexOu4USBk3/S+nCla2cKSVJBZh40pRydhAOkkEQ1Oy9TujmS/OwWis1N+
 xKbJMNF20WpD9W9SPJg0v9n/EapnLYOySalfhNlwnd0uPWS/Naj+7JGQYhQRqWGA2rA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QxJJTbrc; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C6C480F21
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:59:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0066A4E4082F;
 Sun, 20 Sep 2026 12:59:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFAC5604C9;
 Sun, 20 Sep 2026 12:59:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63DC31032829C; 
 Sun, 20 Sep 2026 14:59:00 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:58:59 +0200
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
Message-ID: <aq_YbbITPsoON5rs@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-10-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-10-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 09/77] package/domoticz: bump version to
 2026.3
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

On Sat, Sep 19, 2026 at 05:57:34PM +0200, Bernd Kuhls wrote:

> Removed configure option USE_BUILTIN_MQTT due to its upstream removal:
> https://github.com/domoticz/domoticz/commit/be95eec094bf524c1ab011eebcd797d3b19b17fc

But then, is mosquitto still needed as a dependency?

(The rest of the patch looks good, this is the only thing that I
noticed during the review)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
