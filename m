Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3EBEB64D8
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 16:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F4140396;
	Tue, 13 Jun 2023 16:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F4140396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofKid6NeeFdb; Tue, 13 Jun 2023 16:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82337416E2;
	Tue, 13 Jun 2023 16:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82337416E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 148791BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 16:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEB49409A8
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 16:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB49409A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MDN2eFOqrp2 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 16:46:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CB3B409A5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CB3B409A5
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 16:46:31 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C9EC1BF208;
 Tue, 13 Jun 2023 16:46:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q97A1-004eyQ-Rh; Tue, 13 Jun 2023 18:46:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20230506214618.373562-1-yann.morin.1998@free.fr>
 <87y1knwnah.fsf@48ers.dk> <87sfavqyc8.fsf@tarshish>
Date: Tue, 13 Jun 2023 18:46:25 +0200
In-Reply-To: <87sfavqyc8.fsf@tarshish> (Baruch Siach's message of "Tue, 13 Jun
 2023 16:33:57 +0300")
Message-ID: <875y7rwbry.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/docker-run: make it work in
 workdirs/woktrees
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Tue, Jun 13 2023, Peter Korsgaard wrote:
 >>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> 
 >> > It is quite customary to use a single repository with multiple workdirs,
 >> > one for each active branch, with either the aging 'git new-workdir' or
 >> > the more recent 'git worktree'.
 >> 
 >> > However, in a workdir/worktree, most entries in .git/ are only symlinks
 >> > to the actual files in the main repository.
 >> 
 >> > Currently, utils/docker-run only bind-mounts the current working copy.
 >> > If that is a workdir/worktree, then it is going to be missing the actual
 >> > git data, resulting in errors like:
 >> 
 >> >     $ ./utils/docker-run make check-package
 >> >     fatal: not a git repository (or any parent up to mount point [....]/buildroot)
 >> >     Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
 >> >     No files to check style
 >> >     make: *** [Makefile:1257: check-package] Error 1
 >> 
 >> > So, we also bind-mount the actual git directory. If that is a subdir
 >> > of the current working copy, then it is already mounted and thus the
 >> > bind-mount is superfluous but harmless; for simplicity, we mount it
 >> > unconditionally.
 >> 
 >> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> > Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
 >> 
 >> Committed to 2023.02.x, thanks.

 > Not in 2023.02.x branch as of commit bcddc639d.

Ups, fixed now - Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
