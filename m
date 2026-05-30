Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C735CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529B6853C0;
	Sat, 30 May 2026 17:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0NWq63jScD7; Sat, 30 May 2026 17:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83A7F853BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780161410;
	bh=Bm9MK+s6G1uZh0F+djr9hpVErAuN+m34bTJ/GVhqXX4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fsn+DPxY+jmJYD66edRVe1fxWK9CYPf96jrHxVWM9wzodaVh8CtMWfaBaz13Qw+Dw
	 r7xy7KupGEE0SzvW0zJ/Ozfkh/KV0BVRP+98M9UZ1B9c9o7qA4a8NhFhC2dq3cMk5u
	 25gsjeY3Hwz9jaAKn4ZbBjI8QILHxx4s7+p4fcokDX0X3aPqhHxuU7GSFxt5soAFPF
	 UwhDibHmCp9s+ZqxUVydiRdzr++L6W/qr6MA73I62x5cAve3WIaVscQGBzcjxLZfxD
	 5rSw6zCL7aMckZuOQTplhhbHMyQ4scj17en7nvf6f3YdmHK5fiOdVJl0A28tIsJuO2
	 IB2H18HvKedRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A7F853BD;
	Sat, 30 May 2026 17:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A453D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4016540064
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vlQJ0EDOEQL for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35CC24268A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CC24268A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35CC24268A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:16:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 024221A374E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:16:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA5EF6073B;
 Sat, 30 May 2026 17:16:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E31E510888CDC; 
 Sat, 30 May 2026 19:16:41 +0200 (CEST)
Date: Sat, 30 May 2026 19:16:41 +0200
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ahsbXdskPXb0GNRs@windsurf>
References: <20260416080903.8480-1-mooz@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260416080903.8480-1-mooz@blockos.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780161403; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=8xvAL+9Pv3O2w2R91O16nwdjH+8D5uHCyOIva3aaHqY=;
 b=Kk5nTp+54UJ/7J2kIQaWyaEnchvuR2dgVL9UvxhuhuZ1IGqbofwjviXURMkIwNXX/p4pHF
 5SL7Ox1jqzu697V9BB59Kc8X4psV3FKTFMEu6vabZNKQT+aRnsyYTh/QYRKV/iuUmFhPjs
 3XXLD145omH6LlUlyvQJ2JBZncjx2h5QWwJ5hu30O4ZuZua+h5dBaN9b6ayQkkJwFYmk85
 Fm46ltAyIgDGJLSPIxIPYppY0Xg81Zq077uUUXTzg+xGIbdEAyMZlHFoEPPtyCqbPqp6eL
 jiP8M8zHaL7ajhTxrM9clUVoOa8KJuh7AG/wJCxzHhRrwS0tlDBBjeoS5cg/5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Kk5nTp+5
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-sysv-ipc: new package
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

Hello Vincent,

On Thu, Apr 16, 2026 at 10:06:38AM +0200, Vincent Cruz wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> python-sysv-ipc provides Python bindings for System V IPC primitives
> (semaphores, shared memory and message queues).
> 
> https://github.com/osvenskan/sysv_ipc
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

Thanks, applied to next, with some minor adjustements.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
