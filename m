Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6E9C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1B960FE7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1B960FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFEAD40146;
	Wed, 21 Jul 2021 20:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 530g2uao5aP3; Wed, 21 Jul 2021 20:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39FCB400E1;
	Wed, 21 Jul 2021 20:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE931BF580
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CB3A826C2
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osyMS8J7yti3 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:15:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51B07826BF
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 20:15:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8F178200004;
 Wed, 21 Jul 2021 20:15:03 +0000 (UTC)
Date: Wed, 21 Jul 2021 22:15:01 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexey Neyman <stilor@att.net>
Message-ID: <20210721221501.4c14fcfd@windsurf>
In-Reply-To: <20210721194605.1552794-3-stilor@att.net>
References: <20210721194605.1552794-1-stilor@att.net>
 <20210721194605.1552794-3-stilor@att.net>
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

Hello,

On Wed, 21 Jul 2021 12:46:05 -0700
Alexey Neyman <stilor@att.net> wrote:

> Since qemu started using ninja, they have the following fragment in the
> Makefile:
> 
> MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
> NINJAFLAGS = ... $(if $(MAKE.n), -n) ...
> 
> Buildroot's generated makefile in the O= directory invokes make in the
> base buildroot with --no-print-directory. However, make's placement of
> the --no-print-directory in MAKEFLAGS varies between the versions of
> the host make; make 4.3 places that at the end while make 3.82 places
> it at the beginning. As a result, if building on a system with an older
> host make, qemu's makefile invokes `ninja -n` which does not generate
> any outputs.
> 
> To reproduce, on a CentOS 7 machine or docker image:
>   mkdir /tmp/br-build && cd /tmp/br-build
>   make -C ~/buildroot pc_x86_64_bios_defconfig O=`pwd`
>   make menuconfig # Switch to glibc, enable "QEMU" and "QEMU tools"
>   make all # Build succeeds
>   find target -name qemu-img # No binary has been built

I'm not sure to grasp all the implications of this, but isn't this a
bug in Qemu's build machinery, that should be fixed in Qemu's Makefile
instead ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
