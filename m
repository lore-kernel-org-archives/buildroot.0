Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEA8C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E02D183BF2;
	Sun, 11 Feb 2024 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ozpgzRZ4moP; Sun, 11 Feb 2024 21:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0371783C50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0371783C50;
	Sun, 11 Feb 2024 21:29:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8FFB1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D672683C29
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHM-gouyMOSX for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACE9783BF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE9783BF2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACE9783BF2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:29:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8C2BFF806;
 Sun, 11 Feb 2024 21:29:27 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:29:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240211222927.4587f57b@windsurf>
In-Reply-To: <20240211154714.2311642-1-bernd@kuhls.net>
References: <20240211154714.2311642-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707686967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJ7Cy9f9hKuJGMiFDKhzC1PoW8MWoWmIElx8tXCbopw=;
 b=LarfvPccx840cd+wesEFvhNpD/c8/hN1i2fcroGR/t8GKGOMOgNj5G3SsAGFHZCQwxt5vk
 qs1SMHCH6BCfltZzWus+pxUv8pZOHxjiGwCuPCHV7b9c/QiYwnYLZr3Yqt42exNH4Ifw90
 mw65OeM8AS6pu1l/xSJQCo2tTeaSCv8YOmnQnIeHrOb07/kBkTw//f39cvvcdDdDDHj4PQ
 hQu16NkqdN0EUk1HQHE6xXUtLqNeUhk+yA2HSesofxt8bS8ql5VtyKlhQv7hy1xKYbSyVn
 5tM7bJT/fLJr5eSN9IdR9AtQdN5XjGqNaHtgYGoTfxjBhJwZTVy+7hd57JBe7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LarfvPcc
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.11
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

On Sun, 11 Feb 2024 16:47:13 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Changelog:
> https://www.alsa-project.org/wiki/Changes_v1.2.10_v1.2.11#alsa-lib
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...STRING-macro-outside-PIC-ifdef-block.patch | 50 -------------------
>  package/alsa-lib/alsa-lib.hash                |  2 +-
>  package/alsa-lib/alsa-lib.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 52 deletions(-)
>  delete mode 100644 package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
