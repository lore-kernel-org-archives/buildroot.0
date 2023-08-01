Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAA2C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628646119A;
	Tue,  1 Aug 2023 21:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628646119A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2B9RpbktgAT; Tue,  1 Aug 2023 21:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80026118F;
	Tue,  1 Aug 2023 21:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80026118F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1985E1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D7840147
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D7840147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVLg18WeFBsS for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:25:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E123B40181
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E123B40181
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7383E0004;
 Tue,  1 Aug 2023 21:25:40 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:25:39 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230801232539.429bbebd@windsurf>
In-Reply-To: <20230731154739.1371164-1-neal.frager@amd.com>
References: <20230731154739.1371164-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690925141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8haoFK6aA7HCfI19yJ9/xOpbetskdJpTggjdZfKtqw=;
 b=m9FKOA0kJF/dScKFYv+fOPi+vinmRtKgv41wpH5ZjNGr7vbONYjJAvfqvt3a4LtFAWNiS/
 AvctyCUhBXdCcJA2Knf3L2fyXjS10YhZr+aOBIbSPYodYzalozIQ/X0uoztzDkobOF1HGY
 E7FLwrYedGUDQhP54YYxpN8jGyDCQO4FITP+KmBDkHnh2vJ3POWHVVAeaarBHpHK5tZyVd
 Jigu9h/hK1qhaxCAK74BOAYOFxOtAjxx4NYvYhKoMSruVW0X8lGKlQDulN70P8BpGuM5Uz
 s93LerZWPYaCJl2IKfKrC8cRLVo8ok7ueoKUM4B8qPv64NzXdVXqHJvWvPyvtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m9FKOA0k
Subject: Re: [Buildroot] [PATCH v2 1/2] board/zynqmp: fix atf build failure
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 31 Jul 2023 16:47:38 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Binutils 2.39 now warns when a segment has RXW permissions:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> 
> This causes the following build error:
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
> permissions.
> 
> This patch applies the upstream boot/arm-trusted-firmware/v2.6 patch already
> included with buildroot to solve the problem.
> 
> Fixes: https://developer.trustedfirmware.org/T996

This Fixes: tag is not really useful. What we're interested in in the
context of Buildroot is which Buildroot issue is being fixed. So I
changed that to:

    Fixes:
    
      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556414 (zynqmp_kria_kv260)
      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556417 (zynqmp_zcu102)
      https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556420 (zynqmp_zcu106)
    
when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
