Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D1D2447B
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 06:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A536581EAA;
	Fri, 11 Oct 2024 06:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO6_hgjycQwP; Fri, 11 Oct 2024 06:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9895881EAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9895881EAB;
	Fri, 11 Oct 2024 06:34:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61A251BF385
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F8EF41521
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNabhYKEk_WB for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 06:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9131840150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9131840150
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9131840150
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 06:34:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DA746000C;
 Fri, 11 Oct 2024 06:34:51 +0000 (UTC)
Date: Fri, 11 Oct 2024 08:34:50 +0200
To: Ludwig Kormann <ludwig.kormann@ict42.de>
Message-ID: <20241011083450.50b5e81c@windsurf>
In-Reply-To: <20241010091531.1943185-2-ludwig.kormann@ict42.de>
References: <20241010091531.1943185-1-ludwig.kormann@ict42.de>
 <20241010091531.1943185-2-ludwig.kormann@ict42.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728628491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=200dn9ILVfknRFTM4A18movRn9Ggn3AUALtV2n7hNA4=;
 b=RSqJAE/fBMf6brs7OLirurq6uSssW+STEypS08YJ5b6TSd7yjc7abE6ZvvJAjyv5W1TJos
 ak5oS/Yo4p9X5npx/8JT5Qn3+8aznWFfAbsKTr1Nj799L5suXkqeMrrJKUh+jCVHxR91y0
 lyTop2OLmER8l9uI2h7WzhIbDU0ZY/TCpoaXMJtdPVL3xAzLVVNJ8tUagLtKA1QBHTTQhO
 PEvLbFG5VY2+m1fE0FP6mu+pRMqfQJ2xhJuKNXvBFcvbPKbjL4NYuCH94P+za9qfUe7Vya
 DD5D5VMLP5JHarBNhEWxiIvjvQ+5SHmhceIEuvgEHPmLXxM56RzOtuXUOSK3eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RSqJAE/f
Subject: Re: [Buildroot] [PATCH 2/2] configs/icnova-a20-adb4006: add uboot
 patch for reliable bootclk
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ludwig,

On Thu, 10 Oct 2024 11:15:31 +0200
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

> Up until now cpu clock gets initialized at 384 MHz, which is
> the highest supported cpu clock.
> 
> Recent A20 batches show an increased percentage of modules
> reacting very sensitive to operating conditions outside the
> specifications.
> 
> The cpu dies very shortly after PLLs, core frequency or cpu
> voltage are missconfigured. E.g.:
> - uboot SPL selects 384 MHz as cpu clock which requires a cpu
>   voltage of at least 1.1 V.
> - Linux CPU Frequency scaling with most sun7i dts will reduce
>   cpu voltage down to 1.0 V.
> - When intiating a reboot or reset from linux the cpu voltage
>   may keep the 1.0 V configuration and the cpu dies during SPL
>   initialization.
> 
> Therefore reduce cpu clock at uboot SPL initialization down
> to 144 MHz from 384 MHz.
> 
> Use patch until KConfig option in uboot becomes available.
> 
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>

Thanks as well for your patch! Some comments below.

> ---
>  .../uboot-sun7i-a20-reliable-bootclk.patch            | 11 +++++++++++
>  configs/icnova-a20-adb4006_defconfig                  |  1 +
>  2 files changed, 12 insertions(+)
>  create mode 100644 board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch
> 
> diff --git a/board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch b/board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch
> new file mode 100644
> index 0000000000..ce83f59e4b
> --- /dev/null
> +++ b/board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch
> @@ -0,0 +1,11 @@
> +--- uboot/arch/arm/include/asm/arch-sunxi/clock_sun4i.h	2024-10-10 09:34:01.346401734 +0200
> ++++ uboot/arch/arm/include/asm/arch-sunxi/clock_sun4i.h.modified	2024-10-10 09:33:55.146402528 +0200

We require all patches to have a description, a Signed-off-by: line and
an Upstream: tag. Also, since U-Boot is using Git upstream, we strongly
prefer a patch generated by "git format-patch".

> diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
> index 948b054d83..4cf7826346 100644
> --- a/configs/icnova-a20-adb4006_defconfig
> +++ b/configs/icnova-a20-adb4006_defconfig
> @@ -38,6 +38,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="icnova-a20-adb4006"
> +BR2_TARGET_UBOOT_PATCH="board/in-circuit/icnova-a20-adb4006/uboot-patches"

Instead of this, could you use BR2_GLOBAL_PATCH_DIRECTORIES? It allows
to patch all packages, not just u-boot, and is anyway going to be
needed to provide the hashes, as I suggested in my review of your PATCH
1/2.

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
