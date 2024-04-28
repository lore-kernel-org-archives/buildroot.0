Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41158C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 14:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26BA1400DF;
	Sun, 28 Apr 2024 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y2LTaxOr8wG; Sun, 28 Apr 2024 14:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA036400D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA036400D0;
	Sun, 28 Apr 2024 14:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB6221BF5B4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 14:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C84E840147
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 14:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDMf2lW-frgf for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 14:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DDED40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DDED40025
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DDED40025
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 14:18:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1113AFF805;
 Sun, 28 Apr 2024 14:18:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s15MG-003NA5-0P;
 Sun, 28 Apr 2024 16:18:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
References: <20240401112421.27763-1-ps.report@gmx.net>
Date: Sun, 28 Apr 2024 16:18:24 +0200
In-Reply-To: <20240401112421.27763-1-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Mon, 1 Apr 2024 13:24:21 +0200")
Message-ID: <87ttjld0zz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/zic: fix host compile (needs
 CC/HOST_CONFIGURE_OPTS set)
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
Cc: buildroot@busybox.net, Kadambini Nema <kadambini.nema@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > Host compile of zic needs CC defined since version bump to 2024a (given by
 > HOST_CONFIGURE_OPTS).

 > 	$ diff -ru build/host-zic-2023c/Makefile build/host-zic-2024a/Makefile
 >   --- build/host-zic-2023c/Makefile	2024-04-01 12:44:14.515490354 +0200
 >   +++ build/host-zic-2024a/Makefile	2024-04-01 13:10:50.138333771 +0200
 >   [...]
 >   +# To affect how this Makefile works, you can run a shell script like this:
 >   +#
 >   +#	#!/bin/sh
 >   +#	make CC='gcc -std=gnu11' "$@"
 >   +#
 >   +# This example script is appropriate for a pre-2017 GNU/Linux system
 >   +# where a non-default setting is needed to support this package's use of C99.
 >   +#
 >   +# Alternatively, you can simply edit this Makefile to tailor the following
 >   +# macro definitions.
 >   +
 >   +###############################################################################
 >   +# Start of macros that one plausibly might want to tailor.
 >   [...]
 >   -cc=		cc
 >   -CC=		$(cc) -DTZDIR='"$(TZDIR)"'
 >   [...]

 > Fixes:

 >   c99 -O1   -c -o zic.o zic.c
 >   make[2]: c99: No such file or directory

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
