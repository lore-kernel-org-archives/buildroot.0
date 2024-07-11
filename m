Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E4C3DA47
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 08:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C98FF4172F;
	Thu, 11 Jul 2024 08:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOQqXEm0ellX; Thu, 11 Jul 2024 08:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933D441749
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933D441749;
	Thu, 11 Jul 2024 08:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C25D1BF471
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 08:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04F1441004
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 08:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3wNKkTn-C3v for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 08:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F13B1405C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F13B1405C7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F13B1405C7
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 08:52:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CECB040003;
 Thu, 11 Jul 2024 08:52:01 +0000 (UTC)
Date: Thu, 11 Jul 2024 10:52:00 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240711105200.292f5783@windsurf>
In-Reply-To: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
References: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720687922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2Cf7EU5iGKFkXfRPvF+omyhxXRgSFB7YwW7CNJSqUY=;
 b=mRFUB2VaWat0gYXAHUPZLPHe0oNGaK+AuVuWYxRfmV+by59xkTMDG+hJr1vuOE/rFpAEse
 U5gzjRPPxg60urVyfy4YVqIn8M1fsMdVu8pp0KCHk5B8X7JuR07Tvmif6IYvlnfarvBM0z
 nPFuRCoBNi/0RMNZ+Yh5Wg224Miibt/I+YLR0/9A/ny3TClLlVjLvNSWzpK6VTQtR6MzCx
 6xWmFMRwYtUBJTJ37fSt4ZYX1PsVvZmLbCYME+sn5QpNTT63hKZ+jCA7yZ/rj/nccgKINR
 h0YX4y+m3bfo6Ad7kjfI3XHETCiv5osX0+Ux2MirfiIHHLmGOvDnFL+jXBbMlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mRFUB2Va
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-mali-utgard-driver: fix
 patch fuzz
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
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Arnout in Cc.

On Thu, 11 Jul 2024 09:05:25 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, sunxi-mali-utgard-driver fails to build with output:
> 
>     - r6p2:
> 
>         Applying 0018-mali-support-building-against-4.20.patch using series:
> 	patching file src/devicedrv/mali/linux/mali_kernel_linux.c
> 	Hunk #1 succeeded at 1125 (offset 193 lines).
> 	patching file src/devicedrv/mali/linux/mali_kernel_linux.h
> 	Hunk #1 FAILED at 16.
> 	Hunk #2 succeeded at 33 (offset 5 lines).
> 	1 out of 2 hunks FAILED -- saving rejects to file src/devicedrv/mali/linux/mali_kernel_linux.h.rej
> 
>     -r8p1:
> 
> 	Applying r6p2/0013-mali-support-building-against-4.15.patch using series:
> 	patching file src/devicedrv/mali/common/mali_control_timer.c
> 	patching file src/devicedrv/mali/common/mali_group.c
> 	Hunk #2 FAILED at 1768.
> 	1 out of 2 hunks FAILED -- saving rejects to file src/devicedrv/mali/common/mali_group.c.rej
> 	patching file src/devicedrv/mali/common/mali_osk_types.h
> 	patching file src/devicedrv/mali/linux/mali_memory_os_alloc.c
> 	Hunk #1 succeeded at 202 (offset -2 lines).
> 	patching file src/devicedrv/mali/linux/mali_osk_timers.c
> 
> 	Applying 0020-mali-support-building-against-4.17.patch using series:
> 	patching file src/devicedrv/mali/linux/mali_memory.c
> 	Hunk #1 FAILED at 57.
> 	1 out of 1 hunk FAILED -- saving rejects to file src/devicedrv/mali/linux/mali_memory.c.rej
> 
> This commit fixes the driver patches on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...he-patches-to-be-applied-with-fuzz-0.patch | 317 ++++++++++++++++++
>  1 file changed, 317 insertions(+)
>  create mode 100644 package/sunxi-mali-utgard-driver/0002-Update-the-patches-to-be-applied-with-fuzz-0.patch

Thanks for the patch, but I'm not entirely sure that's how we want to
fix this issue. Indeed, apply-patches is used in quite a lot of
packages to apply patches from Debian. Do we want to fix all those
patches, like you did for the sunxi-mali-utgard-driver? I'm not sure.

So in the end, I'm wondering if apply-patches.sh shouldn't take an
argument that specifies whether we accept fuzz or not. We shouldn't
accept fuzz for patches provided by Buildroot itself, but perhaps we
should keep accepting fuzz for patches that are not part of Buildroot.

Arnout, since you accepted the patch changing the apply-patches.sh
behavior, what is your opinion on this?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
