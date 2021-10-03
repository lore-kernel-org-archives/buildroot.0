Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA3AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 09:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581D461B25
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 09:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 581D461B25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C80C404EC;
	Sun,  3 Oct 2021 09:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLIML7h9rB7L; Sun,  3 Oct 2021 09:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2E194019B;
	Sun,  3 Oct 2021 09:09:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 377DB1BF39F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 09:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3085042650
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 09:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqzlIz-mX63d for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 09:09:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D6642621
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 09:09:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4A51EFF804;
 Sun,  3 Oct 2021 09:09:06 +0000 (UTC)
Date: Sun, 3 Oct 2021 11:09:05 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211003110905.52243d6f@windsurf>
In-Reply-To: <20211002202805.GX1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-6-kory.maincent@bootlin.com>
 <20210930202810.GP1504958@scaer> <20211002202805.GX1504958@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 5/7] support/testing/infra/emulator.py:
 update encoding when calling qemu
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 2 Oct 2021 22:28:05 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> OK, so there are a lot of ANSI Escape Sequences, which are CSI commands:
> 
>     1b 5b 30 35 3b 37 39 48     - ESC [ 05 ; 79 H
> 
> This is CSI for "Cursor Position", i.e. move sursor to row 5, column 79.
> OK, it is drawing a box! da is top-left corner, c4 is horizontal line,
> bf is top-right corner, b3 is vertical line, c0 id lower-left corner,
> and d9 is lower-right corner.
> 
> This is definitely not ISO-8859-15; it is CP437 [0]:
>     https://en.wikipedia.org/wiki/Code_page_437
> 
> So, the solution to switch over to iso-8859-15 is not the proper
> solution. We don't want to switch to CP437 either!

Wow, thanks for the investigation!

> What I suggest, instead, is that we tell pexpect.spawn to just fix any
> non-decodable character, by passing the parameter:
>     codec_errors='replace'
> 
> At least, it makes the two EFI run-test succeed!
> 
> If that is OK, I can do that when applying, and fix the commit log
> accordingly.

This indeed looks like a better option.

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
