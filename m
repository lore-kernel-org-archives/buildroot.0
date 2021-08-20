Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5790AC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:23:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31CF61102
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F31CF61102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C7D42517;
	Fri, 20 Aug 2021 21:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBzQVlUEaIBE; Fri, 20 Aug 2021 21:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7504254B;
	Fri, 20 Aug 2021 21:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFEDA1BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB04281B69
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJJBrPppG-D7 for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:23:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C550D81B3E
 for <buildroot@busybox.net>; Fri, 20 Aug 2021 21:23:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 202DA20002;
 Fri, 20 Aug 2021 21:22:59 +0000 (UTC)
Date: Fri, 20 Aug 2021 23:22:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Matthew Weber via buildroot <buildroot@busybox.net>
Message-ID: <20210820232258.144f2fda@windsurf>
In-Reply-To: <20210820133232.40519-1-matthew.weber@collins.com>
References: <20210820133232.40519-1-matthew.weber@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: disable SSP
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Matt,

On Fri, 20 Aug 2021 08:32:32 -0500
Matthew Weber via buildroot <buildroot@busybox.net> wrote:

> kvm-unit-tests shouldn't use stack-protector as the test suite is
> building free standing binaries to test QEMU. There is no guarantee
> that GCC has set a spec to filter out stack protector enabling with
> -ffreestanding so disabling explicitly to prevent a series of build
> failures.
> 
> Fixes:
> http://autobuild.buildroot.net/results/780/780c8c70ea7015113714cbd3841d96b08bd2f2aa/
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  package/kvm-unit-tests/kvm-unit-tests.mk | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Thanks, but your patch doesn't apply to the master branch, and it makes
me think we're piling up work-arounds on work-arounds.

Indeed, the passing of -fno-stack-protector in EXTRA_CFLAGS has been
removed in master as of commit
d183146b5c7a1a8d1a3c828bd3b6d0660d97efc0, which itself says it is no
longer needed since commit 0788e921f961e36a50a94f8bb98f7eb75b312245.

However, it seems like despite
0788e921f961e36a50a94f8bb98f7eb75b312245, SSP is still being used.

Matt, Fabrice, could you review the situation and see what is the
correct fix moving forward ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
