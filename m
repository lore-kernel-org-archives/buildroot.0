Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C131C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A9742954;
	Fri,  7 Jan 2022 18:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOJygczntE9K; Fri,  7 Jan 2022 18:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D0E4296C;
	Fri,  7 Jan 2022 18:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D540B1BF5E9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1F9A400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B234IOTa8QJg for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:07:50 +0000 (UTC)
X-Greylist: delayed 21:07:28 by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70EE040002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:07:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DAE9F24000A;
 Fri,  7 Jan 2022 18:07:47 +0000 (UTC)
Date: Fri, 7 Jan 2022 19:07:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: John Keeping <john@metanate.com>
Message-ID: <20220107190746.0b714e72@windsurf>
In-Reply-To: <20220106151942.1506534-1-john@metanate.com>
References: <20220106151942.1506534-1-john@metanate.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] download/git: fix LFS support
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  6 Jan 2022 15:19:42 +0000
John Keeping <john@metanate.com> wrote:

> The original patch for commit cff428fe31 ("download/git: support Git
> LFS") included a call to "git lfs install" but this was a problem as it
> could modify ~/.gitconfig outside the dl/ tree.  When this was
> updated it was thought that the modification to gitconfig was
> unnecessary because the LFS fetch and checkout steps are performed
> manually.
> 
> Unfortunately, this is not correct and the LFS checkout fails with:
> 
> 	Cannot checkout LFS objects, Git LFS is not installed.
> 
> Add the call to "git lfs install", with the --local option so that only
> the repository's .git/config is modified and not the user's global
> ~/.gitconfig.
> 
> This is also required for submodules as the parent repository's config
> is not inherited.
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  support/download/git | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
