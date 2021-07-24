Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D05BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB4E460E97
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB4E460E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A054A606E9;
	Sat, 24 Jul 2021 07:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlPy3ybAkAnu; Sat, 24 Jul 2021 07:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13EEE6062F;
	Sat, 24 Jul 2021 07:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83FC81BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7323983B30
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwwwPLMDYTBS for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:53:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7355883B2C
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 07:53:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0DB54240004;
 Sat, 24 Jul 2021 07:53:27 +0000 (UTC)
Date: Sat, 24 Jul 2021 09:53:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Nosthoff via buildroot <buildroot@busybox.net>
Message-ID: <20210724095326.19eb1fc5@windsurf>
In-Reply-To: <20210723132648.30775-1-buildroot@heine.tech>
References: <20210723132648.30775-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/bluez5_utils: fix mesh build
 with musl
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
Cc: Michael Nosthoff <buildroot@heine.tech>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 23 Jul 2021 15:26:46 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> when compiling with mesh support and musl toolchain the build fails
> due to a missing include of limits.h for PATH_MAX in mesh-cfgtest.c.
> 
> Patch submitted upstream:
> https://lore.kernel.org/linux-bluetooth/20210723081039.30396-1-bluez@heine.tech
> 
> Fixes:
> http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/
> http://autobuild.buildroot.net/results/003968b25906579dbcf5a95d1e43fec0ab504ef5/
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...-tools-mesh-cfgtest-include-limits.h.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
