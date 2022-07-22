Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83FBC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE6660F0E;
	Fri, 22 Jul 2022 08:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE6660F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtWmF2f7dKkI; Fri, 22 Jul 2022 08:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88A0160F0C;
	Fri, 22 Jul 2022 08:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88A0160F0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25FFB1BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0080D40BEE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0080D40BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGDhhcuNJaNv for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A136D4028D
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A136D4028D
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:32:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61662200009;
 Fri, 22 Jul 2022 08:32:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oEo5c-0034pH-4w; Fri, 22 Jul 2022 10:32:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
Date: Fri, 22 Jul 2022 10:32:52 +0200
In-Reply-To: <20220506104658.3174243-1-foss+buildroot@0leil.net> (Quentin
 Schulz's message of "Fri, 6 May 2022 12:46:58 +0200")
Message-ID: <875yjpv96z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > Open-Source IPA shlibs need to be signed in order to be runnable within
 > the same process, otherwise they are deemed Closed-Source and run in
 > another process and communicate over IPC.

 > The shlib installed on the target should be the same as the one signed
 > by libcamera during package creation otherwise the signature won't match
 > the shlib.

 > Buildroot sanitizes RPATH in a post build process. meson gets rid of
 > rpath while installing so we don't need to do it manually.

 > Buildroot may strip symbols, so we need to do the same before signing.
 > Since meson install target is also signing the IPA shlibs, let's strip
 > them before this happens.

 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > ---

 > v2:
 >  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
 >  LIBCAMERA_INSTALL_TARGET_CMDS,
 >  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
 >  shouldn't,
 >  - added --no-run-if-empty to xargs, in case no IPA is selected,
 >  - removed stderr redirect and pipe to true to not hide useful
 >  information or fail the build if strip does not work,

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
