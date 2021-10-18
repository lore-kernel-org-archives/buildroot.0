Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE57C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:45:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44946112D
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E44946112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B384840477;
	Mon, 18 Oct 2021 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eliVREO7gSiL; Mon, 18 Oct 2021 19:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A354046F;
	Mon, 18 Oct 2021 19:45:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63C271BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 530FD40204
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtsWUVRz1_ur for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:45:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32F3E4046F
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:45:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 80C7120007;
 Mon, 18 Oct 2021 19:45:36 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:45:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211018214535.5743fd67@windsurf>
In-Reply-To: <20211015081514.2472764-1-giulio.benetti@benettiengineering.com>
References: <e0aa4d38-ef32-8c57-7597-017e86d1ecf8@benettiengineering.com>
 <20211015081514.2472764-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino: fix mali
 not working because Linux version >= 4.20
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Oct 2021 10:15:14 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Since on olinuxino_lime/lime2 we have a Linux version >= 4.20 we need to
> pass drm_kms_helper.drm_leak_fbdev_smem=1 to kernel command-line that
> really enables DRM_FBDEV_LEAK_PHYS_SMEM. CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
> only adds the code for this, but drm_leak_fbdev_smem is 0 by default, so we
> need to override it with 1. Same goes for drm_fbdev_overalloc that
> must be at least 200 for having a double buffer that is required by
> Mali. This fixes both olimex_a20_olinuxino_lime and lime2 that use
> extlinux.conf.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I appreciate the idea, but I'm not sure if we want this. Indeed, the
A20 Olinuxino defconfigs are meant to be minimal, and there's nothing
that forces anyone to use the proprietary Mali driver+blob, they can
also use mesa3d instead, which might have different requirements.

So I'm rather keen on enabling your patch on
sunxi-mali-mainline-driver/Config.in, but not this one I'm afraid.

Of course, if others disagree, I can change my mind :)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
