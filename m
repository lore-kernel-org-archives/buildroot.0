Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86465C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53AE9401A0;
	Mon, 22 Jul 2024 16:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceyEXrgGO7Eu; Mon, 22 Jul 2024 16:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87664026E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D87664026E;
	Mon, 22 Jul 2024 16:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB01E1BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C77CD80DEA
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzlSBe6nPyMX for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE0F780DE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0F780DE9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE0F780DE9
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:11:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 052052000B;
 Mon, 22 Jul 2024 16:11:14 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:11:14 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240722181114.2b20f1a1@windsurf>
In-Reply-To: <20240719033439.14225-1-christian@aperture.us>
References: <20240719033439.14225-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721664675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79Jh1SvhZc3TgsJQjTKikorf3aUoFdY3Me461KyQe8E=;
 b=cK9sR+3tJovxiAFTXNLtVpvatWNRQz8Ae3IoxYZMWaCC7DUTKzgDhSKkjvWikJI2TA8kYF
 Jl4vnpYTdSC8g+qOpgcrLKDqjRTYgWr9km15U5hR836TX5injfGDu41ntHA/WLgxDeWpQU
 yrBNmFWWpkoV7VIGGPCRjwhsHie5fXymAsx1wQMhLrtJmjeZj55P/FkbOZP68Y6+pvjivU
 AZ1KYbAtgQo4DIa6cUE0tP2sBQ3PLrOH2H+OpBnAAGva+1gs2A/el6WXJb84QVkSb7M4Qs
 p+OafDZvRtpSSRPEz/Ik6lbX1k8Dunr48f77GkJ1m7rk5g3CV+nQOPnT8DJjFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cK9sR+3t
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.20
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

On Thu, 18 Jul 2024 20:34:39 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/containerd/containerd/releases/tag/v1.7.20
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
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
