Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53557C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 11:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0709D40275;
	Tue,  5 Mar 2024 11:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOOG7XcvYK0x; Tue,  5 Mar 2024 11:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E888941597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E888941597;
	Tue,  5 Mar 2024 11:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26F5F1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13DC481D73
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 11:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAW9yWsO2tpR for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 11:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7EDA813F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7EDA813F5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7EDA813F5
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 11:30:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50B711C0006;
 Tue,  5 Mar 2024 11:30:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhT00-000C5m-1L;
 Tue, 05 Mar 2024 12:30:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240305091302.7403-1-fontaine.fabrice@gmail.com>
Date: Tue, 05 Mar 2024 12:30:20 +0100
In-Reply-To: <20240305091302.7403-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2024 10:13:02 +0100")
Message-ID: <87ttlkzzjn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
 > following build failure with BR2_TIME_BITS_64 raised since commit
 > 3c427c64726560ea1743282a3fdb78f5b28692eb:

 > configure:5239: /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -Os -g2 -I/home/autobuild/autobuild/instance-1/output-1/host/bin/../mips-buildroot-linux-gnu/sysroot/usr/include/tirpc  -fno-builtin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 conftest.c >&5
 > In file included from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
 >                  from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
 >                  from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/limits.h:26,
 >                  from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/limits.h:205,
 >                  from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/syslimits.h:7,
 >                  from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/limits.h:34,
 >                  from conftest.c:12:
 > /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >    26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >       |     ^~~~~

 > [...]

 > checking for /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc options needed to detect all undeclared functions... cannot detect
 > configure: error: in `/home/autobuild/autobuild/instance-1/output-1/build/ltp-testsuite-20240129':
 > configure: error: cannot make /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc report undeclared builtins

 > Indeed, this LFS workaround was added by commit
 > ca3524ba707126de7284210c00268a8e7ca6379a and is only needed to fix a
 > build failure with the old codesourcery-arm toolchain from 2014 which
 > uses glibc < 2.23. as glibc 2.23 was released in February 2016:
 > https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
 > already done for libselinux in commit
 > c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
 > drop codesourcery-arm toolchain.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d2e75a79bc42b6a9a2b407fd557aca5c7f207d84

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
