Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A77C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:34:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEE860E90
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FEE860E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE4F6403B6;
	Thu,  4 Nov 2021 12:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlimSQXo13yH; Thu,  4 Nov 2021 12:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF1D8403A9;
	Thu,  4 Nov 2021 12:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A35DA1BF25F
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91AD2403A9
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_eTbrI3to2o for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 12:34:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17F2F40015
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 12:34:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4A1B3100014;
 Thu,  4 Nov 2021 12:34:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mibwj-0002Ho-Kv; Thu, 04 Nov 2021 13:34:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211027191311.414458-1-fontaine.fabrice@gmail.com>
Date: Thu, 04 Nov 2021 13:34:21 +0100
In-Reply-To: <20211027191311.414458-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Oct 2021 21:13:11 +0200")
Message-ID: <87czngje0i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: fix build with uclibc
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

 > Fix the following build failure with uclibc raised since bump to version
 > 8.2.3565 in commit 5650439b922d020cfad1131e5fb536bce73eb845 and
 > https://github.com/vim/vim/commit/0a7984af5601323fae7b3398f05a48087db7b767:

 > In file included from vim.h:27,
 >                  from fileio.c:14:
 > fileio.c: In function 'time_differs':
 > auto/config.h:149:22: error: 'stat_T' {aka 'struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
 >   149 | #define ST_MTIM_NSEC st_mtim.tv_nsec
 >       |                      ^~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2132f9aa1b0bc618c91f7bf44fbd1b71b9d6ba05

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
