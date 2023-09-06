Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187FAEE14D6
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C3854159F;
	Wed,  6 Sep 2023 19:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3854159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bchhK08SRMWR; Wed,  6 Sep 2023 19:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB6F241591;
	Wed,  6 Sep 2023 19:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6F241591
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAE2A1BF37E
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FEF611B5
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83FEF611B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odxGpRw8ivfm for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:01:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C1A3611B4
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C1A3611B4
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8FA640009;
 Wed,  6 Sep 2023 19:01:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qdxlz-007gFM-MO; Wed, 06 Sep 2023 21:01:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "TIAN Yuanhao" <tianyuanhao3@163.com>
References: <20230717041047.1510851-1-christian@aperture.us>
 <20230717041047.1510851-2-christian@aperture.us>
 <845cccd.4d5f.18977003291.Coremail.tianyuanhao3@163.com>
Date: Wed, 06 Sep 2023 21:01:07 +0200
In-Reply-To: <845cccd.4d5f.18977003291.Coremail.tianyuanhao3@163.com> (TIAN
 Yuanhao's message of "Fri, 21 Jul 2023 13:50:48 +0800 (CST)")
Message-ID: <87pm2vgm8c.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/2] package/docker-cli: backport fix for
 host header check
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
 > At 2023-07-17 12:10:47, "Christian Stewart via buildroot" <buildroot@buildroot.org> wrote:
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
 >> ---
 >> ...ackport-fix-for-go-Host-header-check.patch | 270 ++++++++++++++++++
 >> 1 file changed, 270 insertions(+)
 >> create mode 100644 package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
 >> 
 >> diff --git a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
 >> new file mode 100644
 >> index 0000000000..2d16fd6df2
 >> --- /dev/null
 >> +++ b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
 >> @@ -0,0 +1,270 @@
 >> +From 4dc783e2bdf414761ef7c209b435d0a30f17c858 Mon Sep 17 00:00:00 2001
 >> +From: Sebastiaan van Stijn <github@gone.nl>
 >> +Date: Sat, 15 Jul 2023 02:22:10 +0200
 >> +Subject: [PATCH] backport fix for go Host header check
 >> +
 >> +Go 1.20.6 and 1.19.11 include a security check of the http Host header:
 >> +    
 >> +  https://github.com/golang/go/issues/60374
 >> +
 >> +docker-cli fails this check:
 >> +
 >> +  $ docker exec -it ctr bash
 >> +  http: invalid Host header
 >> +
 >> +This is a backported patch to fix this issue.
 >> +
 >> +Issue: https://github.com/moby/moby/issues/45935
 >> +Upstream PR: https://github.com/moby/moby/pull/45942
 >> +
 >> +The upstream PR has been merged and will be included in v24.0.5.
 >> +
 >> +Signed-off-by: Christian Stewart <christian@aperture.us>
 >> +
 >> +---
 >> +
 >> +For local communications (npipe://, unix://), the hostname is not used,
 >> +but we need valid and meaningful hostname.
 >> +
 >> +The current code used the socket path as hostname, which gets rejected by
 >> +go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
 >> +which was implemented in  https://go.dev/issue/60374.
 >> +
 >> +Prior versions go Go would clean the host header, and strip slashes in the
 >> +process, but go1.20.6 and go1.19.11 no longer do, and reject the host
 >> +header.
 >> +---
 >> + vendor.mod                                    | 16 +++++-----
 >> + vendor.sum                                    | 32 +++++++++----------

Do we really need the changes to vendor.mod / vendor.sum? They didn't
apply to 23.0.5 here, so I dropped those hunks.

Committed with that fixed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
