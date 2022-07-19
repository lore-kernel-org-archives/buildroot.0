Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88179C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 17:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F6B681317;
	Tue, 19 Jul 2022 17:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F6B681317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oNJ-a3dz3bfx; Tue, 19 Jul 2022 17:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B8B4812F5;
	Tue, 19 Jul 2022 17:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B8B4812F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F12501BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7D2640A7A
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D2640A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okwhcwx63RF4 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 17:02:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E65240A06
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E65240A06
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 17:02:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E3F61BF206;
 Tue, 19 Jul 2022 17:02:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oDqc8-002uVT-Vg; Tue, 19 Jul 2022 19:02:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220613201758.293344-1-fontaine.fabrice@gmail.com>
 <bf145aa4-0370-91a5-4583-0932e531091a@mind.be>
Date: Tue, 19 Jul 2022 19:02:28 +0200
In-Reply-To: <bf145aa4-0370-91a5-4583-0932e531091a@mind.be> (Arnout
 Vandecappelle's message of "Sun, 19 Jun 2022 17:55:27 +0200")
Message-ID: <871quh2fyz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtalloc: fix build wihout SSP
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/06/2022 22:17, Fabrice Fontaine wrote:
 >> Fix the following build failure without SSP raised since the addition of
 >> the package in commit f0d37e275a915539a581c4ac7fd066eddc41fc8c:
 >> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld:
 >> talloc.c.5.o: in function `_vasprintf_tc':
 >> talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


 >  Applied to master, thanks.

 >  Since upstream seemed to risk not accepting the package, I added a
 >  comment that hopefully will tickle them (for real this time).

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
