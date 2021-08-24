Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36435C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 22:02:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7468611C8
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 22:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7468611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C278A60745;
	Tue, 24 Aug 2021 22:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAj3nCz4JIW4; Tue, 24 Aug 2021 22:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690BB61390;
	Tue, 24 Aug 2021 22:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 230B41BF2A2
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 22:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCA240742
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 22:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwUfRsQamDHI for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 22:02:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3ED4406EC
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 22:02:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A5D56C0005;
 Tue, 24 Aug 2021 22:02:43 +0000 (UTC)
Date: Wed, 25 Aug 2021 00:02:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210825000242.0bbf2fa9@windsurf>
In-Reply-To: <20210822194644.3260223-1-romain.naour@gmail.com>
References: <20210822194644.3260223-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: test_atf: bump the custom
 version to v2.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 22 Aug 2021 21:46:44 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This version bump is needed to pass the ATF test with
> hardening option enabled (-fstack-protector-strong)
> 
> With the version v2.2, ATF fail due to undefined references:
> 
> ./build/juno/release/bl2u/arm_tzc400.o: In function `arm_tzc400_setup':
> arm_tzc400.c:(.text.arm_tzc400_setup+0x10): undefined reference to `__stack_chk_guard'
> arm_tzc400.c:(.text.arm_tzc400_setup+0x18): undefined reference to `__stack_chk_guard'
> arm_tzc400.c:(.text.arm_tzc400_setup+0xb8): undefined reference to `__stack_chk_guard'
> arm_tzc400.c:(.text.arm_tzc400_setup+0xcc): undefined reference to `__stack_chk_fail'
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Isn't this fixed since ccac9a5bbbd7374187a0f0017101ece0c202851d perhaps ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
