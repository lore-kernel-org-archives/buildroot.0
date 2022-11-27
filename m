Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38043C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1550405D4;
	Sun, 27 Nov 2022 20:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1550405D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_LJpCHedGX6; Sun, 27 Nov 2022 20:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD2F7405F8;
	Sun, 27 Nov 2022 20:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD2F7405F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F29C41BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC45D40111
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC45D40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVrMn31dLy0H for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:22:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA793402E0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA793402E0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:22:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E3B720007;
 Sun, 27 Nov 2022 20:22:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ozOAo-000of7-EK; Sun, 27 Nov 2022 21:22:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20221124124546.A2767844ED@busybox.osuosl.org>
Date: Sun, 27 Nov 2022 21:22:46 +0100
In-Reply-To: <20221124124546.A2767844ED@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Thu, 24 Nov 2022 13:42:45 +0100")
Message-ID: <87y1rwcfl5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package.libopenssl: fix
 enabling/disabling mdc2
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=45bb69c2bdee44346d6be5b58e46b2278e40a04a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 3dbc86f09897 (openssl: bump version, enable mdc2+camellia+tlsext)
 > form 2010-06-03, forced the build of mdc2. Commit a83d41867c8d
 > (package/libopenssl: add option to enable some features) added an option
 > to explicitly disable mdc2, but forgot to amend the existing enabling
 > option.

 > It appears that, like most (all?) openssl config options, mdc2 ends up
 > enabled unless explicitly disabled.

 > Additionally, mdc2 depends on DES, so without DES, mdc2 gets disabled.

 > So, drop the explicit enabling option, and make mdc2 select DES.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
 > Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
