Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C942EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B309A41723;
	Wed, 14 Jun 2023 13:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B309A41723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dQpY7x6nCzv; Wed, 14 Jun 2023 13:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 831B2405A7;
	Wed, 14 Jun 2023 13:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 831B2405A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9B431BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93495813C4
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93495813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Y8j9FdezJYu for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:33:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FC0680EE3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FC0680EE3
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:33:39 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD0CFE0005;
 Wed, 14 Jun 2023 13:33:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Qcy-00872E-5c; Wed, 14 Jun 2023 15:33:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230516194855.1548486-1-bernd.kuhls@t-online.de>
Date: Wed, 14 Jun 2023 15:33:36 +0200
In-Reply-To: <20230516194855.1548486-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 16 May 2023 21:48:53 +0200")
Message-ID: <87jzw6p3rj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/3] package/vdr: Fix patch for uclibc
 build
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > uClibc-ng 1.0.42 added support for getloadavg:
 > https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=ad3a130dad88ad7a59dcd965b0cf9bd0d713595e

 > leading to build errors of the vdr package:

 > skinlcars.c:1105:12: error: 'int getloadavg(double*, int)' was declared 'extern' and later 'static' [-fpermissive]

 > since its version bump in buildroot:
 > https://git.busybox.net/buildroot/commit/?id=61ae6add9e5d4761536fa4ff24150d5f8f82a61d

 > Fixes:
 > http://autobuild.buildroot.net/results/d3a/d3a65044fabdafa1b6d75a508eae006a2cfebdc0/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > I do not know whether all external toolchains were already updated to
 > uClibc-ng >= 1.0.42 so I fixed the patch instead of removing it.
 > Due to uClibc-ng providing getloadavg() sending 0001-getloadavg.patch
 > makes no sense imho.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
