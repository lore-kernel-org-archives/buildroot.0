Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708ADC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 08:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1988481446;
	Mon, 27 Dec 2021 08:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHXlQlG1b1uV; Mon, 27 Dec 2021 08:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6528281444;
	Mon, 27 Dec 2021 08:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793031BF36A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6746D60E31
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msZ3gf1oCoJh for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 08:54:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 512B460E2B
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 08:54:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 33E4660006;
 Mon, 27 Dec 2021 08:54:06 +0000 (UTC)
Date: Mon, 27 Dec 2021 09:54:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20211227095405.5b194139@windsurf>
In-Reply-To: <CAMo8BfLjbpoWdTtoswpihCJJs3672bM5SBaLOA+5hjB_rXK0wA@mail.gmail.com>
References: <CAMo8Bf+N5zOkAXgOGRYe4cJkBitactfuajB1SEoLLuwqZfCQ2g@mail.gmail.com>
 <20211226122351.425d0579@windsurf>
 <CAMo8BfLjbpoWdTtoswpihCJJs3672bM5SBaLOA+5hjB_rXK0wA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] package/coreutils mkfifo -m exit status
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Max,

On Sun, 26 Dec 2021 23:24:53 -0800
Max Filippov <jcmvbkbc@gmail.com> wrote:

> I had to look at the preprocessed source to understand it,

Ah, good idea. Navigating the forest of ifdef-ery in gnulib land is not
trivial :/

> in the presence of gl_cv_func_fstatat_zero_flag=no it looks like this:
> 
> int rpl_fstatat(int fd, char const *file , struct stat *st, int flag)
> {
>  if (flag & ~0x100) {
> (*__errno_location ())  =  22; return -1; };
> 
> i.e. return error with EINVAL code when flags have anything other
> than AT_SYMLINK_NOFOLLOW, which is always the case for the
> following call:
> https://github.com/coreutils/gnulib/blob/9aca7b67333fd0a90bf56104325ce96199644451/lib/lchmod.c#L65

OK. This is weird though, I don't understand why they are doing this to
work-around the problem of "flags = 0" causing a failure.

But OK, fair enough, we know that gl_cv_func_fstatat_zero_flag is now
properly detected, so forcing it to "no" no longer makes sense, so I'll
go ahead and apply your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
