Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B72C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 22:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DA56103C
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 22:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4DA56103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0FE98246D;
	Wed, 25 Aug 2021 22:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ARo-kGQj_pEC; Wed, 25 Aug 2021 22:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EDA88246F;
	Wed, 25 Aug 2021 22:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE25C1BF283
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 22:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA873613DA
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 22:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0hYVIIM6t5T for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 22:31:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46DA3613E4
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 22:31:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6FF0C20002;
 Wed, 25 Aug 2021 22:31:21 +0000 (UTC)
Date: Thu, 26 Aug 2021 00:31:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Tudor Holton <tudor@tudorholton.com>
Message-ID: <20210826003120.7eb15bbd@windsurf>
In-Reply-To: <f2ac08f597a5b80bb2b2aa9ea554b952@tudorholton.com>
References: <f2ac08f597a5b80bb2b2aa9ea554b952@tudorholton.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Package to manage multiple buildroot filesystem
 "versions"?
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Tudor,

On Wed, 25 Aug 2021 17:08:16 +1000
Tudor Holton <tudor@tudorholton.com> wrote:

> I understand that buildroot is for building root filesystems and not 
> really outside that, but...
> 
> Is there a package that can manage the partition layout, and buildroot 
> filesystem "versions", for upgrade and fallback?
> 
> For example, something like:
> 
> 1) During build, allocate space for 2 or more partitions, the first 
> partition is the running buildroot filesystem
> 2) When the buildroot filesystem is running, download a newer version of 
> the filesystem, verify it, and dd it to the second partition
> 3) Tell grub/EFI to boot the newer partition and reboot
> BUT
> 4a) It doesn't complete the startup for some reason (like there's a 
> kernel panic, or something doesn't start properly triggering the 
> watchdog)
> SO
> 5a) It reboots again, calling the previous version (e.g. using grub 
> fallback or fallback.efi)
> OR
> 4b) It does complete the startup, but some important service doesn't 
> work (like it can't connect to the internet) so we presume we need to 
> roll back
> 5B) It rolls back to the previous version with some kind of failure flag 
> to tell the server that it failed the upgrade
> 
> I can see that this could be fairly easily written, but I was wondering 
> if there was a buildroot package or environment that does this kind of 
> behaviour already?

You are re-inventing the concept of OTA update systems. Check out:

 * swupdate, https://sbabic.github.io/swupdate/

 * RAUC, https://rauc.readthedocs.io/en/latest/

 * Mender, https://mender.io/

All three are packaged in Buildroot.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
