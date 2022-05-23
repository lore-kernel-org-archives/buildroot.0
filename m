Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BCCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 10:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B84D2607F9;
	Mon, 23 May 2022 10:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEGQU8JJEDVv; Mon, 23 May 2022 10:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB3960803;
	Mon, 23 May 2022 10:58:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21B431BF30A
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D8183FAD
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyYLpH73qfVq for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 10:58:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9375983FA5
 for <buildroot@buildroot.org>; Mon, 23 May 2022 10:58:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF3AEFF80A;
 Mon, 23 May 2022 10:57:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nt5l7-00DEzT-PF; Mon, 23 May 2022 12:57:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220411211956.257449-1-fontaine.fabrice@gmail.com>
Date: Mon, 23 May 2022 12:57:57 +0200
In-Reply-To: <20220411211956.257449-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 11 Apr 2022 23:19:56 +0200")
Message-ID: <87a6b8y0qy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: fix static build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure when using an external zlib:
 > /home/autobuild/autobuild/instance-11/output-1/host/bin/i686-buildroot-linux-uclibc-gcc
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og
 > -g0 -static -DHAVE_CONFIG_H -Wall -W -Wno-unused-parameter -static -o
 > rsync flist.o rsync.o generator.o receiver.o cleanup.o sender.o
 > exclude.o util.o util2.o main.o checksum.o match.o syscall.o log.o
 > backup.o delete.o options.o io.o compat.o hlink.o token.o uidlist.o
 > socket.o hashtable.o usage.o fileio.o batch.o clientname.o chmod.o
 > acls.o xattrs.o progress.o pipe.o params.o loadparm.o clientserver.o
 > access.o connection.o authenticate.o lib/wildmatch.o lib/compat.o
 > lib/snprintf.o lib/mdfour.o lib/md5.o lib/permstring.o
 > lib/pool_alloc.o lib/sysacls.o lib/sysxattrs.o -lz -lpopt -liconv
 > /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-11/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(deflate.c.o):
 > in function `read_buf':
 > deflate.c:(.text+0xb93): multiple definition of `read_buf'; io.o:io.c:(.text+0x2bf4): first defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/488453197da880dda8f47b71ff302192bcbb6679

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
