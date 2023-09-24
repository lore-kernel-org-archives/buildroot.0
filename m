Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CA9CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C6A04097C;
	Sun, 24 Sep 2023 16:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C6A04097C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BIXpVUIU_rq; Sun, 24 Sep 2023 16:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D5754095E;
	Sun, 24 Sep 2023 16:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5754095E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE191BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7395060760
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7395060760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9vjragqa4d3 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:05:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37B4B60759
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B4B60759
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CBE9C0002;
 Sun, 24 Sep 2023 16:05:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkRba-000Azb-AU; Sun, 24 Sep 2023 18:05:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <87ecf117f50e4758946f6b0ce54436f09435f4bc.1694556946.git.yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2023 18:05:00 +0200
In-Reply-To: <87ecf117f50e4758946f6b0ce54436f09435f4bc.1694556946.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 13 Sep 2023 00:15:49 +0200")
Message-ID: <871qenlfpv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/5] support/download: generate even more
 reproducible tarballs
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we generate the taballs off a local working copy of a VCS tree,
 > the umask is the one that we enforce in out top-level Makefile.

 > However, it is possible that a user manually tinkers in said working
 > copy (e.g. to check an upstream bug fix, or regression). If the user
 > umask is different from the one Buildroot enfirces, such tinkering
 > can impact the mode bits of the files, even if their content is not
 > modified.

 > When we eventually need to create a tarball from said working copy,
 > the VCS (e.g. git) will only be interested in checking whether the
 > content of the files have changed before chcking them out, and will
 > not look at, and restore/fix the mode bits.

 > As a consequence, we may create non-reproducible archives.

 > We fix that by enforcing the mode bits on the files before we create
 > the tarball: we disable the write and execute bits, and only set the
 > execute bit if the user execute bit is set.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Vincent Fazio <vfazio@xes-inc.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
