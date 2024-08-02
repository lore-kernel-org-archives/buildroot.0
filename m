Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986CAC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 20:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 553F240D0B;
	Fri,  2 Aug 2024 20:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nWy2LVUGrWE; Fri,  2 Aug 2024 20:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21192410C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21192410C4;
	Fri,  2 Aug 2024 20:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6641BF37F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24273820A8
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hfmtjdh-AX6T for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 20:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E81E580E5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E81E580E5A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E81E580E5A
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 20:05:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CBD2FF802;
 Fri,  2 Aug 2024 20:05:50 +0000 (UTC)
Date: Fri, 2 Aug 2024 22:05:48 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20240802220548.1e6676f9@windsurf>
In-Reply-To: <CAMo8Bf+5XSQyEp1ZP1UbqL7DF=VLfWbUuA-3OFY9M7WENn0GaA@mail.gmail.com>
References: <20240802170713.2790A83B45@busybox.osuosl.org>
 <CAMo8BfK7FSn8imzqjTW8BLS7mPk6HLTKvCM4aBFaJw93z-ZpmQ@mail.gmail.com>
 <20240802194315.2de20808@windsurf>
 <CAMo8Bf+5XSQyEp1ZP1UbqL7DF=VLfWbUuA-3OFY9M7WENn0GaA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722629150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97reOSuVHYv4zS4tmQQxZrmGGBi4g/3/0GLsp3DRF4Y=;
 b=V+WcL+0XUWolsd7Cexa3MtHKtNLhPYyf1tm7HifqvIfuMdVeEj1tLq6y6pNTKNwVg/jR9X
 U29T/pMC+HCcvYft5AEnlkwOr6aJ4YfyFx0wiKyldoOHM06EDcCV4uDgz6j/VHh3L6TSnb
 76mjoWYwBzDb+yADmI6RcUsW1cTJeKffdY0UtleSF1r88eqFwMKTgPrOJBf3gKwtFUhsgJ
 cBnvCKdGVBrANew65yPNEmWp3UfX6HRiB2OW2CqjZrIjfgu8xpMfql1lXe223bIFhPk8Fu
 /jlEPEtLfdJnjZbjbBABu6ocQURw9GOH6oXs+ARrn4hbcAdGvhd6+9PvM+9d0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V+WcL+0X
Subject: Re: [Buildroot] [git commit] package/chicken: move literals into
 text section for xtensa architecture
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 2 Aug 2024 11:00:02 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> > It causes build failures:
> >
> >   http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e/  
> 
> I see the following in the build-end.log:
> 
> /home/autobuild/autobuild/instance-2/output-1/per-package/chicken/host/bin/xtensa-buildroot-linux-uclibc-gcc
> -fno-strict-aliasing -fwrapv -DHAVE_CHICKEN_CONFIG_H
> -DC_ENABLE_PTABLES -c -Os -fomit-frame-pointer -fPIC -DPIC
> -DC_BUILDING_LIBCHICKEN library.c -o library.o -I. -I./
> 
> There's no TARGET_CFLAGS in this command line.

Hm, indeed!

So, Woodrow, could you have a look at the chicken build system, and why
our CFLAGS are not passed down to the build?

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
