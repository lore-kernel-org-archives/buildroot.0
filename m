Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC38C4320A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 20:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207F361038
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 20:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 207F361038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78B3405AC;
	Wed, 28 Jul 2021 20:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnpEiU7BcOc0; Wed, 28 Jul 2021 20:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C0740250;
	Wed, 28 Jul 2021 20:01:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 021A01BF2BC
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F215B4021B
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 20:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DGzlCE6rznW for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 20:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E12B2401E2
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 20:01:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 063C6E0002;
 Wed, 28 Jul 2021 20:01:18 +0000 (UTC)
Date: Wed, 28 Jul 2021 22:01:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210728220117.5629468f@windsurf>
In-Reply-To: <20210725210054.1534823-1-giulio.benetti@benettiengineering.com>
References: <20210725210054.1534823-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix printfs format build
 failure on 64-bits platforms
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

On Sun, 25 Jul 2021 23:00:54 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add 2 pending upstream patches that have been pointed to nfs-utils
> maintainer to be committed soon. They both fix the build failure on 64-bits
> where time_t is assumed to be a long long when passed to printf("%ld"), but
> that is not always true, so in these patches the author(Petr) uses PRIu64
> tag.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...nfsdcltrack-sqlite-Fix-printf-format.patch | 51 +++++++++++++++++++
>  ...rack-nfsdcltrack.c-Fix-printf-format.patch | 47 +++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 package/nfs-utils/0001-nfsdcltrack-sqlite-Fix-printf-format.patch
>  create mode 100644 package/nfs-utils/0002-nfsdcltrack-nfsdcltrack.c-Fix-printf-format.patch

Applied to master after adding a reference to the upstream commits.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
