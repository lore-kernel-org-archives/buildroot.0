Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C69C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:37:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C316141B
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15C316141B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B79AE607BA;
	Mon, 15 Nov 2021 22:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXsTZAZ-HpbY; Mon, 15 Nov 2021 22:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152A36078A;
	Mon, 15 Nov 2021 22:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3121BF406
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37BB06078A
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_UzDWz-nasy for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 22:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13B2360763
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 22:37:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0E075240008;
 Mon, 15 Nov 2021 22:36:59 +0000 (UTC)
Date: Mon, 15 Nov 2021 23:36:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Tim Harvey <tharvey@gateworks.com>
Message-ID: <20211115233658.47839c65@windsurf>
In-Reply-To: <CAJ+vNU0pupEcDjVschLgBW9tdjy6MpnA0WCJE8cSzxqnCy9GGA@mail.gmail.com>
References: <CAJ+vNU0pupEcDjVschLgBW9tdjy6MpnA0WCJE8cSzxqnCy9GGA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] BR2_ARCH_IS_64 NEON support
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tim,

On Mon, 15 Nov 2021 13:46:40 -0800
Tim Harvey <tharvey@gateworks.com> wrote:

> I'm curious why NEON is not available for BR2_ARCH_IS_64?
> 
> I'm working with boards with IMX8M SoC's which are arm64 and do have
> NEON support (per the NXP literature and I've run binaries using NEON
> on IMX8M). Is this a simple oversight or is there something wrong with
> my understanding of this?

This is explained in commit 0976cd6cd64a128a2ac921e4f35f0e7cbe306692,
which states:

commit 0976cd6cd64a128a2ac921e4f35f0e7cbe306692
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Wed Dec 7 10:25:21 2016 +0100

    arch/Config.in.arm: only enable BR2_ARM_CPU_HAS_NEON for ARMv8 in 32bit mode
    
    A number of packages use BR2_ARM_CPU_HAS_NEON to know if the target handles
    aarch32 neon instructions, which is only true for ARMv8 cores when they are
    running in 32bit mode.
    
    Notice: These cores do support neon-like instructions using a different
    encoding in 64bit mode (it is a required part of ARMv8, similar to the FPU).
    
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

However, it does mean that we need to improve the situation, to also
properly support NEON for ARM 64-bit platforms, exactly as you say.

I'm not sure if this means:

 * Fixing packages to use BR2_ARM_CPU_HAS_NEON && !BR2_ARCH_IS_64 when
   they use aarch32 neon instructions

 * Separating BR2_ARM_CPU_HAS_NEON into BR2_ARM_CPU_HAS_NEON32 and
   BR2_ARM_CPU_HAS_NEON64 ?

 * Something else?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
