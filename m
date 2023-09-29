Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C179E728DD
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 19:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5260B83D4E;
	Fri, 29 Sep 2023 19:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5260B83D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2XO4O0OJo6U; Fri, 29 Sep 2023 19:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A21AB83D49;
	Fri, 29 Sep 2023 19:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A21AB83D49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E191D1BF83B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 19:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9B1442DEA
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 19:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B1442DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fD1l7B_0GVJG for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 19:33:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A33942DE9
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 19:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A33942DE9
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0CB71BF204;
 Fri, 29 Sep 2023 19:33:25 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmJEr-006EwR-0s; Fri, 29 Sep 2023 21:33:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
 <20230911210917.1114974-2-romain.naour@gmail.com>
Date: Fri, 29 Sep 2023 21:33:25 +0200
In-Reply-To: <20230911210917.1114974-2-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 11 Sep 2023 23:09:17 +0200")
Message-ID: <87a5t4g4fu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/localedef: build issue with old
 glibc (<= 2.38)
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > While building host-localedef from glibc 2.38 sources, it uses the
 > features.h header from it sources that define _ISOC2X_SOURCE 1 as
 > soon as _GNU_SOURCE is defined.

 > _ISOC2X_SOURCE enable __GLIBC_USE_ISOC2X 1 that enable the header
 > redirection to use __isoc23_* functions introduced in glibc 2.38 [1].

 > If an older version is installed on the host, thoses functions
 > doesn't exist and break the build.

 > Add a local patch to keep _ISOC2X_SOURCE and __GLIBC_USE_ISOC2X
 > disabled.

 > Fixes:
 > host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o:
 > in function `ctype_read':
 > ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'

 > (glibc 2.31 installed on the host)

 > [1]
 > https://sourceware.org/git/?p=glibc.git;a=commit;h=64924422a99690d147a166b4de3103f3bf3eaf6c

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
