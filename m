Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB43C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 22:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BE681465;
	Sat, 13 Jan 2024 22:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00BE681465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLMhcjSut-dq; Sat, 13 Jan 2024 22:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B43281458;
	Sat, 13 Jan 2024 22:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B43281458
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 279DD1BF325
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 22:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DE398144C
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 22:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE398144C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P09WmtgWnuXO for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 22:53:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2D238144A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 22:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D238144A
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3C3CFF802;
 Sat, 13 Jan 2024 22:53:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOmsr-00DTMx-0J;
 Sat, 13 Jan 2024 23:53:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240111194021.2570675-1-fontaine.fabrice@gmail.com>
Date: Sat, 13 Jan 2024 23:53:45 +0100
In-Reply-To: <20240111194021.2570675-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 11 Jan 2024 20:40:21 +0100")
Message-ID: <87edekn8ue.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/criu: disable mips
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mips raises the following build failure since the addition of the
 > package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

 > compel/arch/mips/plugins/std/memcpy.S:7: Error: opcode not supported on this processor: mips32 (mips32) `dadd $2,$0,$4'
 > compel/arch/mips/plugins/std/memcpy.S:8: Error: opcode not supported on this processor: mips32 (mips32) `daddiu $13,$0,0'

 > Indeed, dadd and daddiu are specific to mips64

 > Building on mips64 doesn't work either as it raises the following build
 > failure:

 > /tmp/ccArXSfi.s:305: Error: opcode not supported on this processor: mips64 (mips64) `rdhwr $2,$29'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b0341d0654e66bdac2c91d5949be3810a961d9da
 >  - http://autobuild.buildroot.org/results/b7b8860476de04980bd8c7241d3dd5a01a0251c8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
