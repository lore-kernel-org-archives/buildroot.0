Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A749C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D57D1417D6;
	Thu, 29 Feb 2024 15:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEnCF1FVRLZM; Thu, 29 Feb 2024 15:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCEC4417D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCEC4417D8;
	Thu, 29 Feb 2024 15:14:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 029EA1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F154C418BB
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2a_ndc8lEYch for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBC3A418B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC3A418B9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBC3A418B9
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:14:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADD22C0005;
 Thu, 29 Feb 2024 15:14:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfi6p-004lr9-09;
 Thu, 29 Feb 2024 16:14:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240121202422.1598129-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Feb 2024 16:14:06 +0100
In-Reply-To: <20240121202422.1598129-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jan 2024 21:24:22 +0100")
Message-ID: <87a5nji9q9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: don't export
 arc4random
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't export arc4random to fix the following libcurl build failure
 > raised since bump of libcurl to version 8.5.0 in commit
 > aaa9438b96f88b1ecbf5eb9a1aebef8010835b8d and
 > https://github.com/curl/curl/commit/7925ba431b9a099daee1fa21d36c21887f787ad5:

 > rand.c: In function 'randit':
 > rand.c:146:26: error: implicit declaration of function 'arc4random';
 > did you mean 'srandom'? [-Werror=implicit-function-declaration]
 >   146 |     *rnd = (unsigned int)arc4random();
 >       |                          ^~~~~~~~~~
 >       |                          srandom
 > cc1: some warnings being treated as errors

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8b7988629f1887be15c97b8c511d25443ba110d8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
