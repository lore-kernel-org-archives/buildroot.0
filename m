Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3E2C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 11:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA7A60C04;
	Tue, 15 Nov 2022 11:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA7A60C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnkGxx6eaXgx; Tue, 15 Nov 2022 11:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E3D60C0F;
	Tue, 15 Nov 2022 11:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24E3D60C0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C45F81BF59E
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A047781309
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 11:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A047781309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wi8ks6usqWh2 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 11:04:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42D7B81304
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42D7B81304
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 11:04:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B7C72000F;
 Tue, 15 Nov 2022 11:04:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1outjo-008WgG-IL; Tue, 15 Nov 2022 12:04:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221106222042.648813-1-fontaine.fabrice@gmail.com>
Date: Tue, 15 Nov 2022 12:04:20 +0100
In-Reply-To: <20221106222042.648813-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 6 Nov 2022 23:20:42 +0100")
Message-ID: <87wn7wh423.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: fix static build
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

 > Pass TARGET_LDFLAGS (which contains -static) to fix the following static
 > build failures with gpio, iio and pci:

 >   LINK     lsgpio
 > /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/../../../../arm-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
 > /home/autobuild/autobuild/instance-8/output-1/build/host-gcc-final-10.4.0/build/arm-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

 > [...]

 >   LINK    iio_event_monitor
 > /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
 > /home/thomas/autobuild/instance-2/output-1/build/host-gcc-final-11.3.0/build/microblazeel-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:88: undefined reference to `abort'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f202eb843ef331939f5f12325bdbf2d0d664a7ce
 >  - http://autobuild.buildroot.org/results/504ec8be1ebd15c5da09f8b90bb723a58d4c58c5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
