Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11089C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF42140475;
	Mon,  7 Mar 2022 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okIdY6eyx_Aj; Mon,  7 Mar 2022 21:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF0E4016A;
	Mon,  7 Mar 2022 21:10:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4091BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65D744012E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DILqJ0YfaabW for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:10:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78C0D4016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:10:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 05963240002;
 Mon,  7 Mar 2022 21:10:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRKcD-001HeM-41; Mon, 07 Mar 2022 22:10:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <817_1646667779_62262803_817_313_1_9705b574ea82a36b8f676e04876817b58ebb6e3c.1646667776.git.yann.morin@orange.com>
Date: Mon, 07 Mar 2022 22:10:01 +0100
In-Reply-To: <817_1646667779_62262803_817_313_1_9705b574ea82a36b8f676e04876817b58ebb6e3c.1646667776.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 7 Mar 2022 16:42:56 +0100")
Message-ID: <87a6e14ggm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: fix build with
 per-package directories
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Build with per-package directory is broken, because go is not found in
 > the PATH, when trying to download and vendor a go package.

 > This is because FOO_DL_ENV contains $(HOST_GO_COMMON_ENV), which defines
 > the PATH as PATH=$(BR_PATH). This is correct, except this is expanded at
 > the time the golang-package macro is evaluated, which means PATH
 > contains the 'global' BR_PATH, i.e.: $(O)/host/bin:$(O)/host/sbin:...

 > However, with PPD, this does not yet exist at build time; only the
 > per-package hoqt directory exists.

s/hoqt/host/

 > We want to have it expanded at the time the recipe is run, so like all
 > other variables, we need to $$-expand it.

 > At the same time, also $$-expand two other variables (even though those
 > are benign, it is better for consistency that they be $$-expanded).

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Anisse Astier <anisse@astier.eu>
 > Cc: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
