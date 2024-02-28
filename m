Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB47C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0067840964;
	Wed, 28 Feb 2024 21:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOD8PlKPPP14; Wed, 28 Feb 2024 21:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD01B4086E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD01B4086E;
	Wed, 28 Feb 2024 21:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE9AA1BF27A
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC02640232
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4O9G2jWt2MhR for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24A2A40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A2A40175
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A2A40175
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:00:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0596360004;
 Wed, 28 Feb 2024 21:00:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfR2d-002zbh-16;
 Wed, 28 Feb 2024 22:00:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240121100023.316551-1-fontaine.fabrice@gmail.com>
Date: Wed, 28 Feb 2024 22:00:39 +0100
In-Reply-To: <20240121100023.316551-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jan 2024 11:00:23 +0100")
Message-ID: <87v868mhhk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/lynx: fix openssl static build
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
Cc: Mario Lang <mlang@blind.guru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use LDFLAGS instead of LIBS to fix the following openssl static build
 > failure raised because lynx filters out duplicates (i.e. -lz) in
 > CF_ADD_LIBS:

 > configure:12958: checking for inet_ntoa
 > configure:12995:
 > /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX
 > -static conftest.c
 > -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64
 > -lssl
 > -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64
 > -lz -pthread -lcrypto -lz -pthread >&5
 > configure:12998: $? = 0
 > configure:13001: test -s conftest
 > configure:13004: $? = 0
 > configure:13014: result: yes
 > configure:13095: checking for gethostbyname
 > configure:13151: result: yes
 > configure:13232: checking for strcasecmp
 > configure:13288: result: yes
 > configure:13401: checking for inet_aton function
 > configure:13443:
 > /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX
 > -static conftest.c
 > -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64
 > -lssl -lz -pthread -lcrypto >&5

 > [...]

 > /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc
 > -DHAVE_CONFIG_H -DLOCALEDIR=\"/usr/share/locale\" -I. -I.. -Ichrtrans
 > -I./chrtrans -I.. -I../src -I.././WWW/Library/Implementation
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -D_GNU_SOURCE -DLINUX
 > -I/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include
 > -I/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/openssl
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -Ofast -g0 -static
 > -Wl,-rpath,/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64
 > -Wl,-rpath,/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib
 > -L/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib
 > -static -o lynx LYebcdic.o LYClean.o LYShowInfo.o LYEdit.o L
 >  YStrings.o LYMail.o HTAlert.o GridText.o LYGetFile.o LYMain.o
 > LYMainLoop.o LYCurses.o LYBookmark.o LYmktime.o LYUtils.o LYOptions.o
 > LYReadCFG.o LYSearch.o LYHistory.o LYForms.o LYPrint.o LYrcFile.o
 > LYDownload.o LYNews.o LYKeymap.o HTML.o HTFWriter.o HTInit.o
 > DefaultStyle.o LYUpload.o LYLeaks.o LYexit.o LYJump.o LYList.o LYCgi.o
 > LYTraversal.o LYEditmap.o LYCharSets.o LYCharUtils.o LYMap.o
 > LYCookie.o LYStyle.o LYHash.o LYPrettySrc.o TRSTable.o parsdate.o
 > UCdomap.o UCAux.o UCAuto.o LYSession.o LYLocal.o
 > .././WWW/Library/Implementation/libwww.a -lz -static -lncurses -lssl
 > -lcrypto
 > -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64
 > -pthread
 > /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-c_zlib.o):
 > in function `zlib_oneshot_expand_block':
 > c_zlib.c:(.text+0xb8b): undefined reference to `uncompress'

 > Patching aclocal.m4 is not possible as autoreconf fails due to missing
 > AC_DIVERT_HELP macro.

 > This build failure is only raised by autobuilders since 2024 for an
 > unknown reason.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6d4119b54fc6b6111a03f81e131e83bae0d844d1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
