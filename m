Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19BCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 07:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2810C40494;
	Thu, 20 Jan 2022 07:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-WymwpWwmFd; Thu, 20 Jan 2022 07:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3049D40385;
	Thu, 20 Jan 2022 07:48:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D36651BF36F
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 07:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C127E409A5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 07:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eubNeqC6kQmj for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 07:48:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D9D8409A0
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 07:48:09 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DAD9124000D;
 Thu, 20 Jan 2022 07:48:05 +0000 (UTC)
Date: Thu, 20 Jan 2022 08:48:04 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220120084804.429f1d54@bootlin.com>
In-Reply-To: <20220119233944.7ba2d09f@windsurf>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
 <20220119222332.66485-1-giulio.benetti@benettiengineering.com>
 <20220119233944.7ba2d09f@windsurf>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed, 19 Jan 2022 23:39:44 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>On Wed, 19 Jan 2022 23:23:32 +0100
>Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>
>> +config BR2_REFPOLICY_DISABLE_DONTAUDIT
>> +	bool "Disable dontaudit"  
>
>I am still extremely confused by the name of option, with its double
>negative.
>
>When enabled, this option will disable something that doesn't audit.
>Meh.

I agree about the confusing double-negative, but it follows the SELinux
terminology from the rules syntax. My personal view is that the "make
enableaudit" target is a bit confusing already :)

>Is it possible to find a better name / description that doesn't make
>one's brain segfault when trying to understand what it does ?

Maybe we can think of an option name like
"BR2_REFPOLICY_VERBOSE_DONTAUDIT", suggesting that we're not silencing
these 'dontaudit' rules anymore ? The only actual effect is what gets
printed in the AVC logs.

>The make target that gets triggered is "enableaudit". Would it make
>sense to call this option BR2_PACKAGE_REFPOLICY_ENABLE_AUDIT ?

The more I think about that, the more I think that using
"enable/disable" here is misleading, the behaviour stays the same with
regard to what gets denied/allow, only the logs are going to change.

Thanks,

Maxime

>It would be nice to get the feedback from Antoine and/or Maxime on this.
>
>Thomas



-- 
Maxime Chevallier, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
