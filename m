Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95940C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521B440183;
	Mon, 22 Jul 2024 16:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 732ciMdUJWhw; Mon, 22 Jul 2024 16:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F3B640186
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F3B640186;
	Mon, 22 Jul 2024 16:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BCA91BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79595401F3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMypNlDkhbBd for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47B3740109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B3740109
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47B3740109
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:11:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D0F840002;
 Mon, 22 Jul 2024 16:11:11 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:11:10 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240722181110.70a25e8e@windsurf>
In-Reply-To: <20240719033331.13606-1-christian@aperture.us>
References: <20240719033331.13606-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721664671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6F3ZZaq6mmmgSRBgGTh/IaHwHS2K8ulnMwTspj9THg4=;
 b=kjNoTo6rMEOmD+kEvM9CcWOm9Iuq7joqUifrix+6FVp6b/cKzlqw4fam4KF2iQkbNwjHVz
 ntjP7GtQly/0xXBXgwp5+TlUqddc0yIKe20l8ktxBotESqnaS9StTXbO50SmKnaxiDnsSv
 XLit5ZXc6ceIzSCdtgG7W37FdJPJ7BHdjgAbArWZn6tqzARpxchIPsKw9PTYLQ1vZjsB1n
 OS1akch6546lf21aEivpx9IJzDDPea2HjYywQIxtWIx93xwTkjHnbs7K2hT/410GSnPp+2
 s3efp8vTGnpYHYpk8m6RlD1bYLKBx2xfL8SziZcjfGdZBBCI2DfzIosPGtDd1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kjNoTo6r
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version
 to v27.0.3
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

On Thu, 18 Jul 2024 20:33:30 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/moby/moby/releases/tag/v27.0.3
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
