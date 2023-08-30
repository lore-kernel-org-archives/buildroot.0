Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582B8C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 148804181E;
	Wed, 30 Aug 2023 22:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 148804181E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS2CJ7mAwT4o; Wed, 30 Aug 2023 22:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E8B4180A;
	Wed, 30 Aug 2023 22:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67E8B4180A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9A791BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D04D660B68
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D04D660B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUttia_SBVWm for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:10:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C959460B42
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C959460B42
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32A0560006;
 Wed, 30 Aug 2023 22:10:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbTOH-000IqK-A9; Thu, 31 Aug 2023 00:10:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20230325203808.1272652-1-giulio.benetti@benettiengineering.com>
Date: Thu, 31 Aug 2023 00:10:21 +0200
In-Reply-To: <20230325203808.1272652-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 25 Mar 2023 21:38:08 +0100")
Message-ID: <87pm34npv6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/bind: fix build failure due to gcc
 bug 101737
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > The bind package exhibits gcc bug 101737 when built for the SH4
 > architecture with optimization enabled, which causes a build failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
 > To achieve this we need to correct the override of CFLAGS by using:
 > BIND_CONF_OPTS += CFLAGS="$(BIND_CFLAGS)"
 > instead of:
 > BIND_CONF_ENV = BUILD_CFLAGS"$(BIND_CFLAGS)"
 > since the latter doesn't work as expected and doesn't override CFLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/e7b/e7b9a4cbee8bb16431609182b96d1ac1ccec10e7/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
