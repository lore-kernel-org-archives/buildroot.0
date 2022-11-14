Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F17C43217
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D0A80BD2;
	Mon, 14 Nov 2022 16:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D0A80BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 132jBjz3uyZX; Mon, 14 Nov 2022 16:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0664080BD0;
	Mon, 14 Nov 2022 16:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0664080BD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA56B1BF32B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C593980BCF
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C593980BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTedJPFyfnfu for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 16:13:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5866880BCB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5866880BCB
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 16:13:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DD18FF80C;
 Mon, 14 Nov 2022 16:13:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouc5c-0071Fa-5v; Mon, 14 Nov 2022 17:13:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221105135618.322293-1-fontaine.fabrice@gmail.com>
Date: Mon, 14 Nov 2022 17:13:40 +0100
In-Reply-To: <20221105135618.322293-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 Nov 2022 14:56:18 +0100")
Message-ID: <875yfhjyyz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with
 wolfssl >= 5.0
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with wolfssl raised since bump to
 > version 5.2.0 in commit 14e0c4de719a0d63192cc5de66a608f75297f37d and
 > https://github.com/wolfSSL/wolfssl/commit/33cb8231481d5beb46b57511c2630aba36028256:

 > /home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:
 > In function 'handle_wolfssl_asn_error':
 > /home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:339:10:
 > error: 'ASN_NTRU_KEY_E' undeclared (first use in this function); did
 > you mean 'ASN_ECC_KEY_E'?
 >   339 |     case ASN_NTRU_KEY_E:
 >       |          ^~~~~~~~~~~~~~
 >       |          ASN_ECC_KEY_E

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3261b0035c8aadd1b62538b53e03af1cd8a7b312

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
