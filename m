Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91396C04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 13:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F25E40438;
	Tue, 25 Oct 2022 13:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F25E40438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VR5vKqxhImXE; Tue, 25 Oct 2022 13:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 554534034B;
	Tue, 25 Oct 2022 13:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 554534034B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D91A1BF94B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 13:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C966059A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 13:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C966059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZZxytWsG3mK for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 13:33:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3BBB60615
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3BBB60615
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 13:33:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68245FF808;
 Tue, 25 Oct 2022 13:33:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1onK3E-00EvBc-E3; Tue, 25 Oct 2022 15:33:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20221025093752.3520434-1-peter@korsgaard.com>
Date: Tue, 25 Oct 2022 15:33:04 +0200
In-Reply-To: <20221025093752.3520434-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 25 Oct 2022 11:37:51 +0200")
Message-ID: <87a65k110v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/booten: Fix build on machines with
 modern flex / host-flex
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.org/results/3a8/3a8b66027cde3cdd9d02745381526d52bb626a78/

 > Bootgen embeds an old version of flex, but uses the system include syntax
 > (#include <>) to reference it, causing conflicts on systems with the
 > development headers for a modern flex version installed, leading to build
 > issues like:

 > ../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
 > ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator='
 > (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and
 > 'std::istream*' {aka 'std::basic_istream<char>*'})

 > Fix it by using normal local #include statements by:

 > sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

 > Patch submitted upstream: https://github.com/Xilinx/bootgen/pull/20

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
