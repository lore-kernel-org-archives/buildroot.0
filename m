Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED6ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8246B41D85;
	Fri, 16 Sep 2022 21:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8246B41D85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VGUl1SJkEJt; Fri, 16 Sep 2022 21:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8BD41D63;
	Fri, 16 Sep 2022 21:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A8BD41D63
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62C161BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DE5184308
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE5184308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIaI_r8j5ugU for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:52:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE6F80B90
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE6F80B90
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:51:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A25840006;
 Fri, 16 Sep 2022 21:51:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZJFd-008lhz-Az; Fri, 16 Sep 2022 23:51:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220815160124.5038-1-fontaine.fabrice@gmail.com>
 <20220815193133.GJ2854108@scaer>
Date: Fri, 16 Sep 2022 23:51:57 +0200
In-Reply-To: <20220815193133.GJ2854108@scaer> (Yann E. MORIN's message of
 "Mon, 15 Aug 2022 21:31:33 +0200")
Message-ID: <87r10b56o2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uacme: ualpn needs libopenssl
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
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2022-08-15 18:01 +0200, Fabrice Fontaine spake thusly:
 >> ualpn is not compatible with libressl as stated by upstream in
 >> https://github.com/ndilieto/uacme/commit/32546c7caa1626bbef860cf81e53d10e29fca5cb
 >> resulting in the following build failure:
 >> 
 >> ualpn.c: In function 'ssl_client_hello_cb':
 >> ualpn.c:2038:16: error: 'SSL_CLIENT_HELLO_RETRY' undeclared (first
 >> use in this function); did you mean 'SSL_F_CLIENT_HELLO'?
 >> 2038 |         return SSL_CLIENT_HELLO_RETRY;
 >> |                ^~~~~~~~~~~~~~~~~~~~~~
 >> |                SSL_F_CLIENT_HELLO
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/d7d49cfce6f99c59e99c8e15399164fd5ecacc21
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> Changes v1 -> v2 (after review of Yann E. Morin):
 >> - Invert openssl and mbedtls order to avoid a build failure if libressl
 >> and mbedtls are enabled at the same time

 > I've split that in two patches:
 >     package/uacme: fix crypto backend preference order
 >     package/uacme: ualpn needs libopenssl

 > ... and wrote an analysis and a rationale for the first one.

Committed (both) to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
