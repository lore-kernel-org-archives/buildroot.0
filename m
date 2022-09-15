Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9AAC6FA8D
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E01B261005;
	Thu, 15 Sep 2022 08:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E01B261005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzUxaAPz1Vs9; Thu, 15 Sep 2022 08:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B12E60FAA;
	Thu, 15 Sep 2022 08:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B12E60FAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 233181BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F234A83366
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F234A83366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dqqwzKBd4w0 for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:36:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 023238333F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 023238333F
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:36:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE01DC001D;
 Thu, 15 Sep 2022 08:36:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYkMS-008CMX-V0; Thu, 15 Sep 2022 10:36:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220813184448.2303650-1-fontaine.fabrice@gmail.com>
Date: Thu, 15 Sep 2022 10:36:40 +0200
In-Reply-To: <20220813184448.2303650-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Aug 2022 20:44:48 +0200")
Message-ID: <87v8ppkp9j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: fix build with
 kernel >= 5.1 and < 5.6
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with kernel >= 5.1 and < 5.6 (i.e.
 > before
 > https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
 > raised since bump to version 0.12.02 in commit
 > e551fe76e2073f15b0fcf92a73bb6b7334b017b3 and
 > https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:

 > In file included from stress-io-uring.c:26:
 > io-uring.h:1:9: error: macro names must be identifiers
 >     1 | #define #define HAVE_IORING_OP_NOP 0
 >       |         ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
