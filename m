Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608CC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3004F41864;
	Wed, 30 Aug 2023 21:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3004F41864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5RjWWqvy4VX; Wed, 30 Aug 2023 21:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D42341826;
	Wed, 30 Aug 2023 21:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D42341826
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342ED1BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DBD982B53
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBD982B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a27T9yRQiOCm for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:59:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CCC582B51
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCC582B51
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10D42C0005;
 Wed, 30 Aug 2023 21:59:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbTDZ-000IVd-6X; Wed, 30 Aug 2023 23:59:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20230728213218.3893857-1-brandon.maier@collins.com>
Date: Wed, 30 Aug 2023 23:59:17 +0200
In-Reply-To: <20230728213218.3893857-1-brandon.maier@collins.com> (Brandon
 Maier via buildroot's message of "Fri, 28 Jul 2023 21:32:18 +0000")
Message-ID: <87y1hsnqdm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] utils/docker-run: fix support for
 git-worktrees
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > The docker-run script attempts to support git-new-workdirs and
 > git-worktrees by resolving the symlink at '$GIT_DIR/config' to get the
 > true $GIT_DIR. However this does not work for git-worktrees as they do
 > not use symlinks, instead they change the $GIT_DIR into a regular file
 > that contains the path to the real $GIT_DIR. To complicate things
 > further, we actually want the $GIT_COMMON_DIR which is the superset of a
 > worktree's $GIT_DIR.

 > git-rev-parse supports the '--git-common-dir' which will resolve the
 > $GIT_COMMON_DIR for us. However it does not work for git-new-workdirs,
 > so we still need to detect and handle them.

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
