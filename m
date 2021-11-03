Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89518C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51796109F
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E51796109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B37A6401CB;
	Wed,  3 Nov 2021 20:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78Ty12YZFuwU; Wed,  3 Nov 2021 20:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEA49401BE;
	Wed,  3 Nov 2021 20:19:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5AE1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04C7E60AE7
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OIv3irI4DB8 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:19:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EC47606B3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:19:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EC6FB240004;
 Wed,  3 Nov 2021 20:19:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1miMjf-0005fe-6m; Wed, 03 Nov 2021 21:19:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
 <20211009191043.1075544-2-thomas.petazzoni@bootlin.com>
Date: Wed, 03 Nov 2021 21:19:51 +0100
In-Reply-To: <20211009191043.1075544-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 9 Oct 2021 21:10:40 +0200")
Message-ID: <87r1bxm1p4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] support/scripts/generate-gitlab-ci-yml:
 allow multiple tests in one pipeline
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The current Gitlab CI mechanism allows to trigger all tests in a CI
 > pipeline by pushing a branch named <something>-runtime-tests, or to
 > trigger a single test in a CI pipeline by pushing a branch name
 > <something>-tests.<name of test>.

 > However, there are cases where it is useful to run a suite of tests,
 > for example to run all tests in tests.init.test_busybox.

 > This commit makes that possible by extending the current semantic of
 > <something>-tests.<name of test> to not expect a complete test name,
 > but instead to accept all tests that starts with the given pattern.

 > This allows to do:

 >   git push gitlab HEAD:foobar-tests.init.test_busybox.TestInitSystemBusyboxRo

 > like it was the case before. But it now also allows to do:

 >   git push gitlab HEAD:foobar-tests.init.test_busybox

 > to run all Busybox tests.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
