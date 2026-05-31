Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5D4CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9CFA60FAC;
	Sun, 31 May 2026 17:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_9zGxvT-ZHK; Sun, 31 May 2026 17:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9391160F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247248;
	bh=T6mi29h/5EhbBwF25m0oKh2SQWGgsGI5QVkDO4y8T9Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=naekmosKtIXIEK11nXtKAk44zq7bOwrdxcJdIrEeNimg6vmsV8epI80LYRSeu41eM
	 TT2FoPN/55AhtlRJYHmPOG72GKKqmV5T5IsleojYQqg3rGP5xFtVYOq9/7YMojD7/m
	 CkcgyysjLxUl9d4C/ozWeoReuz0PG3lhxxr2Q4HyOwSS4WJ0m/KCvqRQsCKctUSgxX
	 Upp4YDD65bnezLtGPifyESu4jq01jAwoqVAexG3mUx8Tn4BFIr05UzN07ssSRyetkJ
	 hYX0lgVRDysUR71ppP/ViTqj4lTBI06ei7BGLzudTdUAERv9zkdUpeFaPscz6nFHvG
	 kliE+sUh3tFMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9391160F7F;
	Sun, 31 May 2026 17:07:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FD3EF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15664405DF
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8m-0E7cR_Ch for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4277D40183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4277D40183
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4277D40183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:07:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2F08C4E42DB4;
 Sun, 31 May 2026 17:07:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 027D660230;
 Sun, 31 May 2026 17:07:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07FAF10888CC7; 
 Sun, 31 May 2026 19:07:20 +0200 (CEST)
Date: Sun, 31 May 2026 19:07:19 +0200
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, 
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <ahxquZFxTFuwwtcs@windsurf>
References: <20260218124726.120001-1-mooz@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260218124726.120001-1-mooz@blockos.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780247242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=9u5j5Tyz6gfzOVbTceV9XAhoAXosX7g2jyU2QV1Q1nQ=;
 b=xt0tDlPOhBWCEUT/9zmol/LWDRNxKvNwrep8fmOwY9DqRW0r/dtJtZ4omeqsGJblUQ9O/V
 kuuRZfmX5p+ARIoXRo8muUgUxPfcz0rC8uq0wWZG4ZhHkzw9ECxsf5qXmuJi+T2Ms5uXvH
 YfNN4Bg5/spozbttn604IYfFEwb9cruzaJ+oLyPu1hn/fv/jK0yHFdmfvwI2koeWRkRKgQ
 yG3DzjJ4zWS/o6YW74N4AySGAJ76sKD3SzTyYk11DUlPnKWUUWxwP2zoCR0sgLwV/1KvYh
 0MQXVcbFD/XEv0ckFwvEkZTYFzMefaF7KjJlImnXwmHOhZZ3G7hczt/sSyzo2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xt0tDlPO
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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

On Wed, Feb 18, 2026 at 01:46:27PM +0100, Vincent Cruz wrote:
> Fixes:
>   https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log
> 
> Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

Thanks for the patch, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
