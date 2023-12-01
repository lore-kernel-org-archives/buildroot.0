Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89183C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31F2C40448;
	Fri,  1 Dec 2023 20:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F2C40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7roFXKRZy3V8; Fri,  1 Dec 2023 20:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1989740492;
	Fri,  1 Dec 2023 20:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1989740492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1365E1BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD9CE40492
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9CE40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGEFUP1KzKLy for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:29:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9022640448
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9022640448
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92EC020003;
 Fri,  1 Dec 2023 20:29:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9A8m-004UC4-2q;
 Fri, 01 Dec 2023 21:29:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
Date: Fri, 01 Dec 2023 21:29:36 +0100
In-Reply-To: <20231130191305.5345-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 30 Nov 2023 20:13:05 +0100")
Message-ID: <87fs0l4qfj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
 > following build failure with BR2_TIME_BITS_64 raised since commit
 > 3c427c64726560ea1743282a3fdb78f5b28692eb:

 > In file included from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
 >                  from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
 >                  from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/stdint.h:26,
 >                  from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/include/stdint.h:9,
 >                  from ../include/selinux/avc.h:9,
 >                  from avc.c:10:
 > /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >    26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >       |     ^~~~~

 > This LFS workaround for glibc < 2.23 was added in 2016 by commit
 > ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
 > anymore as glibc 2.23 was released in February 2016:
 > https://sourceware.org/glibc/wiki/Release/2.23

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d85c81f87adf3a5945fa369bcec233e6def2ed12

Hmm, probably. We do have similar code elsewhere as well though,
presumably that needs to be removed as well?

git grep 'filter-out.*D_FILE_OFFSET_BITS=' package/**/*mk
package/elfutils/elfutils.mk:ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
package/elfutils/elfutils.mk:ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
package/libselinux/libselinux.mk:       CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
package/libselinux/libselinux.mk:       CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
package/ltp-testsuite/ltp-testsuite.mk:LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
package/ltp-testsuite/ltp-testsuite.mk:LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
package/musl/musl.mk:           CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS)) $(MUSL_EXTRA_CFLAGS)" \
package/musl/musl.mk:           CPPFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))" \

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
