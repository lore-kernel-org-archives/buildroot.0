Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A69C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A64607BC;
	Sat, 19 Mar 2022 19:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evgeIZeSypFS; Sat, 19 Mar 2022 19:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5239760774;
	Sat, 19 Mar 2022 19:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 103391BF35F
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2757825CA
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjEWhwDJujv6 for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:01:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30BC4825C6
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:01:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A416200003;
 Sat, 19 Mar 2022 19:01:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVeJz-00EklQ-8s; Sat, 19 Mar 2022 20:01:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Mathieu Mirmont via buildroot <buildroot@buildroot.org>
References: <20220310101826.GA2353@parad0x.org>
Date: Sat, 19 Mar 2022 20:01:03 +0100
In-Reply-To: <20220310101826.GA2353@parad0x.org> (Mathieu Mirmont via
 buildroot's message of "Thu, 10 Mar 2022 11:18:26 +0100")
Message-ID: <87zgllpy1c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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
Cc: Mathieu Mirmont <mat@parad0x.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Mathieu" == Mathieu Mirmont via buildroot <buildroot@buildroot.org> writes:

 > Different shells can have different behaviours when it comes to
 > globbing patterns. The dash shell (/bin/sh) on Debian testing switched
 > to a different fnmatch/glob implementation that results in this new
 > behaviour:

 > Using bash:
 > $ mkdir /tmp/foo
 > $ echo /tmp/foo/.[^.]*
 > /tmp/foo/.[^.]*

 > Using dash:
 > $ mkdir /tmp/foo
 > $ echo /tmp/foo/.[^.]*
 > /tmp/foo/..

 > The current FAKEROOT script uses this shell glob pattern which now
 > fails on recent Debian testing systems:

 > rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/run/..'
 > rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/tmp/..'

 > It seems safer to use `find | xargs rm` here instead of relying on
 > shell globbing patterns.

 > Signed-off-by: Mathieu Mirmont <mat@parad0x.org>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
