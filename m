Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EB9C83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 08:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A81060FC8;
	Sun, 27 Aug 2023 08:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A81060FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KghSCGI6e0Cy; Sun, 27 Aug 2023 08:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7B5460F99;
	Sun, 27 Aug 2023 08:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7B5460F99
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8A11BF316
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 08:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA5A400FE
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 08:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA5A400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_CWKQl_1IuX for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 08:11:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2235400C5
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 08:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2235400C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C0C40002;
 Sun, 27 Aug 2023 08:11:29 +0000 (UTC)
Date: Sun, 27 Aug 2023 10:11:28 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230827101128.61446f39@windsurf>
In-Reply-To: <20230826210011.39269-1-romain.naour@gmail.com>
References: <20230826210011.39269-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693123889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ds+G7B1yuhsQUwYxDrNPbHeu4AuLr7lc/Re18ByFBsA=;
 b=dN6ZH9BYmP2Uj1DmkMPpjNH00lI3jiC2kmqt3CgeIBIOuS1IENwT9lQrbPVOHe2Oo5c28W
 FKoz42ZKfbM9YExCWzTyb97BV9l0ekmHJA00qwU0OzR0aALTCx+lV675FW5deE2h9eqixq
 qkG2/h+nJ/fyhLcfczRrWjGDvXmDqUIH/lQ0k86lWUAj36QhE8oxknOT8JBzKNla/q6/r1
 tnlht2iruxc3tQXAx9R4kIGTMpIxA+jNAC9n7l8nYqFoQdr0Qk3QtG82oPHVPdGTflHR1q
 rTAdRN+Sj1jXwAxg/B9sN6RoC69L7MXS/fQfdwnXZ5vfVwVuSCL4JuzdViw9jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dN6ZH9BY
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Aug 2023 23:00:11 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Each time a new pipeline is trigged, some jobs may fail due to temporary
> issue with a Gitlab runner (network, power supply, docker or maintainance).
> 
> Most of the problems are "runner system failure" [1] and requires to retart
> each failed jobs manually by maintainers to complete the pipeline with only
> real failure if any.
> 
> The "retry" keyword allows to configure how many time a job is retried if
> it fails. "retry:when" allows to retry a failed job only on specific
> failure types like "runner_system_failure".
> 
> While at it, retry a job if it failed due to a timeout failure (this
> timeout means that the job was pending for more than 24h) [2].
> 
> Such timeout failure occurs on pipeline testing each Buildroot's defconfig
> since there is not enough gitlab runner avaible to build all of them
> within 24h.
> 
> Retry only jobs that are more likely to wait for a runner
> (generate-gitlab-ci-yml, runtime_test_base, defconfig_base and test_pkg).
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949397 (runner system failure)
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949530 (timeout failure or the job got stuck)
> 
> https://docs.gitlab.com/ee/ci/yaml/#retrywhen
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  .gitlab-ci.yml                |  5 +++++
>  support/misc/gitlab-ci.yml.in | 15 +++++++++++++++
>  2 files changed, 20 insertions(+)

Excellent! I hope this will improve the reliability of Gitlab results.
I've applied to master, after fixing some minor typos in the commit
log. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
