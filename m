Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6486C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5121781455;
	Mon,  6 Feb 2023 21:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5121781455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pJ1GfmvE5Os; Mon,  6 Feb 2023 21:22:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684448141D;
	Mon,  6 Feb 2023 21:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684448141D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 292781BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 023484174F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 023484174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id toyukjM4k3Ps for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:22:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A40E4174E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A40E4174E
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:22:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C34CFC0002;
 Mon,  6 Feb 2023 21:22:24 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:22:23 +0100
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230206222223.7e0425d2@windsurf>
In-Reply-To: <20220731193521.1217825-2-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-2-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675718545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTjUU7QwuUtIEqwegijWdnFFBtH318mVRSu2lrirpTs=;
 b=lzcMid+5O2i50xpB2LRHeDMOfErsR991gMlWteiF5fZlc1UTuojAGLp1q49ieesTBOMrMC
 WTUHl7eWMD9oxu6IkrXPgaxcd3rG2LViEJSZ/8xlVt60+TCsLchqWCUQNMgsiQoQ1FvboZ
 qvdJtnmuA7OG8BCbzBH+RxiZvgXMhmmVSZ0c0E3h447T63I/XEcstVwfHbPV6lgMz9wR83
 ErC7dY8rm+jiXiNqjUkgz3n7JtOcG9q2+5MVn/SWOM1oI2NE73K76yiM44KAiYlqOi6bRC
 tPCQHc6oSKlsZTnbXFqToGTM+xstJA8XgZo71drI2TBQmfirKoJ8dQXWMMknbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lzcMid+5
Subject: Re: [Buildroot] [PATCH v2 01/14] utils/check-package: decouple
 adding rules from fixing all intree files
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Jul 2022 16:35:08 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> When a new check_function is added to check-package, often there are
> files in the tree that would generate warnings.
> 
> An example is the Sob check_function for patch files:
> | $ ./utils/check-package --i Sob $(git ls-files) >/dev/null
> | 369301 lines processed
> | 46 warnings generated
> Currently these warnings are listed when calling check-package directly,
> and also at the output of pkg-stats, but the check_function does not run
> on 'make check-package' (that is used to catch regressions on GitLab CI
> 'check-package' job) until all warnings in the tree are fixed.
> This (theoretically) allows new .patch files be added without SoB,
> without the GitLab CI catching it.
> 
> So add a way to check-package itself ignore current warnings, while
> still catching new files that do not follow that new check_function.
> 
> Add a file named .checkpackageignore to the buildroot topdir.
> It contains the list of check_functions that are expected to fail for
> each given intree file tested by check-package.
> Each entries is in the format:
> <filename> <check_function> [<check_function> ...]
> 
> These are 2 examples of possible entries:
> package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
> utils/test-pkg Shellcheck
> 
> Keeping such a list allows us to have fine-grained control over which
> warning to ignore.
> 
> In order to avoid this list to grow indefinitely, containing entries for
> files that are already fixed, make each entry an 'expected to fail'
> instead of just an 'ignore', and generate a warning if a check_function
> that was expect to fail for a given files does not generate that
> warning.
> Unfortunately one case that do not generate warning is an entry for a
> file that is deleted in a later commit.
> 
> Add also a new option --ignore-list that can be used:
> - by pkg-stats
> - by developers willing to reduce the intree ignore list
> - by developers of br2-external trees that want its own ignore list
> - for debug and tests purposes
> 
> When using for a br2-external each entry in the ignore file is relative
> to the directory that contains the ignore file. Since calling
> check-package -b already uses relative paths to the directory it was
> called from, when a developer wants a ignore file for a br2-external
> he/she must call check-package from the directory that contains it.
> For instance, with these files:
>  /path/to/br2-external/.checkpackageignore
>  /path/to/br2-external/package/mypackage/mypackage.mk
> The file .checkpackageignore must contain entries in the format:
>  package/mypackage/mypackage.mk EmptyLastLine
> and the developer must call check-package this way:
>  $ cd /path/to/br2-external/ && \
>    /otherpath/to/check-package \
>     --ignore-list=.checkpackageignore \
>      -b package/mypackage/mypackage.mk
> 
> This is one more step towards standardizing the use of just
> 'make check-package' before submitting patches to the list.
> 
> Cc: Sen Hastings <sen@phobosdpl.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - rename the patch

We finally applied this, but we did one change: now by default
check-package does not ignore any error. You have to explicitly pass it
an ignore list for it to ignore some errors. This way by default
check-package is noisy, and you need to do some action to silence some
of the warnings.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
