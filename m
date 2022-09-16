Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95C7C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D60842E9;
	Fri, 16 Sep 2022 12:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D60842E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqU1PqDuoGbl; Fri, 16 Sep 2022 12:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680BC842E1;
	Fri, 16 Sep 2022 12:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 680BC842E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD4E1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242A661228
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 242A661228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jjamx4YlzC9X for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:05:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A776121B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A776121B
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:05:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A43020008;
 Fri, 16 Sep 2022 12:05:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZA60-008cc6-Jr; Fri, 16 Sep 2022 14:05:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220815094054.291874-1-fontaine.fabrice@gmail.com>
Date: Fri, 16 Sep 2022 14:05:24 +0200
In-Reply-To: <20220815094054.291874-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Aug 2022 11:40:54 +0200")
Message-ID: <878rmj8qyj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: set CROSS
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set CROSS variable otherwise makedumpfile will use it to undefine the
 > host architecture through -U__$(HOST_ARCH)__ if $(TARGET) is not equal
 > to $(HOST_ARCH). This will result in the following build failure since
 > the addition of the package in commit
 > adb64a97e79bcb4e28450dd858654003ec8706c3 if aarch64_be is cross-compiled
 > on a aarch64 host for example:

 > /home/autobuild/autobuild/instance-5/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -g -O2 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DVERSION='"1.7.0"' -DRELEASE_DATE='"8 Nov 2021"' -D__aarch64_be__ -U__aarch64__ -DUSELZO -c -o ./print_info.o print_info.c

 > [...]

 > makedumpfile.c: In function 'is_kvaddr':
 > makedumpfile.c:1547:46: error: 'KVBASE' undeclared (first use in this function)
 >  1547 |         return (addr >= (unsigned long long)(KVBASE));
 >       |                                              ^~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e4e10364e1a24099ce31bf20eacf5adedf93e5a7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
