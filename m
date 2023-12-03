Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4892CC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF00E40519;
	Sun,  3 Dec 2023 21:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF00E40519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bXaZy7uOt8K; Sun,  3 Dec 2023 21:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC0204012F;
	Sun,  3 Dec 2023 21:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC0204012F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9CA1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43567607C1
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43567607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9is7dmq46i1B for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:04:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7CCF606F2
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CCF606F2
Received: by mail.gandi.net (Postfix) with ESMTPSA id F346C1C0004;
 Sun,  3 Dec 2023 21:04:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9tdx-009e30-10;
 Sun, 03 Dec 2023 22:04:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231201203822.615354-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 22:04:49 +0100
In-Reply-To: <20231201203822.615354-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Dec 2023 21:38:22 +0100")
Message-ID: <87leabvvym.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: fix static build
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
Cc: Alexander Dahl <post@lespocky.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure raised since bump to version 0.78
 > in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

 > In file included from /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/putty.h:8,
 >                  from /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/callback.c:8:
 > /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/unix/platform.h:11:10: fatal error: dlfcn.h: No such file or directory
 >    11 | #include <dlfcn.h>                     /* Dynamic library loading */
 >       |          ^~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/06f0b14bd0414f97b06070198e290fb3253348c5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
