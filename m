Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7EC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C02E260B34;
	Sun, 19 Jun 2022 13:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C02E260B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDsD3O1rUkb8; Sun, 19 Jun 2022 13:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2FA607EC;
	Sun, 19 Jun 2022 13:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE2FA607EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7E241BF3D8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFE53405A8
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE53405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oDZggLEw-cG for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:06:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7838A4012F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7838A4012F
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:06:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25C9420003;
 Sun, 19 Jun 2022 13:05:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2ucm-006Fsa-U0; Sun, 19 Jun 2022 15:05:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220608191137.2065197-1-fontaine.fabrice@gmail.com>
Date: Sun, 19 Jun 2022 15:05:56 +0200
In-Reply-To: <20220608191137.2065197-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Jun 2022 21:11:37 +0200")
Message-ID: <87a6a8sszv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-userland: fix libexecinfo
 workaround
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix libexecinfo workaround to avoid the following ffmpeg build failure
 > with BR2_PACKAGE_RPI_USERLAND raised on uclibc and musl since commit
 > bc4cc27705de50356d7e9945e41bd989fdc56fe8:

 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-linux-gcc
 > --sysroot=/home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot
 > -mcpu=arm926ej-s -Wl,--as-needed -Wl,-z,noexecstack -o
 > /tmp/ffconf.5K0cMIh3/test /tmp/ffconf.5K0cMIh3/test.o -lmmal_core
 > -lmmal_util -lmmal_vc_client -lbcm_host -latomic
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so:
 > undefined reference to `backtrace_symbols'

 > [...]

 > ERROR: mmal not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/64d21872d25fef35b72106133ed2aed300f52f2f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
