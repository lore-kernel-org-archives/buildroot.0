Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CB7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFF2613C8
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DFF2613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59FA440668;
	Mon,  4 Oct 2021 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_E4GqwKXsHU; Mon,  4 Oct 2021 20:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD67D40652;
	Mon,  4 Oct 2021 20:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A27901BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA2F40668
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfFORxjR24od for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:02:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F48D4065E
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:02:47 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id EAF9C100006;
 Mon,  4 Oct 2021 20:02:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXUAd-0007oi-6Q; Mon, 04 Oct 2021 22:02:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
 <20210912141140.253778-3-romain.naour@gmail.com>
Date: Mon, 04 Oct 2021 22:02:43 +0200
In-Reply-To: <20210912141140.253778-3-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 12 Sep 2021 16:11:29 +0200")
Message-ID: <87fstgh82k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 05/16] support/testing: test_openrc: switch
 to ARM arm toolchain and builtin kernel
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The kernel 5.5.7 curently used by the test doesn't build with host
 > gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

 > /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

 > But we can't just update this test to the next linux kernel LTS 5.10.y since
 > the minimum gcc version has been updated to gcc 4.9 since 5.8 kernel [2]
 > and the Sourcery CodeBench ARM 2014.05 is used (gcc 4.8 based).

 > Enable arm cortex A9 and VFP support to switch to the ARM arm prebuilt
 > toolchain (the Bootlin toolchain could be used).
 > While at it use the prebuilt buildin kernel for the vexpress target
 > recently updated to 5.10.7.

 > Fixes:
 > https://gitlab.com/kubu93/buildroot/-/jobs/1564202094

 > [1] https://gcc.gnu.org/gcc-10/porting_to.html
 > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4476ac82512f09c94aff5972654b70f3772b2
 > [3] 3cf2782906d5cc05a3966c25518d2ce01f11afc8

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
