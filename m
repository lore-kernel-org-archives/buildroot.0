Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFFC77B7E
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C38D540641;
	Sun, 28 May 2023 19:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38D540641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4zKu3drSWaQ; Sun, 28 May 2023 19:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E62AB40338;
	Sun, 28 May 2023 19:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E62AB40338
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91B531BF834
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63C74417C3
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63C74417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVZKefjtZlgx for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:41:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA79E417B9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA79E417B9
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:41:48 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B52C20002;
 Sun, 28 May 2023 19:41:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q3MGu-0089r4-4O; Sun, 28 May 2023 21:41:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230527163302.2130999-1-romain.naour@gmail.com>
Date: Sun, 28 May 2023 21:41:44 +0200
In-Reply-To: <20230527163302.2130999-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 27 May 2023 18:33:02 +0200")
Message-ID: <87edn0tf9j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/busybox: fix busybox lineedit
 signal handling
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Since the Busybox version bump to 1.36.0 the TestS6 fails during the
 > test teardown.

 > Backport an upstream patch fixing signal handling (SIGWINCH), see [1].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819388

 > [1] https://bugs.busybox.net/show_bug.cgi?id=15256

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 >  ...CH-and-SIGCHLD-in-hush-interrupting-.patch | 104 ++++++++++++++++++
 >  1 file changed, 104 insertions(+)
 >  create mode 100644
 > package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch

 > diff --git a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
 > new file mode 100644
 > index 0000000000..e233be07f8
 > --- /dev/null
 > +++ b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
 > @@ -0,0 +1,104 @@
 > +From f683598539683266d9b959178e1330a2b66392eb Mon Sep 17 00:00:00 2001
 > +From: Romain Naour <romain.naour@gmail.com>

You should not change authorship.

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
