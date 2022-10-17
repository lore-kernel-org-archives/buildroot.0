Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132C0C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A35F40A04;
	Mon, 17 Oct 2022 08:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A35F40A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iT3Mkw1Gxt8; Mon, 17 Oct 2022 08:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 566EE40531;
	Mon, 17 Oct 2022 08:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 566EE40531
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 386651BF38A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2140E8142B
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2140E8142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seFyTYaKREwD for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:34:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A6B81429
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2A6B81429
 for <buildroot@busybox.net>; Mon, 17 Oct 2022 08:34:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63F71240004;
 Mon, 17 Oct 2022 08:34:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1okLZe-006MOa-Fo; Mon, 17 Oct 2022 10:34:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
Date: Mon, 17 Oct 2022 10:34:14 +0200
In-Reply-To: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Tue, 11 Oct 2022 17:02:09
 +0300")
Message-ID: <87a65uc0hl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: fix SSP
 support
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

 > Commit ccac9a5bbbd ("boot/arm-trusted-firmware: don't force
 > ENABLE_STACK_PROTECTOR") fixed a build failure but also effectively
 > disabled SSP entirely for ATF. This is because ENABLE_STACK_PROTECTOR is
 > set to 0 unconditionally in make_helpers/defaults.mk, overwriting any
 > environment set value. So we must pass ENABLE_STACK_PROTECTOR in
 > MAKE_OPTS for it to be effective. But to avoid said build failure we
 > can't pass ENABLE_STACK_PROTECTOR=0.

 > Only pass ENABLE_STACK_PROTECTOR when
 > BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is enabled. Drop SSP_LEVEL value for
 > the !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP case which is now unused.

 > Cc: Dick Olsson <hi@senzilla.io>
 > Cc: Sergey Matyukevich <geomatsi@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Heh, I just spent some time investigating some ATF link failures for
avenger96_defconfig after we moved to glibc by default (which enables
SSP support) and got to the same conclusion ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
