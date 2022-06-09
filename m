Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73550C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2954684262;
	Thu,  9 Jun 2022 20:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUFjd2rsOUjc; Thu,  9 Jun 2022 20:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4988A84246;
	Thu,  9 Jun 2022 20:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 987121BF384
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86AF141C2F
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVTKfLfic_6c for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:26:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 449F441C23
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:26:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58AAA200004;
 Thu,  9 Jun 2022 20:26:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzOjk-002LtM-HL; Thu, 09 Jun 2022 22:26:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220605213113.2366560-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:26:36 +0200
In-Reply-To: <20220605213113.2366560-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Jun 2022 23:31:13 +0200")
Message-ID: <871qvx1t37.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: fix tmon static
 build with uclibc
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass LDFLAGS (which will contain -static) to fix the following tmon
 > static build failure with uclibc:

 > /home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc
 > -O3 -Wall -Wshadow -W -Wformat -Wimplicit-function-declaration
 > -Wimplicit-int -D VERSION=\"1.0\" tmon.o tui.o sysfs.o pid.o -o tmon
 > -lm -lpthread -lpanel -lncurses
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o):
 > in function `_Unwind_Find_FDE':
 > /home/autobuild/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/x86_64-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469:
 > undefined reference to `dl_iterate_phdr'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/58f4cdb734b68afb02595d004e7ca19a15d1abcc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
