Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D9BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 23:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42210408AF;
	Mon,  7 Mar 2022 23:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_6RM0kJIUFU; Mon,  7 Mar 2022 23:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37BEE4013A;
	Mon,  7 Mar 2022 23:00:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B28C1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 23:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A4841760
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 23:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5p6cDds7XJS for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 23:00:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A04AB4177B
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 23:00:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2C42910000C;
 Mon,  7 Mar 2022 23:00:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRMKe-001JO9-GC; Tue, 08 Mar 2022 00:00:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220225171148.701977-1-romain.naour@gmail.com>
 <87zgm15yir.fsf@dell.be.48ers.dk>
 <d2685b34-a9d7-3196-ef38-68c59be02d9d@gmail.com>
 <813a014c-8aae-990e-cd76-f961a9be9bf7@mind.be>
Date: Tue, 08 Mar 2022 00:00:00 +0100
In-Reply-To: <813a014c-8aae-990e-cd76-f961a9be9bf7@mind.be> (Arnout
 Vandecappelle's message of "Mon, 7 Mar 2022 23:33:10 +0100")
Message-ID: <871qzd4bdb.fsf@dell.be.48ers.dk>
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> What if something (build system) unset _FILE_OFFSET_BITS ?

 >  Then there's something wrong with that package and it needs to be fixed.

 >> There is something weird with libzlib package.

 >  gzguts.h has this:

 > #ifdef _LARGEFILE64_SOURCE
 > #  ifndef _LARGEFILE_SOURCE
 > #    define _LARGEFILE_SOURCE 1
 > #  endif
 > #  ifdef _FILE_OFFSET_BITS
 > #    undef _FILE_OFFSET_BITS
 > #  endif
 > #endif

 >  Why, I have no idea...

Me neither. It seems to have been added when the file was added to zlib
10 years ago, but given that there is no real public VCS for zlib it is
hard to know why:

https://github.com/madler/zlib/commit/d004b047838a7e803818b4973a2e39e0ff8c1fa2

We're not the only ones running into the issue:

https://unix.stackexchange.com/questions/692377/relationship-between-flags-d-file-offset-bits-and-d-largefile64-source


I agree that it simply looks like a bug in zlib, but maybe the best bet
is indeed to revert for (the overdue) 2022.02 release? I hesitated when
applying it given how late it is, but it indeed fixes a real bug.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
