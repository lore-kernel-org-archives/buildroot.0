Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1935EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 11:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2326076C;
	Sun, 26 Dec 2021 11:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tr9nwqDbGKCx; Sun, 26 Dec 2021 11:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995BF6058B;
	Sun, 26 Dec 2021 11:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD9A81BF357
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 11:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9F25401C2
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 11:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZ90rVJppjXY for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 11:23:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E7CB401B8
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 11:23:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 864B120002;
 Sun, 26 Dec 2021 11:23:52 +0000 (UTC)
Date: Sun, 26 Dec 2021 12:23:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20211226122351.425d0579@windsurf>
In-Reply-To: <CAMo8Bf+N5zOkAXgOGRYe4cJkBitactfuajB1SEoLLuwqZfCQ2g@mail.gmail.com>
References: <CAMo8Bf+N5zOkAXgOGRYe4cJkBitactfuajB1SEoLLuwqZfCQ2g@mail.gmail.com>
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

On Sun, 26 Dec 2021 01:51:47 -0800
Max Filippov <jcmvbkbc@gmail.com> wrote:

> I've noticed that when I run
> mkfifo -m 600 fifo-name
> from package/coreutils on a linux system it always indicates an error
> in the exit code.
> 
> Debugging showed that lchmod function call at
> https://github.com/coreutils/coreutils/blob/v9.0/src/mkfifo.c#L178
> returns error because when the package is configured with
> gl_cv_func_fstatat_zero_flag=no the following fstatat code in lchmod
> https://github.com/coreutils/gnulib/blob/9aca7b67333fd0a90bf56104325ce96199644451/lib/lchmod.c#L65
> always returns error with EINVAL in errno.
> 
> Removing gl_cv_func_fstatat_zero_flag=no from the package/coreutils
> config environment fixes that issue for me, but I couldn't find any
> explanation as to why it was added. I can send a patch if this
> is an acceptable fix, please let me know.

I took my extreme situation caving equipment, and went into the deep
dark cave of the gnulib code.

In the dark dark age of commit 531e3287a33c005edeeba10b0ab0910c6686e049
(https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=531e3287a33c005edeeba10b0ab0910c6686e049)
this gl_cv_func_fstatat_zero_flag was added to handle an obscure bug on
AIX 7.1, where fstatat() would return an error if the flags argument is
zero.

An AC_RUN_IFELSE() check was verifying this, and setting this
gl_cv_func_fstatat_zero_flag variable was necessary to make ./configure
pass. However setting it to "no" was a mistake, because it did imply
that yes fstatat() was broken with a zero flag, which was never the
case on Linux.

A bit later in commit c098d6b8a714de15c81ee72f86f9b7c268554682
(https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=c098d6b8a714de15c81ee72f86f9b7c268554682),
this logic was improved so that setting gl_cv_func_fstatat_zero_flag
was no longer needed when cross-compiling: it would automatically
assume the bug is present.

Further later, in commit 24a579b40979e51868e07b56ea307c1b2c12bcff
(https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=24a579b40979e51868e07b56ea307c1b2c12bcff),
this was improved even more to only assume that fstatat() was broken on
AIX systems when cross-compiling, making the right guess automatically.

So when we force gl_cv_func_fstatat_zero_flag=no in Buildroot today, we
prevent HAVE_WORKING_FSTATAT_ZERO_FLAG from being set.

So, clearly dropping gl_cv_func_fstatat_zero_flag=no from Buildroot's
coreutils.mk is the right thing to do.

However, I have not been able to understand why
gl_cv_func_fstatat_zero_flag=no makes fstatat() always return an error.
The code in lib/fstatat.c is convoluted, and even looking at its Git
history, I've not been able to spot what happened.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
