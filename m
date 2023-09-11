Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4FCCA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12EBB40576;
	Mon, 11 Sep 2023 21:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12EBB40576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMGMbZQb2dC5; Mon, 11 Sep 2023 21:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA58417C7;
	Mon, 11 Sep 2023 21:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA58417C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A79A01BF309
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80E9E81EC0
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E9E81EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNat0SxSsQge for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 21:07:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49BB981EAE
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 21:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BB981EAE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7760320007;
 Mon, 11 Sep 2023 21:06:52 +0000 (UTC)
Date: Mon, 11 Sep 2023 23:06:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230911230651.4739c3d1@windsurf>
In-Reply-To: <20230729103022.378621-1-bernd@kuhls.net>
References: <20230729103022.378621-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694466436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yv+loPAwhQ94S6NldYWR8rE8Tu2aPyBEwMeivrI7oSg=;
 b=NabTvWZrm9NY3VOIk93SP/jeuGvPEDA/nkL7pGSdfhMTFJjVSpnlzBsfZ6hYcoalAH4HtA
 M508ddpN3IHVv2/3vCBSBQsuEQ8RzFSX1w7CtKJ/0PQ0sAsfXrJt5/QsxoFZNy73EQUUdp
 CNPaNRUsVbrLnMFg5E6UKI8wGUXuXzbwepIS43jclOKtRS6erdEJZh8frOPyCjsDjabQEE
 rO4VUOE+Qteta4oBgWupJipGuqrV1obWF4hkOnrgWZIgDCBg56M13wF2VaTBLYKwPq4dUD
 cdRPSzcd3xUYAxcQFq0JrhncJcOZblpWfU+6ZmMrnLFc9kv12lF8NyGlZli+mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NabTvWZr
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix pthread detection
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jul 2023 12:30:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Cairo's link check for pthreads support "must complete without warnings
> or errors to stderr":
> https://cgit.freedesktop.org/cairo/tree/build/aclocal.cairo.m4?h=1.16.0#n83
> https://cgit.freedesktop.org/cairo/tree/build/configure.ac.pthread?h=1.16.0#n137
> 
> The pthread check fails with this defconfig
> 
> checking for cairo's pthread feature...
> checking whether cairo's pthread feature could be enabled... no (can't link with -lpthread or -pthread)
> 
> due a warning thrown by ld:
> 
> /home/bernd/buildroot/output/per-package/cairo/host/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
>  warning: /home/bernd/buildroot/br4/output/per-package/cairo/host/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/crtendS.o:
>  missing .note.GNU-stack section implies executable stack
> 
> /home/bernd/buildroot/output/per-package/cairo/host/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
>  NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> 
> These linker warnings were introduced by binutils 2.39:
> https://www.redhat.com/en/blog/linkers-warnings-about-executable-stacks-and-segments
> 
> Silence them by adding "-Wl,-z,noexecstack" to fix cairo's pthread check
> 
> Meanwhile upstream removed autoconf support on the master branch:
> https://cgit.freedesktop.org/cairo/commit/?id=efe303d9db6e24d5786c15252327811338bc9b0a
> so no need to notify them.
> 
> Fixes:
> http://autobuild.buildroot.net/results/408/408a900ac01dbce145aff302c75f9f4e147f5672/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cairo/cairo.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

The correct fix for this was to fix gcc:

  https://gitlab.com/buildroot.org/buildroot/-/commit/ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb

So I've marked this patch as Rejected. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
