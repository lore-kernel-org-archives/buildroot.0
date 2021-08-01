Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A670FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73388610A0
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73388610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D1794032F;
	Sun,  1 Aug 2021 09:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9GCgPz_oq72I; Sun,  1 Aug 2021 09:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A530540326;
	Sun,  1 Aug 2021 09:49:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5601BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69FD7415E0
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsnzC5QIT0ES for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:48:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62502415D8
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:48:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EAEB3200002;
 Sun,  1 Aug 2021 09:48:10 +0000 (UTC)
Date: Sun, 1 Aug 2021 11:48:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801114809.76993e05@windsurf>
In-Reply-To: <20210801083641.2761809-1-fontaine.fabrice@gmail.com>
References: <20210801083641.2761809-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: fix host build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun,  1 Aug 2021 10:36:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 9dfbbbb4105c47602da048c9bb9499fb8862e768 wrongly removed
> dependency on host-python3 or host-python resulting in the following
> build failure:
> 
> cp -rp /tmp/instance-2/output-1/build/host-gtest-1.11.0/googlemock/scripts/generator/cpp /tmp/instance-2/output-1/per-package/host-gtest/host/lib/python2.7/site-packages
> cp: cannot create directory '/tmp/instance-2/output-1/per-package/host-gtest/host/lib/python2.7/site-packages': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a1d2e100a65d7c1c39c20bdd5bf687a804c94305
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gtest/gtest.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
