Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977BBC61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E88F81586;
	Sun, 29 Jan 2023 21:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E88F81586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9E2BJxyhdsb; Sun, 29 Jan 2023 21:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7854D8161D;
	Sun, 29 Jan 2023 21:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7854D8161D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70E801BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48840400CC
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48840400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDckCofRJr6L for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:04:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A68340567
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A68340567
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:04:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 756B160004;
 Sun, 29 Jan 2023 21:04:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pMEqU-0052xZ-Cp; Sun, 29 Jan 2023 22:04:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230118182333.503773-1-fontaine.fabrice@gmail.com>
Date: Sun, 29 Jan 2023 22:04:14 +0100
In-Reply-To: <20230118182333.503773-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Jan 2023 19:23:33 +0100")
Message-ID: <87ilgp3ve9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: set XXH_NO_INLINE_HINTS
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

 > Set XXH_NO_INLINE_HINTS to marks all internal functions as static,
 > giving the compiler full control on whether to inline or not. This will
 > fix the following build failure raised since bump to version 0.8.1 in
 > commit 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97:

 > In file included from xxhash.c:43:
 > In function 'XXH3_accumulate',
 >     inlined from 'XXH3_hashLong_internal_loop' at xxhash.h:4390:9,
 >     inlined from 'XXH3_hashLong_64b_internal' at xxhash.h:4453:5,
 >     inlined from 'XXH3_hashLong_64b_withSecret' at xxhash.h:4473:12,
 >     inlined from 'XXH3_64bits_internal' at xxhash.h:4554:12,
 >     inlined from 'XXH3_64bits_withSecret' at xxhash.h:4570:12:
 > xxhash.h:4196:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_scalar': function not considered for inlining
 >  4196 | XXH3_accumulate_512_scalar(void* XXH_RESTRICT acc,
 >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f2c52238df97cc4c13117d8dc1423235231a094c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
