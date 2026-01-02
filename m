Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD41FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA2B81E82;
	Fri,  2 Jan 2026 21:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9jIszXrSXfB; Fri,  2 Jan 2026 21:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2855811C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390634;
	bh=bSShwGPdQ3/5dNZP9+SPZ7nls+UC7byPNYn0rmrOe+A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EbJNCb+W9SXG5Eex2+pcBKVs1KYs9gbmdwn4rAK+x/RbavOT34Xig5wH/UO/zUsrd
	 C7Aw6I85i73wDIwE1jCK7L+zhZP0cTufrdLKpJAO4xSbrxN22UYUnjfYenipyqcqnz
	 9+RY1b+gh2zCHYRL2HS46Wg//UUDaCr2IdMW+rqFdhpIvySlSEkEGmQ6WkwlMfntv3
	 QlLfr8E5jgFt2FOQt5YCllfzA0fylbGhrDuJ0SgekUl22ih+Wyem9gHZpXPlQfZrl7
	 c3e8MXOe5pjx1fHNK59tWPl3tKINJzhmEwEzsx1ylmxgpFMDTLgHu8+j6MFwqY34hz
	 ABfrKNPI6tV1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2855811C0;
	Fri,  2 Jan 2026 21:50:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 269C019D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1784960A48
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjOzf5nzj89D for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3B2F608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B2F608D4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3B2F608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:50:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 47F734E41F03;
 Fri,  2 Jan 2026 21:50:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0181A606C7;
 Fri,  2 Jan 2026 21:50:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 670DA113B023D; Fri,  2 Jan 2026 22:50:29 +0100 (CET)
Date: Fri, 2 Jan 2026 22:50:28 +0100
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>
Message-ID: <20260102225028.1adbf1d3@windsurf>
In-Reply-To: <20250506145236.895150-1-titouan.christophe@mind.be>
References: <20250506145236.895150-1-titouan.christophe@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767390630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hp385ScFpicv+3TfFanN9vyOoE/aKPSs1j8MZ1izH2M=;
 b=ONgdWH9S6tEBPhDFierccbFnZLqsm5EW1nmDyfRo8IqBP7DrHmu/BBP8Mn9MLUqMZhlQB0
 0rmK3b0z/3YBmg/pihsw0oUFgq7wHo8NvtKS5f5XL0FvZmd0PjY9NS1+hibeCO6G7J0s75
 lDpLdGYiREtIQgJtih8rwDKeuk3jQBmEY3im5k4DtAW8tL5cudi3S6Yh4CDcv4rLFxmdbU
 8Rc42YzbZG5nCKcA72b1QjJ5tjGj+pB5E1xJOHVbZl1Vbb6s42wrLgd3WgPEbGWeewqzbx
 f91L3W1rPDw/ij8pQPhCIaaJ2fe0m+VzDFAgGh2tND6F/EOpI7D3gOL6V0OEPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ONgdWH9S
Subject: Re: [Buildroot] [PATCH] package/mender: ignore mender CVE because
 it doesn't affect the client package
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

On Tue,  6 May 2025 16:52:36 +0200
Titouan Christophe via buildroot <buildroot@buildroot.org> wrote:

> CVE-2024-46948 only affects the device management and update server part
> of Mender, and not the client running on the devices
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/mender/mender.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
