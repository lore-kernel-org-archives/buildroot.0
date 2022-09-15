Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F22ECAAD3
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 07:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21A0441021;
	Thu, 15 Sep 2022 07:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A0441021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DiXaaNDrAhP; Thu, 15 Sep 2022 07:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EDDA4101B;
	Thu, 15 Sep 2022 07:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EDDA4101B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD7A1BF344
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 585C761004
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585C761004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GsfGht1Za5J for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 07:21:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3823A60FF3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3823A60FF3
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 07:21:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 217CC40009;
 Thu, 15 Sep 2022 07:21:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYjC4-0089UX-Oc; Thu, 15 Sep 2022 09:21:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
 <20220811094049.798010-3-niklas.cassel@wdc.com>
Date: Thu, 15 Sep 2022 09:21:52 +0200
In-Reply-To: <20220811094049.798010-3-niklas.cassel@wdc.com> (Niklas Cassel
 via buildroot's message of "Thu, 11 Aug 2022 11:40:49 +0200")
Message-ID: <87leqlm7an.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/elf2flt: fix fatal error
 regression on m68k, xtensa, riscv64
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com,
 alistair@alistair23.me, geert@linux-m68k.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.naour@smile.fr,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Niklas" == Niklas Cassel via buildroot <buildroot@buildroot.org> writes:

 > This series fixes a fatal error at link time on m68k, xtensa,
 > and riscv64, caused by a bad upstream elf2flt commit.

 > Without this patch, m68k, xtensa, and riscv64 would result in
 > a fatal error:
 > ERROR: text=0x3bab8 overlaps data=0x33f60 ?

 > With this patch, qemu_m68k_mcf5208_defconfig,
 > qemu_riscv64_nommu_virt_defconfig, and
 > qemu_xtensa_lx60_nommu_defconfig builds properly.

 > riscv64 and m68k boots to login prompt.
 > xtensa crashes when loading init, the same behavior as when
 > reverting the bad upstream elf2flt commit completely.

 > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

When was this regression introduced? With the update to elf2flt 2021.08?
Are 2022.02.x and 2022.05.x also affected?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
