Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140CAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8474A409B4;
	Mon, 27 Dec 2021 14:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjRgQTSphBhr; Mon, 27 Dec 2021 14:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC607409A8;
	Mon, 27 Dec 2021 14:43:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47BEC1BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B2040947
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94fpL88pukMR for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:43:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B1E640170
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:43:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id ABCF5200003;
 Mon, 27 Dec 2021 14:43:09 +0000 (UTC)
Date: Mon, 27 Dec 2021 15:43:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20211227154308.1bcc4a4d@windsurf>
In-Reply-To: <YcchfJG1EDtyepcy@curiosity>
References: <20211219142035.6220-1-peter@korsgaard.com>
 <20211219142035.6220-2-peter@korsgaard.com>
 <YcchfJG1EDtyepcy@curiosity>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] board/*/genimage.cfg: use
 partition-table-type = "gpt" for genimage-15
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Sat, 25 Dec 2021 16:49:48 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Build still fails for orangepi-zero-plus2 with this patch. I get the
> following subsequent error messages from genimage:
> 
> ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> After changing 'partition-type' entries to the appropriate 'partition-type-uuid',
> genimage complains about overlaps:
> 
> ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
> ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> It looks like new genimage is able to keep track of partition table.
> IIUC this can be fixed either using new 'holes' feature or just updating
> size of the bootloader file. For instance, with the following patch
> applied orangepi-pc-plus builds and boots fine:

Have you looked at
https://patchwork.ozlabs.org/project/buildroot/patch/20211219142035.6220-1-peter@korsgaard.com/
which is PATCH 1/2 of this series? It fixes exactly the problem you're
pointing to, just for a different board.

Do not hesitate to send patches to fix other boards.

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
