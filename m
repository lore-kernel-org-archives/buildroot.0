Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323DCC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9964C60BDA;
	Tue, 23 Aug 2022 21:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9964C60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yjsE81UAdqH; Tue, 23 Aug 2022 21:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12EF060B4C;
	Tue, 23 Aug 2022 21:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EF060B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 483901BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F7E381289
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7E381289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bh3TQIWAuIWY for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:21:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F5B81281
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67F5B81281
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 21:21:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAD7760002;
 Tue, 23 Aug 2022 21:21:09 +0000 (UTC)
Date: Tue, 23 Aug 2022 23:21:08 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220823232108.3a8a5ce5@windsurf>
In-Reply-To: <20220816175503.1280276-2-francois.perrad@gadz.org>
References: <20220816175503.1280276-1-francois.perrad@gadz.org>
 <20220816175503.1280276-2-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661289670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQPRSBmnhiPIArqTrlS80Edp3qsQ+r2P5LhL500MKL4=;
 b=mSQnwJ8AvPAPz2phEdzuytT8Ssf8EIIYdGfEeTaKOhOx9mUevVwWZJ72ilkPMuCUARRIHA
 ihWkEdsIGF1xyd43IWUaNatGT3rN3QWJIYLBuJBWq2xd6zS0yJUeGZTdyNMKCyQcmDaloR
 Mydjo+ZIT+F/2c6A9NIek7NFGu1aCkccsAGhfs2JnDVIKk18jvzeaFoadTnHbEzmXp+Tqx
 3NVWyoeuK3vsgtMCISesvhG5cjr/mjFwHgW7vxj4GK7jfCpvEg8HhtVNu2pm0oOjc5qOA+
 Di5UU8FzibVbikGzWFVGyUjgMnm9MzDigOvfcaliDTyipmhAXTOI6DiV95wpsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mSQnwJ8A
Subject: Re: [Buildroot] [PATCH v4 1/2] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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
Cc: buildroot@busybox.net,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Aug 2022 19:55:02 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> This patch adds option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW that allows
> TF-A to encapsulate a pre-loader RCW (Reset Configuration Word) file
> into BL2.
> 
> Upcoming NXP QorIQ family board needs this option.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks, I have applied with some changes.

> ---
>  boot/arm-trusted-firmware/Config.in               | 6 ++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index 100ac8348..2a59a325d 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -90,6 +90,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
>  	  platforms were ATF encapsulates the second stage bootloader
>  	  (such as U-Boot).
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW

I have moved this option further down, next to the options where we can
say what BL32 to use, what BL33 to use. It made more sense to me than
to have the option in the middle of the list of images to build.

> +	bool "Include RCW"

Changed to "Include NXP RCW" to hint it's some NXP-specific stufff.

> +	select BR2_PACKAGE_HOST_QORIQ_RCW

Changed to "depends on". Indeed, sub-options of
BR2_PACKAGE_HOST_QORIQ_RCW must be set for this to work correctly, so
the user needs to be aware that qoriq-rcw is used.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
