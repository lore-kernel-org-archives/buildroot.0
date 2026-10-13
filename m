Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AE0CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19838607C8;
	Tue, 13 Oct 2026 17:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g33Idq0v3nG; Tue, 13 Oct 2026 17:55:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 432586080B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914149;
	b=J/up5T1QJ/e87u/fcQFadk9/wi8ot/ouq+heWcIhqlZ2K3mt6Z+gbLASaC0hGrELRIQX
	 ayKCMMbpp+Dozi4Fk54zYkSlohP7tkfJV6Ee9Ek5xixpmUb2gkmlILvOxa5Ya6bPlOSXD
	 ZcUCMG3/p+Z/2TmX93Ki7ANOsOk4Fefftvfq6cMGYQH4RxPcLRqrfOfGCbNy55OU+nuvg
	 LtmWkWCMCs8cd8XfmKBx8bvHQJGtxtzMAbB2s/+VzSZybU1dPRnuBot4/iS8ph8HZJxSa
	 Xoe1IMitPw8Jhc74b9sRc76lCVDTAld8lYGQaaEOiYGu17HNLbN8jw2Y+7Z9BnOb3/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bgPSJPgDLH9+VzS4/OZIjcxVWEXfJ2cn5I5xwkHV5VM=;
	b=aDq0GgeSSJGlXuRJy5bLe2ghoIKIhNhYCwQFAmNjHccU2OHV8E4DvB/jKWNVMj6sW0v5
	 ouoFnQpXTM8tgZdHAmvzlKY8f6GiXfbXyQptlagAtT1dVLxS1q1L8PMmy4h3ghvgknFb0
	 6J/CJ5WSxd6wS6ZGfbWbTsDgBLe7Yqgtp/71QP1/O9CVwdHq9SBLhEGt9LdAXP+yC38tb
	 b5yDjfI9BWOTm6mAQny1u5xm9U4+itV9E0qvPPXAcB/KzNrpDI5HzOlJx+rKp1XLuEVmy
	 +19DO2ytd/CbG+Wx6178GBTIaImwjm2FhWk2LLZZu3XMDStll9OLJVYAF2TIoN3WaEA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914149;
	bh=bgPSJPgDLH9+VzS4/OZIjcxVWEXfJ2cn5I5xwkHV5VM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FofZSNeisHbkf8GD+blwLXVRCrMY9+YbrigZRrV9F4qyLLVPdHomBGW1MMK8J6Cu9
	 VemLGB6vs8nF20yLaf7JWN7JzWez/1GdAtiwk+JYgHU4atH2CeJPuoZLKPcoOFZPbM
	 YB8cQ/usihbShu4ixu69PvCQ30dSRjxaRTATumpGt6udpniJ5YKbS22CIwKnL3kXZM
	 bpAM/AhugCVPQiy7bAt2k555Ac843CQ0irGFXTBU7k312NvD/7WCXAm5iX0BYVxdIQ
	 fvTR9z3FCDifeUh30g44kIu5zzxXm1uBH+KhoQp/evHvkRHD+Mt3gkWXZbVLLE4uPy
	 8XJqEZD3nQVdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 432586080B;
	Tue, 13 Oct 2026 17:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BD2F362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6267402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I5tf33fg9fy for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 04C9D4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914147;
 b=MObdGEbXephM0FM6+XDHWx8Fl0KfaH2W022Mojci18tIOZ7pyg7OMe9BGhZSD965dS6N
 DchDfJlWIvwHCh0wCE+s4FpaGjtN6Ld5Xj5XQuicsGDHcau+DFA5b0Ab2vzEEKix4J+In
 yKCrQgQR1esvjcDQmVtpEYmbvid4UTY1g35rKrUzV+qNkX6WNh2teNgYFau8U0RXQxsMg
 wE8rUi9J6eM58pFzHlYb8eD011fhb4/hUKpmiAyYbhaxnkEtWZo7wCzRCvpvWdFekdA57
 IwIoL+GoGU8xGntoPfjx4oi34ky9/qZIMMn6mkWjdVqbed3S5kucBCaowrbF8xtiVmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914147;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=+cmCk6R6piU5kRcacuPOc6UhN9TcQON4iaOaT7gk08g=;
 b=o5uw7SLI+Goj1gcyx+OjlniN9COZOrTwMPbYnhq2hXIge7UWmBES9vIndOqFaOTBupH+
 VMKQEs8rVyYchQCbnjwOZrKAj0OWuuN1dJDq43pHqCOZue8vi8pQhNdj7j7BQTkWqdtNL
 ENlnvW2cZFcHSAWKZnXvtoh48PUvp7de0CHYeFyGXS7nGk2zeVDUxFo8sExGHD+mMXKXY
 iz7E8LAWxgOBjzEClYz0k8W9VT5UAz6toppUOOFuo3QXECWDp9OjxrDJ4ZEm434fGq+Ey
 mOQwPePcK4Vb0+wYED+VqXjo98U9wVIskI9qtE8CAYjggjr2TZWWyAxhz8uXKLIigjw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SJuOw1Qz; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04C9D4002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 478A6C653FE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A65CF60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:44 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id F063B11D718C5; Tue, 13 Oct 2026 19:50:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:13:46 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <as3oNtys-hkW1e5A@windsurf>
References: <as2yqqA5mwAIMWnH@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <as2yqqA5mwAIMWnH@waldemar-brodkorb.de>
X-TUID: qMZFXetcpNet
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: F063B11D718C5
X-Spamd-Result: default: False [-0.31 / 30.00]; BAYES_HAM(-0.71)[77.36%];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; NEURAL_HAM(-0.00)[-1.000];
 MISSING_XM_UA(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 RCPT_COUNT_TWO(0.00)[2];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 URIBL_BLOCKED(0.00)[openadk.org:email,configure.ac:url,localhost:rdns,localhost:helo,buildroot.net:url,bootlin.com:url];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH] package/uclibc: patch to remove
 pthread_atfork dummy for noMMU
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

On Tue, Oct 13, 2026 at 06:25:14AM +0200, Waldemar Brodkorb wrote:
> For noMMU pthread_atfork() is only a dummy.
> This causes build failures in util-linux: the configure.ac script
> detects pthread_atfork() presence because the symbol exists, but the
> build fails because the prototype isn't there.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/936/93637dfaabad0a1f11a94488421f6cc73882817f/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
