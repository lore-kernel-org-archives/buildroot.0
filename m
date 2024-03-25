Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B906EC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C707813F2;
	Mon, 25 Mar 2024 07:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBM1aIt73DTC; Mon, 25 Mar 2024 07:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92AA68193E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92AA68193E;
	Mon, 25 Mar 2024 07:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D268F1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2333813F2
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDN6YwjJQRV4 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDF5A8193E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF5A8193E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDF5A8193E
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:30:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77AF440005;
 Mon, 25 Mar 2024 07:30:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roemW-008QZg-1w;
 Mon, 25 Mar 2024 08:30:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240321211456.510333-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 08:30:08 +0100
In-Reply-To: <20240321211456.510333-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 21 Mar 2024 22:14:56 +0100")
Message-ID: <87il1ahipr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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

Committed to 2024.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
