Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804D9C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07F6B408F7;
	Wed,  2 Nov 2022 22:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F6B408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alQnabjYjeXJ; Wed,  2 Nov 2022 22:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E455E40761;
	Wed,  2 Nov 2022 22:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E455E40761
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99D001BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70D92817A9
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D92817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VstFoRx3tG7 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:45:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56EF5817A5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56EF5817A5
 for <buildroot@busybox.net>; Wed,  2 Nov 2022 22:45:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DCD9424000A;
 Wed,  2 Nov 2022 22:45:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqMTn-007mcW-Rv; Wed, 02 Nov 2022 23:45:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
Date: Wed, 02 Nov 2022 23:45:03 +0100
In-Reply-To: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 28 Oct 2022 08:36:27
 +0300")
Message-ID: <87k04dt1qo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't enable SSP
 by default
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@busybox.net, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > SSP support requires support in ATF platform code. Not all platforms
 > implement plat_get_stack_protector_canary() hook. The result is build
 > failure:

 > (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'

 > Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
 > originally introduces this issue. But then commit ccac9a5bbbd
 > ("boot/arm-trusted-firmware: don't force ENABLE_STACK_PROTECTOR") hid
 > the problem by effectively disabling SSP for all platforms. So only
 > after commit 09acc7cbc91f5 ("boot/arm-trusted-firmware: fix SSP
 > support") the issue showed up.

 > Make SSP an opt-in for platform that actually provide the
 > plat_get_stack_protector_canary() hook.

 > Cc: Sergey Matyukevich <geomatsi@gmail.com>
 > Cc: Dick Olsson <hi@senzilla.io>
 > Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
