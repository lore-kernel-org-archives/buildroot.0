Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4290FE810D0
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 11:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E55B761407;
	Wed, 27 Sep 2023 11:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E55B761407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJcSxl8sVqju; Wed, 27 Sep 2023 11:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAE460B7C;
	Wed, 27 Sep 2023 11:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EAE460B7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 296261BF275
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDAEB61413
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAEB61413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cc18axNxadn for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 11:46:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D25306140F
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 11:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D25306140F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52288FF804;
 Wed, 27 Sep 2023 11:46:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qlSzs-004y6t-Mu; Wed, 27 Sep 2023 13:46:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20230923093901.1372593-1-mail@jens-maus.de>
 <20230923105932.1865002-1-mail@jens-maus.de>
Date: Wed, 27 Sep 2023 13:46:28 +0200
In-Reply-To: <20230923105932.1865002-1-mail@jens-maus.de> (Jens Maus via
 buildroot's message of "Sat, 23 Sep 2023 12:59:32 +0200")
Message-ID: <87ttrf3kkr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: fix cross-compile builds
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
Cc: Martin Bark <martin@barkynet.com>, Jens Maus <mail@jens-maus.de>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:

 > When nodejs is build a qemu wrapper script is used to execute
 > some programs built for the target in user-mode emulation. However, in
 > some constellations this causes the build to fail because libraries from
 > the build host are used rather than from the target staging directory.
 > This has been already reported [1] and throughoutly investigate [2].
 > A commonly used fix for this issue is to explicitly use LD_LIBRARY_PATH
 > to make sure that the correct runtime libraries are preferred rather
 > than using libraries from the build host.

 > [1] https://bugs.busybox.net/show_bug.cgi?id=14366
 > [2] https://lore.kernel.org/buildroot/20221031213926.50d3c778@windsurf/

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
