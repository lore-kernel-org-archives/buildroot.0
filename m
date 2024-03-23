Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64253C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC42040548;
	Sat, 23 Mar 2024 12:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAfp4TkGV6Y2; Sat, 23 Mar 2024 12:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B8E40607
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B8E40607;
	Sat, 23 Mar 2024 12:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01C411BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E041340607
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nLW4aZ6YxeK for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 215E540548
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215E540548
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 215E540548
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:10:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B0741C0003;
 Sat, 23 Mar 2024 12:10:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro0Cr-006q4P-29;
 Sat, 23 Mar 2024 13:10:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240318220420.356343-1-yann.morin.1998@free.fr>
Date: Sat, 23 Mar 2024 13:10:37 +0100
In-Reply-To: <20240318220420.356343-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 18 Mar 2024 23:04:20 +0100")
Message-ID: <87edc11742.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts: use FKIE git tree
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we grab the per-year CVE feeds, in two passes: first, we grab
 > the meta files, and check whether something has changed since last we
 > downloaded it; second, we download the feed proper, unless the meta file
 > has not changed, in which case we use the locally cached feed.

 > However, it has appeared that the FKIE releases no longer provide the
 > meta files, which means that (once again), our daily reports are broken.

 > The obvious fix would be to drop the use of the meta file, and always
 > and unconditionally download the feeds. That's relatively trivial to do,
 > but he feds are relatively big (even as xz-xompressed).

 > However, the CVE database from FKIE is available as a git tree. Git is
 > pretty good as only sending delta when updating a local copy. The git
 > tree, however, contains each CVE as individual files, so it is
 > relatively easier to scan and parse.

 > Switch to using a local git clone.

 > Slightly surprisingly (but not so much either), parsing the CVE files is
 > much faster when using the git working copy, than it is when parsing the
 > per-year feeds: indeed, the per-year feeds are xz-compressed, and even
 > if python is slow-ish to scan a directory and opening files therein, it
 > is still much faster than to decompress xz files. The timing delta [0]
 > is ~100s before and ~10s now, about a ten time improvement, over the
 > whole package set.

 > The drawback, however, is that the git tree is much bigger on-disk, from
 > ~55MiB for the per-year compressed feeds, to 2.1GiB for the git tree
 > (~366MiB) and a working copy (~1.8GiB)... Given very few people are
 > going to use that, that's considered acceptable...

 > Eventually, with a bit of hacking [1], the two pkg-stats, before and
 > after this change, yield the same data (except for the date and commit
 > hash).

 > [0] hacking support/scripts/pkg-stats to display the time before/after
 > the CVE scan, and hacking support/scripts/cve.py to do no download so
 > that only the CVE scan happens (and also because the meta files are no
 > longer available).

 > [1] sorting the CVE lists in json, sorting the json keys, and using the
 > commit from the FKIE git tree that was used for the current per-year
 > feeds.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
