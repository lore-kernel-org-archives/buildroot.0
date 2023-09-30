Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2773BE77375
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DF381276;
	Sat, 30 Sep 2023 14:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DF381276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFzULQ6mEbtT; Sat, 30 Sep 2023 14:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D40008126A;
	Sat, 30 Sep 2023 14:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40008126A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C42F51BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989BF81274
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 989BF81274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAqgiAFnY8Nh for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:20:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D14B08126A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D14B08126A
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3C2F1C0004;
 Sat, 30 Sep 2023 14:20:05 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmap6-00Ezr0-4i; Sat, 30 Sep 2023 16:20:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230929222724.2372985-1-peter@korsgaard.com>
Date: Sat, 30 Sep 2023 16:20:00 +0200
In-Reply-To: <20230929222724.2372985-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 30 Sep 2023 00:27:24 +0200")
Message-ID: <87edifagkv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH-2023.02.x] package/{glibc,
 localedef}: security bump to 2.36-117
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2023-4527: If the system is configured in no-aaaa mode via
 > /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
 > family, and a DNS response is received over TCP that is larger than
 > 2048 bytes, getaddrinfo may potentially disclose stack contents via
 > the returned address data, or crash.

 > CVE-2023-4806: When an NSS plugin only implements the
 > _gethostbyname2_r and _getcanonname_r callbacks, getaddrinfo could use
 > memory that was freed during buffer resizing, potentially causing a
 > crash or read or write to arbitrary memory.

 > CVE-2023-5156: The fix for CVE-2023-4806 introduced a memory leak when
 > an application calls getaddrinfo for AF_INET6 with AI_CANONNAME,
 > AI_ALL and AI_V4MAPPED flags set.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
