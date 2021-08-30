Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E94C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE04E60ED8
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE04E60ED8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87FB16081A;
	Mon, 30 Aug 2021 21:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBsanMwWvIbn; Mon, 30 Aug 2021 21:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3F5608CC;
	Mon, 30 Aug 2021 21:51:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9605E1BF86C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 841494038F
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9ZgNbYsmyLV for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 21:51:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A28B40198
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 21:51:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CE7BB1C0005;
 Mon, 30 Aug 2021 21:51:12 +0000 (UTC)
Date: Mon, 30 Aug 2021 23:51:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210830235111.28cb4d68@windsurf>
In-Reply-To: <20210829193748.GD1053080@scaer>
References: <20210829183932.1737738-1-fontaine.fabrice@gmail.com>
 <20210829193748.GD1053080@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix per-package
 build with ncurses
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 29 Aug 2021 21:37:48 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Sorry, this is not the correct solution. Indeed, we can not accept that
> a package overwrites a file provided by another package. See the
> explanations Thomas and I discussed earlier today:
> 
>     https://lore.kernel.org/buildroot/20210829133955.74d921e9@windsurf/
>     https://lore.kernel.org/buildroot/20210829164031.GB1053080@scaer/
> 
> This case is however very special, and I have no idea (yet) on what the
> best solution is. I guess the curses headers in the toolchain are due to
> the presence of gdb with TUI support...

gdb with TUI support would mean to have ncurses (library and headers)
installed for the host, but here it's in the sysroot of the toolchain,
while for the target we only build gdbserver.

The two build failures that Fabrice is pointing to are RISC-V 64-bit,
and I believe until recently gdbserver was not available on RISC-V
64-bit. So it means that when we enable BR2_PACKAGE_GDB=y when building
our RISC-V 64-bit toolchains, instead of getting just the default of
gdbserver, we get the full gdb, which pulls in ncurses. This is clearly
a bug in the toolchain: we don't want to provide a full gdb for the
target.

Confirmed with:

$ tar tvf aarch64--glibc--bleeding-edge-2020.08-1.tar.bz2 | grep ncurses.h
lrwxrwxrwx root/root         0 2020-09-30 21:49 aarch64--glibc--bleeding-edge-2020.08-1/include/ncurses/ncurses.h -> curses.h

$ tar tvf riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2 | grep ncurses.h
lrwxrwxrwx root/root         0 2020-10-01 10:22 riscv64--glibc--bleeding-edge-2020.08-1/riscv64-buildroot-linux-gnu/sysroot/usr/include/ncurses.h -> curses.h
lrwxrwxrwx root/root         0 2020-10-01 10:21 riscv64--glibc--bleeding-edge-2020.08-1/include/ncurses/ncurses.h -> curses.h

But in fact, I see we don't even provide gdbserver anywhere in fact,
since we're building the toolchain tarball with "make sdk", that
doesn't preserve the target directory. So we're building the target gdb
package for no reason...

Meh. Stuff to fix.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
