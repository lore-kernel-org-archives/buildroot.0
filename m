Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 09:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D9CF408E2;
	Thu, 20 Jan 2022 09:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4GQsmzDRGe3; Thu, 20 Jan 2022 09:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BFA0408AE;
	Thu, 20 Jan 2022 09:29:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCAC1BF325
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 09:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 284054057F
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 09:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89LGY_UUtLFG for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 09:29:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C54644053D
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 09:29:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F405FB81D17;
 Thu, 20 Jan 2022 09:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818D8C340E0;
 Thu, 20 Jan 2022 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642670969;
 bh=mANHxJyOd7DHOPc1+bzssMCZ3/K33cPYyZDNrONTojY=;
 h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
 b=TkEnbVofI8tkPobuZepiYXGggJ+U5OJwxe0/5yWMNiIanTwJHdo54/EdCDmFBOHu9
 HwboPz0Y1P9oPJMisXuX+Smq0mep/guqd7I2k9VB8dItdsk1PSF5WT8NXUXMQ9OmBZ
 340up0k0sgQ11mD1Ni02KrLwbrI/yxi/9npfxeAcdClYHvWbODcEB5a/QmhW4fZg1O
 lraRwC9ujsAnTHiIddGwaDHcOwdGFGi06bU2Im5pOZsSTCNnKssKEIeLXryFWMle8E
 0IHwOyIQvwFLzYjeorNqEzEamXAqnncbLdhKxTmZmVefohWVcngSdzOfpzoleTvX0Z
 e0xs9cCfzjCVg==
MIME-Version: 1.0
In-Reply-To: <20220120084804.429f1d54@bootlin.com>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
 <20220119222332.66485-1-giulio.benetti@benettiengineering.com>
 <20220119233944.7ba2d09f@windsurf> <20220120084804.429f1d54@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <164267096542.4497.13116457792635384701@kwain>
Date: Thu, 20 Jan 2022 10:29:25 +0100
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Maxime Chevallier (2022-01-20 08:48:04)
> On Wed, 19 Jan 2022 23:39:44 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >On Wed, 19 Jan 2022 23:23:32 +0100
> >Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >
> >> +config BR2_REFPOLICY_DISABLE_DONTAUDIT
> >> +    bool "Disable dontaudit"  
> >
> >I am still extremely confused by the name of option, with its double
> >negative.
> >
> >When enabled, this option will disable something that doesn't audit.
> >Meh.
> 
> I agree about the confusing double-negative, but it follows the SELinux
> terminology from the rules syntax. My personal view is that the "make
> enableaudit" target is a bit confusing already :)

Agreed.

> >Is it possible to find a better name / description that doesn't make
> >one's brain segfault when trying to understand what it does ?
> 
> Maybe we can think of an option name like
> "BR2_REFPOLICY_VERBOSE_DONTAUDIT", suggesting that we're not silencing
> these 'dontaudit' rules anymore ? The only actual effect is what gets
> printed in the AVC logs.
> 
> >The make target that gets triggered is "enableaudit". Would it make
> >sense to call this option BR2_PACKAGE_REFPOLICY_ENABLE_AUDIT ?
> 
> The more I think about that, the more I think that using
> "enable/disable" here is misleading, the behaviour stays the same with
> regard to what gets denied/allow, only the logs are going to change.

I would suggest using BR2_PACKAGE_REFPOLICY_WITH_DONTAUDIT, defaulting
to y (using _WITHOUT_ would be less clear IMHO).

And in Kconfig something along the lines:

  bool "Build with dontaudit rules"
  default y
  help
    The refpolicy comes with 'dontaudit' rules suppressing audit logs
    for known and expected violations of the policy. These rules are
    enabled by default. Building without the 'dontaudit' rules will lead
    in more denied actions being logged, which can be useful for
    debugging purposes. Note that running 'semodules -DB' from a running
    system will have the same effect.

    Say y if unsure.

(Please check the semodules part, never tried it).

WDYT?

Antoine
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
