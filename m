Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C26C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD9682310;
	Sun, 14 Jan 2024 21:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD9682310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32ZzL0lR6tCL; Sun, 14 Jan 2024 21:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87CE822EF;
	Sun, 14 Jan 2024 21:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87CE822EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E43011BF297
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 21:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B4D41715
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 21:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B4D41715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZItRPU4W--i for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 21:35:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DB8541712
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 21:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB8541712
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CD5060002;
 Sun, 14 Jan 2024 21:35:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rP88n-00E7JY-2c;
 Sun, 14 Jan 2024 22:35:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240113100654.85904-1-fontaine.fabrice@gmail.com>
Date: Sun, 14 Jan 2024 22:35:37 +0100
In-Reply-To: <20240113100654.85904-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Jan 2024 11:06:54 +0100")
Message-ID: <87wmsbk386.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/apcupsd: set LD to TARGET_CXX
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As found out by Yann E. Morin in [1], apcupsd configure script is ugly,
 > and uses gcc to do the link line-wrapping which will raise the following
 > build failure with gcc 13:

 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld:
 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/lib/../lib64/libsupc++.a(eh_alloc.o):
 > in function `std::basic_string_view<char, std::char_traits<char>
 >> ::compare(unsigned long, unsigned long, char const*, unsigned long)
 > const':
 > eh_alloc.cc:(.text._ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm[_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm]+0x44):
 > undefined reference to `std::__throw_out_of_range_fmt(char const*,
 > ...)'

 > It will also raise the following build failure on sparc/arc:

 > /home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-3/output-1/host/arceb-buildroot-linux-uclibc/sysroot/lib/libsupc++.a(eh_throw.o):
 > in function `__exchange_and_add_dispatch':
 > /SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82:
 > undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*,
 > int)'
 > /home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld:
 > /SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82:
 > undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*,
 > int)'

 > Instead of trying to patch the configure script as advocated by
 > Yann E. Morin, set LD to TARGET_CXX as:
 >  - this solution is quicker
 >  - usptream is dead (last release in 2016)
 >  - this solution has already been used in other packages (nodejs, zmqpp)

 > [1]: https://patchwork.ozlabs.org/project/buildroot/patch/20200812171821.2517-1-Evgeniy.Didin@synopsys.com/

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6096c3ddc5edf3204635c2c90246c2e8c8e074e7
 >  - http://autobuild.buildroot.org/results/d8a/d8a3ab31c5b86871c7e1117f4ffa7b6cedfcb7e0/build-end.log

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
