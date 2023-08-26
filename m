Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5839DC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 20:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA488201F;
	Sat, 26 Aug 2023 20:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA488201F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Prz60l0UamM; Sat, 26 Aug 2023 20:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F7181FB7;
	Sat, 26 Aug 2023 20:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F7181FB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1163A1BF471
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 20:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF6F181FB7
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 20:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF6F181FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRDFhBnBU_7C for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 20:06:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7E3581F93
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 20:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E3581F93
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0A0960004;
 Sat, 26 Aug 2023 20:06:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZzY7-0054U6-QW; Sat, 26 Aug 2023 22:06:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever via buildroot <buildroot@buildroot.org>
References: <20230713161139.182388-1-frank.vanbever@mind.be>
Date: Sat, 26 Aug 2023 22:06:23 +0200
In-Reply-To: <20230713161139.182388-1-frank.vanbever@mind.be> (Frank Vanbever
 via buildroot's message of "Thu, 13 Jul 2023 18:11:39 +0200")
Message-ID: <87il917em8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2023.02.x] package/libmodsecurity: backport
 security fix for CVE-2023-28882
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frank" == Frank Vanbever via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following issue:
 > - CVE-2023-28882: Trustwave ModSecurity 3.0.5 through 3.0.8 before 3.0.9 allows
 >   a denial of service (worker crash and unresponsiveness) because some inputs
 >   cause a segfault in the Transaction class for some configurations.

 >   https://security-tracker.debian.org/tracker/CVE-2023-28882

 > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Sorry for the slow response.

We are using 3.0.8 on 2023.02.x. Is the delta between 3.0.8 and 3.0.9 so
big that it makes sense to add this patch rather than just bumping to
3.0.9 - Especially given that 3.0.10 contained another security fix?

Looking at the 3.0.9 release notes, it seems to be almost entirely
fixes:

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.9

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
