Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5B8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 17:18:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6084061205
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 17:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6084061205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01B680B48;
	Wed, 10 Nov 2021 17:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuzPXsHCvmTb; Wed, 10 Nov 2021 17:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D4480B26;
	Wed, 10 Nov 2021 17:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D67A51BF9B2
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6351403FA
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 17:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKjA8XULeZPH for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 17:18:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDA4F4018B
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 17:18:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 903CD1BF20D;
 Wed, 10 Nov 2021 17:18:18 +0000 (UTC)
Date: Wed, 10 Nov 2021 18:18:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Derek Atkins" <derek@ihtfp.com>
Message-ID: <20211110181813.7c78997e@windsurf>
In-Reply-To: <209062b430ef017340a806c4a10e0b12.squirrel@mail2.ihtfp.org>
References: <209062b430ef017340a806c4a10e0b12.squirrel@mail2.ihtfp.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot: How to cache linux.git from different
 repos in a shared DL_DIR
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

Hello Derek,

On Wed, 10 Nov 2021 08:52:00 -0500
"Derek Atkins" <derek@ihtfp.com> wrote:

> I have a question:  I am using a shared DL_DIR to build BuildRoot for
> multiple platforms, however two of my platforms are building a custom
> kernel from git, and each uses a *DIFFERENT* git repository for their
> repo.

That is not a problem at all. A single Git repository can contain
changes that come from multiple Git repositories, so there's absolutely
no problem with having a single $(DL_DIR)/linux/git/ repository storing
the Git commits/blobs coming from your kernel repositories A, B, C, D
and E if you have 5 different platforms with each Linux kernel code
hosted in its own repository.

> Needless to say, this does not work well, because there will be one,
> shared /DL/linux/git/ which is *assumed* to be the one and only repo... 
> And whichever one I build first will take that and cached it there, and
> then the second.... Not sure what happens, but it clearly can't cache two
> repos in to the same place.

Sure it can. It's exactly how Git works when you use multiple
"remotes". You fetch Git commits/blobs from different remote
repositories into a single local Git repository.

> Is there some configuration I can use to differentiate platformA from
> platformB in this case?

See above: not needed.

Hope this helps!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
