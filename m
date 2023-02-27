Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEECC64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB7B340A42;
	Mon, 27 Feb 2023 14:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7B340A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNGq5dVny2zh; Mon, 27 Feb 2023 14:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142FB40A4B;
	Mon, 27 Feb 2023 14:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142FB40A4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF35D1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6DD960F7B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DD960F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFrH0xxkNZvh for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:39:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6430B60C0B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6430B60C0B
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:39:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73FEC240013;
 Mon, 27 Feb 2023 14:39:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWeel-009ExI-Ax; Mon, 27 Feb 2023 15:39:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230226120732.39710-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 Feb 2023 15:39:11 +0100
In-Reply-To: <20230226120732.39710-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 Feb 2023 13:07:32 +0100")
Message-ID: <87zg8znpf4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: fix build without NPTL
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without NPTL raised since the addition
 > of the package in commit 1e64fa2956171cdc9d6e6c8896b4b589ce573513:

 > /tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp: In function 'CPLSpinLock* CPLCreateSpinLock()':
 > /tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp:2265:9:
 > error: 'pthread_spin_init' was not declared in this scope; did you
 > mean 'pthread_cond_init'?
 >  2265 |         pthread_spin_init(&(psSpin->spin), PTHREAD_PROCESS_PRIVATE) == 0 )
 >       |         ^~~~~~~~~~~~~~~~~
 >       |         pthread_cond_init

 > Fixes:
 >  - http://autobuild.buildroot.org/results/aa2a88990a07e551c40efb0c2180768add600c4f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
