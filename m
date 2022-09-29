Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A420C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 14:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B537560BDE;
	Thu, 29 Sep 2022 14:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B537560BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ror8F3-UKU5W; Thu, 29 Sep 2022 14:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDCE60BC1;
	Thu, 29 Sep 2022 14:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEDCE60BC1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF61C1BF3BF
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 14:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C76B683E79
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 14:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C76B683E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcEz47mJzSXO for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 14:05:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BD283E72
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6BD283E72
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 14:05:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA72C4000C
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 14:05:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oduA4-009ask-QH
 for buildroot@buildroot.org; Thu, 29 Sep 2022 16:05:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220918133049.3180533-1-peter@korsgaard.com>
Date: Thu, 29 Sep 2022 16:05:12 +0200
In-Reply-To: <20220918133049.3180533-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 18 Sep 2022 15:30:49 +0200")
Message-ID: <87czbe8eef.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openssh: allow sandboxing to be
 disabled as workaround for seccomp issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As explained in bug #14796, there are situations where the seccomp based
 > sandboxing in openssh can get confused, leading to connection issues.

 > As explained by Thomas in the bug report:

 > glibc does not care about the kernel headers when deciding whether to try
 > the clock_gettime64() syscall or not: it always use it, and if that fails at
 > runtime, it falls back to clock_gettime().  This is how glibc ends up using
 > clock_gettime64() even if your kernel does not support it.

 > On the other hand, the OpenSSL seccomp code relies on kernel headers to decide
 > whether the clock_gettime64() syscall should be in the allowed list of syscalls
 > or not.

 > So when you are in a situation where glibc is recent, but your kernel is
 > older, you get into precisely the problem you have: glibc tries to use
 > clock_gettime64, but OpenSSH seccomp configuration prevents that, which does
 > not allow glibc to gracefully fallback to clock_gettime (as seccomp is
 > configured to kill the process on filter violations).

 > As a workaround, add a _OPENSSH_SANDBOX option (defaulting to y) to decide
 > if sandboxing should be used or not.

 > Fixes (works around) #14796

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
