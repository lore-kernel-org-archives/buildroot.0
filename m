Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32ACC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 19:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3467E60B9F;
	Thu,  5 May 2022 19:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERPKPmCwvfeN; Thu,  5 May 2022 19:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C30460B8A;
	Thu,  5 May 2022 19:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6A31BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68B624011F
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 19:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNnhinXsk5sC for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 19:41:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B2BD404A0
 for <buildroot@buildroot.org>; Thu,  5 May 2022 19:41:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CBF86200003;
 Thu,  5 May 2022 19:41:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nmhMH-00G83i-Hu; Thu, 05 May 2022 21:41:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20220505172220.1865729-1-f.fainelli@gmail.com>
Date: Thu, 05 May 2022 21:41:53 +0200
In-Reply-To: <20220505172220.1865729-1-f.fainelli@gmail.com> (Florian
 Fainelli's message of "Thu, 5 May 2022 10:22:20 -0700")
Message-ID: <87bkwb22da.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package: Add cpulimit
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com, mmayer@broadcom.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

 > Cpulimit is a tool which limits the CPU usage of a process (expressed in
 > percentage, not in CPU time). It is useful to control batch jobs, when
 > you don't want them to eat too many CPU cycles.

 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 > ---
 > Changes in v3:

 > - dropped CPULIMIT_SOURCE
 > - dropped 'v' from CPULIMIT_VERSION
 > - updated hash file with new tarball name

 > Changes in v2:

 > - added DEVELOPERS entry
 > - back ported 2 patches from upstream project pull requests to address
 >   build warnings
 > - added _GNU_SOURCE to the CFLAGS
 > - added hash file
 > - corrected check-package warnings

..

 > +++ b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
 > @@ -0,0 +1,56 @@
 > +From d1f42082590bed42cbf6ef1bf37e936df1afbf6b Mon Sep 17 00:00:00 2001
 > +From: Tobias Tangemann <tobias@tangemann.org>
 > +Date: Thu, 9 Jul 2015 23:51:07 +0200
 > +Subject: [PATCH] Fix crash (and compiler warnings)
 > +
 > +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

I've added links to the upstream pull requests for both patches.

 > +++ b/package/cpulimit/Config.in
 > @@ -0,0 +1,7 @@
 > +config BR2_PACKAGE_CPULIMIT
 > +	bool "cpulimit"

It uses fork(), so I've added a BR2_USE_MMU dependency.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
