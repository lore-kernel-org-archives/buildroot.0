Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6ABC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB734042F;
	Tue, 15 Nov 2022 13:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB734042F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlcsYv-QqrEG; Tue, 15 Nov 2022 13:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE06415E1;
	Tue, 15 Nov 2022 13:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE06415E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC0431BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1994814BB
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1994814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUxk8DtniiBU for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:10:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892A48144B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 892A48144B
 for <buildroot@busybox.net>; Tue, 15 Nov 2022 13:10:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF129E000E;
 Tue, 15 Nov 2022 13:10:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouvhi-008eOF-Qr; Tue, 15 Nov 2022 14:10:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <a165e1785fec7f9b4ce3e38f1282c5ab87bff511.1668366594.git.baruch@tkos.co.il>
Date: Tue, 15 Nov 2022 14:10:18 +0100
In-Reply-To: <a165e1785fec7f9b4ce3e38f1282c5ab87bff511.1668366594.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Sun, 13 Nov 2022 21:09:54
 +0200")
Message-ID: <87y1scfjnp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix SSP disable
 in v2.2
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
Cc: buildroot@busybox.net, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > ATF version 2.2 and older does not disable SSP when
 > ENABLE_STACK_PROTECTOR is not set. This is because the compiler enables
 > SSP by default, and ATF does not pass -fno-stack-protector to the
 > compiler. Upstream commit 7af195e29a42 ("Disable stack protection
 > explicitly") fixed the issue for v2.3 and newer.

 > Add -fno-stack-protector in CFLAGS when
 > BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set to fix older ATF
 > versions.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821171

 > Cc: Dick Olsson <hi@senzilla.io>
 > Cc: Sergey Matyukevich <geomatsi@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
