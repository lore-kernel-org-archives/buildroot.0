Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E7C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF49844B4;
	Wed, 31 Jan 2024 20:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF49844B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgrceicGBY5n; Wed, 31 Jan 2024 20:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA5984443;
	Wed, 31 Jan 2024 20:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA5984443
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A80EF1BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D7FD60B22
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7FD60B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZslrvJYXV1P0 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:21:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EDAD60B1A
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EDAD60B1A
Received: by mail.gandi.net (Postfix) with ESMTPSA id E367B60002;
 Wed, 31 Jan 2024 20:21:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rVH5d-002d3C-0q;
 Wed, 31 Jan 2024 21:21:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240121100023.316551-1-fontaine.fabrice@gmail.com>
Date: Wed, 31 Jan 2024 21:21:45 +0100
In-Reply-To: <20240121100023.316551-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jan 2024 11:00:23 +0100")
Message-ID: <87r0hxw8x2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
