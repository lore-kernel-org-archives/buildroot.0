Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DFEC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACAE642432;
	Fri, 10 May 2024 11:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpFHhPVuVB0j; Fri, 10 May 2024 11:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6936C41FF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6936C41FF2;
	Fri, 10 May 2024 11:24:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5316D1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EE1C42431
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHw1z3LeR7vM for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08B0C40316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B0C40316
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08B0C40316
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:24:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BB0EC0002;
 Fri, 10 May 2024 11:24:31 +0000 (UTC)
Date: Fri, 10 May 2024 13:24:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240510132430.193acf94@windsurf>
In-Reply-To: <20240427083939.13278-1-bernd@kuhls.net>
References: <20240427083939.13278-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715340272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3UZi5Hi8JpVpdBenSDl1zyRA8+iPgEHTK6gnW1uKCI=;
 b=JVNq8wvdEPgRtHIwS6cAI+3O7Zq+P8JNPftmcjSsAgDEI2JWrE1UKYFiT93OSp+qUBsVgW
 6uglUbHFFZrzcDcTVL7ZrSKZoHGCHX25K+p19h91KJV6mO19OEPbOitocnakefyfSt8AX3
 5qWy01v3ASbMCtw92Zk/r9ydkVObUNLWlFRWuAchVk2tq6WgUoXKH9PMGBMVmnz6OhpBEZ
 TMEwDQj0dfbbqY//fhY57UNnAg/mAkmFAUquqfflZIdj3bKsrkvAT9SK4U7Y2Q5+7tPSZq
 E6QmUblQOJwnt3H6Ajo+ibwwSNVa7QE7uH1cG/RKJDeKurwGSc13aw9YuHi3sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JVNq8wvd
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.6
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Apr 2024 10:39:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-April/000754.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: squashed bump to 24.0.5

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
