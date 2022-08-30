Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E6ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5E18139F;
	Tue, 30 Aug 2022 16:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5E18139F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2k_7FAUVD1u; Tue, 30 Aug 2022 16:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F6498133B;
	Tue, 30 Aug 2022 16:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6498133B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4BEB1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A03CC8133B
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03CC8133B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Oxu7Rt8nobC for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:14:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74E7C812FE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74E7C812FE
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:14:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4B6860002;
 Tue, 30 Aug 2022 16:14:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oT3t0-001Y10-2b; Tue, 30 Aug 2022 18:14:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
References: <20220727140822.355859-1-tianyuanhao3@163.com>
Date: Tue, 30 Aug 2022 18:14:46 +0200
In-Reply-To: <20220727140822.355859-1-tianyuanhao3@163.com> (TIAN Yuanhao's
 message of "Wed, 27 Jul 2022 07:08:22 -0700")
Message-ID: <87fshd1zex.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: refine
 KCONFIG_MUNGE_DOT_CONFIG
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

>>>>> "TIAN" == TIAN Yuanhao <tianyuanhao3@163.com> writes:

 > Given a .config with:
 >     FOO="1234"
 >     BAR="$(FOO)"

 > and then:

 >     $(call KCONFIG_SET_OPT,FOO,azerty)

 > would yield a .config with just:

 >     FOO="azerty"

 > because \<FOO\> would match the assignment to BAR.

 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
