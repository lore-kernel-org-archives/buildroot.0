Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3760EE020C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBB18175B;
	Wed, 13 Sep 2023 19:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBB18175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0P19O9xIQQt; Wed, 13 Sep 2023 19:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929B8814AB;
	Wed, 13 Sep 2023 19:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929B8814AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F9E1BF283
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE257814AB
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE257814AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32tClvKzEWk2 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:28:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE9E7814A9
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9E7814A9
Received: by mail.gandi.net (Postfix) with ESMTPSA id B699FFF803;
 Wed, 13 Sep 2023 19:28:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgVXh-007SEJ-WA; Wed, 13 Sep 2023 21:28:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230826210011.39269-1-romain.naour@gmail.com>
Date: Wed, 13 Sep 2023 21:28:53 +0200
In-Reply-To: <20230826210011.39269-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 26 Aug 2023 23:00:11 +0200")
Message-ID: <875y4d27pm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [RFC] support/misc/gitlab-ci.yml.in: retry a job
 only if it failed due to a runner issue
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Each time a new pipeline is trigged, some jobs may fail due to temporary
 > issue with a Gitlab runner (network, power supply, docker or maintainance).

 > Most of the problems are "runner system failure" [1] and requires to retart
 > each failed jobs manually by maintainers to complete the pipeline with only
 > real failure if any.

 > The "retry" keyword allows to configure how many time a job is retried if
 > it fails. "retry:when" allows to retry a failed job only on specific
 > failure types like "runner_system_failure".

 > While at it, retry a job if it failed due to a timeout failure (this
 > timeout means that the job was pending for more than 24h) [2].

 > Such timeout failure occurs on pipeline testing each Buildroot's defconfig
 > since there is not enough gitlab runner avaible to build all of them
 > within 24h.

 > Retry only jobs that are more likely to wait for a runner
 > (generate-gitlab-ci-yml, runtime_test_base, defconfig_base and test_pkg).

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949397 (runner system failure)
 > [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949530 (timeout failure or the job got stuck)

 > https://docs.gitlab.com/ee/ci/yaml/#retrywhen

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
