Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E52EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:37:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43A260F22
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D43A260F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 772B2400BD;
	Thu,  7 Oct 2021 07:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xxl93U4lw_Ua; Thu,  7 Oct 2021 07:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE5C4018A;
	Thu,  7 Oct 2021 07:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E93161BF48B
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4CD283EE6
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPNbk9nF0foR for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 07:37:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5ABC83F27
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 07:37:14 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3D5D424000C;
 Thu,  7 Oct 2021 07:37:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYNxl-0002qo-1n; Thu, 07 Oct 2021 09:37:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210922210959.3604227-1-giulio.benetti@benettiengineering.com>
Date: Thu, 07 Oct 2021 09:37:09 +0200
In-Reply-To: <20210922210959.3604227-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 22 Sep 2021 23:09:59 +0200")
Message-ID: <87k0ip2sm2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/ffmpeg: fix build on mips
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > mips_32 is not supported by ffmpeg and it tries to build with loongson3
 > SIMD support that leads to build failure due to:
 > /tmp/ccFO2LRa.s: Assembler messages:
 > /tmp/ccFO2LRa.s:15314: Error: opcode not supported on this processor: mips32 (mips32) `dmult $2,$6'
 > /tmp/ccFO2LRa.s:15316: Error: opcode not supported on this processor: mips32 (mips32) `dsrl $2,$2,32'

 > So let's --disable-asm to prevent using those unsupported opcodes for every
 > mips architecture according to Arnout.

 > Fixes:
 > http://autobuild.buildroot.net/results/f01/f01d9cedec8e1b371308d0f7af561a75883fa27c/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.05.x and 2021.08.x, thanks. We don't have any
autobuilder failues on 2021.02.x, and I cannot reproduce it either here
so it may be related to ffmpeg 4.4.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
