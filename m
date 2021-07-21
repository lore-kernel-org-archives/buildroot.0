Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242A4C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3DBF61248
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3DBF61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631544030C;
	Wed, 21 Jul 2021 20:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l65RCr46TW-0; Wed, 21 Jul 2021 20:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC34A40315;
	Wed, 21 Jul 2021 20:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1351BF5F5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B41440134
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8SjpOrlzJdr for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:22:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46FB4400D5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:22:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1DF9920007;
 Wed, 21 Jul 2021 20:22:29 +0000 (UTC)
Date: Wed, 21 Jul 2021 22:22:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210721222228.39f7bae3@windsurf>
In-Reply-To: <20210627140049.159432-1-romain.naour@gmail.com>
References: <20210627140049.159432-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcc: remove gcc 8.x
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
Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 27 Jun 2021 16:00:49 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> gcc 11.1 is around, gcc 10.2 is the default version, so drop
> 8.4 in order to reduce the gcc choice.
> 
> For PowerPC SPE, introduce BR2_GCC_VERSION_POWERPC_SPE
> to avoid removing defconfigs arcturus_ucp1020_defconfig,
> freescale_p1025twr_defconfig and qemu_ppc_mpc8544ds_defconfig
> that are still used by some users [1].
> BR2_GCC_VERSION_POWERPC_SPE use the same gcc version (8.4), no
> change expected.
> 
> [1] 96e80ad214ced86c802d561946fa7da88c1595eb
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>
> Cc: Matthew Weber <matthew.weber@collins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy           |  9 +++++++++
>  package/gcc/Config.in.host | 13 +++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)

I've applied to master, but modified the commit title to say that we
don't remove gcc 8.x, but restrict it to PowerPC SPE, which really is
what your patch is doing.

We will clearly have an issue with this PowerPC SPE support: we won't
be able to keep gcc 8.x around forever.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
