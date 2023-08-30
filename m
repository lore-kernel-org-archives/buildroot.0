Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE2C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D716841C5F;
	Wed, 30 Aug 2023 11:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D716841C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3mAVc8Tgao2; Wed, 30 Aug 2023 11:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D707741C5A;
	Wed, 30 Aug 2023 11:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D707741C5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BDA71BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 742F441C5F
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742F441C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQtq76-0y21o for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:07:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FD7E41BCD
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD7E41BCD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29EF41C0006;
 Wed, 30 Aug 2023 11:07:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbJ2v-0003Ep-Ex; Wed, 30 Aug 2023 13:07:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230728170648.2838566-1-bernd@kuhls.net>
Date: Wed, 30 Aug 2023 13:07:37 +0200
In-Reply-To: <20230728170648.2838566-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 28 Jul 2023 19:06:48 +0200")
Message-ID: <87wmxcpz46.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ntp: needs either mmu or threads
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/f2b466853ed296fdc8b4629f36e5a6447658f82d/

 > Quoting the first error message:
 > ntp_io.c:3793:9: error: unknown type name 'blocking_child'

 > ntp needs either fork or threads:
 > https://bk.ntp.org/ntp-dev/include/ntp_workimpl.h?PAGE=anno&REV=4d6178063mDeaH-s7PteNqw1DDK-Rw

 >   #if defined(WORK_FORK) || defined(WORK_THREAD)
 >   # define WORKER
 >   #endif

 > to enable the blocking_child code based on the WORKER define:
 > https://bk.ntp.org/ntp-dev/include/intreswork.h?PAGE=anno&REV=4d617805zzdW7YeB56-WZ4GbGCcXxw

 > The build error first occured on April 3rd, 2022:
 > http://autobuild.buildroot.net/results/31b/31bfdac8411ebf043a39e3277f6d7b008fe337b0/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
