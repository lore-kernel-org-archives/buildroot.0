Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15137C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2CC960B0D;
	Sat,  4 Mar 2023 13:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2CC960B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FE0F75Q8_lpf; Sat,  4 Mar 2023 13:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B747C60AE1;
	Sat,  4 Mar 2023 13:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B747C60AE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAC0E1BF3E3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A85403E9
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A85403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmNTH-e6GK0z for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:41:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC0864025D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC0864025D
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:41:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9C3D51C0005;
 Sat,  4 Mar 2023 13:41:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYS8P-00GmCp-KT; Sat, 04 Mar 2023 14:41:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1675873210.git.yann.morin.1998@free.fr>
 <6ab1ebdce8bb87f50f68bf1c57ecf988345c2330.1675873210.git.yann.morin.1998@free.fr>
Date: Sat, 04 Mar 2023 14:41:13 +0100
In-Reply-To: <6ab1ebdce8bb87f50f68bf1c57ecf988345c2330.1675873210.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Feb 2023 17:20:16 +0100")
Message-ID: <87v8jgd47a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/dmalloc: don't use SSP
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > dmalloc directly calls into $(LD) to generate a shared library our of
 > the static one.

 > To detet what command it should run, ./configure tries various
 > incantations of ld with various command line options until one does not
 > fail. One of those is (basically):
 >     $(LD) --whole-archive -o contest.o.t contest.a

 > This makes ./configure conclude what the command to link a shared
 > library in the Makefile should be, and thus stores that in a variable:
 >     shlinkargs='$(LD) --whole-archive -o $@'

 > ... which is then AC_SUBST()ed into Makefile.in with a rule like:

 >     $(SHLIB): $(LIBRARY)
 >         @shlinkargs@ $(LIRARY)

 > which once substiuted, gives:

 >     $(SHLIB): $(LIBRARY)
 >         $(LD) --whole-archive -o $@ $(LIRARY)

 > However, when SSP is enabled, the __stack_chk_fail_local and co symbols
 > are provided by additional libraries or object files, and that is the
 > responsibility of gcc to pass those when linking. But as dmalloc
 > directly calls ld, it misses those.

 > Changing dmalloc to use $(CC) is not trivial, however.

 > First, we can't pass LD=$(TARGET_CC), otherwise the whole package
 > explodes [0]: indeed --whole-archive is unknown to gcc, so it must be
 > passed as -Wl,--whole archive instead. So we'd need to add a new test
 > that uses $(CC), like so:
 >     $(CC) -Wl,--whole-archive -o contest.o.t contest.a

 > However, in that case, gcc does pass additional libs/objs (like, for
 > eample, the SSP ones) to the linker. But then those are also inc;luded
 > in the whole-archive section. This causes the linker to add all the
 > symbols form those libs/objs, even those not needed for SSP; on some
 > archs, like PPC, that may require floating point symbols (__muldiv3 et
 > al.) which are in another library, and thus the linked can't find them.

 > The proper solution wouild be to add -Wl,--no-whole-archive, but that
 > would have to be added _after_ the library we want to link, i.e.e we
 > should be able to evntually run:

 >     $(CC) -Wl,--whole-archive -o $@ $(LIRARY) -Wl,--no-whole-archive

 > That would require that we introduce a new variable that is added
 > _afgter_ the $(LIBRARY), e.g. @shlinkargs_post@ or so...

 > This is a bigger endeavour than we want to pursue...

 > Since dmalloc is a debugging utility, it is not supposed to go into
 > production builds, and during debugging, it would not be surprising that
 > it needs to poke around arrays to debug them.

 > So, we go the easier route: disable SSP altogether.

 > [0] with lots of nce colors, but that's not the point, is it?

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
