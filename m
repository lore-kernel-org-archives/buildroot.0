Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC8C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD2BD61020;
	Mon, 27 Feb 2023 14:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD2BD61020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1de5JFFKnGOf; Mon, 27 Feb 2023 14:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B456100C;
	Mon, 27 Feb 2023 14:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B456100C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4F11BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6925D402F4
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6925D402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egb5tk1K05QD for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:57:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BBE24013D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BBE24013D
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:57:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 980C9FF811;
 Mon, 27 Feb 2023 14:57:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWewM-009Fin-Bc; Mon, 27 Feb 2023 15:57:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
References: <ME3P282MB1347B8B822841FCC27B501D0B9AE9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
Date: Mon, 27 Feb 2023 15:57:22 +0100
In-Reply-To: <ME3P282MB1347B8B822841FCC27B501D0B9AE9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
 (Alberto Fahrenkrog's message of "Mon, 27 Feb 2023 00:17:25 +0000")
Message-ID: <87o7pfma0d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [Help] Building from a private PyPi server
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alberto" == Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au> writes:

 > Hello all,
 > In our company we have custom Python packages stored in a private PyPi
 > server. To install them we simply add the --extra-index-url in our
 > requirements.txt file when using pip.

Are you aware of the security issues with --extra-index-url?

https://github.com/pypa/pip/issues/9612

 > The packages are also available for manual download from the server,
 > however all URLs to any .tar.gz file are in the form
 > https://git.ourserver.com/packages/pypi/package-name/version-number/files/1234. This
 > leads me to the following options (I think):


 >   * Try to get Buildroot to use the private PyPi server. I had a look
 > at the "scanpypi" script and it generated the .mk and .in files for a
 > regular PyPi package, but I could not find a way to tell scanpypi to
 > use an extra url or private pypi address

scanpypi is indeed hard coded to use pypi and their JSON API
(https://pypi.org/pypi/{pkg}/json), so not trivial to use with a local
repo. Do your private server expose the same API? If so, I guess we
could add an argument to scanpypi to use a custom URI instead of
pypi.org.


 >   * Find a way, using wget, to download the package from the address
 > above. Unfortunately I've had no luck with that yet. With the command:
 > wget
 > https://ourserver.com/-/packages/pypi/package-name/version_nr/files/5525

Notice: You have an additional /-/ compared to the URL above.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
