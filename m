Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF70FC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D74D40AB4;
	Sun, 20 Sep 2026 12:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-JtPR_u7jMu; Sun, 20 Sep 2026 12:06:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8FEB540AA4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906019;
	b=qEAVFFADXd34TW7A8EAt/qj88w4GYxgrRYqhthXYLcaZFUDQ3z0CzBd3Vb9RlZctIJHJ
	 fYLvPA07RHLwkflXpd7jEl6aH0z+n54lxq0Q4BTtTEhaItn2hFlxiaGbtuqHok0Q6RQhg
	 bW5B5gos0AEqfQIKsmbI5g+pzUQnOiouo8o3ip2Ch6A7CZZdOcd4JOupmMZZaP9YJcKOJ
	 vnHEY/ReELDErthNEff0/TNhzNnMRSO9h8csmlHzFURiTqdkA0OuLJtXXt2G8rrnR3iTu
	 sjbhZpCIAa4/3VrsF+kY1oq7WM9x1VGXPT25LECdqCHx91K6dsW+uDq4jjwFVaUwP4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dxhJooUHIOLAKzGqkwXj8lY12pMNix7IqSSZosSaxb4=;
	b=dHYwlAM3X6KEKSvw4/JidL4NFWJFzXEp7F1w0kOwihmJjWHqzZKcKH5+khEgLCA7JvrM
	 g2aCUaTmvGpBN3IuzITdsmoYFZwYwsCFenIREe0ZtP83iJuH69OW9xXGlWYXb+UWoVTY4
	 k53kjV9bzbyqgJkUyCA5G55qugTJAiD8KrZLzDdAWEaatrOo/OtNHWYyMT2ZvDLqi66Cq
	 iY9CyyLmNjQs862IW1thLLE0v8eJrGwRK3Sh7UkzMvRJ1t3R6j/U3uP9R0SsiNMMoqyTG
	 uN1JStzcy2XvRiWiMW6vC64mCpDf8G/0KZV2VX/0yAa5JKMN/2xEm0DExjuXJv/Hdog==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906019;
	bh=dxhJooUHIOLAKzGqkwXj8lY12pMNix7IqSSZosSaxb4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k04XGQetttzhj3Z7snnyVkjVxAXwcdm0C/fh8eswfXr0A7GJW+SfEU4imdJLsEaa2
	 OpBLlGQ9Y79fPy5huawJrNHGkqESxsLHYqjkVVlR+Ru9XKbz6olCJSPBW8U0EMXvmz
	 vulMjYSVgM34I7tXS9/E/KV0nfbm35131MUzwxCv9JKoxelaBjtCyC+em5v1hVvoxM
	 DJXToN/Z+MVw3PkZBQCxI7wMGmWfUod7v/zSIxeqekVd4UFtx/NDUQTAFrFJG+zWGO
	 mt34ZqQ0vdVN4xoQYfwy+IxaAjn8X/CbibilCAV1wuIaj2cBk7WD5oq/A/RU/nMSYo
	 pSYk6FMhMndIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEB540AA4;
	Sun, 20 Sep 2026 12:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3620E37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BEFE40AA4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oc0_zpcOqdhv for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:06:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C5D8740A95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906017;
 b=spYy4HzsJKWkCuca/Tl+bQ+1SFXzdZ2yZYUYplJ8da6mCZALGajK2OvW/MVXnw7SsTN0
 1wC8CYSEEgZQhvTYv8qMSfCMqDlfkFQXgYSTt3n47m3K6oIju2QXnwBmu7e+hScVVaQyt
 76FdomUZ6EDJbzscCpGL42j/TVu+g6n1etxGhw0aIlOrLNLI7blo/Arj1j5OIchiJQ+P+
 +CrEqkq2CipnwkkCbP+4kTELOvvcKoiAZS12/uTDTWuqD5A50mWQlwrU9jHWE6CqKcsNH
 99G3FzOEXZ04ypFi8nS/3RTVqxzr1E6nA1dBVuB6Bt347LV6pkuxzdjFVzQf4D8PRyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906017;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DtV03+LmYW0LbaYvwX5iFSiFPWtWfv9xgb1zNteG3xg=;
 b=hW9NhmUPHAS7GUvvyz25r0L/pTPkcu7IY3E06aKefpAMHZxmAv1VcNa9FsUers1cCV2W
 pbGOouK0LGoGGgLS8TvlX4vuYsrYV5ff3/xYJTL6xenGHMYDwx4K14brBeqQyutZkIKAs
 96IndRzkT4fmLqGBZl55xtEEJWEkU2cBDHLxrYzGQP/C2bIP+gOMUotKwSJ+Omvd/Hm8n
 SALEmAfx+UnxOIalrdFhpixLsXZKudVXGyyHZcW5b0ir3gR2CVzVWPY1cVZ0fdj3HBLER
 6HAoSHIaPXjFvqP1wus1+IuVbOxaY2u5d+OL9VRjCgMRpaKaEQLSYwaQR6v2vxTITTQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SZtbiesz; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5D8740A95
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:06:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 47E901A08D8;
 Sun, 20 Sep 2026 12:06:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 025F5604C9;
 Sun, 20 Sep 2026 12:06:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 552D31032829C; 
 Sun, 20 Sep 2026 14:06:40 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:06:39 +0200
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
Message-ID: <aq_MDPou84UIVjbm@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-67-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-67-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 66/77] package/squid: Fix build with
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

Hello Bernd,

On Sat, Sep 19, 2026 at 05:58:31PM +0200, Bernd Kuhls wrote:

> +Downloaded from Fedora:
> +https://src.fedoraproject.org/rpms/squid/blob/rawhide/f/squid-7.5-openssl4.patch
> +
> +Upstream: https://github.com/squid-cache/squid/pull/2389#issuecomment-5554800393

Thanks for the patch, but this is not a proper upstream
submission. You're just commenting another PR that has a subset of the
changes required, pointing to the Fedora patch. This has no chance of
ever bringing the complete changes from the Fedora patch upstream.

Could you do a proper upstream submission, splitting the Fedora patch
into several ones if needed?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
