Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3DEE3F33
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E36E8200C;
	Tue, 12 Sep 2023 21:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E36E8200C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYhieBgZYFSr; Tue, 12 Sep 2023 21:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BAD882008;
	Tue, 12 Sep 2023 21:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BAD882008
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A98C71BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8324982008
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8324982008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21NPcPBjBjS0 for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:21:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FFFA81343
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FFFA81343
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ADAC60002;
 Tue, 12 Sep 2023 21:21:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgAoy-001yzl-Go; Tue, 12 Sep 2023 23:21:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230817191130.1022405-1-yann.morin.1998@free.fr>
Date: Tue, 12 Sep 2023 23:21:20 +0200
In-Reply-To: <20230817191130.1022405-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 17 Aug 2023 21:11:30 +0200")
Message-ID: <87bke75bqn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nftables: fix the build of the
 pyhon bindings
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
Cc: Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > nftables provides python bindings; it uses setuptools to install them.
 > We currently install those bindings by telling nftables buildsystem,
 > autotools, to install the python bindings.

 > However, we do not pass any of the environment variables that are needed
 > for setuptools packages. When host-python-setuptools is installed before
 > nftables is built [0], this breaks the system at runtime, as the
 > bindings are not installed; only the egg is, resulting in runtime errors
 > like:

 >     # python -c 'import nftables'
 >     Traceback (most recent call last):
 >       File "<string>", line 1, in <module>
 >     ModuleNotFoundError: No module named 'nftables'

 > Upstream has been doing some changes on their python handling, but it is
 > not in a released version, and we can't backport those changes either,
 > due to other big changes.

 > Instead, we split the pyhon bindings to their own package.

 > For legacy hadnling, we make that package default to y, so that existing
 > (def)config still work. The only novelty is that it can be disabled now.

 > Many thanks to Julien for testing and finding the offending dependency,
 > to James for suggesting the package split, and to Adam for, well,
 > trigerring the issue in the first place! ;-p

 > Note: a git bisect of the issue turns up 72 candidates for the breakage,
 > all around the time we dropped python2 support in early 2022; the last
 > known-good commit is 55df30f8b1fb (package/zfs: drop python2 support)
 > and the first known-bad commit is 697acda00d9f (package/pkg-python: drop
 > python2 host/setuptools support); everything in-between does not
 > configure (package/python/Config.in.host still sourced but already
 > removed), or does not build (host-python still in the dependency chain
 > but already removed), so had to be skipped during the bisect.

 > [0] This can happen when another python package using setuptools is
 >     built before nftables. However, with PPD, this never happens because
 >     host-python-setuptools is never in the dependency chain of nftables.

 > Reported-by: Julien Olivain <ju.o@free.fr>
 > Tested-by: Julien Olivain <ju.o@free.fr>
 > Suggested-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > ---
 > Given the bisection result, it means that all the currently maintained
 > branches are affected by the issue.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
