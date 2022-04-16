Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588E2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 08:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C6D60A99;
	Sat, 16 Apr 2022 08:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SB4o44lu3wLu; Sat, 16 Apr 2022 08:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02A94607D6;
	Sat, 16 Apr 2022 08:30:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4E6C1BF41A
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 08:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C09C5607D6
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 08:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8DtOoTillr1 for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 08:30:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E15BE607A1
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 08:30:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5FF120005;
 Sat, 16 Apr 2022 08:29:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nfdoa-00EIp2-P0; Sat, 16 Apr 2022 10:29:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <Eugen.Hristev@microchip.com>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com>
 <20220324082433.GA3649946@scaer> <87fsn2b4ht.fsf@dell.be.48ers.dk>
 <df314344-f151-7ae4-1e56-b65b8532d6d2@microchip.com>
Date: Sat, 16 Apr 2022 10:29:56 +0200
In-Reply-To: <df314344-f151-7ae4-1e56-b65b8532d6d2@microchip.com> (Eugen
 Hristev's message of "Fri, 15 Apr 2022 10:54:42 +0000")
Message-ID: <871qxxa0sb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
Cc: Jason@zx2c4.com, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <Eugen.Hristev@microchip.com> writes:

Hi,

 >> Committed to 2021.02.x and 2022.02.x, thanks.

 > Hello Jason,

 > I noticed that you worked a lot on the S20urandom init script for 
 > sysvinit in buildroot.

 > I recently updated from 2022.02 release to 2022.02.1 and now on booting 
 > all our boards, I noticed this message:

 > "Initializing random number generator: FAIL"

 > With the 2022.02 release, with the same kernel, the message stated "OK".

This comes from an error writing the seed value to /dev/urandom:

https://git.buildroot.org/buildroot/tree/package/urandom-scripts/S20urandom#n22

Given that you state that it displayed OK in 2022.02, I take it that you
have a writable and persistent /var/lib, so /var/lib/urandom-seed is
present?

Maybe just try doing that by hand (without the 2>/dev/null) and see what
error message dd displays?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
