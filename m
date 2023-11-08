Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A36C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2B7081F71;
	Wed,  8 Nov 2023 13:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B7081F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSj6E30t277O; Wed,  8 Nov 2023 13:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3F681BC5;
	Wed,  8 Nov 2023 13:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3F681BC5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5991BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 364A281BC5
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364A281BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRhy7XlsaYwj for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:39:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECFFA81B69
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFFA81B69
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93E651BF207;
 Wed,  8 Nov 2023 13:39:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0ilq-000JqM-0U;
 Wed, 08 Nov 2023 14:39:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231102171118.4810-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 14:39:02 +0100
In-Reply-To: <20231102171118.4810-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 2 Nov 2023 18:11:18 +0100")
Message-ID: <87bkc4s6tl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: fix build with gcc >=
 13
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

 > Fix the following build failure with gcc >= 13:
 > In file included from ../include/pistache/reactor.h:19,
 >                  from ../src/common/reactor.cc:13:
 > ../include/pistache/flags.h:29:35: error: 'uint8_t' was not declared in this scope
 >    29 |         struct TypeStorage<sizeof(uint8_t)>
 >       |                                   ^~~~~~~
 > ../include/pistache/flags.h:17:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
 >    16 | #include <iostream>
 >   +++ |+#include <cstdint>
 >    17 | #include <type_traits>

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d3b6eb6fb943d69571a311235944df879fccc831

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
