Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10BEC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A362E847A6;
	Fri, 12 Jul 2024 19:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQNCKVazEUi2; Fri, 12 Jul 2024 19:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B57A98479F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57A98479F;
	Fri, 12 Jul 2024 19:12:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1F6C1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD44241574
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpRxRFUe_GkG for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C2A5408B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2A5408B6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C2A5408B6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:12:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 666B0240002;
 Fri, 12 Jul 2024 19:11:58 +0000 (UTC)
Date: Fri, 12 Jul 2024 21:11:57 +0200
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <20240712211157.13910779@windsurf>
In-Reply-To: <20240712182712.216799-1-rgallaispou@gmail.com>
References: <20240712182712.216799-1-rgallaispou@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720811518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaY9+QKUPXr5MCVcuHjhmYAP/teYofDICrkP434ZrQE=;
 b=FmBDelGNMe6JyBHpKxj3IbVMOus84to5XO4k0Ye1XP88FR1U7bKESSc4EjQDcmXXk6pcCr
 wGkfgR0eFGfBao/6iLuoexkXqcvb5om1IqTFE66P0WCHmEKXXhXzPSEHX8wPYIIEzr0Xwb
 4TszRvI9RfxaJSlTm5DxH9IquaD/xJ0gR2Coo+RW7zLohXcpFJeaA64rkuT3XLJOdvC68+
 HnvbyTRlJlpc8fyNdtnbDGz9zoxPuVQV+fV7xs7LvkCeTKPPP3fdFeMPj8gKZeUEemP55i
 dz3JXCcvHqPYSV7h/QFKIbtNweqqJcI5SyL0mz+aQWOJglpxHlVoYHq/BgSRbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FmBDelGN
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp157c_dk2: bump Linux to
 6.9
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
Cc: Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Raphael,

Thanks for your patch. See below a review.

On Fri, 12 Jul 2024 20:27:12 +0200
Raphael Gallais-Pou <rgallaispou@gmail.com> wrote:

> Base config on latest kernel version available.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  configs/stm32mp157c_dk2_defconfig | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
> index c48705b2fb..0e26042b90 100644
> --- a/configs/stm32mp157c_dk2_defconfig
> +++ b/configs/stm32mp157c_dk2_defconfig
> @@ -1,31 +1,17 @@
> -# Architecture
>  BR2_arm=y
>  BR2_cortex_a7=y
> -
> -# Linux headers same as kernel, a 5.13 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y

Please keep the comments and this option (but updated). It seems like
you did a "make savedefconfig", without really worrying about what
changed.

> -
> -# System configuration
>  BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
> -
> -# Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"

We need to keep an explicit kernel version, so that it doesn't
automatically uses the "latest".

I believe it would also make sense to update TF-A and U-Boot at the
same time.

Could you fix up those details, and submit an updated version?

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
