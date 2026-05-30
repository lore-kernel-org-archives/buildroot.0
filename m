Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF0CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80DC185441;
	Sat, 30 May 2026 21:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0Y_PUfKsRcu; Sat, 30 May 2026 21:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383C8853FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176051;
	bh=ifsXz091KpN1feYDD2vRda2zq2dAQf2rps/5Ph+kAo4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pqq40xm1khEBrDP70Xl6KRw7ahHOAQfkTy4w4T1RHpuB2euj+76cKJzZe5e7117BN
	 gUggQQKvCI2dzbAKrrQ09UeWT5kB3Mh+9cOgDVM9cnCkY1XS5vfoZdk3X6tBxD1pE+
	 dbV8XPZ/tCZa9RErhhpzKH0sJpxhjQ6LcEjeT33AyjxA2/t7Py5bIQ8LFII0tdAGFN
	 M+KxTLRxNPClax09nLgnW6zeh/LzL9yZEgbu7HAcHVyM3hm1MHU55GGr+a+F0tRs2h
	 ZBN64zUW35sbQmbFs7zssGoD5xdXI0RpgFKVPz5nVP7+DhFkwJL4WX9mNfRUXpYSWq
	 xvnDjYncoZySQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383C8853FA;
	Sat, 30 May 2026 21:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35C29F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 258FB853D2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5J0aozSwh8c for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:20:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 252E5853FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 252E5853FA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 252E5853FA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D0DBC1A3755;
 Sat, 30 May 2026 21:20:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DFB16073B;
 Sat, 30 May 2026 21:20:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 897DD10888CC7; 
 Sat, 30 May 2026 23:20:43 +0200 (CEST)
Date: Sat, 30 May 2026 23:20:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahtUn5iwLYErmCPT@windsurf>
References: <20260530155718.657095-1-bernd@kuhls.net>
 <20260530155718.657095-5-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530155718.657095-5-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780176044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=o9BLITpg9oYC3YVjK4EcpcFjviL12qEOvRU0O97OPsY=;
 b=fvH5M1aJBpGihPAFGaMZTxwX4aSFqK9DSp4h/8JM+MTDY40WYEdeEUdOskyzb6t6Boi3IU
 N59olJGDjjxkoc18jXso5yQJ3BfqCZtMjtV1v/F+u7T61yS+kGv2M4EAb5l+Hzarq9EWaK
 bvpK+rd+UEQrhoO7kUIkKTpuidGpffYb0N213zM7hEVGgjT5y5Fyf3G3qojLt0SrnR8s7A
 Q7Cj2aM6X4CQIhhMGbzemjaLc70kdvOATsl+N7NrODOzwbJpil0IlHFzfKrD6NvccftVVu
 B7wGvFzONy7tNtXS17F4YPvEwKJXSOzqrJ8x541v8Czr0/Hl7ckcuTRDqjX5mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fvH5M1aJ
Subject: Re: [Buildroot] [PATCH v2 5/5] package/stellarium: allow build with
 qt6
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

On Sat, May 30, 2026 at 05:57:18PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
