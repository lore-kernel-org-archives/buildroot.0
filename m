Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B7C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 08:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A7D817B5;
	Sun, 12 Feb 2023 08:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A7D817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXsZ9dphvKUx; Sun, 12 Feb 2023 08:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1A1817A9;
	Sun, 12 Feb 2023 08:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1A1817A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 579B31BF4E2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3244D402D4
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3244D402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAwVHLK6nj5i for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 08:45:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3724E40256
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3724E40256
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:45:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 777AA240004;
 Sun, 12 Feb 2023 08:45:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pR7yq-001vf6-8r; Sun, 12 Feb 2023 09:45:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230210223143.1060114-1-yann.morin.1998@free.fr>
 <20230210223143.1060114-2-yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2023 09:45:04 +0100
In-Reply-To: <20230210223143.1060114-2-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 10 Feb 2023 23:31:43 +0100")
Message-ID: <87sffbb7cf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/download: fix the cargo
 post-process in face of failed vendoring
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
Cc: Simon Richter <simon.richter@ptwdosimetry.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In commit 04154a651729 (support/download/cargo-post-process: cargo
 > output for vendor config), we switched away from our hand-crafted
 > cargo.toml mangling, to use cargo itself to update that file.

 > In doing so, we enabled the shell pipefail option, so that we could
 > catch cargo failures, while redirecting its output through tee to the
 > cargo.toml.

 > However, pipefail is overzealous, and will hit us even for pipes we do
 > not want to globally fail, like the one that actually checks whether an
 > archive is already vendored or not:

 >     if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
 >         ...

 > with pipefail, the above may always fail:
 >   - if the tarball is already vendored, grep will exit on the first
 >     match because of -q (it only needs a single match to decide that its
 >     return code will be zero), so the | will get closed, and tar may
 >     get -EPIPE before it had a chance to finish listing the archive, and
 >     thus would terminate in error;
 >   - if the tarball is not vendored, grep will exit in error.

 > It turns out that the tee was only added so that we could see the
 > messages emitted by cargo, and still fill the cargo.tom with the output
 > of cargo.

 > But that's a bit overkill: the cargo messages are going to stderr, and
 > the blurb to add to cargo.toml to stdout, so we just need to redirect
 > stdout.

 > Yes, we do not see what cargo added to cargo.toml, but that is not so
 > interesting.

 > Still, cargo ends its messages with a suggestion for the user to modify
 > cargo.toml, with:

 >     To use vendored sources, add this to your .cargo/config.toml for this project:

 > But since we've already redirected that to cargo.toml, there is nothing
 > for the user to edit, so the above can get confusing. Emit a little
 > blurb that states that everything is under control.

 > And then we can drop pipefail.

 > Note: the go-post-process initially had pipefail too, but it was dropped
 > in bfd1a31d0e59 (support/download/go-post-process: drop -o pipefail) as
 > it was causing spurrious breakage when extracting the archive before
 > vendoring, so it is only reasonable that we also remove it from the
 > cargo-post-process.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Simon Richter <simon.richter@ptwdosimetry.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
