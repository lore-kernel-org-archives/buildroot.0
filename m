Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4310DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA023812F0;
	Tue, 11 Jan 2022 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBGQVBuCxiS7; Tue, 11 Jan 2022 16:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DBC812C5;
	Tue, 11 Jan 2022 16:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DB8C1BF83E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39FF340114
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 16:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46o_PCjNC1ln for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 16:11:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 765D04016D
 for <buildroot@uclibc.org>; Tue, 11 Jan 2022 16:11:48 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1n7JkP-00072L-U5
 for buildroot@uclibc.org; Tue, 11 Jan 2022 17:11:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 11 Jan 2022 16:11:41 -0000 (UTC)
Message-ID: <srka7t$pu1$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
Subject: [Buildroot] Diagnosing conflicts due to new Python version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems that every time a new Python version is unmasks, it breaks
things.

This time it's a python-exec version conflict that prevents emerge
-u. FAICT, Python 3.10 requires python-exec 2.4.8, and some other
package requires 2.4.6.

I've fixed things temporarily with:

package.use:

   */* PYTHON_TARGETS: -python3_10
   */* PYTHON_SINGLE_TARGET -python3_10

package.mask:

   =dev-lang/python-3.10

No, at least I can continue to update the machine.

When I eventually get the spare time to try to get Python 3.10
working, how does one figure out which package is causing the problem
by requring the older version of python-exec?

I've tried adding a 't' to the emerge flags, but that doesn't seem to
show anything useful.

Is there any documentation on how to determine the cause of a package
version conflict?

--
Grant



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
