Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B69ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18DF583103;
	Sun, 18 Sep 2022 16:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18DF583103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euNvTpM2EsD4; Sun, 18 Sep 2022 16:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D30A83046;
	Sun, 18 Sep 2022 16:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D30A83046
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0041BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5725B40A0D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5725B40A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBAVOUZKJs0G for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:20:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A67B40989
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A67B40989
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:20:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17AD4E0002;
 Sun, 18 Sep 2022 16:20:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZx2M-00DWUa-BA; Sun, 18 Sep 2022 18:20:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220511114003.162006-1-joel@jms.id.au>
 <20220511114003.162006-2-joel@jms.id.au>
Date: Sun, 18 Sep 2022 18:20:54 +0200
In-Reply-To: <20220511114003.162006-2-joel@jms.id.au> (Joel Stanley's message
 of "Wed, 11 May 2022 21:10:03 +0930")
Message-ID: <87sfkofyc9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/go: Fix link failure on ppc64
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > The autobuilder has been reporting build failures for golang packages
 > such as moby, containerd, and docker-cli on powerpc64le:

 >  net(.text): relocation target _savegpr0_28 not defined

 >  http://autobuild.buildroot.net/results/a4aab952acca33577822daf9541c25ccb8e68e60
 >  http://autobuild.buildroot.net/results/07dab4c21074d9f2cfba5020eac1d07e630fa3e9
 >  http://autobuild.buildroot.net/results/e37af28b6ea2293a5a8a3bb1a5c123bd465ff5de

 > Backport the upstream fix for the go compiler, and a dependant patch:

 >  https://github.com/golang/go/commit/9c9090eb1da540c7d757df0c60423319a28759d3
 >  https://github.com/golang/go/commit/caa46312eeca1275ce22ecf8985ca31ef8de7883

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Sorry for the slow response. As far as I can see, this was fixed in go
1.19 and backported to 1.18.4:

https://github.com/golang/go/issues?q=milestone%3AGo1.18.4+label%3ACherryPickApproved

I also haven't seen any autobuilder issues since we bumped go, so I
believe this is fixed and I have marked the patch as superseeded.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
