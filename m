Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989BEC25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF9782CCB;
	Thu,  4 Aug 2022 15:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF9782CCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0J0DCxqWE_B; Thu,  4 Aug 2022 15:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCEC82C75;
	Thu,  4 Aug 2022 15:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CCEC82C75
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFED71C1148
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9CCA41B89
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CCA41B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnNceZoR_5_S for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701C6418D9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 701C6418D9
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:02:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B9FD60006;
 Thu,  4 Aug 2022 15:01:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oJcMI-0005Eh-JV; Thu, 04 Aug 2022 17:01:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220716134714.611106-1-fontaine.fabrice@gmail.com>
Date: Thu, 04 Aug 2022 17:01:58 +0200
In-Reply-To: <20220716134714.611106-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Jul 2022 15:47:14 +0200")
Message-ID: <87czdgrr15.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openssl: fix libressl dependency
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libressl can be built with uclibc on noMMU since bump to version 3.0.2
 > in commit 26f42106e8acfd336d8e902da96cd2ac9e63c09d and
 > https://github.com/libressl-portable/openbsd/commit/f542e84c859e3fb2728075c702062cce8a0ea93f

 > However, uclibc-ng doesn't provide __register_atfork without NPTL
 > resulting in the following libressl build failure:

 > /nvmedata/autobuild/instance-28/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.3.0/../../../../arceb-buildroot-linux-uclibc/bin/ld:
 > ../../tls/libtls.a(arc4random.c.o): in function `_rs_stir':
 > arc4random.c:(.text+0x50c): undefined reference to `__register_atfork'

 > So fix the dependency and, while at it, drop the double negation for
 > readability

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2fa4fa10cf19f1f942b6b49b5f6f05339c008cd4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
