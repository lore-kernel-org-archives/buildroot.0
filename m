Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9ADCFD64B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 15:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 331BA821C9;
	Wed,  7 Jan 2026 15:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_phWYuVGybD; Wed,  7 Jan 2026 15:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24E8821BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767798225;
	bh=f4xhoizFIuc9XNXTXteHqDNYvkZctCnOuRhwVBtc78o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y8cqyoW90GJbpGp1HLC76rNUaBsG4y+GCRUI9n+WhbgPaj2we1VRi2+6kRP6hagaj
	 DTkMEJVJRV8N2jKQidSrZBS8mWYG9NinDQ0b5udyIiob9EOkwWqPcIfNiHp2Vf3/WW
	 OONIbiCvVKe0BpdUfcT9l9Y5344mzB+CUFgYwGHwcC+4dkND7OwvPSx8WrMb88d3Y4
	 JR0z01Wh0DNFdAwWcBGfwB/ocZR04RiGJymaLf58RP/ZHiZCJg5eB8bVb19JlWMS8P
	 Xd4u2M9PBCIGd5xCEYr9Vh1eSwFPCTBFltSdNaC/qgEaWUs/3mdzn7J5DjU1VYCDNL
	 6gxyACB4RyzEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24E8821BD;
	Wed,  7 Jan 2026 15:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E11922A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFB6D403E1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpJ2ks7QFzHC for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 15:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D89A4403B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89A4403B0
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D89A4403B0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:03:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ED1261A26E0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 15:03:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2B2A606F8;
 Wed,  7 Jan 2026 15:03:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1903103C872C; Wed,  7 Jan 2026 16:03:36 +0100 (CET)
Date: Wed, 7 Jan 2026 16:03:35 +0100
To: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>, Julien Olivain <ju.o@free.fr>
Message-ID: <20260107160335.27ad0605@windsurf>
In-Reply-To: <20260107100406.2263334-1-pkerbrat@free.fr>
References: <20260107100406.2263334-1-pkerbrat@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767798218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ipRvJsPstOd0Tmhqb0TMaLdpq7XtIYYKG/gBvDBA4B8=;
 b=ACH33SNNuBuFMrZIgN5YdqS96OXVRcAkx/YaAa6AhLP4+M416U53q+KnjplXgn2c16SEFO
 fFL8A0Q3y9sq6A9CKZGp+WydPz6DITTSzvcPTOG6ABHgaalmB8DvdYaP6bM6EGW2UPAnG6
 bSrLhfbKt2r9VhlZP7MUF6H1VVKgG2fTJP8vmd8TQ8+mr2MJ/P6NxmGmcVuinAbuOXKwht
 sEAfiTusCqBMYjo/aden3tPJVl4SMA5gUVfkRY4RxHs4fdZf1tCMran98581eBouAWlVM1
 nmYHyjFrzE7MLUc7lcU322gghJavhUUf+gcR0ThwhypkuchYGE2UAM6pEYDH4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ACH33SNN
Subject: Re: [Buildroot] [PATCH] package/rdma_core: bump to version 61.0
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

On Wed,  7 Jan 2026 11:04:06 +0100
Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> https://github.com/linux-rdma/rdma-core/releases/tag/v61.0
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
> ---
>  package/rdma-core/rdma-core.hash | 2 +-
>  package/rdma-core/rdma-core.mk   | 2 +-
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
