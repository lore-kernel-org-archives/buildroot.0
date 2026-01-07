Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CFCD0D178
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A65381223;
	Wed,  7 Jan 2026 22:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77WcfdpBV6MK; Wed,  7 Jan 2026 22:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7172481226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767824859;
	bh=Falkg8vRW12K4r4sjtwPcG8Y1j/dztHJ4Z1A+YG/Cn4=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PkxvkmSE4Sva+jPe0jgdIfvLUjU099QGM5ic8ggWG2zOL7wMQu/DE6LT7VF8tlsp8
	 1binO6UTLPTc4aaxRz/v4SVYlk3PavG+xfy+XFuYSKalYGaBn7sOS6A7bDndYj+8mA
	 Bb5SVGmIEcriOtw+gdsp8JRcad+VAeGkbSoeKYDyd2xnhOupjMqq5o+9vBfzRQMR4+
	 Lyug6CI2GkScfrDRa4J4Su6GucN7qsqqIG5gauDueifPVQ9K92HmV43+VJFFiQjaud
	 MeC6oneL37l02mqZl8GNVv6ujpVIecCVfaZNELQQGA2FabNeXNgzJnbbuehvFBEb+h
	 7B3q3GI3xoNEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7172481226;
	Wed,  7 Jan 2026 22:27:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C3C9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF12781223
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2IuJY2XOgNg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F03AB811B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F03AB811B1
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F03AB811B1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 64F23C1ECA2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:27:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B809606F8;
 Wed,  7 Jan 2026 22:27:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C58DF103C8307; Wed,  7 Jan 2026 23:27:34 +0100 (CET)
Date: Wed, 7 Jan 2026 23:27:33 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20260107232733.789659af@windsurf>
In-Reply-To: <20260107155242.143698-1-buildroot@heine.tech>
References: <20260107155242.143698-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767824855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=P7oxplMAY80M3DA12mSPurzkn8Ru5ehiYP1nsMt9FIY=;
 b=wkH2WQJa+fMEC6T2Zkk1KBKob9vqGOshh2LYldD1xve4q/v2ay/NW5nhiib8hB9P1ni/Wu
 0jXY5OLhNe7UiinuBxbLhut/vKI6CES+UNatGzipj7vED3YwEkkln8gcnDnI8+dT7eZwWo
 iyPPyaBA5mS7X8Jk/swBbE0Et/2uK84bTE9tW8QrQ+1t2LhjSlhkDh73i77H7KEUxZrIm1
 FyAqzsSGaADzl7tVEPzW/tVWb+wQm2RxiOVNxyhCFC+npUpLZCI4A/b5RgDKXwi1BbA9Ot
 HZXP+1f5vLoMxt+TXHEJVjXOLSU4EfZwlom85DjTw89EfA+b2AHGUjaLqxjxpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wkH2WQJa
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.12.0
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

On Wed,  7 Jan 2026 16:52:39 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://github.com/catchorg/Catch2/releases
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/catch2/catch2.hash | 2 +-
>  package/catch2/catch2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
