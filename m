Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AC1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 796D881BF4;
	Sun, 27 Feb 2022 19:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1_0ecDvzo1q; Sun, 27 Feb 2022 19:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8E381B60;
	Sun, 27 Feb 2022 19:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0E451BF356
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F0C240896
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MdE8_XolF4FD for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:24:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86CA740893
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:24:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D53F200002;
 Sun, 27 Feb 2022 19:24:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nOP9r-00Dq3R-L7; Sun, 27 Feb 2022 20:24:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1643665029.git.yann.morin.1998@free.fr>
 <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
Date: Sun, 27 Feb 2022 20:24:39 +0100
In-Reply-To: <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 31 Jan 2022 22:38:09 +0100")
Message-ID: <87mtic2juw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2 v2] linux: fix build with host-gcc 10+
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some older versions of linux, or custom versions (like forks for some
 > boards), fail to build with host-gcc 10+, because of redefined symbols:

 >       HOSTLD  scripts/dtc/dtc
 >     /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
 >     of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
 >     collect2: error: ld returned 1 exit status

 > Since this has been fixed in recent-ish versions, we can't use an
 > unconditionaly patch, so we must have a conditional patch. However, a
 > patch may not always apply to arbitrary U-Boot versions or forks.

 > Upstream just dropped that line altogether:
 >     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

 > So, we use a little sed-grep combo to do the exact same change.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
