Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03317EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BEAF81EEE;
	Mon, 24 Jul 2023 20:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BEAF81EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26s-AYctjBiR; Mon, 24 Jul 2023 20:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D125A81F14;
	Mon, 24 Jul 2023 20:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D125A81F14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF5D1BF5B4
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396B88138E
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396B88138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8I1_w4evN2T for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 20:49:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 526AD81E55
 for <buildroot@uclibc.org>; Mon, 24 Jul 2023 20:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 526AD81E55
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qO2UP-0009Ra-Il
 for buildroot@uclibc.org; Mon, 24 Jul 2023 22:49:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 24 Jul 2023 22:48:17 +0200
Message-ID: <pan$22ac9$82d21647$d8e54d59$6b8e9f97@ID-313208.user.individual.net>
References: <20230720185445.1375987-1-bernd@kuhls.net>
 <20230720231717.33ed6806__30743.4139352821$1689887867$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: link with -latomic if
 needed
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

Am Thu, 20 Jul 2023 23:17:17 +0200 schrieb Thomas Petazzoni via buildroot:

> I continue to think this is not the right way of handling this issue.
> opensc is using pkg-config to detect openssl, so it is the openssl .pc
> files that should have -latomic. This will fix the issue once for all
> for all users of openssl, without chasing them down one by one.

Hi Thomas,

openssl has everything in place for statically linking to libatomic:

cat output/per-package/opensc/host/arceb-buildroot-linux-uclibc/sysroot/
usr/lib/pkgconfig/libcrypto.pc | grep atomic

Libs.private: -ldl -pthread -latomic -latomic

It's just the build system of opensc which does not make use of it. Due to 
my limited coding skills I only managed to disable building the test 
binaries which include the broken file:
https://patchwork.ozlabs.org/project/buildroot/patch/
20230724204439.1526127-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
