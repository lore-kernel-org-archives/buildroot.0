Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D87EC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 17:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDEE604DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 17:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BDEE604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59974606BE;
	Sun, 25 Jul 2021 17:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1f36Tkny6e8; Sun, 25 Jul 2021 17:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B697C605CD;
	Sun, 25 Jul 2021 17:37:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0B2C1BF417
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 17:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9099040247
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 17:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXlDRTCiBbqT for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 17:37:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A91400C6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 17:37:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 63003200005;
 Sun, 25 Jul 2021 17:37:53 +0000 (UTC)
Date: Sun, 25 Jul 2021 19:37:51 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210725193751.62d7666a@windsurf>
In-Reply-To: <6cd7e12d-3bcf-f177-650e-441f5a322e7c@mind.be>
References: <20210718204406.899038-1-james.hilliard1@gmail.com>
 <6cd7e12d-3bcf-f177-650e-441f5a322e7c@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libtirpc: Add optional
 GSSAPI support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 18:21:08 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Both applied to master, thanks.

Gah, I should have replied earlier. I didn't apply this because there
was a small issue, see below.

> > +config BR2_PACKAGE_LIBTIRPC_GSS
> > +	bool "gss"
> > +	depends on BR2_USE_MMU # libkrb5
> > +	depends on BR2_PACKAGE_LIBTIRPC
> > +	select BR2_PACKAGE_LIBKRB5

libkrb5 has a !BR2_STATIC_LIBS that is not taken into account here (and
the libtirpc main option does not have such a dependency).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
