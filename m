Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA66C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 08:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3E282538;
	Tue, 15 Feb 2022 08:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtpmgHBegyot; Tue, 15 Feb 2022 08:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F12281D16;
	Tue, 15 Feb 2022 08:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC4E1BF292
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 08:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89911403A7
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 08:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPGpDONXZwUT for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 08:15:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 354224000B
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 08:15:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC7C5100007;
 Tue, 15 Feb 2022 08:15:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nJszv-0004He-PF; Tue, 15 Feb 2022 09:15:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
 <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
 <c3a9cf08-fb79-580d-f1e6-79ef28b46263@mind.be>
 <cb93cb6a-c8ae-0975-6ae0-14ad369de9e2@benettiengineering.com>
 <6edcbc6d-c9bb-e802-48f1-d4866a698aa9@mind.be>
Date: Tue, 15 Feb 2022 09:15:43 +0100
In-Reply-To: <6edcbc6d-c9bb-e802-48f1-d4866a698aa9@mind.be> (Arnout
 Vandecappelle's message of "Mon, 14 Feb 2022 21:13:33 +0100")
Message-ID: <87czjok0k0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand
 rootfs size to 120M
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
Cc: Danilo Bargen <mail@dbrgn.ch>, buildroot@buildroot.org,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> It is because of modules(30M) and linux "Image", it's not
 >> compressed, so it's 25M. So only for Linux+modules => 55M, plus the
 >> few other stuff(Busybox+libc etc.)1M

 >  Yeah those giant aarch64 default configs are mightily annoying...

 >  I'm thinking, perhaps we should just bite the bullet and move the
 > default ext2 size to 120M...

 >  Peter, Yann, what do you think?

Fine by me.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
