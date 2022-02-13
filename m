Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECDCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 14:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC4E60A9C;
	Sun, 13 Feb 2022 14:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SS_WfKfxY3uM; Sun, 13 Feb 2022 14:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4176160758;
	Sun, 13 Feb 2022 14:52:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C253F1BF841
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3884030A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcIf1oo9VyjL for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 14:52:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B52640304
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 14:52:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2CC8C000C;
 Sun, 13 Feb 2022 14:52:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nJGEh-0002RL-Pm; Sun, 13 Feb 2022 15:52:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-2-james.hilliard1@gmail.com>
 <20220213144218.GA4462@scaer>
Date: Sun, 13 Feb 2022 15:52:23 +0100
In-Reply-To: <20220213144218.GA4462@scaer> (Yann E. MORIN's message of "Sun,
 13 Feb 2022 15:42:18 +0100")
Message-ID: <87o83alsyg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 2/8] package/re2: switch to
 generic-package make build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?Q?Ga=C3=ABl?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Jmes, All,
 > On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
 >> The cmake build appears to be missing features such as pkg-config
 >> generation support, switch to the regular makefile based build
 >> which appears to work better.

 > I was wondering why we could not just fix the CMake buildsystem, and
 > submit the fix upstream...

 > And then I remembered already talking about this earlier, but this
 > commit did not carry any explanations why we could not do it... So I
 > had to dig the archives to recover the previous discussion.

 > So, bottom line is, the commit log would be better off with more
 > explanations, like:

 >     The cmake build appears to be missing features, such as pkg-config
 >     generation support which is needed for some packages to find re2,
 >     like qt5webengine.

 >     Upstream is not keen on fixing the CMake-absed buildsystem [0]

 >     Instead of patching it on our side, and then have to carry the patch
 >     forever, we switch to the Makefile-based generic buildsystem.

 >     Note that previously some packages like grpc failed when the generic
 >     Makefile was used, because they would not find the cmake-equivalent
 >     of pkg-config, but this is now fixed [1].

 >     Signed-off-by: you.

 >     [0] https://github.com/google/re2/issues/349
 >     [1] https://github.com/grpc/grpc/commit/45e413d2520795e7281e9a592af81620349bc186

Yes, a lot nicer! Committed with the commit message changed to the
above, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
