Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464BCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF4F82FB1;
	Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF4F82FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1FrJ9B4DSf0; Tue, 11 Oct 2022 18:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B8682F92;
	Tue, 11 Oct 2022 18:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B8682F92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE1781BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A896E418D0
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A896E418D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oMdwB3b-808 for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:53:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6820418CE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6820418CE
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:53:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 35437240005;
 Tue, 11 Oct 2022 18:53:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oiKNu-00C9UL-AV; Tue, 11 Oct 2022 20:53:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
Date: Tue, 11 Oct 2022 20:53:46 +0200
In-Reply-To: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 25 Sep 2022 19:19:29 +0200")
Message-ID: <877d16p4xx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/nodejs: fixup qemu dependencies
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Commit 1facb09b94bf806b301868539185c0ff9ddffee2 ("package/nodejs:
 > build host-nodejs only if we're installing modules with NPM") forgot
 > to account for the dependency on Qemu. Now that nodejs no longer
 > depends on host-nodejs, but needs host-qemu, we need to make sure that
 > nodejs selects the relevant BR2_PACKAGE_HOST_QEMU options.

 > So this patch:

 >  - Drops the dependency of BR2_PACKAGE_NODEJS_ARCH_SUPPORTS on
 >    BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET, which was incorrect: we
 >    don't care about running Qemu on the target. We care about
 >    host-qemu supporting the emulation of the target architecture,
 >    which is what BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS is for.

 >  - Adds the dependency to the relevant BR2_PACKAGE_HOST_QEMU options
 >    to BR2_PACKAGE_NODEJS, so that host-qemu is built with the
 >    appropriate features needed to build the target nodejs.

 >  - Removes the qemu related dependencies from host-nodejs, which does
 >    not need Qemu at all.

 > Without this change the build of nodejs without npm enabled is broken
 > as the host-qemu that gets built does not have all the features that
 > are needed. There are no autobuild failures at this point, however.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
