Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AC4C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 11:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900A741DE0;
	Thu, 26 Oct 2023 11:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900A741DE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvDZuvlOtPIQ; Thu, 26 Oct 2023 11:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DD041D5F;
	Thu, 26 Oct 2023 11:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9DD041D5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5260A1BF59D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C2EB416D9
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2EB416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKdFrjlSWCGC for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:13:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 108824047B
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108824047B
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD686E0005;
 Thu, 26 Oct 2023 11:13:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qvyJ7-006IfB-UY; Thu, 26 Oct 2023 13:13:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231015194511.1158058-1-fontaine.fabrice@gmail.com>
Date: Thu, 26 Oct 2023 13:13:45 +0200
In-Reply-To: <20231015194511.1158058-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Oct 2023 21:45:11 +0200")
Message-ID: <87msw5ocuu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/casync: fix build with gcc >= 13
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
Cc: Yair Ben Avraham <yairba@protonmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc >= 13:
 > In file included from ../src/compressor.c:3:
 > ../src/compressor.h:59:59: error: unknown type name 'size_t'
 >    59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
 >       |                                                           ^~~~~~
 > ../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
 >    18 | #include "cacompression.h"
 >   +++ |+#include <stddef.h>
 >    19 |

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
