Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F328C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B4640182;
	Mon, 22 Jul 2024 16:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2SZQn3dAiJL; Mon, 22 Jul 2024 16:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C12D340186
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C12D340186;
	Mon, 22 Jul 2024 16:11:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 253A21BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FD8440186
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4zwF-Ivc24h for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9AA640182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AA640182
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9AA640182
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:11:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 046112000C;
 Mon, 22 Jul 2024 16:11:04 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:11:04 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240722181104.386cce1a@windsurf>
In-Reply-To: <20240719032205.5659-1-christian@aperture.us>
References: <20240719032205.5659-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721664665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kq5L2IeHqEU3BqDFUnZ++iXlUKoHeZDLCzIPPbr0mNQ=;
 b=J4ZqBoNEvMdYK7aZpPNtPy35DMmhc+Yb1xW+Q6bpMI6gYXWo/hUXNfdl2u49aCcwRrLcwQ
 KnEWo5niJmtMsX71Xpy1/5PdUApvjvbJHwVRP/w2ARG0Z/zDM6p8UAtyrlnFVTtDFEcFQM
 i1k0WH/s6AecdEWcVXqiDBZLdpl24L8X6/ZSyLXyUyne/gYPtzy2nnEEg+8mOJtUgk0yKP
 KfIgTZYQwXTXMetvHAxYFvlFQaX1ztpI7zSVoFtzQ5H2OsmjGPT69PJU3iCnRSz9rgLGsX
 4IAh2LwMgY0GXJBYU34MOsQpaSPgdYDJHfsjRdwQ7FjuQw2FHuVokkLk4Z6XtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J4ZqBoNE
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-cli-buildx: bump
 version to v0.16.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jul 2024 20:22:05 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Drop the vendor/ workaround as it is no longer necessary.
> 
> https://github.com/docker/buildx/releases/tag/v0.16.1
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-cli-buildx/docker-cli-buildx.hash |  2 +-
>  package/docker-cli-buildx/docker-cli-buildx.mk   | 11 +----------
>  2 files changed, 2 insertions(+), 11 deletions(-)

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
