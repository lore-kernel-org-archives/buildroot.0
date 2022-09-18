Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0343AC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 880A760E1A;
	Sun, 18 Sep 2022 08:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 880A760E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 417W-G8HyFdL; Sun, 18 Sep 2022 08:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ECC660B2A;
	Sun, 18 Sep 2022 08:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ECC660B2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74EA11BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50D0C60B2A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D0C60B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgVU2Z5MgR6H for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:55:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BC460A6F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20BC460A6F
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:55:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A3E1100007;
 Sun, 18 Sep 2022 08:55:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZq5R-00BTVw-Dz; Sun, 18 Sep 2022 10:55:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220904130501.1983806-1-romain.naour@gmail.com>
Date: Sun, 18 Sep 2022 10:55:37 +0200
In-Reply-To: <20220904130501.1983806-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 4 Sep 2022 15:05:01 +0200")
Message-ID: <878rmhjc3a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for-master] package/gcc: 11.3.0: fix glibc
 crash on G4 ppc cpus
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > gcc 11.3.0 contains a backported patch [1] that introduce
 > a regression for old powerpc cpus like the powerpc 7400 (G4).

 > The glibc crash the init process due to a wrong asm machine
 > directive (.machine).

 > Run /sbin/init as init process
 > init[1]: segfault (11) at 7369693e nip 6f6e08 lr 6f6a68 code 1 in libc.so.6[690000+18f000]
 > init[1]: code: 280a000c 41c1ffe0 811edb80 554a103a 7d48502e 7d4a4214 7d4903a6 4e800420
 > init[1]: code: 2c08007a 4bffffbc 89290000 5529103a <7d2a482e> 2c090000 41c2ff78 7fe4fb78
 > Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

 > Backport two patches from the gcc-11 stable branch (the upcoming gcc
 > 11.4.0).

 > [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=3cb53c10831be59d967d9dce8e7980fee4703500

 > Fixes:
 > https://gitlab.com/kubu93/buildroot/-/jobs/2976071284

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Joel Stanley <joel@jms.id.au>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
