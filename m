Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F7C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6E741737;
	Sun,  4 Feb 2024 15:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6E741737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOR3kZ2bxiMi; Sun,  4 Feb 2024 15:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0393B41734;
	Sun,  4 Feb 2024 15:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0393B41734
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD5631BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AACEA82256
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AACEA82256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIfqh38xMATe for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:07:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 775BB82252
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775BB82252
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44764FF804;
 Sun,  4 Feb 2024 15:07:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWe67-00A11I-12;
 Sun, 04 Feb 2024 16:07:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240121131614.3ADE3863A1@busybox.osuosl.org>
Date: Sun, 04 Feb 2024 16:07:55 +0100
In-Reply-To: <20240121131614.3ADE3863A1@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 21 Jan 2024 14:12:16 +0100")
Message-ID: <87sf28p8s4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/micropython: fix building
 after dropping GIT_DIR=. workaround
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6c9be611a8b7b4caac746920c08035761a9b9d9c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The MICROPYTHON_MAKE_ENV variable contained two things;
 >   - the comon target environment variables CC, CFLAGS et al. defined in
 >     TARGET_MAKE_ENV,
 >   - the GIT_DIR workaround

 > Commit 9024e1866523 (package/micropython: drop GIT_DIR=. workaround)
 > totally dropped the assignment to MICROPYTHON_MAKE_ENV, but did not
 > replace its expansin with TARGET_MAKE_ENV.

 > This yields build error like:

 >     LINK build-standard/micropython
 >     arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib64/../lib64'

 > Fix this by expanding TARGET_MAKE_ENV in lieu of MICROPYTHON_MAKE_ENV.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
