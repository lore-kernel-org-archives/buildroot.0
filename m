Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C5FC9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B89A405B3;
	Mon, 28 Sep 2026 08:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlPdi3kf3TOs; Mon, 28 Sep 2026 08:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A9E0640599
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790584983;
	b=Yf8U0qTo/7JeTz6XfgQKGK102ny0P9oJSDawhDNsSqEks6js5veTViCk7nmXWjrtIP8r
	 LVXf834DuefqbbAlleX7i3zypeSAbD2dBgq7oioy/PsxaeEW8AZIeJP97y3PjOS/NsMdq
	 VVUqS+zlPe0Xs4JfC+/Opw2awx0m6U7A9dkSqoUEjIBV1oOI8Co/9MUplayPxRuJI/glu
	 ExGhGAEsYOqmjItVajGY5nfmpSV4USzqzZ9VHtAw7Abl59wHGdbQXaSoxNKh4ICz6dGyy
	 6ZadBYz8wvKB39lHpwI/0T7w3T5es/Vvhxc86G6/jrnY107jzAmwJ6j9KiimLsCombA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790584983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lcRXCWiN9Am9AWiDLZAq7YpeEB25DJEVSj97Pgq8t1w=;
	b=LOw8KzP08U+ltQgntcCtXes/SArLqwAqh8WdWVVBtLoVmy3hHb6wXZaRzXsG6YPhaNAt
	 dbJbsbEPaABQwt/o1ljV5XIU4Y6N2Xqm7FVpYqFTppVin2MuIX+klf7dWiCdt81tnYDmA
	 EfNVj9iexqZ4zUN2gIUoBqiOOZXPEH9MLdLMChIBVyUzhp1wtuflomc1epYcHNlapJz0i
	 gq9K8+qC2RTB63eymga2buvCbj4zB6p2N1nrMNQuVuNg/AVwMfwPsWDAT4EZXZAjzY4S9
	 AqMAo/ALzJBIjzHUJueBskDAk2wXB/jtqu3qjaW9D3w235BdoVkDJS46BCtZtBk07Fg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790584983;
	bh=lcRXCWiN9Am9AWiDLZAq7YpeEB25DJEVSj97Pgq8t1w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UsT1QSy6/h1XN4+Wnnv+II8wnrCxlHOL+T8zz3GMrGyamRyJL22FZgtrx6Xfho2tZ
	 oyws/41FEXcB3Lyw2AS+n37mQIOjz7NgBpcvnumFiEN6m8tHY631IRGE7p8EZEdDf5
	 1GjffR/2RxiomfH82Ru/f9BuAKR0EMiFYaDJLG0lFFbWmowJR39Lz/Flkv20P9Psf6
	 gPXWCHXN5oT95cp95VkvemhtD36c+2NWT9a5gODzwxsqoaz1ThaqW7djoROC0OulLC
	 07YU2chnqAyllC87msYM3QauFjsw7oM4fN4IH0Bz7zcx7+YYmteY7lCbpeyqvzJHZK
	 IjjSnSVbshSZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E0640599;
	Mon, 28 Sep 2026 08:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38BDF361
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E70E80C84
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7l2T3nJyE0y for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4C79480C7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790584980;
 b=BUXu/KCjqhudWOwFGJwqcPiJ6LfQeEf4KyWsT3kYl0lEdQGzZKa4dgzN6okgCI6jNKQ7
 Zkj5Y2vVY0ZM7eGYu2s/JHH3fS8YCYbslRIPJV2rxLnPQRFLEkKNZbS4ZfQG38fj0dX5G
 DIi8r2L9P3rTNO9bW00ZFhGih27hnaEihP1GCiKE+I1pLJb3nmUq1C7BTsOOzNe6dGAe/
 vJzQsi3hjOo7Ga1Bi1ixVFOU6v0mfSn289KBXXW2e3YoH3ninBrZ2l04HROjVPPr6fewT
 UfP/vZN3gvQd2KXWyC96/7I7DMdIgIW1PVpwv+iETJ+bZ4rADxxUJ6V5qUmd4nc5wKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790584980;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FLug4T3mwceK49n0V3fXkF9XUbkMdtlbCiXRUJF/wNM=;
 b=f9vGTqkAjrqh8QTB8PaWlGU6W+aI9AZyt6Cc4lPXvNyZYHg9wZdwxckLuh2eTaVn4Mhb
 aPoj1gdid3kKZqO2XzEN+cDgQn/G/c+cN+8upX+3LQxsC+yF29ods4ahCeQU+vQ9xVXq2
 I7ooPQy+d33Yepim5dMPy4GfGi+DOXZzTh2XDLT+OBeZX4SCxIOPTnTkQ1oKcqRR+GjO5
 L1urRDyNGLjMfKmnTMkRozsfQNotoR8QEOZv0MtXn7amaoDlACZp1ToG0luhZjXFIPUcz
 SIY2hbfcYmtnM6Ax4dj45Yd6dHKQplVH7SCKChYkwQdTic3/1Vx/5DHr5JTRInKfxsQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="onAVO/VN"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C79480C7B
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 08:42:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 971694E41089
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 08:42:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64273601BD;
 Mon, 28 Sep 2026 08:42:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C193E102F1EB6; 
 Mon, 28 Sep 2026 10:42:54 +0200 (CEST)
Date: Mon, 28 Sep 2026 10:42:53 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <arooOH-qmgHdt6PS@windsurf>
References: <20260928074239.24304-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928074239.24304-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wireshark: fix support for lua
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

On Mon, Sep 28, 2026 at 09:42:38AM +0200, Francois Perrad wrote:
> since 4.4.0, support for Lua 5.3 and 5.4 has been added,
> and support for Lua 5.1 and 5.2 has been removed.
> see https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html

Is this fixing a build issue?

I did a build locally, and I see cmake taking 100% CPU time at the
step:

-- Considering the following Lua versions: 5.4;5.3

is this what you are seeing as well?

Since this is a fix, please add a reference to the Buildroot commit
being fixed:

Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")

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
