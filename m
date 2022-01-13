Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C731BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814E384CF4;
	Thu, 13 Jan 2022 21:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsYtNEIsIHDA; Thu, 13 Jan 2022 21:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D254284BF2;
	Thu, 13 Jan 2022 21:51:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 992641BF616
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9471084BF2
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9ywwDgmEQXD for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:50:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A6F784BEB
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:50:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 95B23100003;
 Thu, 13 Jan 2022 21:50:57 +0000 (UTC)
Date: Thu, 13 Jan 2022 22:50:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220113225056.52fdda1d@windsurf>
In-Reply-To: <20210929220027.10505-1-romain.naour@gmail.com>
References: <20210929220027.10505-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RFC] package/binutils: build deterministic
 archives by default
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

Hello Romain,

On Thu, 30 Sep 2021 00:00:27 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The option --enable-deterministic-archives that build deterministic
> archives is supported by binutils since binutils 2.23 [1][2].
> 
> See "Static libraries" chapter [3].
> https://reproducible-builds.org/docs/archives/
> 
> Enable this option for target and host variant.
> 
> It was added to Yocto Morty (2.2) in 2016 [4].
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2e30cb575a1d2b1eb8f776356ed59b0722a943d1
> [2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=9cb80f72d8b8b2f59562692d9385cd5a533e9b3f
> [3] https://reproducible-builds.org/docs/archives
> [4] https://github.com/openembedded/openembedded-core/commit/df0d525c02780b5a0bd7a177a249c55f41797476
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

The drawback of this approach is that it doesn't address the problem
for external toolchains, which have not necessarily been built with
--enable-deterministic-archives.

We could either pass -D in TARGET_AR (but of course that is subject to
packages obeying to that), or we could extend the toolchain wrapper to
also cover the ar tool ?

For this to be worth the effort, it would be useful to get some actual
case where this is causing a problem. Indeed, in Buildroot, we don't
really care about the reproducibility of .a archives themselves. So
unless their lack of reproducibility trickles down to the
statically-linked executables that result from using those .a, I'm not
sure this is really worth it.

I'll mark the patch as Changes Requested, but feel free to disagree and
put it back in the New state.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
