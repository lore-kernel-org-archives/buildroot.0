Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC64CE7A8B
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF59041720;
	Sun, 24 Sep 2023 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF59041720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ze3kxcX0j2d; Sun, 24 Sep 2023 21:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E59AF41734;
	Sun, 24 Sep 2023 21:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59AF41734
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 815901BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ABF381758
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ABF381758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hst7yuUoqbPG for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:30:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F8A81656
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F8A81656
Received: by mail.gandi.net (Postfix) with ESMTPSA id 484ED60002;
 Sun, 24 Sep 2023 21:30:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkWfv-001y48-Mj; Sun, 24 Sep 2023 23:29:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230916211714.1175631-1-fontaine.fabrice@gmail.com>
Date: Sun, 24 Sep 2023 23:29:59 +0200
In-Reply-To: <20230916211714.1175631-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Sep 2023 23:17:14 +0200")
Message-ID: <87wmwffeeg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fstrcmp: fix musl static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following musl static build failure raised because host libtool
 > is not patched to manage "-static" as "-all-static".

 > /home/buildroot/autobuild/instance-2/output-1/host/bin/libtool --mode=link --tag=CC /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -Wextra -Wshadow -o bin/test_user \
 > 	test_user/main.lo lib/libfstrcmp.la -static
 > chmod a+rx bin/test_prelude
 > libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/test_user test_user/main.o  lib/.libs/libfstrcmp.a
 > libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/fstrcmp fstrcmp/main.o  lib/.libs/libfstrcmp.a
 > /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
 > /home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ffbee12f13e3d6c180d8891a428c6c490163083d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
