Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF1CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D856060B;
	Sun, 18 Oct 2026 20:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rM3fA7PYZ6e; Sun, 18 Oct 2026 20:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 194B460622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792357005;
	b=lIimAlZvUERsnKajUNeD5uNmQDpFCUtjuZQn1veBD3Gwjga2gmPWycjaZm71+FIV2pVH
	 UX4rs8EJQZmianoP5zHKsw1GjM7GgV/pRXmke9bk9wbbgVWxOCJfPQHE5AcEDnLfMysIv
	 tkhU9ErZFKxneerUpWA1n+IhZ7k19Pj9wWgT/HtPuo+ji5szdLqBVsVm0q56MCoPTBFRt
	 FIJZS9aXkZRjqSRTTJbZdox5OYDs8Eg8GZ4B4Skv+pX3fU1lCcyK/VGx9Go0hOVjj3W3A
	 dRhgMGFGSiM7QeKvTQJk4ZJXs4BwKE1F4Dl9qZgz5Q/Uf6BESDF9znN63UIsbAnx9bA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792357005;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Dhnhu6yB6AY5JTGU4nqQHvXWSl24cDV1JNGfGMV8C7g=;
	b=jdf68Z8OgzChVymUTVTPuGW21GSWWjG2K39VGKX9goej9Ud3EuaZ1sZFtj/LsgTW0KM/
	 wfx1sMOtn/ExS8TI2HgDCaZ9k2J/jddjLljwd/Sq7oV2jnqJIGW1n2TgfYd1s6/J7ePuC
	 12Kma9uK9RkTvNkA0suI/kuxbQxudK5jOZHIwhm6bjCaqhsOi7grBFIWvJaGgmVLY8LHR
	 cXer/+lqzDAdpN+wyXJm5TtbymseTJMai3NFLxeECO3uVDQqD3mFzKqTo3b81U1/FR+I0
	 8xdgRIJ1QJSS1NI2RQIFxuRa7ci+T6xWtuly1t5N3IKHI3LIaxsp3fWovC/1MJALTXg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792357005;
	bh=Dhnhu6yB6AY5JTGU4nqQHvXWSl24cDV1JNGfGMV8C7g=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=D+70qrYxNgnggb2qQrP1x5pgjHqKUzO+xuLQTryN3ub7ha510l5Nm5YT29fPE/KZx
	 0zo5PmZu20e2seI3TnZr/ZgeZbKnF5YKBWzgAZ8DerCb6EFGysbLMf+tXLYghpcNhV
	 v/VHFDkTFrH3hb/LP+kJcCDhUFeFTHJTc5eVqfvup51eb4KhQBhpaymKgCUs+1hADi
	 8x0KXKhSwXlqqOyjCZOTjWNT8c7hK29+jI8DYhJEkRz0YHdQHFpKr0dyj79H1BcFou
	 GYFUlLt7JmI50Fkxz161Kmzv754i8eI08yz8ou6kX/6KoMJBhEt6P2LOsSlzvh6KNS
	 WmLv8ALwJQEbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194B460622;
	Sun, 18 Oct 2026 20:56:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65F7E1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584FC60656
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRL_6vNHe8Qb for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0517F6060B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792357003;
 b=nBYEw3s4IhT+M6LSatuD/8lGXBfOrRO9dI6vuMcShuobHo/98ezt5uMhCqe0nanU+Avq
 2UYBY5hYrbS5+vy0JDTErozgbglCx+FyOhYemUbtnyT+L0FPPE54J+Cm+ftNGH4TGz48g
 KVwn4Sm0Ke/wTeqtsvtFAkyoJd6l4OIgZNiBs8MHsV4io1bje3TPpigVuoHPmMoaE7cHo
 xWhEpOFSY9hwpb9SkmH2RPKODwEm53rNvpFLNJTnyDo+XvFlZYz8BvGNCEwetOt2f3jlT
 uQqPyChmjI3vAU9Oz6OzRTOzmDId4eNOo0+xSEhmMeG8A4n46G4ydMojuQpFT8JaV0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792357003;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=U1AaM1L1Ynk8Z12hgutOe1umSj0fAR4Q68FEuyryd1I=;
 b=bENXZf8iv1TfgBNDjflV1PPqNKYKHIb5tWJgtOVEuhUgjgnkwzFd4M5sldrpzjMeErWK
 NzoDkjBOD2GHMzh0b/j3XeTdUcZkcO9XKwAUHIMkV7RCjmKkiX5b8+I1tGZE9MecyaEVR
 bYY89EN1gE0jhvRVDTH02t+wFJGq2doqxBIrwVVuTKPK58m/b3GTb8Svcetw1owwH0VnV
 TxY0uHWT+OTh46WvaFVph6sE5apjGRBJlYvgNLbIO4QkcfrG0GqDijGFlvCxSuTL0cyjk
 2C3Gcwnyz4uj234ncgJG4kdCBTzteGiOnrofgl20oDpl7hS2uLph0Gnk9ZpSYm1v1Mg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=y4TgXqWU; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0517F6060B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:56:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CEDEA4E41218;
 Sun, 18 Oct 2026 20:56:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DE3F60582;
 Sun, 18 Oct 2026 20:56:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76F621032868C; 
 Sun, 18 Oct 2026 22:56:38 +0200 (CEST)
Date: Sun, 18 Oct 2026 22:56:37 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org
Message-ID: <atUydCZOiuRB85Kj@windsurf>
References: <20260903114721.984785-1-yegorslists@gmail.com>
 <asp4qInIYNj-7JlB@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asp4qInIYNj-7JlB@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix cross compilation
 detection
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

Hello Yegor,

Do you have some feedback on the below questions?

Thanks!

Thomas

On Sat, Oct 10, 2026 at 07:42:09PM +0200, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Thu, Sep 03, 2026 at 01:47:21PM +0200, Yegor Yefremov via buildroot wrote:
> 
> > So add a patch making the generated configure script follow what
> > autoconf has been doing since 2.50, and consider the build cross
> > compilation as soon as --host is given and differs from --build,
> > regardless of whether the produced binaries happen to be runnable.
> 
> Instead of patching the generated configure script, have you tried
> using AUTORECONF = YES to fully regenerate the configure script from
> the configure.in? Or perhaps this is hopeless as the configure.in is
> ancient and any modern autoconf while not accept this ancient
> configure.in?
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
