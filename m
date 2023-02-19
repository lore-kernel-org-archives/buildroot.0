Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE0C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E35640B61;
	Sun, 19 Feb 2023 16:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E35640B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbAhGHet_MKV; Sun, 19 Feb 2023 16:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2FF040B53;
	Sun, 19 Feb 2023 16:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2FF040B53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98EFE1BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7219760E89
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7219760E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPHFEktWOqyt for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:55:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C60460E70
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C60460E70
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:55:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 922C740004;
 Sun, 19 Feb 2023 16:55:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pTmyV-0074ps-3w; Sun, 19 Feb 2023 17:55:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230216174134.34179-1-fontaine.fabrice@gmail.com>
Date: Sun, 19 Feb 2023 17:55:42 +0100
In-Reply-To: <20230216174134.34179-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 16 Feb 2023 18:41:34 +0100")
Message-ID: <874jrh388h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 libexecinfo
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with libexecinfo raised since commit
 > d649bcd3805a26cedb30120ebbdcf12f8fbf449f:

 > /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot-linux-musl/10.4.0/../../../../mips-buildroot-linux-musl/bin/ld:
 > ../lib/monkey/library/libmonkey.a(mk_utils.c.o): in function
 > `mk_utils_stacktrace':
 > mk_utils.c:(.text+0x1578): undefined reference to `backtrace'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e3a21f5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
