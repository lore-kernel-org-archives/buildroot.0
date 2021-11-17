Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D1EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:20:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562B6619BB
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 562B6619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116C44016B;
	Wed, 17 Nov 2021 21:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTR3dTNN_hos; Wed, 17 Nov 2021 21:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EA9A400EB;
	Wed, 17 Nov 2021 21:19:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298F21BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17DDB400EB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhzWUciIoh-A for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:19:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A984400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:19:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C3C94FF809;
 Wed, 17 Nov 2021 21:19:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnSLP-0004xd-Ub; Wed, 17 Nov 2021 22:19:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211109220328.388872-1-romain.naour@gmail.com>
Date: Wed, 17 Nov 2021 22:19:51 +0100
In-Reply-To: <20211109220328.388872-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 9 Nov 2021 23:03:28 +0100")
Message-ID: <87fsruv5s8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Currently when a tag is added to the Buildroot git tree, the gitlab-ci
 > create a pipeline with several hundred of jobs (~750) to build all
 > defconfigs and execute the Buildroot testsuite.

 > However, there is only a limited number of gitlab-ci runner (9 runners)
 > and some jobs reach the timeout limit (24h) while waiting for a runner
 > [1]. Indeed, the Buildroot project doesn't use the Gitlab's shared
 > runners.

 > In addition to the pipeline created when a new tag is added to the
 > git repository, two pipelines are created each weeks to execute the
 > Buildroot testsuite (on monday [2]) and build all defconfigs (on
 > Thursday [3]).

 > At some point there are too many jobs waiting in gitlab due board
 > defconfigs builds. Indded a board defconfig requires a lot of time
 > (~30min) compared to other jobs in order to build a toolchain and a
 > kernel linux along with a basic rootfs. There is currently 262
 > defconfigs.

 > This is even worse when several pipelines are trigged at the same
 > time (new git tag and scheduled pipeline trigger).

 > In order to reduce the number of long jobs, don't build board
 > defconfigs with pipelines trigged on tag, keeping only the runtime
 > tests and the Qemu's defconfigs.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966541
 > [2] https://gitlab.com/buildroot.org/buildroot/-/pipelines/404035190
 > [3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/401685550

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > ---
 > v2: improve commit log

 > I would like to keep Qemu runtime testing when a tag is added because
 > it test the toolchain provided by default by Buildroot on several
 > architectures.

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
