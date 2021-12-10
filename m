Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745DEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2336461501;
	Fri, 10 Dec 2021 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Orh00CwhWzi; Fri, 10 Dec 2021 22:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7617C614FC;
	Fri, 10 Dec 2021 22:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8731BF3D6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B08F418D2
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDmKg6arTf37 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 22:11:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCD6C418C9
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 22:10:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D9E491C000E;
 Fri, 10 Dec 2021 22:10:56 +0000 (UTC)
Date: Fri, 10 Dec 2021 23:10:55 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20211210231055.550d5641@windsurf>
In-Reply-To: <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
 <20211209151054.3799fb4e@windsurf>
 <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Building packages for Cortex M4
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andrey,

On Thu, 9 Dec 2021 18:02:27 +0100
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> In the meantime, I came up with the following solution and wondered what
> would you say about it. First, I made host package which downloads and
> installs M4 toolchain from ARM site (inspired by
> https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee )
> 
> Config.in.host:
> 
> ################################################################################
> #
> # gcc-arm-none-eabi
> #
> ################################################################################

We already have a package for an ARM toolchain, in
package/arm-gnu-a-toolchain/. However, we have found that this
toolchain is targeted at Cortex-A, and while in theory it should work
for Cortex-M as well, the Cortex-M examples from ST (at least) expect
some libraries that are not in the Cortex-A toolchain provided by ARM,
but only the Cortex-M.

This is why in
https://github.com/bootlin/buildroot/commit/8635d412292eec7bb90bfabcba25a8c238aa2f93
we switch to the Cortex-M/Cortex-R toolchain for this package. But this
isn't directly suitable for upstream. More work is needed here.

> Except for a couple of small errors in the CMakeLists.txt which need yet to be
> fixed, it looks like this solution would work for me.
> 
> What do you think about it?

Yes, that looks, except for the toolchain package, where we probably
want to re-use what already exists :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
