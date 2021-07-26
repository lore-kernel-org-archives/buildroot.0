Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D33C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:07:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D048060BD3
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D048060BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6A760787;
	Mon, 26 Jul 2021 21:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbFWLDly8HvD; Mon, 26 Jul 2021 21:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B548E607A6;
	Mon, 26 Jul 2021 21:07:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90D651BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FC9F402FF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfiPXR1qL8nk for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:07:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8267840295
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:07:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 21938240003;
 Mon, 26 Jul 2021 21:07:16 +0000 (UTC)
Date: Mon, 26 Jul 2021 23:07:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210726230716.2c7079c5@windsurf>
In-Reply-To: <20210726201244.43070-1-buildroot@heine.tech>
References: <20210726201244.43070-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: expose more disable
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marcin Bis <marcin@bis.org.pl>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

(Yann, Arnout, Peter: question for you below.)

On Mon, 26 Jul 2021 22:12:42 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> BlueZ builds a lot of Classic BT profiles by default but allows
> to disable them. This is especially handy when only BLE is needed
> and enabled in the kernel.
> 
> Otherwise this yields warnings like this on bootup:
> 
>  profiles/network/bnep.c:bnep_init() kernel lacks bnep-protocol support
>  src/plugin.c:plugin_init() System does not support network plugin
> 
> Also it allows to disable btmon which should not be needed on
> production systems and is ~800KB in size.
> 
> Expose those options but default to 'y' to no break existing
> configurations.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/bluez5_utils/Config.in       | 36 ++++++++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk | 41 ++++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)

Applied to master, thanks.

Arnout, Peter, Yann: in order to preserve backward compatibility,
Michael has created those new options with a "default y". However,
while it keeps backward compatibility, it also means that all new users
will get a more bloated bluez_utils installation than is probably
necessary. Should we break our backward compatibility rule here and
drop the "default y" on those new options ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
