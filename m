Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5C2CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 12:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC8780C4D;
	Mon, 28 Sep 2026 12:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tSzVo9RZ0tU; Mon, 28 Sep 2026 12:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 40CED80DC4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790597328;
	b=fjmudecBom7h2oBNnAnVBS9s/zmwAk33KCqlky/mg2b0mZg7Rr6DjRVgfA0OdjIItY3e
	 Kh2BNG6nRjabTXsv0gmUwgS8OSVblCOkcvp0tn/jswG7ohyeYBjLsJ74pyY5/9OlllrQ+
	 UaXg64lZ3oRZy2QooolVmZmLfZEDVM5x3OkULEeqRpGWNh7JOdw8wLEpp31l/hR4P8faQ
	 StQxXeu5Hb090HzB9YSLv8063uVjwBhPmzwt2nllQe6rRdA0a0CWimV8o1Rb7L4X26wRc
	 qskwbvAmnNwG/LeQsYEW06f7LdZ4tuaeGILe0G5mtxOwHyMKDHlsA93zDCFd1Z9vubg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790597328;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uh9Hm3TCZ2hN7+XKPZxbpcqorSZFS8lARQ4RMPk7ws8=;
	b=CI0nckh454Ou7TNQG1IQytxXYW5idxD6nwMDc/m0dDYdYvBk8gT/XwDmEgVJdiipVOv2
	 63zNqjEYf1CWcrmnfSR0sLVDQvXtng2+EJX6SzrqBUkWkArj3phzHkaX31wDrkPSuvSbz
	 YRq0jDR/tYLllC61SUDF5mWVs8yuu1kaqxZmdX8uL3fX5HMMmmZJ4b8QVk77xlHj+q4MI
	 Xi7TK/Tf3Ayh3iPpRU2tY57acpF8dva7Qon56dKQ8VvH6ypIwBpnVC3u7O/cJ3krsfFVy
	 Q5rVd3TdhD64mzfkP/hrW7oXNZNupojtY+ScHf9PCrRfwg14/+QTCMbgUdB9zZrfSng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790597328;
	bh=uh9Hm3TCZ2hN7+XKPZxbpcqorSZFS8lARQ4RMPk7ws8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gEkoR11nvKipMn8fPw2gtSbdDVIm+AJNflgjHDiUYTLCvukazFJkusdIumpEWRk+H
	 DCGcH6h8/EKuNN6MYceeIVMC0ZEwkRQlJEhgVnThHdjgP2wCe0rErrfYbZDT2khJyF
	 Pq8EJYeZpmCIuGQt3X4b1kZEi/gEtha/9yHEF/SeRV4uyWeFlVuts5jtkjYZZG1mq+
	 1wwvU6LpLZ3lR6ol6D43o1cyJLI4+iS7xblQAjnMGvSTRd+t01eV6iiyVKKM2/mCEm
	 7qgdKtgNlV+A/AQUdeZCqSb0HHW/x41dhfAPmblg08PQD7Hld24sa9qLrm+LzgosCD
	 nieiGBexQbJlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CED80DC4;
	Mon, 28 Sep 2026 12:08:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F398372
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E281E605E3
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SmV-afz-_Wc for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 12:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79054605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790597325;
 b=NWsnSTC2z4f4UCwA3xlxYeUaDb3iaBPR6Lvd++fcJFyxwU6QW2YrcZAxv9TQGlMQNKN7
 3nnh34yxo2u/k8lOTS1ZopSCDfMh+XRgSEvFLRDwZL40OjudXlsZAf4JFLqZlwWiB/+ge
 BhIjWSxS/f8A+vFeACWDEx9+3/dhTkDNzILODflazBVwf4WcNl77+mXCqqht/+e9r+RQ2
 Eg/WMAkIlasEAHTHd0FmN5JqX0na4G0O29p9YF0vCa1Qr/Deu+dS86q8NDJ9jNVFo/t+V
 YkwF5GlcOKaJEbrNcAOlV9XgQWrDGn1YWQiBfNORKtYpuf6mlhp7iasVmuROH9y4VCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790597325;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=g+ZahgkZ02Y/uxwSeSpU922ao54vfxLG8dIiSwp4um4=;
 b=OX5cCa5nrNZg13ov71saY7FO5PFewaha55JrPJoJFqiu4KJpfs79NTg9yYY2Qp+O2rVF
 xjySu2olVyhYnmZ65U7ApldENYGIg68vFq/kswJ7cP0A9j/gE5ITjA6hyht8WMHbpr7oC
 iG7PilT8rDax5exe5FKSMh6jmsTzkVV0TgUxPHQ6yZ98Xe+7OL/Ff08iOCZdHV8too3cu
 gzvTfpYVWjJkVn+2jlwCH9RRUfAzEzc7UORAX5HZtRIAIpOZmcZ++Xth7HVzj2dWub/3z
 yVvx8Ve7Go+FAhuCfvJXuuk7+IHhq8YpEE9w1eFbeOvTbA0MxCLwVa19edbXjxq2wOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=17w1LGev; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79054605DB
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:08:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E43894E410A7;
 Mon, 28 Sep 2026 12:08:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B4057601BD;
 Mon, 28 Sep 2026 12:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36EB9102F228B; 
 Mon, 28 Sep 2026 14:08:35 +0200 (CEST)
Date: Mon, 28 Sep 2026 14:08:35 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <arpYvTFQLrmvpo7e@windsurf>
References: <20260928113943.1418780-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928113943.1418780-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/pcsc-lite: bump version to 2.5.2
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

On Mon, Sep 28, 2026 at 01:39:43PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Autotools support was removed upstream in 2.5.0, so switch to the meson
> build system:
> - the tarball is now only provided as .tar.xz
> - --disable-strict has no meson equivalent and is dropped
> - there is no debugatr option anymore, so define ATR_DEBUG via CFLAGS
> - pass -latomic via LDFLAGS instead of LIBS
> - meson installs the systemd units into the user unit directory by
>   default, so pass -Dsystemdunit=system to keep them in the system
>   unit directory as before
> 
> Since 2.4.0, pcscd.service runs pcscd as the unprivileged pcscd user,
> so add it to the users table.
> 
> COPYING hash changed because doc/example/pcsc_demo.c was removed from
> the list of GPL-3.0+ files; Buildroot already listed it as
> BSD-3-Clause.
> 
> https://github.com/LudovicRousseau/PCSC/blob/2.5.2/ChangeLog
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

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
