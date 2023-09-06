Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186D1EE14D0
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93FC64159D;
	Wed,  6 Sep 2023 19:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93FC64159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOSsRFHspGSp; Wed,  6 Sep 2023 19:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9E284158A;
	Wed,  6 Sep 2023 19:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E284158A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5201BF37E
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151C6818C0
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151C6818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BF4Ub2y-sBYu for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:00:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD1858136F
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1858136F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62C671C0008;
 Wed,  6 Sep 2023 19:00:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qdxl3-007gEi-Fp; Wed, 06 Sep 2023 21:00:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "TIAN Yuanhao" <tianyuanhao3@163.com>
References: <20230717041047.1510851-1-christian@aperture.us>
 <5deecbea.4d7e.1897700fbb6.Coremail.tianyuanhao3@163.com>
Date: Wed, 06 Sep 2023 21:00:09 +0200
In-Reply-To: <5deecbea.4d7e.1897700fbb6.Coremail.tianyuanhao3@163.com> (TIAN
 Yuanhao's message of "Fri, 21 Jul 2023 13:51:40 +0800 (CST)")
Message-ID: <87tts7gm9y.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: backport fix
 for host header check
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "TIAN" == TIAN Yuanhao <tianyuanhao3@163.com> writes:

 > Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>
 > At 2023-07-17 12:10:46, "Christian Stewart via buildroot" <buildroot@buildroot.org> wrote:
 >> Go 1.20.6 and 1.19.11 include a security check of the http Host header:
 >> 
 >> https://github.com/golang/go/issues/60374
 >> 
 >> docker-cli does not satisfy this check:
 >> 
 >> $ docker exec -it ctr bash
 >> http: invalid Host header
 >> 
 >> This is a backported patch to fix this issue:
 >> 
 >> Issue: https://github.com/moby/moby/issues/45935
 >> Upstream PR: https://github.com/moby/moby/pull/45942
 >> 
 >> The upstream PR has been merged and will be included in v24.0.5.
 >> 
 >> Signed-off-by: Christian Stewart <christian@aperture.us>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
