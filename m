Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E947EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:15:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBB160E97
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EBB160E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D7494039B;
	Thu, 14 Oct 2021 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLTEin-9WbAj; Thu, 14 Oct 2021 21:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9CB44033F;
	Thu, 14 Oct 2021 21:15:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9F31BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C18A605AC
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkkrVakZQy4T for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AAB6605A7
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:15:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7711920003;
 Thu, 14 Oct 2021 21:15:05 +0000 (UTC)
Date: Thu, 14 Oct 2021 23:15:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20211014231504.3fbfc964@windsurf>
In-Reply-To: <CA+h8R2pf-df3MF1z5Rgi1ez5i1FBUDBiPh4R=CvzKqynBaeddg@mail.gmail.com>
References: <20211010234655.585526-1-christian@paral.in>
 <20211011090428.50e68324@windsurf>
 <CA+h8R2pf-df3MF1z5Rgi1ez5i1FBUDBiPh4R=CvzKqynBaeddg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-NEXT v3 1/6] support/download/dl-wrapper:
 add concept of download post-processing
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
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Mon, 11 Oct 2021 00:13:02 -0700
Christian Stewart <christian@paral.in> wrote:

> >  - The initial series also had support for Cargo, I think we want to
> >    retain that as the idea was to solve both Go and Cargo at the same
> >    time, to make sure we have a solution that works for both.  
> 
> I don't have the experience with Rust to sign off on the Cargo
> portion, and I was unsure if it was confirmed to be ready for merging.
> So in the interest of getting these packages in (including gocryptfs)
> I sent the Go portion only.

When I sent the series, I had neither the experience with Go nor Rust :-)

> Can send the full thing with the Cargo as well... if really necessary,
> but can't we just do it in 2 patch series?

The idea of having a single series was to make sure we are able to
implement a mechanism that works (at least) for two different
vendoring-based package management systems.

> >  - PATCH-NEXT doesn't make any sense right now, there is no "next"
> >    branch.  
> 
> Ok, was just indicating that it's somewhat "next release" material
> (not for backport), I guess.

Whether something is to be considered for backport or not is a decision
that Peter Korsgaard does. And new features are by nature generally not
considered for backporting.

Cheers!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
