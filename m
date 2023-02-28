Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF4C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 21:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC01E8123F;
	Tue, 28 Feb 2023 21:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC01E8123F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWZevpxK1UT5; Tue, 28 Feb 2023 21:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0FFC8144F;
	Tue, 28 Feb 2023 21:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FFC8144F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6F491BF2BF
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A9B4023B
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A9B4023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XEyJ7pnVoGh for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 21:33:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D2E401E4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26D2E401E4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 21:33:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DE81240009;
 Tue, 28 Feb 2023 21:32:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pX7aj-00BQei-Fz; Tue, 28 Feb 2023 22:32:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230212124421.17787-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Feb 2023 22:32:57 +0100
In-Reply-To: <20230212124421.17787-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Feb 2023 13:44:21 +0100")
Message-ID: <87zg8xfpbq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/zabbix: fix BR2_SHARED_STATIC_LIBS
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > zabbix uses custom --enable-{static,shared} options, instead of standard
 > libtool directives resulting in the following build failure with openssl
 > or libcurl:

 > configure:13132:
 > /home/autobuild/autobuild/instance-6/output-1/host/bin/or1k-buildroot-linux-gnu-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Ofast -g0
 > -I/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -rdynamic -static
 > -L/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib
 > conftest.c -lssl -lcrypto -lm >&5
 > /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld:
 > /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o):
 > in function `dlfcn_globallookup':
 > dso_dlfcn.c:(.text+0x2c): warning: Using 'dlopen' in statically linked
 > applications requires at runtime the shared libraries from the glibc
 > version used for linking
 > /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld:
 > /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_addr.o):
 > in function `BIO_lookup_ex':
 > b_addr.c:(.text+0x1128): warning: Using 'getaddrinfo' in statically
 > linked applications requires at runtime the shared libraries from the
 > glibc version used for linking
 > /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld:
 > /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_sock.o):
 > in function `BIO_gethostbyname':
 > b_sock.c:(.text+0x90): warning: Using 'gethostbyname' in statically
 > linked applications requires at runtime the shared libraries from the
 > glibc version used for linking
 > /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld:
 > /tmp/cceWHjDi.o: in function `main':
 > conftest.c:(.text.startup+0x8): undefined reference to `SSL_connect'

 > [...]

 > configure: error: OpenSSL library libssl or libcrypto not found

 > ---

 > configure:15199: checking for main in -lz
 > configure:15219:
 > /home/autobuild/autobuild/instance-13/output-1/host/bin/s390x-buildroot-linux-gnu-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Ofast -g0 -D_FORTIFY_SOURCE=2
 > -I/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -rdynamic -static
 > -L/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib
 > conftest.c -lz -lm >&5
 > /home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld:
 > cannot find -lz
 > collect2: error: ld returned 1 exit status

 > [...]

 > configure: error: static library z required for linking libcurl not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c05230d13fa0538323bb77e8f35533e6dd02453f
 >  - http://autobuild.buildroot.org/results/cc947038510e16417298b381521f226f7c45f986

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Update commit log and comment

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
