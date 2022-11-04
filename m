Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F479C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E64441809;
	Fri,  4 Nov 2022 07:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E64441809
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-q3wRqfr4wJ; Fri,  4 Nov 2022 07:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 340A541806;
	Fri,  4 Nov 2022 07:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 340A541806
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F41601BF399
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBDF941806
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBDF941806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vk2_EwX_myf for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:40:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CD3415D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99CD3415D7
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:40:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B9A07FF804;
 Fri,  4 Nov 2022 07:40:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqrJF-00BXdv-P8; Fri, 04 Nov 2022 08:40:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
 <1138_1665746311_63494587_1138_437_1_82ab2cc49c43374ceb22a1fdd6bc5e4c72d29df2.1665746266.git.yann.morin@orange.com>
Date: Fri, 04 Nov 2022 08:40:13 +0100
In-Reply-To: <1138_1665746311_63494587_1138_437_1_82ab2cc49c43374ceb22a1fdd6bc5e4c72d29df2.1665746266.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 14 Oct 2022 13:18:26 +0200")
Message-ID: <87zgd7np5u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts: don't require gawk to
 generate glibc gconv modules
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

>>>>>   <yann.morin@orange.com> writes:

 > When a subset of the glibc gconv modules installed, we eed to generate a
 > trimmed-down list of available modules. We currently use gawk for that.

 > However, we are not using any GNU extension in that awk script, and it
 > happens to work as expected when using mawk (which has no GNU
 > extension).

 > Commit 11c1076db9a5 (toolchain: add option to copy the gconv libraries)
 > did not explain why it used gawk explicitly, and given the age for that
 > commit, we doubt we'd be able to have the involved participants recall
 > anything from that period...

 > Besides, gawk is not a requirement for Buildroot.

 > Switch over to using plain awk.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
