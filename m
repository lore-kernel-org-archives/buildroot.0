Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB2FEE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9043840C51;
	Mon, 11 Sep 2023 10:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9043840C51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLHcNZyMk2FU; Mon, 11 Sep 2023 10:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B567440C43;
	Mon, 11 Sep 2023 10:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B567440C43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CABC71BF28E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A42AC81B70
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A42AC81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3nAraB98LeA for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:27:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96B81813FA
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B81813FA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60EBA1BF207;
 Mon, 11 Sep 2023 10:27:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfe8S-00Eeor-2n; Mon, 11 Sep 2023 12:27:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZND2kP8kQgFsEzMZ@waldemar-brodkorb.de>
Date: Mon, 11 Sep 2023 12:27:16 +0200
In-Reply-To: <ZND2kP8kQgFsEzMZ@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Mon, 7 Aug 2023 15:50:08 +0200")
Message-ID: <878r9dc8e3.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/openssh: fix build failure due
 to gcc bug 110934
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Following ICE occurs for m68k builds:
 > (cd openbsd-compat && /home/autobuild/make/make)
 > /home/autobuild/autobuild/instance-10/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -pipe -Wno-error=format-truncation -Wall
 > +-Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing
 > +-D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
 > +-D_DEFAULT_SOURCE -D_GNU_SOURCE -DHAVE_CONFIG_H -c bsd-closefrom.c
 > during RTL pass: zero_call_used_regs
 > bsd-closefrom.c: In function 'closefrom':
 > bsd-closefrom.c:151:1: internal compiler error: in change_address_1, at emit-rtl.c:2275
 >   151 | }
 >       | ^
 > 0x7fa76f4bad09 __libc_start_main
 >         ../csu/libc-start.c:308
 > Please submit a full bug report,
 > with preprocessed source if appropriate.
 > Please include the complete backtrace with any bug report.
 > See <http://bugs.buildroot.net/> for instructions.
 > make[2]: *** [Makefile:106: bsd-closefrom.o] Error 1

 > Fixes following autobuild failure:
 > http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
