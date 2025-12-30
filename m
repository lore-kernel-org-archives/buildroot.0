Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7753BE95A89
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 12:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5BB818D0;
	Tue, 30 Dec 2025 12:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0s3rTBJSrUZ; Tue, 30 Dec 2025 12:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7094281A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767098261;
	bh=g7gWjQBxhwSQPILMm/2+DgbG9/p564SDmu2bT8Ohe8s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f1bCEOLx0SFhU3jrPOPGtWcuOStWg1KJOcmAOS6EK64roZdTOMh+hSUco7m4oPM1I
	 Iztf1DGgMq5qu4wsoAB+d9d7+hHa7IpbP0jbxRtml0TrayCu7xpS849koMIvMsA0X4
	 kuejYBSpVysnQADc0EIgNhKHs+9DFOMM78wJ2lVwZMq2qp3mJZKLqA+gZlnZQtJjYc
	 EqCK7IEMMJYHGAjV5R1jWcg5nzVDkK6stqFNi/0IkGfnp/tn2c6rNgBmw//uwSpBcj
	 vy4Mm/WQWVBW2CMHbEMcHFvQ82AnLcWm36GfN5PZpAKqdLqXenDFmy1rK3bLEGshpl
	 gKWa8NFTywv1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7094281A99;
	Tue, 30 Dec 2025 12:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EB00D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05EFF40531
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Wpr27pPFQH9 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 12:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2197E40524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2197E40524
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2197E40524
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A4D214E41E82
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:37:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73D8360744;
 Tue, 30 Dec 2025 12:37:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 339AA113B0392; Tue, 30 Dec 2025 13:37:33 +0100 (CET)
Date: Tue, 30 Dec 2025 13:37:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251230133732.067f3e1e@windsurf>
In-Reply-To: <20251229075539.516207-1-bernd@kuhls.net>
References: <20251229075539.516207-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767098254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=K0A+AVwBYCpebIH7tmDxtRM7VSjUuV3fP0HBzIO2Ukg=;
 b=vr5rs3548FE4WzbgYdiBbNmAn1rLlS4T7HUXA8//LAE6UzorZ10EmuRWuARO+rmxyk98KO
 gwJXYzDOnDcB5ILp/W18QSK4eb8uMUGw+frDq74xrTRS2vHS60v1IskpBM1DAB9U4QQdIm
 UDev0dtqgn+eg8pdbPHcvyqzTfKgSXQitl0aXAjTJBQpVJ/1t0GFjtOnC0L0qvVIOrGQS6
 oaPNwUutJSm1ni5tJje8QshLNrktyjOgC0kGpyjMaXKn+1dkMAOw38hZNQdRJ6yth/VkGo
 Ira6R5tjYzipyWK3BUInHEPqU9L8wzVqsxkuDPtwjP1/xB1KiHl2wvEmjfdXfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=vr5rs354
Subject: Re: [Buildroot] [PATCH 1/2] package/utfcpp: fix comments
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

On Mon, 29 Dec 2025 08:55:38 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454 added this
> package as copy from the taglib package but forgot to change all taglib-
> related comments.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/utfcpp/Config.in | 2 +-
>  package/utfcpp/utfcpp.mk | 2 +-
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
