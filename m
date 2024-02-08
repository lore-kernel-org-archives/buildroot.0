Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B252C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 08:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FDFC41ADE;
	Thu,  8 Feb 2024 08:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yEublruFz_R; Thu,  8 Feb 2024 08:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28C0341B01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C0341B01;
	Thu,  8 Feb 2024 08:03:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD931BF476
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 08:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B8541B01
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 08:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eLMxMrkc7Bb for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 08:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F34DF41ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34DF41ADE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F34DF41ADE
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 08:03:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 333E140002;
 Thu,  8 Feb 2024 08:02:57 +0000 (UTC)
Date: Thu, 8 Feb 2024 09:02:56 +0100
To: kilian.zinnecker@mail.de
Message-ID: <20240208090256.25b75053@windsurf>
In-Reply-To: <2254622.iZASKD2KPV@laptop>
References: <20231130223101.132221-1-kilian.zinnecker@mail.de>
 <20240207204337.561d3b54@windsurf> <2254622.iZASKD2KPV@laptop>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707379377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKtYX6S9bWgY+R0vy0oBoGCbC8fEXVGjURZiAmqLPpk=;
 b=hfgrTrn4ZYh1N8mYbDBp8HGsleG6KREXjRf7lkaLGPeMgjL1/GBwCowGUUS5Z2Dy571mil
 IL2oePx4Gt6EzUUhaOkc8vLP3oBLmNSchr3RvMke+n6XklwP8bXsWbdQo5FgKg981WXBUi
 TrmfQZlA38dlHKsTca1xei52v+zQHxY0W0TTca3wZYTsWXYY5oP1bVW/Avv62UNDCHDud0
 T4wzXdkj3tZM2Nhd7NCUjfsQN2LsYZtjh7HdAJ8EQfbU2kh4MIlCl7IN0HfTrjrQFt//tY
 XFTeiKfGk2CtmVv8HO0l0edHtHRGj7gmkCkLuHEmS0OCmttPC3dpPp3zsJqNAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hfgrTrn4
Subject: Re: [Buildroot] [PATCH 1/1] configs/rzboard_v2L_defconfig: new
 defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kilian,

On Thu, 08 Feb 2024 00:22:21 +0100
kilian.zinnecker@mail.de wrote:

> Yes, I agree and would prefer a bootable image, containing a uboot built by 
> buildroot as part of the boot chain, too. I therefore tried to run uboot from 
> SD card at first (using the information from the hardware manual you refered 
> to), but I was not successful. Hence I asked the author of a hackster.io 
> article about the RZBoard V2L boot [1], whether he could help me. He told me, 
> that he asked the Avnet BSP team, and "they confirmed there is no official 
> support for storing bootloader files on micro sd". This matches his article, 
> listing only eMMC and QSPI as possible locations for the bootloader.
> 
> However, maybe this information is incomplete and there is in fact a way to 
> run uboot from SD card, which I just was not able to get working. I can try to 
> reach out to the Avnet support myself. And even if there is no way to do that, 
> I can try to adjust the board support to build uboot, figure out how to flash 
> uboot to the eMMC and document that in the readme. May take me some time 
> though at the moment. 

Thanks for the additional details. Indeed in this case, the best option
would be to have our defconfig build a uboot that works on QSPI, or
eMMC, and provide the instructions on how to reflash the QSPI or eMMC.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
