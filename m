Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B147EC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 16:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500D3815AD;
	Mon, 14 Nov 2022 16:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 500D3815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj09CzzMT-Xi; Mon, 14 Nov 2022 16:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91AD281362;
	Mon, 14 Nov 2022 16:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91AD281362
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F2211BF32B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A10781362
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A10781362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsPn9VKDec5n for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 16:05:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FE38135F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05FE38135F
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 16:05:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE4701BF215;
 Mon, 14 Nov 2022 16:05:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oubxF-0070Ro-JR; Mon, 14 Nov 2022 17:05:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221105205239.300732-1-fontaine.fabrice@gmail.com>
Date: Mon, 14 Nov 2022 17:05:01 +0100
In-Reply-To: <20221105205239.300732-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 Nov 2022 21:52:39 +0100")
Message-ID: <87edu5jzde.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gsl: fix powerpc build
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

 > Fix the following powerpc build failures on:
 >  - musl raised because fpu_control.h is not available:

 > In file included from fp.c:8:
 > fp-gnuppc.c:21:10: fatal error: fpu_control.h: No such file or directory
 >    21 | #include <fpu_control.h>
 >       |          ^~~~~~~~~~~~~~~

 >  - glibc raised because _FPU_RC_NEAREST is undefined if _SOFT_FLOAT is
 >    set:

 >    In file included from fp.c:8:
 > fp-gnuppc.c: In function 'gsl_ieee_set_mode':
 > fp-gnuppc.c:53:15: error: '_FPU_RC_NEAREST' undeclared (first use in this function)
 >    53 |       mode |= _FPU_RC_NEAREST ;
 >       |               ^~~~~~~~~~~~~~~

 > These build failures are raised since the addition of the package in
 > commit 9d9f7feba4ffbfeb54479f1ad90d47acca1a6f0b

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d73e116c81bf16d2e55fced215d6bd3b382fef10
 >  - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
