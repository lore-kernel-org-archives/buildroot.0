Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C85C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 12:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6C9610B8;
	Wed, 17 Aug 2022 12:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6C9610B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1mgn-lk8Dfq; Wed, 17 Aug 2022 12:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 220426105D;
	Wed, 17 Aug 2022 12:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 220426105D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0DEE1BF599
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 12:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9037A6105D
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 12:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9037A6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UENsKzInNKkQ for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 12:47:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A0B61055
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53A0B61055
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 12:47:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD6F01C000B;
 Wed, 17 Aug 2022 12:47:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOISK-00CEeS-Su; Wed, 17 Aug 2022 14:47:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220725141506.D03E185D64@busybox.osuosl.org>
Date: Wed, 17 Aug 2022 14:47:32 +0200
In-Reply-To: <20220725141506.D03E185D64@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 25 Jul 2022 16:26:57 +0200")
Message-ID: <878rnn9guz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/pkg-utils: prevent
 KCONFIG_ENABLE_OPT from changing =m to =y
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=66d2ff25bad813659ed4541b3f4c6c2a09455bd7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
 > option when a package requires it.

 > However, this will often override an existing enabled module with `=m` with `=y`
 > which overrides the module to be built-in instead of separate.

 > This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
 > the size of the kernel image.

 > This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > Co-authored-by: TIAN Yuanhao <tianyuanhao3@163.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > [yann.morin.1998@free.fr:
 >   - drop  || exit 1, it is superfluous
 >   - don't change the match in the SED (just append &&)
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
