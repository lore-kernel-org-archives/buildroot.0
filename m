Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25321C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8916041F82;
	Sat, 13 Jan 2024 13:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8916041F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0BF0S352g4p; Sat, 13 Jan 2024 13:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA86241F81;
	Sat, 13 Jan 2024 13:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA86241F81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73F861BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4598B60B25
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4598B60B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SESZEjVisvzN for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:14:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC57A60B12
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC57A60B12
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4E60240007;
 Sat, 13 Jan 2024 13:14:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOdqg-00Cy9b-36;
 Sat, 13 Jan 2024 14:14:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240107132346.3161192-1-fontaine.fabrice@gmail.com>
Date: Sat, 13 Jan 2024 14:14:54 +0100
In-Reply-To: <20240107132346.3161192-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Jan 2024 14:23:45 +0100")
Message-ID: <87r0ilv0hd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build without
 neon
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without neon raised since bump to
 > version 1.4.0 in commit 2f7f8f381394207bfb029ec395f5ced5695a0a2e and
 > https://github.com/jgaeddert/liquid-dsp/commit/c821187dd9af2758c8e3c82e95eaf041b8ac81a0:

 > /home/peko/autobuild/instance-0/output-1/host/bin/arm-none-linux-gnueabi-gcc -std=gnu11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=2  -ffast-math -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4  -Wall -fPIC -Wno-deprecated -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -Iinclude  -c -o src/audio/src/cvsd.o src/audio/src/cvsd.c
 > In file included from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/features.h:388:0,
 >                  from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/stdlib.h:24,
 >                  from src/libliquid.c:25:
 > /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29: fatal error: gnu/stubs-hard.h: No such file or directory
 >  # include <gnu/stubs-hard.h>
 >                              ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/36b3c2220c462e7a20262fd1b9064d9aeb6c9ec4
 >  - http://autobuild.buildroot.org/results/881826b4b6c141e59a0da2d7d1ad55d3709fdb95

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
