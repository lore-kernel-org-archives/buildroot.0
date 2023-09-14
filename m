Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874B9EDE98F
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A00E416F8;
	Thu, 14 Sep 2023 08:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A00E416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6PYQCqWQigb; Thu, 14 Sep 2023 08:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BB9F408C0;
	Thu, 14 Sep 2023 08:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB9F408C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C49571BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABBB641BBB
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBB641BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SKWElhI9tHU for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:23:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E1A441B9C
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1A441B9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B2D3240005;
 Thu, 14 Sep 2023 08:23:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qghdJ-00851c-Ub; Thu, 14 Sep 2023 10:23:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230828223215.2428514-1-thomas.petazzoni@bootlin.com>
Date: Thu, 14 Sep 2023 10:23:29 +0200
In-Reply-To: <20230828223215.2428514-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 29 Aug 2023 00:32:14
 +0200")
Message-ID: <87cyylyxha.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/log4cxx: ignore CVE-2023-31038
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > CVE-2023-31038 affects log4cxx only if ODBC is supported. While
 > CVE-2023-31038 has been fixed in newer versions of log4cxx, there is
 > quite a huge gap to do a version bump, and the commit that fixes
 > CVE-2023-31038 could not be identified.

 > Therefore, we want to rely on the fact that our log4cxx package does
 > not support ODBC: there is indeed no explicit dependency on our
 > unixodbc package in log4cxx.mk. However, log4cxx automatically detects
 > if ODBC is available and if it is, it uses it.

 > So what we do in this commit is backport an upstream commit, which
 > adds explicitly options to enable/disable ODBC and ESMTP support, and
 > we use them to (1) always disable ODBC and (2) explicitly
 > enable/disable ESMTP support.

 > Thanks to ODBC being disabled, we're not affected by CVE-2023-31038.

 > Of course, there is a potential regression for users who were relying
 > on the implicit unixodbc dependency, but as we could not identify the
 > commit fixing the CVE-2023-31038, this is the best we can do at the
 > moment.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
