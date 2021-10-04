Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB30C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 829156124D
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 829156124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD8E84A17;
	Mon,  4 Oct 2021 12:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pg85zq8Riv-m; Mon,  4 Oct 2021 12:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775178469C;
	Mon,  4 Oct 2021 12:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95D4B1BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B10D40471
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfSGBKbbQaUs for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:15:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A67C40463
 for <buildroot@uclibc.org>; Mon,  4 Oct 2021 12:14:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A7DD2E0004;
 Mon,  4 Oct 2021 12:14:56 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:14:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211004141455.1cadeb1f@windsurf>
In-Reply-To: <87czolj9cp.fsf@dell.be.48ers.dk>
References: <20210919141053.3afc7389@windsurf>
 <87czolj9cp.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "buildroot@uclibc.org" <buildroot@uclibc.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 04 Oct 2021 13:52:06 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > While we would have expected output[] to contain just a single element,
>  > "200", which is really the only output of the command. For now, I've
>  > worked around this by looking at output[-1] in my test case, which is
>  > good enough because I only care about one line of output.  
> 
>  > However, I'm not really sure how to fix this in the Emulator.run() core
>  > itself. Perhaps we should not be using the -serial stdio (which
>  > requires interacting on stdin/stdout), but instead use a separate
>  > telnet port (but then there's always the issue of which port to use) ?  
> 
> Just a hack, but how about we add a marker after each shell command (#
> MARKER) and just strip everything util after the marker?

Hm, why not. Indeed a hack, though :-/

The problem with the telnet mechanism is that you need to specify a TCP
port that is available. Tricky, especially if you run multiple test
cases in parallel.

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
