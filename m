Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8BAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:01:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D4E604D7
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2D4E604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7616F80D7F;
	Sun, 14 Nov 2021 13:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNp0yG2dwfSw; Sun, 14 Nov 2021 13:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D298D80D6F;
	Sun, 14 Nov 2021 13:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E15AD1BF228
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBF924019D
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GY4a75443PmR for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:01:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB5484015A
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:01:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BE94B40003;
 Sun, 14 Nov 2021 13:01:24 +0000 (UTC)
Date: Sun, 14 Nov 2021 14:01:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211114140123.77bcde89@windsurf>
In-Reply-To: <87mtm6ykb8.fsf@dell.be.48ers.dk>
References: <20211113141703.1124706-1-thomas.petazzoni@bootlin.com>
 <87mtm6ykb8.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: reduce the maximum
 "size" of random configurations
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 14 Nov 2021 13:48:43 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
> 
>  > genrandconfig is used by the Buildroot autobuilders to generate
>  > semi-random configurations that we build test. As part of this, we use
>  > "make randpackageconfig" to randomize the selection of packages,
>  > together with a KCONFIG_PROBABILITY value, which indicates the
>  > probabibility for each option to be enabled. This probability is
>  > itself randomized, between 1% and 30% for every build.  
> 
>  > However, with our increasing number of packages (over 2900), when we
>  > use a 30% probability for options to be enabled, it means a *lot* of
>  > options are enabled, causing very large configurations to be
>  > tested. These configurations are not very realistic, and they take
>  > ages to build on our autobuilders: we have builds that take 4, 5 or
>  > even 7 hours to build.  
> 
>  > In order to test a larger number of configurations and therefore a
>  > larger variety of configurations, this commit reduces the maximum
>  > probability to 20%.  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Makes sense. Committed, thanks.

Thanks! I think we want it in all branches currently tested by the
autobuilders, i.e master, next, 2021.02.x and 2021.08.x.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
