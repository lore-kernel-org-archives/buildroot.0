Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F9EC001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 09:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49DD4F0B6;
	Sat, 21 Oct 2023 09:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49DD4F0B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT3l5nnz2X-h; Sat, 21 Oct 2023 09:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0634D4F0B7;
	Sat, 21 Oct 2023 09:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0634D4F0B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7911A1BF429
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 09:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B7084D89
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 09:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B7084D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKqMrGNJQteM for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 09:12:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3055780ACC
 for <buildroot@uclibc.org>; Sat, 21 Oct 2023 09:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3055780ACC
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qu81h-0000AR-Jb
 for buildroot@uclibc.org; Sat, 21 Oct 2023 11:12:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 21 Oct 2023 11:11:08 +0200
Message-ID: <pan$5fb08$ba478966$acec30f4$7e2106fb@ID-313208.user.individual.net>
References: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
 <3a3931dd-0819-e4c6-4190-9c6625e8f644__27799.4043821067$1695407966$gmane$org@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: add bsdunzip option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri, 22 Sep 2023 20:38:53 +0200 schrieb Arnout Vandecappelle via
buildroot:

>   It's not clear to me how this would solve the reported build failure - 
AFAICS 
> it should make no difference at all if bsdunzip is selected.
> 
>   So I tried to reproduce the issue, but for me, the build just 
succeeds...

Hi Arnout,

using this defconfig http://autobuild.buildroot.net/results/c66/
c66731b330745ef6f6b36d85f808916547317b11/ I could reproduce the build 
error.

It seems that Fabrice is right with his patch because it extends the logic 
we have in place for the last 9 years to the new tool bsdunzip:
https://git.buildroot.net/buildroot/commit/?
id=9581d0d1177d41cc61501e0f93f6089da3c1d4c1

The build error first occured when libarchive was bumped from 3.6.2 to 
3.71 with buildroot commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 due to 
bsdunzip being added in version 3.7.0:
https://github.com/libarchive/libarchive/releases/tag/v3.7.0

Tested-by: Bernd Kuhls <bernd@kuhls.net>

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
