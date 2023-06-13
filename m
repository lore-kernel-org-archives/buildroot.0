Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F222EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB7B40863;
	Tue, 13 Jun 2023 21:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB7B40863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyyXjiZz92Rg; Tue, 13 Jun 2023 21:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8C8403C8;
	Tue, 13 Jun 2023 21:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA8C8403C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1EA1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03C8940AB4
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03C8940AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3EEL-TjwLLZ for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:54:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94E8D400FD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94E8D400FD
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:54:30 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC2EC1C0004;
 Tue, 13 Jun 2023 21:54:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9By8-004tSR-4B; Tue, 13 Jun 2023 23:54:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230612192648.859014-1-peter@korsgaard.com>
Date: Tue, 13 Jun 2023 23:54:28 +0200
In-Reply-To: <20230612192648.859014-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 12 Jun 2023 21:26:47 +0200")
Message-ID: <87wn07t4dn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bootgen: add patch to fix builds on
 machines with modern flex versions
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
 > http://autobuild.buildroot.net/results/293/2936d9b054269b7055e66ab5a7f7c1f7f4926d48/

 > Bootgen embeds an old version of flex, but uses the system include syntax
 > (#include <>) to reference it, causing conflicts on systems with the
 > development headers for a modern flex version installed, leading to build
 > issues like:

 > ../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
 > ../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for
 > 'operator=' (operand types are 'std::istream' {aka
 > 'std::basic_istream<char>'} and 'std::istream*' {aka
 > 'std::basic_istream<char>*'})

 > Fix it by using normal local includes (#include "") instead.

 > Notice: This was already fixed on master, but the cmdoptions.yy.cpp and
 > reginit.yy.cpp hunks were accidently dropped when the changes were squashed
 > for the 2023.1 release.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
