Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD12C433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:34:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA2661248
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFA2661248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A485E426BB;
	Mon,  4 Oct 2021 13:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNjWgcynpZZq; Mon,  4 Oct 2021 13:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69F642755;
	Mon,  4 Oct 2021 13:34:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85DF21BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E5B426BB
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bChTnUE-7uPr for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 13:34:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FD2F42691
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 13:34:02 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2F8B91BF212;
 Mon,  4 Oct 2021 13:33:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXO6R-00028j-Eo; Mon, 04 Oct 2021 15:33:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Illia Bitkov <illia.bitkov@mind.be>
References: <20210908180825.690731-1-illia.bitkov@mind.be>
Date: Mon, 04 Oct 2021 15:33:59 +0200
In-Reply-To: <20210908180825.690731-1-illia.bitkov@mind.be> (Illia Bitkov's
 message of "Wed, 8 Sep 2021 20:08:25 +0200")
Message-ID: <87ee90j4mw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/mono: fix external
 libatomic_ops linkage
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Illia" == Illia Bitkov <illia.bitkov@mind.be> writes:

 > Added patch fixes linkage of libgc with external libtomic-ops.
 > Mono uses bundeled bdwgc which doesn't link external libatomic-ops.
 > Patch is a fix cherry-picked from bdwgc upstream.

 > Problem found on ARMv5 processors, on newer ARM processors
 > it uses header based functions and doesn't need built library.

 > Error:
 > /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > ../../external/bdwgc/.libs/libgc.a(gc.o): in function
 > `GC_steal_mark_stack':
 > gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'

 > Fixes:
 > http://autobuild.buildroot.net/results/ebc54e5dea63aca21a4072d294fdede41de559c7
 > http://autobuild.buildroot.net/results/6d10a4bd43fbc9c1d3fa26d5eef394c8023cb85f
 > Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
