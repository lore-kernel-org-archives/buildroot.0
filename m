Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C86C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921F382864;
	Thu, 30 Dec 2021 14:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49YNy1mGANhs; Thu, 30 Dec 2021 14:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DF982861;
	Thu, 30 Dec 2021 14:53:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E59071BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B9240923
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wa9KXXhGjBK9 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:53:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B09494016A
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:53:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 30F79100004;
 Thu, 30 Dec 2021 14:53:35 +0000 (UTC)
Date: Thu, 30 Dec 2021 15:53:34 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Frank Vanbever <frank.vanbever@essensium.com>
Message-ID: <20211230155334.16da5582@windsurf>
In-Reply-To: <20200217145805.18815-1-frank.vanbever@essensium.com>
References: <20200217133806.21237-1-frank.vanbever@essensium.com>
 <20200217145805.18815-1-frank.vanbever@essensium.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/fluentbit: new package
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Ryan Barnett <ryan.barnett@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Frank,

On Mon, 17 Feb 2020 15:58:05 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> From: Kevin Hilman <khilman@baylibre.com>
> 
> Fluent Bit is an open source and multi-platform Log Processor and
> Forwarder which allows you to collect data/logs from different
> sources, unify and send them to multiple destinations.
> 
> _FILE_OFFSET_BITS==64 needs to be filtered out to allow building with old glibc
> versions (<2.23).
> 
> 0001-lib-flb_libco-ppc-Fix-signature-for-co_create-API-18.patch is
> required to allow building for PowerPC.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>

I know it's our fault for not applying earlier, but the version 1.3.7
used in your package doesn't build with gcc 10.x (the infamous -fcommon
issue).

So I updated to 1.8.11, which also didn't build due to a "struct iovec"
issue. I backported upstream commit
b28d83d5851ca85943b5eea4f92b0c400169d4fb to fix this issue.

But then, it stills fails to build, because there are bunch of
warnings, and it is built with -Werror.

If you're still interested in this package, could you have a look?

Also Romain made some comments that were very true, and would need to
be handled as well.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
