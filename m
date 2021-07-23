Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940E1C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:26:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1DB60F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE1DB60F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59E540647;
	Fri, 23 Jul 2021 22:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H48qovkYzz_j; Fri, 23 Jul 2021 22:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E414040644;
	Fri, 23 Jul 2021 22:26:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF7861BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC08383AE0
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3zKzwlrt2Wh for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:26:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0AF683ADE
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 22:26:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CF6C720007;
 Fri, 23 Jul 2021 22:26:29 +0000 (UTC)
Date: Sat, 24 Jul 2021 00:26:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexey Neyman <stilor@att.net>
Message-ID: <20210724002628.2b736bc1@windsurf>
In-Reply-To: <fde74814-37a5-cf13-e617-a8af599c0039@att.net>
References: <20210721194605.1552794-1-stilor@att.net>
 <20210721194605.1552794-3-stilor@att.net>
 <20210721221501.4c14fcfd@windsurf>
 <fde74814-37a5-cf13-e617-a8af599c0039@att.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: filter out long make
 options
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 21 Jul 2021 15:18:36 -0700
Alexey Neyman <stilor@att.net> wrote:

> > I'm not sure to grasp all the implications of this, but isn't this a
> > bug in Qemu's build machinery, that should be fixed in Qemu's Makefile
> > instead ?  
> 
> I was on the fence about it myself. Okay, I'll try to send a fix for 
> qemu/Makefile to Qemu developers and see if they agree to pick it up; 
> they could argue they don't support being invoked with --no-print-directory.

It would be odd for them to consider that as a normal behavior,
--no-print-directory is really a standard make option.

Let us know what they say, of course.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
