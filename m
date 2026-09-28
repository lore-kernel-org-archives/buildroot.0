Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E85CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9169D80A53;
	Mon, 28 Sep 2026 21:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35W7Akw7-Gfj; Mon, 28 Sep 2026 21:31:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C635280BB7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631096;
	b=NOsxWCyHPv6jItlN7cWoUb4OXIH+NgUh8Tl7jMSdIZEW/fppeKt7YmM2vNnpXEmGSccK
	 sKX/+ZoQiwGGhjPO80wh1i6K4hUP0+4BJZG4KjZAJ2+iZhCQqpWmm3ax6+ceTkFf7PORJ
	 eJ48I+kgum/x4I3un5DFGX7fxiPJSckMtd3d5ahizNp/MgX0EPvfl9MFZu7sQmoymCs0Q
	 saC344yDkil60zvk8/qLv0ns4WXUWIUUeVCpedcKil+Jk9crVg+CoRpt5fv1MDzf+GAKn
	 Y5lR8DLfRfa8VAVOl1kf5jmZeWtgRkQzfQfuOrZOAhBhXbsuqZFi3wBCPOFJledXcpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pZuOg/XPmlpi4Tl0CfoJoDMuyPkKBQf+Dc7AyKqjabI=;
	b=pdnnKtpsFt26wXoyabrHvc3zwTnwbrvXf6OIhti6JLrmd7WiQobcnNTXTKZ1q+zlMn1R
	 c5b/b/G+6MD3eXb6cDAf1H+HxgA17eQP1xHJSKsJ/O4t/1CF3ud3VoGKbZ12dVvQR/jgJ
	 VhRt8r/blgp6uz+8UtHGi4XFNSFIV3xyo3sOoOOMJd0G+PRQPHDhpbFTbMuFC4ewKt+kn
	 /fr8c6ulbTJuvtWagNVsnO+15UXlp7oFerzrlQ6uUmidJtT9exTtj+B+Oh26GHcFhEkAS
	 mNkpKpwKEK1WmZbsIkxUxvwDXnDDnEiA43R7RKozu3ndRpMxHb7FAlXMV9Ki7L+rSrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631096;
	bh=pZuOg/XPmlpi4Tl0CfoJoDMuyPkKBQf+Dc7AyKqjabI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YCdZab8iobhTOsnfMPUYFQxAmKEPAONBXI0NmAU3/e76VpBsRePsYRfNhHxwKU+UC
	 jSbOdF69IjDdRqXt14+N6fEZ8WxOQ1Kxweuc7gkk0cW566QooyK8cNLRRLDzeO3QeQ
	 PQe06SjZDFxjhmkN9WbElA8GVS+UkA/q72goLzOfQRYjKknBBGwBtVDkCjLweYN246
	 VKmSBu/AaGfRBegfvOmURekhzBePjEE57p9EjldGQufKEjj8orhot4nH+RySFyyHa7
	 TlK7OTvrSmY6YmrXxJ3sy7Ly7HTHToIPVjLdOrEYOZ5biwKOjn1i4UA5AUU/ZaBOKB
	 WRFVsAO+NnTxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C635280BB7;
	Mon, 28 Sep 2026 21:31:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3891661
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE3B4018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MF3UEbsG_TZs for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:31:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B894B4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631094;
 b=j+LbjGQLlrNjjSz0DEtesqWEbiVVffph2aI2o2GIBqZacwcGVBl/8vcb6BBP0uZD/kIe
 pqcn45TGF+e3xC4+/iF8myncjN9vqmfOIDg1gIsuKR25lXA2jgmV+zIMJ4kCXbh6ZMUwi
 I5cNW95VJ9jgH9ZKP8kDyBELZgc0fRRL6xs4or4GC6Ezzpjq7bWM5NYrq5smY+Ealgo7V
 QMkEYtxUuc0uYW26AGtvs/X6f/xqPrSlqQDneafXDOYREWAc+rBg+vZgzTlKZSeyHAUtv
 Ej5sR1R85UVAqP7PoL5RoRpjtKEsAHKdjXaYFKw2LOuBrE/6XApZetZE/aTtcO829DA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631094;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Fq3T9zvSfUJkPTVCTZgk0wcRCtsfaRr+R1BLYgaeJNk=;
 b=FQ1LdZtgUGKk49nXgbPdOZqzWNyUxe7LY8HzPtg8MJhY99F6yuPrEUq+Q7mRKHTTR0e4
 n5K+f/ftJEMtE6Hp6RTL+DYwDJs+/ljOv7XJQnqpqRlp+wgKwuh+ZGvrdMDltAleEgiQo
 35R70A6q/b5Fqmv3vqIq6utOoYf3dPoangbYXK9KPebapoegNuFqbqbWxI6D9waPabrlT
 7sVK5sFztHkBuGFVoNZb/1csqphmto85zV26SxKXJl4oK/kpYFTQQdn6jvKeHiCjpZSMK
 ntL5v0/941ONsizYRp1v29Tu/JW9pOHOIFgbxiTdriP7MTdr12dVDm92IZeffh+ojjg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yySulJDp; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B894B4008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:31:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 83D3C4E410A5;
 Mon, 28 Sep 2026 21:31:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 572C6601BD;
 Mon, 28 Sep 2026 21:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AB001032951E; 
 Mon, 28 Sep 2026 23:31:17 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:31:16 +0200
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
Message-ID: <arrcn3EAZR1IpzLZ@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-35-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-35-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 34/82] package/snort3: bump version to
 3.12.2.0
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

On Sun, Sep 27, 2026 at 12:42:12PM +0200, Bernd Kuhls wrote:
> https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md
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
