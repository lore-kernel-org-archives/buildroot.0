Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AC9EDE99C
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D932660F49;
	Thu, 14 Sep 2023 09:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D932660F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRZG8I1tjIah; Thu, 14 Sep 2023 09:14:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21FD660F36;
	Thu, 14 Sep 2023 09:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21FD660F36
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4121BF4D7
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064A540491
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 064A540491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oXrm84F30lR for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:14:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE39B4017A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE39B4017A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5613040010;
 Thu, 14 Sep 2023 09:14:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgiQm-0088io-98; Thu, 14 Sep 2023 11:14:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230831173736.84288-1-ju.o@free.fr>
Date: Thu, 14 Sep 2023 11:14:36 +0200
In-Reply-To: <20230831173736.84288-1-ju.o@free.fr> (Julien Olivain's message
 of "Thu, 31 Aug 2023 19:37:36 +0200")
Message-ID: <87msxpxgjn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: python-magic-wormhole:
 fix random failures
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The magic-wormhole "receive" command can output "waiting" messages
 > when key receival or verification are longer than a predefined
 > timeout:
 > https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L135

 > The intent is to have an interactive user experience.

 > This behavior makes the runtime test unreliable as the test always
 > expect the sent message as the exact output. When the test execution
 > is slower, it sometimes get the "waiting" message instead of the
 > expected message.

 > Some test jobs are succeeding:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4968059737
 > while some other are failing.

 > magic-wormhole can override those timers with environment variables.
 > See:
 > https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L26

 > This commit sets those environment variable to larger values
 > (100 seconds instread of 1 by default), to make sure the test will
 > always pass.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4962923235

 > Reported-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
