Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79834EE4997
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FCAD841E1;
	Fri, 18 Aug 2023 20:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FCAD841E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWfP5WuXbjSV; Fri, 18 Aug 2023 20:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35F66841DE;
	Fri, 18 Aug 2023 20:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35F66841DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A68941BF31D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81A2A841DE
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81A2A841DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02lnfVdj5ofx for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 20:48:14 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D211841BD
 for <buildroot@uclibc.org>; Fri, 18 Aug 2023 20:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D211841BD
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qX6OB-0004dL-8B
 for buildroot@uclibc.org; Fri, 18 Aug 2023 22:48:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 18 Aug 2023 22:47:15 +0200
Message-ID: <pan$c62b1$e5429c51$8973424f$9abaebbb@ID-313208.user.individual.net>
References: <20230818151608.988723-1-bernd@kuhls.net>
 <20230818220314.3178c964__25218.2109326654$1692389025$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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

Hi Thomas,

Am Fri, 18 Aug 2023 22:03:14 +0200 schrieb Thomas Petazzoni via buildroot:

> Note that double colon rules have a specific meaning in make:

ah, I did not know that.

> so I don't know if the double colon was intended (and needed at
> the time) or was a typo.

Digging further into what first appeared to me as a typo I found your 
commit adding the double colon to package/Makefile.package.in:
https://git.buildroot.net/buildroot/commit/package?
id=e11fe847b2f545446fc3300dd2ba88fd5da05756

At that time there was another file, package/Makefile.autotools.in, which 
also included a "$(BUILD_DIR)/%/.stamp_built:" single-colon target:
https://git.buildroot.net/buildroot/tree/package/Makefile.autotools.in?
id=e11fe847b2f545446fc3300dd2ba88fd5da05756#n264

Today only one file, package/pkg-generic.mk, contains a .stamp_built 
target.

Maybe, I am only guessing, the double colon was necessary back then, due 
to two Makefiles containing the same target, and lost their justification 
when the single-colon target "$(BUILD_DIR)/%/.stamp_built:" was removed 
with commit https://git.buildroot.net/buildroot/commit/?
id=d8b55b99095e5eed46d2b95bdaab2e69ccbd7170

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
