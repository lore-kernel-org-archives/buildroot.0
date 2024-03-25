Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BC1C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 286D9813F2;
	Mon, 25 Mar 2024 07:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrdLKP0l4tb6; Mon, 25 Mar 2024 07:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467718193E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467718193E;
	Mon, 25 Mar 2024 07:30:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8C71BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7C940659
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piySGUaWUsKT for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 513FD405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513FD405A1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 513FD405A1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:29:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49D8760008;
 Mon, 25 Mar 2024 07:29:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roemJ-008QZY-2C;
 Mon, 25 Mar 2024 08:29:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240321211245.508853-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 08:29:55 +0100
In-Reply-To: <20240321211245.508853-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 21 Mar 2024 22:12:45 +0100")
Message-ID: <87msqmhiq4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix btrfs handling
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

 > btrfs handling doesn't depend on btrfs-progs but on kernel >= 4.12 since
 > bump to version 1.7.7 in commit 79e01ef9506a6cdc4836912607dc594ae7b1999d
 > and
 > https://github.com/containerd/containerd/commit/024a748c092cbddde0918f2e93a646ce50116e11
 > resulting in the following build failure:

 > In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
 > ./btrfs.h:19:2: error: #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
 >  #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
 >   ^~~~~
 > In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
 > ./btrfs.h:22:10: fatal error: linux/btrfs_tree.h: No such file or directory
 >  #include <linux/btrfs_tree.h>
 >           ^~~~~~~~~~~~~~~~~~~~

 > Fixes: 79e01ef9506a6cdc4836912607dc594ae7b1999d
 >  - http://autobuild.buildroot.org/results/d6afeef47daae1783dcce3e2b6a0a16e3e5d5fbd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
