Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C605C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32DA812DB;
	Thu, 11 Aug 2022 11:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E32DA812DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWtr7OS8HHOk; Thu, 11 Aug 2022 11:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D30081285;
	Thu, 11 Aug 2022 11:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D30081285
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D32F01BF403
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACDFE408D0
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDFE408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ql0_0C3k_XHW for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:03:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC103408CF
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC103408CF
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:03:28 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 688EABDE7443;
 Thu, 11 Aug 2022 12:54:56 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 11 Aug 2022 10:54:56 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <mailman.8980.1660210862.92745.buildroot@buildroot.org>
References: <mailman.8980.1660210862.92745.buildroot@buildroot.org>
Message-ID: <4e30650d952bc4dbe44f0ffcd92810df@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [Aarch64] libstdc++ segfault at end of execution
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Lance,

> I'm having segfaulting issues with c++ on aarch64 using uclibc-ng.
> Anyone else using aarch64 with uclibc-ng?
> I submitted a bug to gcc so am linking that here for this description.
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106581

Some years ago, I switched from uClibc to musl on aarch64, because 
uClibc did not fully implement thread-local storage, at least not in 
combination with multi-threaded execution, on this architecture.

The C++ library uses TLS for example to store exception related 
information, which, in my case resulted in a segmentation fault whenever 
the first exception handler was invoked, because the TLS area was 
inaccessible from the current thread.

My notes show that tests in 2021 still showed this problem.

Kind regards,
Andreas

[1] https://www.etalabs.net/compare_libcs.html

> thanks,
> Lance Fredrickson


------------------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
