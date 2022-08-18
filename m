Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC1C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 05:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF7D783E3C;
	Thu, 18 Aug 2022 05:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF7D783E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRDsMuKOZQBZ; Thu, 18 Aug 2022 05:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA65483E26;
	Thu, 18 Aug 2022 05:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA65483E26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 710681BF869
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 05:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CCAB40377
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 05:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CCAB40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAVPD21piXs6 for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 05:53:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E479F400E4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E479F400E4
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 05:53:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E66E5240006;
 Thu, 18 Aug 2022 05:53:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOYT1-00CeiQ-Pn; Thu, 18 Aug 2022 07:53:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220725165741.7C41E85D89@busybox.osuosl.org>
Date: Thu, 18 Aug 2022 07:53:19 +0200
In-Reply-To: <20220725165741.7C41E85D89@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 25 Jul 2022 19:08:52 +0200")
Message-ID: <87v8qq85dc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/scripts/pkg-stats: tweak
 infras field when running with -c
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=28973f28acfcee81f2912e7a65dd3704b1d68f6f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When we use the statistics output to generate a CVE/CPE customer
 > report showing whether a product is affected by CVEs, we are primarily
 > interested in whether they are relevant to the target
 > system. Currently we cannot see if the package is configured for the
 > build (infra==host) and/or the target system (infra==target).

 > Therefore this commit extends the pkg-stats script to leverage the
 > information available in "make show-info" output to tweak the list of
 > package infrastructures for each package. Thanks to this commit, the
 > script now has a more consistent behavior:

 >  * When pkg-stats is run without -c, i.e without a defined Buildroot
 >    configuration, it continues to operate as it did, i.e it lists all
 >    package infrastructures supported by the package (such as autotools
 >    host+target, or kconfig target, etc.)

 >  * When pkg-stats is run with -c, i.e with a defined Buildroot
 >    configuration which defines the list of packages that should be
 >    considered, then for each package it now lists only the package
 >    infrastructures used by the package in that current
 >    configuration. For example if you have a package with a host and
 >    target variant, but only the host variant is used in your
 >    configuration, now the pkg-stats output will only say that the host
 >    variant of this package is used;

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 > [Thomas: pretty much rework the entire implementation and how the
 > result is presented.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
