Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614F0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C5060D68;
	Mon, 14 Nov 2022 07:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C5060D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEQJY1edde_u; Mon, 14 Nov 2022 07:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3943F60D65;
	Mon, 14 Nov 2022 07:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3943F60D65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0024F1BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC49F409D6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC49F409D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNIoxsTwCZoF for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:10:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF5A409D3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF5A409D3
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:10:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A126640009;
 Mon, 14 Nov 2022 07:10:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouTcK-0060rN-OW; Mon, 14 Nov 2022 08:10:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221103174818.1469409-1-fontaine.fabrice@gmail.com>
Date: Mon, 14 Nov 2022 08:10:52 +0100
In-Reply-To: <20221103174818.1469409-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Nov 2022 18:48:18 +0100")
Message-ID: <87bkpam2o3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: fix build without
 __NR_pidfd_open
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

 > Fix the following build failure without __NR_pidfd_open raised since
 > bump to version 3.3.17 in commit
 > cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220 and
 > https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da:

 > pgrep.c: In function 'pidfd_open':
 > pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
 >   748 |  return syscall(__NR_pidfd_open, pid, flags);
 >       |                 ^~~~~~~~~~~~~~~
 >       |                 pidfd_open

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
