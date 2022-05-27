Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57706C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D630961639;
	Fri, 27 May 2022 09:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GITSaeW5rfcQ; Fri, 27 May 2022 09:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD2C61645;
	Fri, 27 May 2022 09:28:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCBC1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B315425CE
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAZPUF6AYO-Z for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:28:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC6F94181D
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:28:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB040C0006;
 Fri, 27 May 2022 09:28:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuWH2-001lQ0-Of; Fri, 27 May 2022 11:28:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220426171600.2552919-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 11:28:48 +0200
In-Reply-To: <20220426171600.2552919-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Apr 2022 19:15:59 +0200")
Message-ID: <87h75bl3xr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libpri: fix static build
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

 > pritest, rosetest and testprilib needs a static library and pridump
 > needs a dynamic library resulting in the following static build failure
 > since the addition of the package in commit
 > a77f356b78f9134227f9702a1eb09c3203c42d88:

 > /home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2
 > -g0 -static -fPIC -MD -MT pridump.o -MF .pridump.o.d -MP -c -o
 > pridump.o pridump.c
 > /home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc
 > -static -shared -Wl,-hlibpri.so.1.4 -o libpri.so.1.4 copy_string.o
 > pri.o q921.o prisched.o q931.o pri_aoc.o pri_cc.o pri_facility.o
 > asn1_primitive.o rose.o rose_address.o rose_etsi_aoc.o rose_etsi_cc.o
 > rose_etsi_diversion.o rose_etsi_ect.o rose_etsi_mwi.o rose_other.o
 > rose_q931.o rose_qsig_aoc.o rose_qsig_cc.o rose_qsig_ct.o
 > rose_qsig_diversion.o rose_qsig_mwi.o rose_qsig_name.o version.o
 > /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-15/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libc.a(__uClibc_main.os):
 > in function `__uClibc_fini':
 > __uClibc_main.c:(.text+0xd0): undefined reference to `__fini_array_start'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1217922af3a72646ae242c2c4dec22ead7883b91

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
