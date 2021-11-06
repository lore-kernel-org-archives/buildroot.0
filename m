Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8D0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:50:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2301C6124A
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2301C6124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57C540092;
	Sat,  6 Nov 2021 10:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2mLgxSgM0cL; Sat,  6 Nov 2021 10:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE3740620;
	Sat,  6 Nov 2021 10:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2926B1BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 185456F94D
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p64eeFDpmpdJ for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:50:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 079966068B
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:50:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F0C05E0003;
 Sat,  6 Nov 2021 10:50:45 +0000 (UTC)
Date: Sat, 6 Nov 2021 11:50:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211106115044.0d35c30f@windsurf>
In-Reply-To: <20211104203310.5829-1-ps.report@gmx.net>
References: <20211104203310.5829-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gdb: fix host gdb-11.1 compile
 with simulator enabled and glibc >= 2.34
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Nov 2021 21:33:10 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - add upstream patch to avoid host gdb-11.1 compile failure with simulator
>   enabled and glibc >= 2.34
> 
> Fixes:
> 
>   targ-map.c:412:17: error: initializer element is not constant
>     412 |   { "SIGSTKSZ", SIGSTKSZ, TARGET_SIGSTKSZ },
>         |                 ^~~~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...sim-filter-out-SIGSTKSZ-PR-sim-28302.patch | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch

Applied to master, thanks. Did you verify that this was only applicable
to gdb 11.x and none of the older versions?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
