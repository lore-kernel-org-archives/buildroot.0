Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF043C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2548218C;
	Sat,  5 Nov 2022 10:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2548218C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoRW8hyXg_k3; Sat,  5 Nov 2022 10:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ED282187;
	Sat,  5 Nov 2022 10:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0ED282187
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C32041BF4E6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96F4540179
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F4540179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZneOQRrYuYpF for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 10:02:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FBC9400F2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FBC9400F2
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 10:02:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2A5CE0009;
 Sat,  5 Nov 2022 10:02:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1orG0D-00CNvD-Mx; Sat, 05 Nov 2022 11:02:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20221025190236.1190494-1-james.hilliard1@gmail.com>
Date: Sat, 05 Nov 2022 11:02:13 +0100
In-Reply-To: <20221025190236.1190494-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 25 Oct 2022 13:02:36 -0600")
Message-ID: <87pme1n2hm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: bypass configure shell
 wrapper
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > The configure file is a shell script which searches for a predefined
 > python binary and then calls configure.py with that.

 > As we already call configure with the desired python binary we should
 > call configure.py directly so that the expected python binary is used
 > and so that the shell wrapper doesn't throw spurious interpreter
 > validation errors.

 > This also avoid spurious errors due to the configure shell wrapper
 > missing supported python versions, for example this fixes:
 > Node.js configure: Found Python 3.11.0...
 > Please use python3.10 or python3.9 or python3.8 or python3.7 or python3.6.
 > 	/usr/bin/python3.10 ./configure

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
