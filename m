Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3D8CE7A8C
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF4DE81E5D;
	Mon, 25 Sep 2023 05:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4DE81E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDljrssFpYcq; Mon, 25 Sep 2023 05:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFF881E5C;
	Mon, 25 Sep 2023 05:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFF881E5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71D81BF3C0
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A151740A73
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A151740A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcxn3xrpYi4N for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:27:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A0A6401DD
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0A6401DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 147A8FF805;
 Mon, 25 Sep 2023 05:27:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qke7f-002ENV-Fj; Mon, 25 Sep 2023 07:27:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230917130122.576967-1-ju.o@free.fr>
Date: Mon, 25 Sep 2023 07:27:07 +0200
In-Reply-To: <20230917130122.576967-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 17 Sep 2023 15:01:22 +0200")
Message-ID: <871qemg6vo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: add mandatory dependency
 to zlib
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Tcl changed its zlib handling in upstream commit [1]. Before this
 > commit, the HAVE_ZLIB macro was defined only if a zlib headers/library
 > was found. After that commit, the HAVE_ZLIB macro is unconditionally
 > defined. The only change is that: if a working zlib library is found
 > in the toolchain sysroot, it is used. Otherwise, the package will use
 > a shipped version in [2]. See also [3] and [4].

 > This tcl commit is included in Buildroot since commit 7fda943b43
 > "tcl: bump to version 8.6.1".

 > This behavior leads to runtime failures, when the package is compiled
 > with toolchains including zlib in their sysroot. This is because at
 > configuration time, the package will detect zlib in the sysroot and
 > link against it, but the library files won't be installed on target.

 > This happen to be the case with Bootlin toolchains such as [5]. This
 > toolchain also happen to be the one used in basic configurations
 > of the runtime test infrastructure (this issue was found while
 > attempting to write a runtime test for tcl).

 > In such cases, running "tclsh" command fails with error message:

 >     tclsh: error while loading shared libraries: libz.so.1: cannot open shared object file: No such file or directory

 > libtcl library also miss its dependency.

 >     ldd /usr/lib/libtcl8.6.so
 > 	    libz.so.1 => not found
 > 	    libm.so.6 => /lib/libm.so.6 (0xb6dad000)
 > 	    libc.so.6 => /lib/libc.so.6 (0xb6c65000)
 > 	    /lib/ld-linux.so.3 (0xb6f6c000)

 > This commit fixes this issue by adding zlib as a mandatory dependency.

 > [1] https://github.com/tcltk/tcl/commit/6f3dea45cee94f12ffa0b2acbbdb3eedbc01807b
 > [2] https://github.com/tcltk/tcl/tree/core-8-6-13/compat/zlib
 > [3] https://github.com/tcltk/tcl/blob/core-8-6-13/unix/configure.in#L172
 > [4] https://github.com/tcltk/tcl/blob/core-8-6-13/unix/Makefile.in#L240
 > [5] https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2023.08-1.tar.bz2

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
