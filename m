Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161D1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9908149D;
	Mon,  7 Mar 2022 19:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yjO8u9pm6wPF; Mon,  7 Mar 2022 19:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 107C881440;
	Mon,  7 Mar 2022 19:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0542F1BF2B9
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D3160EA5
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UafZY0-iqp2Y for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:54:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0F7F60B5E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:54:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E3234C0002;
 Mon,  7 Mar 2022 19:54:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRJRE-000zWj-0Z; Mon, 07 Mar 2022 20:54:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220225171148.701977-1-romain.naour@gmail.com>
Date: Mon, 07 Mar 2022 20:54:36 +0100
In-Reply-To: <20220225171148.701977-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 25 Feb 2022 18:11:48 +0100")
Message-ID: <87zgm15yir.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: year2038 makes time_t
 64-bit for glibc toolchains
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > To use time_t 64-bit for glibc >= 2.34 toolchains we have to set both
 > _FILE_OFFSET_BITS=64 and _TIME_BITS=64 for glibc toolchains. Buildroot
 > already define _FILE_OFFSET_BITS=64 since 2008 [1] before the first
 > release tag 2009.02.

 > _TIME_BITS is not needed for musl libc since it already year2038
 > ready [2].

 > The uclibc-ng libc only support time_t 32-bit (long int) so it will be
 > affected by the year2038 issue [3].

 > Fixes (in French, chapter Buildroot 2022 and GlibC):
 > https://www.blaess.fr/christophe/2038

 > Runtime tested with qemu_arm_vexpress_defconfig and the Bootlin glibc
 > bleeding-edge 2021.11-1 toolchain.

 > Before:
 >  # date
 >  Tue Jan 19 03:14:07 UTC 2038
 >  # date
 >  Thu Jan  1 00:00:00 UTC 1970

 > After:
 >  # date
 >  Tue Jan 19 03:14:07 UTC 2038
 >  # date
 >  Tue Jan 19 03:14:08 UTC 2038
 >  # date
 >  Tue Jan 19 03:14:09 UTC 2038

Ahh, good catch. Maybe something to add a runtime test for?

Committed, thanks.

 > [1] 60b5eee76edfa153ef118d2788c74ac8da1497a0
 > [2] https://git.musl-libc.org/cgit/musl/tree/include/alltypes.h.in?h=v1.2.2#n3
 > [3] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/time.h?h=v1.0.40#n75
 >     https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libc/sysdeps/linux/common/bits/types.h?h=v1.0.40#n106

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Christophe Blaess <christophe.blaess@logilin.fr>
 > ---
 >  package/Makefile.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/Makefile.in b/package/Makefile.in
 > index 508ea7c366..cde050ca82 100644
 > --- a/package/Makefile.in
 > +++ b/package/Makefile.in
 > @@ -167,7 +167,7 @@ else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 >  TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 >  endif
 
 > -TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > +TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
 >  TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 >  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 >  TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 > -- 

 > 2.35.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
