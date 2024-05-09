Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B92C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C794813A2;
	Thu,  9 May 2024 15:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JA3BnCuAUJpX; Thu,  9 May 2024 15:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A8B813C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A8B813C6;
	Thu,  9 May 2024 15:47:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B022C1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9245741773
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ia637RFMZbGq for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E66DE4176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E66DE4176B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E66DE4176B
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:46:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EC32FF802;
 Thu,  9 May 2024 15:46:57 +0000 (UTC)
Date: Thu, 9 May 2024 17:46:57 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509174657.24d66dc6@windsurf>
In-Reply-To: <20240412231215.2547252-1-ju.o@free.fr>
References: <20240412231215.2547252-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByCTgOmhqxn0l2QO2w2zHxOf3duX1mWynR9Mr2G/Vgg=;
 b=Giq1R2eaXBdFswRmLn86AwmXU6wiDbEhHUciesj5ILeM4tRFwveYfXYC6qYDbEqlWwxRQu
 o+6Uxl7UPMajZw6tb/u4Zb5c2FQ3mlpQDVjAxgOiGlWGlnQPtMria4BAstXCkcOdkgcEsu
 SGQE6H9ZfxAQNftvxywqyg+zWhnNvN3hyjuwCnrHve92/RR/IF5NmNEQ9n9t0OyulQe+LK
 RYFLV0qtQ0DRWLwHXtxAjQInqf5jLjjRYElmdoj5dOIXYF23zpFG/aXQozSctoyf6NkOjQ
 xuKA3lbe9AZJgDUbYNNd/lPLimyd45rH6ryGXHxfSr2B2Qc5wz2NWXmFeNXF2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Giq1R2ea
Subject: Re: [Buildroot] [PATCH 1/1] configs/spike_riscv64: bump opensbi and
 kernel versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Apr 2024 01:12:15 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump OpenSBI to v1.4 and Kernel to v6.6.26.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  configs/spike_riscv64_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
