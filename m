Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9728DC27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 21:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52932400D8;
	Thu, 13 Jun 2024 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TW5TOQunG2d4; Thu, 13 Jun 2024 21:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2566A400E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2566A400E0;
	Thu, 13 Jun 2024 21:41:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2D2D1BF340
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0125843FF
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 21:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqrb4BRJH4Zh for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 21:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1BF0843FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BF0843FC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1BF0843FC
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 21:41:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF54E0002;
 Thu, 13 Jun 2024 21:41:20 +0000 (UTC)
Date: Thu, 13 Jun 2024 23:41:19 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240613234119.5ee92044@windsurf>
In-Reply-To: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718314880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ULO+rSQIPF6FErw+tTGLgSrcDXaNjVW5+Pq87oNQqY=;
 b=X5pTs7B0G2bfSpWlVqGRJk19r571WfIS6WAsSySNrTc5UPQPQVfnBmUuobUMd7KFfpfY69
 m3xwoDmCuYdDJyWEUkMJtlODnLutQEMJoSsSyw+EeUlGozXUkdxP+xGz9PvxEpuGCSYI90
 dJc0mFbJ/OLJcDh+wFAuzZtl7bYomHEaOpU5VZkRT5ShOrdoJ3H9cHh6amvf2YKawRX7rV
 eoebKZL1w37fOnWtWdPPfJmv/UdF17OPAHEi/w7+qhw773z5qQZ6r1CLUqTVkbnbjg90hR
 3nKBw8yoTYwmr1a4OhHraLOpmrda6IYRkQ7aAieJLqmjZzBsblKP8RjY4BWnWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X5pTs7B0
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 14 May 2024 10:58:00 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Our Bugzilla is so slow and unstable that it has become
> unusable. Let's switch to using the Gitlab issue tracker instead.
> 
> There are still lots of references to the Bugzilla bug tracker in our
> News page at https://buildroot.org/news.html, but these are for older
> news.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I was wondering if the other maintainers had any feedback on this patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
