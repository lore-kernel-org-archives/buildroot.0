Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70335C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186754066E;
	Tue, 27 Aug 2024 16:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQUVvEQrVRiz; Tue, 27 Aug 2024 16:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8240D40658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8240D40658;
	Tue, 27 Aug 2024 16:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0CFE1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5D4C6088E
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1_EczV227qE for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9CB26608AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB26608AC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CB26608AC
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:29:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBA4E1C0003;
 Tue, 27 Aug 2024 16:29:19 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:29:19 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240827182919.4154068e@windsurf>
In-Reply-To: <20240827073642.7819-1-buildroot@heine.tech>
References: <20240827073642.7819-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XiOd6riTSwPYao58GFLhdzdvL5/fdAHvS5MZZMIQE0=;
 b=m+MpLHJ5v9a9IS9W8VFAAcbLNBjyyej18BCyoiVFcmy4RarvJKKoZHrHt6tncGWOBB9uaF
 sks2sUtUAPbtctaWtSiJiiHANFWq03e2V1FJ5MceWZ7mhVzRSNG5Zdzlxnb4SafykL+dam
 oEnbfzgDjTEHYiA8a12FR5iI+DdMDP3JPKzsC8FvG0Tdm+scRx7TwNKowV9f/kOHs8E5IB
 z4t/yUi39ZVLBWstERk0/NM7vnVgt0DBDj2jlOrpR5Qhw63ERnMdf/qX4yWXVZCzBSUD64
 dHQ+5uNVGX9YrNpIn1XlvMHgR6evVtMek86VbloLb1q/R/ATEE8Acb0mh7iWdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m+MpLHJ5
Subject: Re: [Buildroot] [PATCH] package/sqlitecpp: bump to version 3.3.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Aug 2024 09:36:41 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> LICENSE.txt hash update due to bumped license year.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/sqlitecpp/sqlitecpp.hash | 4 ++--
>  package/sqlitecpp/sqlitecpp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
