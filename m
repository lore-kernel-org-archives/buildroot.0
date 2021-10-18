Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F9EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:14:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E1C6115A
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77E1C6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA9860746;
	Mon, 18 Oct 2021 20:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgKUKIZqukdU; Mon, 18 Oct 2021 20:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B020160654;
	Mon, 18 Oct 2021 20:14:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A6E1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0276760654
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eieR26yelLoe for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:14:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D894C6064F
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:14:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 86AE6240009;
 Mon, 18 Oct 2021 20:14:16 +0000 (UTC)
Date: Mon, 18 Oct 2021 22:14:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211018221415.60dc705a@windsurf>
In-Reply-To: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
References: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/erlang-jiffy: fix build failure
 due to lack of -fPIC
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Will Newton <will.newton@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Thu, 14 Oct 2021 23:54:53 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package erlang-jiffy needs to be linked with -fPIC otherwise it throws
> linker error:
> ```
> failed with return code 1 and the following output:
> /home/giuliobenetti/br_reproduce/60296a48210e7ffc6bc9fa50ee586441a8957e85/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /tmp/jiffy.so.FCaOXC.ltrans1.ltrans.o: relocation R_X86_64_PC32 against symbol `dec_destroy' can not be used when making a shared object;
> recompile with -fPIC
> ```
> 
> This is architecture indipendent, so let's add -fPIC flag to LDFLAGS in any
> case.
> 
> Fixes:
> http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks! However, did you review the discussion at:

  https://lore.kernel.org/buildroot/20201224101440.3427472-1-fontaine.fabrice@gmail.com/

Especially the feedback from Arnout around the end of the thread?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
