Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4CAC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCEE60AED;
	Thu,  3 Nov 2022 13:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCEE60AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o07e0eKcCSyZ; Thu,  3 Nov 2022 13:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86BCC60AA3;
	Thu,  3 Nov 2022 13:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86BCC60AA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70B441BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B71C41634
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B71C41634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiK7Ig-q1Mcy for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:47:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5F44162D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE5F44162D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:47:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13A594000C;
 Thu,  3 Nov 2022 13:46:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqaYc-00AWpn-42; Thu, 03 Nov 2022 14:46:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
 <8785_1663677905_6329B5D1_8785_15_1_b7ced13c9a2651fbf36d4009a03c0590457c82a3.1663677504.git.yann.morin@orange.com>
Date: Thu, 03 Nov 2022 14:46:58 +0100
In-Reply-To: <8785_1663677905_6329B5D1_8785_15_1_b7ced13c9a2651fbf36d4009a03c0590457c82a3.1663677504.git.yann.morin@orange.com>
 (yann morin's message of "Tue, 20 Sep 2022 14:45:01 +0200")
Message-ID: <87tu3gp2ul.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/gpsd: actually wait for after
 chrony
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > We use gpsd's upstream systemd service unit files, which define a
 > dependency on chronyd.service. And indeed, upstream chrony does
 > provide an example service unit file chronyd.service.

 > However, in Buildroot, we are not using chrony's upstream unit, we are
 > providing our own, much simplified as compared to upstream. We install
 > that unit file as chrony.service. Notice that subtle difference in the
 > name: upstream's is chronyd, with a trailing 'd', while ours just
 > chrony, without the trailing 'd'.

 > As a consequence, in a Buildroot-built system, gpsd does not wait for
 > after chrony is started, which causes all kind of mayhem when gpsd
 > actually needs to talk to chrony.

 > We have multiple options:
 >  1. use chrony's upstream unit file;
 >  2  rename the chrony service file as installed by Buildroot, to match
 >     what chrony would actually do;
 >  3. tweak gpsd's unit file to refer to chrony.service, not
 >     chronyd.service;
 >  4. leverage systemd's flexibility in how units are defined, and provide
 >     a drop-in to complement gpsd's unit to also wait for chrony.service.

 > For 1. it is totally unknown why we do have our unit file to begin with,
 > rather than use upstream's. Since upstream's is much more complex than
 > ours, using it might have unforetold consequences.

 > Going with 2. seems the easiest at first sight, but then it would break
 > systems where users provide their own drop-ins for chrony, as they would
 > no longer match.

 > 3. is relatively easy, but running sed is not entirely nice. Besides, it
 > semantically should be a post-install hook, rather than a systemd-init
 > command, but again that makes things a bit more ugly. Also, some people
 > may have their own gpsd.service in an overlay or whatever, which would
 > break our fixup.

 > Solution 4. is pretty straightforward, although it is not ideal either.

 > To be noted: some distributions, like Ubuntu 20.04 at least, do install
 > the chrony unit file as chrony.service, like Buildroot does. However,
 > there does not appear to be any fixup in gpsd for this discrepancy, as
 > their gpsd install still refers to chronyd.service. So that does not
 > help us decide what to do.

 > So, eventually, we decided to go with solution 4, which has the least
 > impact on the system, and keeps the status-quo for all other use-cases.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Alex Suykov <alex.suykov@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
