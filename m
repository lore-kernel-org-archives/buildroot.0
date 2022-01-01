Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D56C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 228534037C;
	Sat,  1 Jan 2022 10:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBmdQV-GfsvO; Sat,  1 Jan 2022 10:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC5D4012F;
	Sat,  1 Jan 2022 10:51:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 687331BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611FB401F9
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpdmQvzN453p for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:51:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32997401F4
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:51:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id CD40B20000A;
 Sat,  1 Jan 2022 10:50:59 +0000 (UTC)
Date: Sat, 1 Jan 2022 11:50:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220101115058.0515c8d9@windsurf>
In-Reply-To: <20210930231424.249681-1-giulio.benetti@benettiengineering.com>
References: <20210930231424.249681-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [buildroot-test] scripts/autobuild-run: extend
 timeout from 120 to 180 minutes
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Fri,  1 Oct 2021 01:14:24 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> During the last months some package started to timeout, but this is not due
> to toolchain infinite loop. I think it's due to the increase of the source
> code files' length and to complexity of toolchains or even slow compiling
> time. For example python-uvloop and python-lxml only take long time to
> build with -Os optimization and this makes it seem a TIMEOUT but it's not.
> So let's extend timeout setting from 120 to 180 minutes to avoid false
> TIMEOUTs.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Do you have a specific example where you have seen a failure? Please
note that this HUNG_BUILD_TIMEOUT value is the per-step timeout: it
verifies that one step of one particular package doesn't take more than
120 minutes.

Unless you have a specific example where you have seen this timeout
causing false positives, I'm not really keen on applying such a patch
as it would cause situations where the build is really stuck to be
stuck for 3 hours instead of 2.

Did you identify that the python-uvloop and python-lxml packages really
took more than 2 hours to build? I did see at
http://autobuild.buildroot.net/?status=TIMEOUT those timeouts dating
back from ~November. Did you reproduce the issue, and verified that the
build indeed completes at some point? In general, if a simple package
such as python-uvloop or python-lxml takes more than 2 hours to build,
it means that the compiler (or linker) has gone crazy in an infinite
loop, and the build will in fact never finish.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
