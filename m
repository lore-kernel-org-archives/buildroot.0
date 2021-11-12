Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165D0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 937DD60F45
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 937DD60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DC04019B;
	Fri, 12 Nov 2021 22:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Uibt7pf8PSJ; Fri, 12 Nov 2021 22:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F4D14018D;
	Fri, 12 Nov 2021 22:36:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9A61BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDCF84018D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93R6XAWw2NmI for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:36:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A410240183
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:36:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 36FCE1C0003;
 Fri, 12 Nov 2021 22:36:04 +0000 (UTC)
Date: Fri, 12 Nov 2021 23:36:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211112233603.274a7af2@windsurf>
In-Reply-To: <20211110190005.GN2084998@scaer>
References: <AM6PR03MB56227C126CCA7748EAB48382B5939@AM6PR03MB5622.eurprd03.prod.outlook.com>
 <20211110190005.GN2084998@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fs: allow strip binaries when create rootfs
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
Cc: Tan Xiaofan <xfan1024@live.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Nov 2021 20:00:05 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This is a simple approach to the problem, indeed. However, I think the
> choice is not needed: just keep the boolean option, and move the whole
> stripping out of target-finalize and into the fs creation step.
> 
> Thoughts?

I'm not sure about this change. I understand that's it's an easy way to
have all binaries unstripped on the build machine, while having them
stripped on the target.

However, it makes $(TARGET_DIR) move further away from what will
actually end up on the target. I tend (and I guess a number of users as
well) to look at $(O)/target to see what my root filesystem looks like,
what it contains, etc. So all the post-processing steps that we add in
the root filesystem generation logic kind of "hides" this
post-processing from the eyes of the person looking at $(O)/target.

Furthermore, I believe this change is going to break "make size-stats",
because make size-stats looks at the size of files installed in
$(O)/target.

I think the long term idea instead was to install all packages to
STAGING_DIR, so that we have an unstripped installation of all packages.

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
