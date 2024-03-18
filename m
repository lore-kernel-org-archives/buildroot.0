Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D249C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE8E140608;
	Mon, 18 Mar 2024 13:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOfvnktprRlA; Mon, 18 Mar 2024 13:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6A72408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6A72408A5;
	Mon, 18 Mar 2024 13:30:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A02A61BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF6B80AE0
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NXyzGqFiELA for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:30:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61B9180ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B9180ACD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61B9180ACD
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:30:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77E7EFF80F;
 Mon, 18 Mar 2024 13:30:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmD3y-002eYi-0I;
 Mon, 18 Mar 2024 14:30:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240225225728.2949216-1-romain.naour@smile.fr>
Date: Mon, 18 Mar 2024 14:30:02 +0100
In-Reply-To: <20240225225728.2949216-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 25 Feb 2024 23:57:28 +0100")
Message-ID: <87h6h3fz1h.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/dracut: fix dracut_wrapper
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > As reported by Thierry Bultel [1], dracut doesn't work since the
 > version bump to version 059.

 > Further investigation by Andreas Naumann [2] reported that the issue
 > come from this commit d010fa0 refactor(dracut-install): fork() instead
 > of popen(), sanitise line reading [3].

 > The issue come from our dracut_wrapper and how DRACUT_LDD is defined.
 > Indeed dracut expect DRACUT_LDD=ldd or a single binary (without
 > arguments) but we are using "prelink-rtld --root='${sysroot}'".

 > With the change introduced by [3], our DRACUT_LDD is used
 > directly by execlp() leading to an error:

 >   execlp(ldd, ldd, fullsrcpath, (char *)NULL);

 > Use mktemp to generate a temporary dracut-ldd script using
 > prelink-rtld --root='${sysroot}' ${1}

 > execute dracut.real in a subshell to cleanup the temporary file
 > at the end of the dracut wrapper script.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243423 [tests.fs.test_cpio.TestCpioDracutGlibcMergedUsr]
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243434 [tests.fs.test_cpio.TestCpioDracutMuslMergedUsr]
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243567 [tests.fs.test_cpio.TestCpioDracutUclibcMergedUsr]
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243559 [tests.fs.test_cpio.TestCpioDracutGlibc]
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243504 [tests.fs.test_cpio.TestCpioDracutUclibc]
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243498 [tests.fs.test_cpio.TestCpioDracutMusl]

 > [1] http://lists.busybox.net/pipermail/buildroot/2024-February/684145.html
 > [2] http://lists.busybox.net/pipermail/buildroot/2024-February/684503.html
 > [3] https://github.com/dracutdevs/dracut/commit/d010fa0d7f8ef42ad31729d027d2e4be6dd6e588

 > Fixes: 145f01ded5 ("package/dracut: bump to version 059")
 > Reported-by: Thierry Bultel <thierry.bultel@linatsea.fr>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
