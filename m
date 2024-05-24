Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EBC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A88378303C;
	Fri, 24 May 2024 12:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9qX_aF7zaD3; Fri, 24 May 2024 12:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD78E83046
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD78E83046;
	Fri, 24 May 2024 12:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CFD11CF98D
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6750083046
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toOO8F3K3YKe for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 450C88303C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450C88303C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 450C88303C
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:52:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B06F40009;
 Fri, 24 May 2024 12:52:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAUPI-00FxZU-37;
 Fri, 24 May 2024 14:52:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240521182559.5676-1-fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2024 14:52:24 +0200
In-Reply-To: <20240521182559.5676-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 May 2024 20:25:59 +0200")
Message-ID: <87o78vjrsn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/lmdb: fix CFLAGS handling
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

 > By passing TARGET_CONFIGURE_OPTS to make, the following usptream CFLAGS
 > are completely overriden:

 > CFLAGS	= $(THREADS) $(OPT) $(W) $(XCFLAGS)

 > As a result, setting XCFLAGS is a no-op and -pthread is not passed
 > resulting in the following build failure since the addition of the
 > package in commit eb60c4054c25129d78651a66d1e7554aff04767f:

 > //binhome//.buildroot.//autobuildlib//rungcc//instancepowerpc64--3buildroot/-outputlinux--1gnu//host9.3.0//opt./.ext/-.toolchain.//bin./../../.lib//powerpc64gcc-/buildrootpowerpc64--linuxbuildroot--gnulinux/-bingnu//ld9.3.0:/
 > .mdb.c.:/(...text/+.0x1a44.)/:. .undefined/ powerpc64reference-
 > buildrootto `pthread_setspecific'

 > Fixes: eb60c4054c25129d78651a66d1e7554aff04767f
 >  - http://autobuild.buildroot.org/results/d67c5a99b7d58826e544f1210fa36bb3bc180739

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
