Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26DCFD641
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D78D821EE;
	Wed,  7 Jan 2026 14:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAyQpAwMXcPc; Wed,  7 Jan 2026 14:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B06582204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794947;
	bh=PyPeLmuNh8KIRHyLptbaxB8/qBo+69Yh0DeJzj9QAhc=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pwGpXNVSF6hkQttgFVegseUwiMGAz0eVXHNQ5I3V8yptqlTDsAd366FviOHUStf7q
	 VeZrCd57AZjH4liSymm4Qyal84uUiJueLNqRob4gwCjEt9sSdQnsRytY40v8NR2ZVh
	 7Wsvl6iGqT0YJWnBBweeAResy9OZgvJunqVlRdV9ZExLRASJh8y1YQGy684B7Et0IW
	 gU9WgzLfnIRhVfxhZXHQQn+1sumqJaaq47epIDtIbYfVqxOPCm5y2meGUzIIJ6xBOO
	 qJBiHFHfr8PHulz40XuPkFimK+ltlJJc78627jZB8cLtJFWJzwzSFeLyFMEe6tNOjm
	 oRRTGGhE535pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B06582204;
	Wed,  7 Jan 2026 14:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F119970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 056E0400A5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3pycp2UI8Qf for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 021794007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 021794007C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 021794007C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A25414E41FD8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 773F2606F8;
 Wed,  7 Jan 2026 14:08:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D980103C803C; Wed,  7 Jan 2026 15:08:54 +0100 (CET)
Date: Wed, 7 Jan 2026 15:08:53 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20260107150853.60e7341d@windsurf>
In-Reply-To: <20260106151112.335270-1-francois.perrad@gadz.org>
References: <20260106151112.335270-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4FqllaJNAu0r+pXwjDXisJE/jLnHTn+/h0iEt9l+Fjs=;
 b=p0gN8GlItOfMVX8zywVinpUZ/6jcrgIDjLxsCkHvkiS//+TGBu2uyg0RTxZeZdniZrRzPZ
 lBzFbTqLezJUyxglm/SOQ87uppTPNsi/8ZB08sz4vfM5xXmeFWJUvV/don7N2HyEmoYIfH
 Jj4tJSumWMyEUaSWLFjLKegUhQdhOhSrJPIsXOj5CML0tPwAx+/jns7HjfMe+BpLrZxnmk
 GCB+mWYPMuQ2ropWEUGrkJyD5pyry9zP9ADbS06VnpTRc7gNICJFLArbpctS4r6voqKBKY
 6F7VYlQZRK4JbbjI5EtiOq9wmmtNfBw4G3fMqF+M7QbX4QdLl7RRn+2MZC7jrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=p0gN8GlI
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  6 Jan 2026 16:11:11 +0100
Francois Perrad via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
>  board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
>  configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
>  configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
