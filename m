Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D78C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095654189E;
	Wed,  7 Dec 2022 15:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095654189E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Btr4FComWzUC; Wed,  7 Dec 2022 15:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B3041834;
	Wed,  7 Dec 2022 15:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B3041834
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85D851BF40E
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DE8812E9
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DE8812E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGQynVqvZ3iP for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 15:05:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CB18126D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3CB18126D
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 15:05:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD5111BF204;
 Wed,  7 Dec 2022 15:05:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2vzV-00Gxe3-QA; Wed, 07 Dec 2022 16:05:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221203155545.48559-1-fontaine.fabrice@gmail.com>
Date: Wed, 07 Dec 2022 16:05:45 +0100
In-Reply-To: <20221203155545.48559-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Dec 2022 16:55:45 +0100")
Message-ID: <87lenj2r06.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: fix static with
 shared build
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

 > When BR2_SHARED_STATIC_LIBS is enabled, both --enable-static and
 > --enable-shared are passed to configure. memcached configure.ac only
 > looks for --enable-static to make the build static. But when linking
 > against openssl pkg-config only returns dynamic linking dependencies,
 > resulting in the following build failure:

 > /home/thomas/autobuild/instance-1/output-1/host/bin/aarch64_be-buildroot-linux-gnu-gcc
 > -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Ofast -g0 -D_FORTIFY_SOURCE=2 -pthread -Wall
 > -pedantic -Wmissing-prototypes -Wmissing-declarations
 > -Wredundant-decls -static -o timedrun timedrun.o -levent
 > -L/home/thomas/autobuild/instance-1/output-1/host/bin/../aarch64_be-buildroot-linux-gnu/sysroot/usr/lib
 > -lssl -lcrypto -ldl
 > /home/thomas/autobuild/instance-1/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/11.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld:
 > memcached-memcached.o: in function `conn_new':
 > memcached.c:(.text+0x1668): undefined reference to `SSL_set_info_callback'

 > BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
 > binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
 > static only build.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/363c84eaa69350e02bec0b35b88d4bdf4dad804c
 >  - http://autobuild.buildroot.org/results/0bde41bb700100d8df5ebdb1b64dfdc76c7af475

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
