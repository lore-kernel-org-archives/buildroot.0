Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044FCC25B6E
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 18:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85CB96FAE7;
	Thu, 26 Oct 2023 18:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CB96FAE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JozNOYeOfA5Z; Thu, 26 Oct 2023 18:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEE46FAE5;
	Thu, 26 Oct 2023 18:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDEE46FAE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A85C51BF378
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F75E424C2
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F75E424C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hhmmRoHxdRF for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 18:34:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D0A742E7E
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 18:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D0A742E7E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D5A01BF204;
 Thu, 26 Oct 2023 18:34:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qw5BZ-0072U8-LM; Thu, 26 Oct 2023 20:34:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <2b6e31b7385a7d104f7318010bdcdfbc1a2fbf25.1697576472.git.yann.morin.1998@free.fr>
Date: Thu, 26 Oct 2023 20:34:25 +0200
In-Reply-To: <2b6e31b7385a7d104f7318010bdcdfbc1a2fbf25.1697576472.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 17 Oct 2023 23:01:19 +0200")
Message-ID: <87il6tmdvy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/pkg-utils.mk: break
 hardlinks in global {TARGET, HOST}_DIR on per-package build"
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 21d52e52d8de (package/pkg-utils.mk: break hardlinks in global
 > {TARGET, HOST}_DIR on per-package build) stopped hardlink the source and
 > destination when rsyncing per-package directory, on the rationale that
 > modifying files in-place after the rsync would also modify the original
 > file, and that break foo-rebuild and can cause issues with post-build
 > scripts.

 > However, what 21d52e52d8de did not envision, is that copying instead of
 > hard-linking has two nasty side effects:

 >   - the size increase for the build directory increase with the number
 >     of packages and with the depth of th dependency chains for those
 >     packages: a (relatively small) build that was previously totalling
 >     ~13GiB in output/, now totals north of 122GiB, an almost 10-time
 >     increase;

 >   - the build time increases, as it takes mopre time to read+write files
 >     than it takes to create a new link to a file; the same build saw a
 >     increase of build time from 5min 10s to 7min 30s, a 45% increase.

 > These regressions are both serious, so revert the change; we'll come up
 > with a stopgap measure in follow-up commits.

 > This reverts commit 21d52e52d8dee0940d28b3a38551eb183be37813.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Herve Codina <herve.codina@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
