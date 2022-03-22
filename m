Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0A6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D70415F0;
	Tue, 22 Mar 2022 07:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TsM420SRD-sV; Tue, 22 Mar 2022 07:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD394174E;
	Tue, 22 Mar 2022 07:51:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5095B1BF314
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AAFC8436F
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mt7l_zYXhIlU for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 07:51:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9B2284368
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 07:51:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBB4AFF809;
 Tue, 22 Mar 2022 07:51:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nWZID-008eXi-Gi; Tue, 22 Mar 2022 08:51:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220209203026.3724993-1-yann.morin.1998@free.fr>
Date: Tue, 22 Mar 2022 08:51:01 +0100
In-Reply-To: <20220209203026.3724993-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 9 Feb 2022 21:30:26 +0100")
Message-ID: <878rt2h1cq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/scripts/graph-build-time: add
 support for timeline graphing
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > This commit adds support for a new type of graph, showing the timeline
 > of a build. It shows, with one line per package, when each of this
 > package steps started/ended, and therefore allows to see the
 > sequencing of the package builds.

 > For a fully serialized build like we have today, this is not super
 > useful (except to show that everything is serialized), but it becomes
 > much more useful in the context of top-level parallel build.

 > We chose to order the graph by the time-of-configure, as it is the
 > closest to the actual cascade-style of a true dependency graph, which is
 > tiny bit more complex to achieve properly. The actual result still looks
 > pretty good.

 > The graph-build make target is extended to also generate this new
 > timeline graph.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [yann.morin.1998@free.fr:
 >   - sort by start-of-configure time
 >   - re-use existing colorsets (default or alternate)
 >   - fix python2isms
 >   - fix check-package
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
