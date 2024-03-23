Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2799DCD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F1D4063D;
	Sat, 23 Mar 2024 12:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRr8DkqPUR6o; Sat, 23 Mar 2024 12:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5449A40640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5449A40640;
	Sat, 23 Mar 2024 12:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24AF21BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 121C84063D
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id louT1aILdx0f for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1F9D404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F9D404D7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1F9D404D7
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:48:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9E421C0003;
 Sat, 23 Mar 2024 12:48:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro0nK-006sVH-0w;
 Sat, 23 Mar 2024 13:48:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240321211456.510333-1-fontaine.fabrice@gmail.com>
Date: Sat, 23 Mar 2024 13:48:18 +0100
In-Reply-To: <20240321211456.510333-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 21 Mar 2024 22:14:56 +0100")
Message-ID: <87sf0hyuzx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: fix btrfs
 handling
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > btrfs doesn't depend on btrfs-progs but on headers >= 4.12 since bump to
 > version 24.0.2 in commit 314f62eda347ba02b4688ac94c6bab55b4a4d6c9 and
 > https://github.com/moby/moby/commit/3208dcabdc8997340b255f5b880fef4e3f54580d
 > resulting in the following build failure:

 > daemon/graphdriver/btrfs/btrfs.go:13:6: error: #error "Headers from kernel >= 4.12 are required to build with Btrfs support."
 >      #error "Headers from kernel >= 4.12 are required to build with Btrfs support."
 >       ^~~~~
 > daemon/graphdriver/btrfs/btrfs.go:14:6: error: #error "HINT: Set 'DOCKER_BUILDTAGS=exclude_graphdriver_btrfs' to build without Btrfs."
 >      #error "HINT: Set 'DOCKER_BUILDTAGS=exclude_graphdriver_btrfs' to build without Btrfs."
 >       ^~~~~
 > daemon/graphdriver/btrfs/btrfs.go:18:10: fatal error: linux/btrfs_tree.h: No such file or directory
 >  #include <linux/btrfs_tree.h>
 >           ^~~~~~~~~~~~~~~~~~~~

 > Fixes: 314f62eda347ba02b4688ac94c6bab55b4a4d6c9
 >  - http://autobuild.buildroot.org/results/7d07eba37149d341dc86f9742bd166de874dcd5e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
