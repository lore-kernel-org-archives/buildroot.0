Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6841BC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BC926044F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BC926044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2A0060752;
	Sun, 25 Jul 2021 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvbM9DLdsuFf; Sun, 25 Jul 2021 21:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 497C260731;
	Sun, 25 Jul 2021 21:21:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D11631BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D4E82C9C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDSlztwG70S9 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:21:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D30ED82C7C
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:21:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DBA00200003;
 Sun, 25 Jul 2021 21:21:35 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:21:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Message-ID: <20210725232134.1be5ef08@windsurf>
In-Reply-To: <20210608151840.20917-2-patrickdepinguin@gmail.com>
References: <20210608151840.20917-1-patrickdepinguin@gmail.com>
 <20210608151840.20917-2-patrickdepinguin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv2 1/3] package/gdb: fix gdb 9.2 segfault
 with Python 3.9 support
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue,  8 Jun 2021 17:18:37 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> When enabling Python 3 support in gdb 9.2, gdb segfaults at startup.
> 
> The issue is tracked back to following upstream gdb commit, present since
> gdb 10.1.
> 
>     commit c47bae859a5af0d95224d90000df0e529f7c5aa0
>     Author: Kevin Buettner <kevinb@redhat.com>
>     Date:   Wed May 27 20:05:40 2020 -0700
> 
>         Fix Python3.9 related runtime problems
>         [...]
> 
> Backport this commit to 9.2 in Buildroot.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  ...x-Python3.9-related-runtime-problems.patch | 227 ++++++++++++++++++
>  1 file changed, 227 insertions(+)
>  create mode 100644 package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch

Fixing 9.2 was good, but not sufficient: the 8.3.1 gdb release and the
C-SKY special version as well, so I've backported the fix to those
versions as well. Applied with that change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
