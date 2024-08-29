Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C23C761AE
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784B940B4B;
	Thu, 29 Aug 2024 06:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZ2lM0KJiPRB; Thu, 29 Aug 2024 06:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4196040C97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4196040C97;
	Thu, 29 Aug 2024 06:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67BDA1BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5419381A3B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_i4XdUY8srq for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:07:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4442C81A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4442C81A46
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4442C81A46
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:07:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7D5660004;
 Thu, 29 Aug 2024 06:07:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjYJD-006FHW-1F;
 Thu, 29 Aug 2024 08:07:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240720142629.747083-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Aug 2024 08:07:03 +0200
In-Reply-To: <20240720142629.747083-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Jul 2024 16:26:29 +0200")
Message-ID: <877cbz7th4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/autossh: fix build with gcc >=
 14
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

 > Include stdio.h to avoid that __progname check wrongly returned that
 > the function is unavailable with gcc >= 14 which enables
 > -Werror=implicit-function-declaration
 > (https://gcc.gnu.org/gcc-14/porting_to.html):

 > configure:5231: checking if libc defines __progname
 > configure:5249:
 > /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Os -g0 -static -Wall -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static conftest.c >&5
 > conftest.c: In function 'main':
 > conftest.c:73:27: error: implicit declaration of function 'printf' [-Wimplicit-function-declaration]
 >    73 |  extern char *__progname; printf("%s", __progname);
 >       |                           ^~~~~~
 > conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 'printf'
 >     1 | /* confdefs.h */
 > conftest.c:73:27: warning: incompatible implicit declaration of built-in function 'printf' [-Wbuiltin-declaration-mismatch]
 >    73 |  extern char *__progname; printf("%s", __progname);
 >       |                           ^~~~~~
 > conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 'printf'

 > resulting in the following static build failure:

 > /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0):
 > multiple definition of `__progname'; autossh.o:(.bss+0x120): first
 > defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
