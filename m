Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A8FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 21:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1117C4032E;
	Wed,  4 May 2022 21:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqXE7tdr1Brc; Wed,  4 May 2022 21:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5104040147;
	Wed,  4 May 2022 21:02:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96A1E1BF3D2
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8012760AFA
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4CyKaM1ygiP1 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 21:02:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47FD060ABB
 for <buildroot@buildroot.org>; Wed,  4 May 2022 21:02:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2BCBF100002;
 Wed,  4 May 2022 21:02:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nmM8G-00E09z-Jk; Wed, 04 May 2022 23:02:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20220504182038.1828037-1-f.fainelli@gmail.com>
Date: Wed, 04 May 2022 23:02:00 +0200
In-Reply-To: <20220504182038.1828037-1-f.fainelli@gmail.com> (Florian
 Fainelli's message of "Wed, 4 May 2022 11:20:38 -0700")
Message-ID: <87wnf1106v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package: Add cpulimit
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
 > Changes in v2:

 > - added DEVELOPERS entry
 > - back ported 2 patches from upstream project pull requests to address
 >   build warnings
 > - added _GNU_SOURCE to the CFLAGS
 > - added hash file
 > - corrected check-package warnings

 > +++ b/package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch
 > @@ -0,0 +1,56 @@
 > +From d1f42082590bed42cbf6ef1bf37e936df1afbf6b Mon Sep 17 00:00:00 2001
 > +From: Tobias Tangemann <tobias@tangemann.org>
 > +Date: Thu, 9 Jul 2015 23:51:07 +0200
 > +Subject: [PATCH] Fix crash (and compiler warnings)
 > +
 > +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 > +---
 > + src/cpulimit.c                | 2 +-
 > + src/process_group.c           | 4 ++++
 > + tests/process_iterator_test.c | 2 +-
 > + 3 files changed, 6 insertions(+), 2 deletions(-)
 > +
 > +diff --git a/src/cpulimit.c b/src/cpulimit.c
 > +index 50eabeacf214..42d7ca280738 100644
 > +--- a/src/cpulimit.c
 > ++++ b/src/cpulimit.c
 > +@@ -43,7 +43,7 @@
 > + #include <sys/types.h>
 > + #include <sys/wait.h>
 > + 
 > +-#ifdef __APPLE__ || __FREEBSD__
 > ++#if defined(__APPLE__) || defined(__FREEBSD__)
 > + #include <libgen.h>
 > + #endif

Why is this patch interesting in the context of Buildroot? Presumably
neither __APPLE__ or __FREEBSD__ will be defined?


 > +################################################################################
 > +#
 > +# cpulimit
 > +#
 > +################################################################################
 > +
 > +CPULIMIT_VERSION = v0.2
 > +CPULIMIT_SOURCE = $(CPULIMIT_VERSION).tar.gz

You can drop CPULIMIT_SOURCE (which will make Buildroot use
cpulimit-$(CPULIMIT_VERSION).tar.gz). Don't forget to update the .hash
file as well?

> +CPULIMIT_SITE = $(call github,opsengine,cpulimit,v$(CPULIMIT_VERSION))

You have a 'v' here AND in CPULIMIT_VERSION, please drop it from
CPULIMIT_VERSION.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
