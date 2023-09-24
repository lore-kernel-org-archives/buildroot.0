Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B1BCE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F134173B;
	Sun, 24 Sep 2023 18:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F134173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZxHRAdEgKwT; Sun, 24 Sep 2023 18:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671D241734;
	Sun, 24 Sep 2023 18:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671D241734
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3181BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E9B141734
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E9B141734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qx3vlmqo-uF2 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:32:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01A2241726
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A2241726
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D53D20003;
 Sun, 24 Sep 2023 18:32:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkTuT-000Daw-HK; Sun, 24 Sep 2023 20:32:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230915193344.1434907-1-ju.o@free.fr>
Date: Sun, 24 Sep 2023 20:32:49 +0200
In-Reply-To: <20230915193344.1434907-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 15 Sep 2023 21:33:44 +0200")
Message-ID: <87bkdrjub2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix some x86 32bit
 builds
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > OpenBLAS Makefile normally needs to explicitly define the CPU
 > architecture size (32 or 64bit) in the BINARY macro. See [1].

 > When an architecture supports both 64 and 32bit, the 32bit support
 > is sometimes implemented in OpenBLAS by overriding a fallback to an
 > anterior architecture. For example, if the build target architecture
 > is x86 Haswell 32bit, OpenBLAS build will override the arch to
 > Nehalem. See [2].

 > If the BINARY macro is undefined, the 32bit fallback will not happen,
 > sometimes leading to a link failure, with output:

 >     i686-buildroot-linux-gnu/bin/ar: strmm_kernel_LN.o: No such file or directory

 > This commit fixes those issues by explicitly defining the BINARY
 > macro. This issue has also been discussed upstream in [3] and [4].

 > Note: this issue was not introduced recently ([3] dates back from 2015),
 > and was also see in previous package version, for example in [5].

 > Fixes:
 > http://autobuild.buildroot.net/results/e1e/e1e2034a78799abe1bd28b036fa6f7d13322e42f

 > [1] https://github.com/xianyi/OpenBLAS/blob/v0.3.24/Makefile.rule#L50
 > [2] https://github.com/xianyi/OpenBLAS/blob/v0.3.24/Makefile.system#L113
 > [3] https://github.com/xianyi/OpenBLAS/issues/657
 > [4] https://github.com/xianyi/OpenBLAS/issues/1106
 > [5] http://autobuild.buildroot.net/results/5cd/5cdccd106b1de275ac75c39783e536107a31651f

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
