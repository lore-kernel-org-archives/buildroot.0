Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFD8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 22:28:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB9B60C51
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 22:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EB9B60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CF2426BD;
	Fri,  3 Sep 2021 22:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 118ZzknLYEaa; Fri,  3 Sep 2021 22:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 321A4426F6;
	Fri,  3 Sep 2021 22:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E30B1BF366
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 22:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E35426F6
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 22:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q14IWNZOB-SJ for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 22:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C6C7426BD
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 22:28:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BFEA1E0003;
 Fri,  3 Sep 2021 22:27:58 +0000 (UTC)
Date: Sat, 4 Sep 2021 00:27:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210904002757.6d999f04@windsurf>
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/master 0/7] Qemu and gobject-introspection
 fixes
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Fri,  3 Sep 2021 09:20:20 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> First of all, sorry this took so long!
> 
> This series is an accumulation of several conversations between Thomas, Yann,
> and myself. The basics are this:
> 
> - GOI fails to build with the corei7 architecture because calling qemu results
>   in qemu trying to use instructions that may not exist on the host processor.
>   This causes a core dump.
> 
> - OpenEmbedded gets around this issue by adding options to qemu on certain
>   CPU and architecture combinations, Corei7 being one of those architectures.
> 
> - As discussed with Thomas, a new string "BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS"
>   in qemu/Config.in.host is added, which we then sed to g-ir-scanner.in.
> 
> In addition, I was anonyed that there were so many shellcheck issues with the
> various wrappers, and Yann was annoyed that the wrappers were calling to bash
> when they didn't need to do so, so those are also fixed in this patch series.
> 
> And last (but not least), Yann noticed a latent bug in g-ir-scanner-qemuwrapper.
> If GIR_EXTRA_LIBS_PATH is empty, then the LD_LIBRARY_PATH is prepended with a
> colon, so that is also fixed.
> 
> This will lead the way to NodeJS 14 which is one step closer to removing
> Python2!

Thanks a lot for all this work! Could you remind me what's the
relationship between this and NodeJS 14 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
