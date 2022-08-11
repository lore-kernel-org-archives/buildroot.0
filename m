Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F3BC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D376F405DD;
	Thu, 11 Aug 2022 11:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D376F405DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4dmFdILTrAV; Thu, 11 Aug 2022 11:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 147E54032A;
	Thu, 11 Aug 2022 11:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147E54032A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E90841BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C41CC81B0A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C41CC81B0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tY4acJdRu22Q for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA69981318
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA69981318
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:51:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B7B11C0007;
 Thu, 11 Aug 2022 11:50:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oM6iF-002rNG-Ls; Thu, 11 Aug 2022 13:50:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220615201622.25057-1-fontaine.fabrice@gmail.com>
 <20220720223818.1854d156@windsurf>
Date: Thu, 11 Aug 2022 13:50:55 +0200
In-Reply-To: <20220720223818.1854d156@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 20 Jul 2022 22:38:18 +0200")
Message-ID: <87lervknhc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: needs NPTL
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
Cc: =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 15 Jun 2022 22:16:22 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> wine unconditionally uses pthread_attr_setstack resulting in the
 >> following build failure without NPTL:
 >> 
 >> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/11.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld:
 >> dlls/ntdll/unix/thread.o: in function `NtCreateThreadEx':
 >> thread.c:(.text+0x61b): undefined reference to `pthread_attr_setstack'
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/a866d65cda97845a8c829acad2c057bab00cde08
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/wine/Config.in | 6 ++++--
 >> 1 file changed, 4 insertions(+), 2 deletions(-)

 > The pthread_attr_setstack() has been around for a while in Wine, so I
 > was wondering why we're only seeing this issue now. Turns out that Wine
 > depends on BR2_i386, and until the relatively recent move to fully
 > random configurations, we never tested an i386 toolchain that has
 > linuxthreads suport instead of NPTL.

 > Therefore: applied, thanks!

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
