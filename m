Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE9EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:24:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFED260F6F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFED260F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DF2640124;
	Sun, 24 Oct 2021 13:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T21nok8dce1y; Sun, 24 Oct 2021 13:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7116E401E3;
	Sun, 24 Oct 2021 13:24:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5C5C1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9503760610
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-792HiuYMtp for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:24:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61529605B5
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:24:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7E8D9240009;
 Sun, 24 Oct 2021 13:24:49 +0000 (UTC)
Date: Sun, 24 Oct 2021 15:24:48 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211024152448.6e91a8f8@windsurf>
In-Reply-To: <20211022215337.1990017-1-fontaine.fabrice@gmail.com>
References: <20211022215337.1990017-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix build with
 headers < 3.14
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 22 Oct 2021 23:53:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 2.37.2 in
> commit 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6 and the addition of
> uclampset in
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=9dd95bea42a3b467c1f773fd2e781cc9f0d88847:
> 
> checking for syscall sched_setattr... no
> configure: WARNING: Unable to detect syscall sched_setattr.
> checking for syscall sched_setattr... (cached) no
> configure: WARNING: Unable to detect syscall sched_setattr.
> configure: error: uclampset selected but sched_setattr syscall not found

A bit of a pitty that they don't automatically disable building this
tool, or something like that, but fair enough.

> 
> Fix this build failure by adding a dependency on headers >= 3.14 for
> scheduling utilities:
> https://github.com/torvalds/linux/commit/fded4329da9e8486b434d6c4aceab1ab3f433d8a

This commit points to just wiring the syscall on the s390 architecture,
which is not really "that" important, so I changed the reference to
e6cfc0295c7d51b008999a8b13a44fb43f8685ea instead (which also appeared
in 3.14, so it doesn't change the rest of the patch).

Applied with that change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
