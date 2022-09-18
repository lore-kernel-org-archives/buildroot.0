Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81A9ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A24E81AAB;
	Sun, 18 Sep 2022 21:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A24E81AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2oDLlWx_ilq; Sun, 18 Sep 2022 21:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADDEF815CC;
	Sun, 18 Sep 2022 21:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADDEF815CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7641BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 243D14013B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 243D14013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dxfy8ax2AklG for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027FA400DA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 027FA400DA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:16:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86207C0003;
 Sun, 18 Sep 2022 21:15:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oa1dp-00Ea6K-CZ; Sun, 18 Sep 2022 23:15:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
 <20220910135256.1689860-2-giulio.benetti@benettiengineering.com>
Date: Sun, 18 Sep 2022 23:15:53 +0200
In-Reply-To: <20220910135256.1689860-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 10 Sep 2022 15:52:56 +0200")
Message-ID: <8735cofkom.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/qt5/qt5xmlpatterns: fix build
 failure due to gcc bug 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > The qt5xmlpatterns package exhibits gcc bug 90620 when built for the
 > Microblaze architecture with optimization enabled, which causes a build
 > failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y like we
 > already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

 > Fixes:
 > http://autobuild.buildroot.net/results/346/346e6d502a8927c8e95eea156f5b2943a85d0a6b/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
