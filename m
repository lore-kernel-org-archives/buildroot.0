Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443F9C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB5BB6077D;
	Mon, 27 Jun 2022 22:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB5BB6077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cqh5ONnGAtjz; Mon, 27 Jun 2022 22:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 886936076C;
	Mon, 27 Jun 2022 22:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886936076C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE201BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7469E6076C
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7469E6076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUKG1GFNYFgg for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:10:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3258260759
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3258260759
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:10:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EC00240003;
 Mon, 27 Jun 2022 22:10:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5wvt-00D4Wa-9H; Tue, 28 Jun 2022 00:10:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220626100617.1477457-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Jun 2022 00:10:13 +0200
In-Reply-To: <20220626100617.1477457-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 Jun 2022 12:06:17 +0200")
Message-ID: <87czetvjui.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: fix build without NPTL
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
Cc: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following guile build failure without NPTL raised since the
 > addition of bdwgc in commit b0476427f6c0036b7803d591a5394923c4b07142 and
 > https://github.com/ivmai/bdwgc/commit/7896408d4149347588ed0e36319b53bcea70115b:

 > configure:60776: checking for GC_is_heap_ptr
 > configure:60776: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu11 -o conftest  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0  -DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND -flto -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -latomic_ops -lgc -lpthread -ldl  -latomic -lm >&5
 > /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgc.so: undefined reference to `pthread_getattr_np'

 > [...]

 > In file included from ../libguile/alist.h:26,
 >                  from ../libguile.h:31,
 >                  from guile.c:38:
 > ../libguile/pairs.h:205:1: error: conflicting types for 'GC_is_heap_ptr'
 >   205 | GC_is_heap_ptr (void *ptr)
 >       | ^~~~~~~~~~~~~~
 > In file included from ../libguile/bdw-gc.h:48,
 >                  from ../libguile/gc.h:142,
 >                  from ../libguile/pairs.h:26,
 >                  from ../libguile/alist.h:26,
 >                  from ../libguile.h:31,
 >                  from guile.c:38:
 > /home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gc/gc.h:551:20: note: previous declaration of 'GC_is_heap_ptr' was here
 >   551 | GC_API int GC_CALL GC_is_heap_ptr(const void *);
 >       |                    ^~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/819f231a60fc81f9a8dd07bf5411aa9d8f78c3bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
