Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572C7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 08:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AF861212
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 08:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46AF861212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A8E61512;
	Fri,  5 Nov 2021 08:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2mK95Cv98Qt; Fri,  5 Nov 2021 08:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A84761511;
	Fri,  5 Nov 2021 08:25:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3D361BF48B
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 08:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0BF2605FE
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 08:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8R10iOtkTnzK for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 08:25:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65DA9605D7
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 08:25:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 37DE36000F;
 Fri,  5 Nov 2021 08:25:04 +0000 (UTC)
Date: Fri, 5 Nov 2021 09:25:02 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211105092502.5e3ac821@windsurf>
In-Reply-To: <20211104214829.GC2400@scaer>
References: <20211104065422.88A6E81027@smtp1.osuosl.org>
 <20211104214829.GC2400@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-11-03
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

On Thu, 4 Nov 2021 22:48:29 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Hint, and to serve as my own memory: if investigating a reported-unknown
> failure, just grab the build-time.log.gz, decompress it, and pass it
> through this python3 script:
> 
> 
>     with open('build-time.log', 'r') as f:
>         lines =  [l.rstrip('\n\r') for l in f.readlines()]
>     pkg = dict()
>     for l in lines:
>         items = [i.strip() for i in l.split(':')]
>         if items[1] == 'start':
>             pkg[items[3]] = items[2]
>         else:
>             del pkg[items[3]]
>     print(pkg)
> 
> This reports all the packages (usually one) that had a step started that
> did not end, e.g.;
> 
>     {'tpm2-tss': 'configure'}

Should we augment the logic that detects the failure reason with
something like this, when the reason is "unknown" ? It would be ideal
to also get the package version, so we could get the exact same
information as we have with "normal" failures.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
