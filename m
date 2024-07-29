Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7538FC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 08:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAF8605EB;
	Mon, 29 Jul 2024 08:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOcMhqDmbdZB; Mon, 29 Jul 2024 08:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED41607FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED41607FB;
	Mon, 29 Jul 2024 08:11:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4294F1BF591
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 08:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3060B607FB
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 08:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnXIVIg6_g4i for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 08:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11330605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11330605EB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11330605EB
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 08:11:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F4C120003;
 Mon, 29 Jul 2024 08:11:20 +0000 (UTC)
Date: Mon, 29 Jul 2024 10:11:19 +0200
To: Torben Voltmer <mail@t-voltmer.net>
Message-ID: <20240729101119.22f92091@windsurf>
In-Reply-To: <20240728214222.2515625-1-mail@t-voltmer.net>
References: <20240728214222.2515625-1-mail@t-voltmer.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722240680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVY4TXygyyNEMYbooYDTNQRRYzOF+d7vL4MO5141oxg=;
 b=RCC5dnnvDHI+Jf6KsZ+CJwnDV3Vh3f6R4LH0j4En6kEeDMI0mlWmxqGZTF+/Ng0EVgvLNu
 Zu/5pj0cH6CyY8lH1e4bc7+FFYuoM90vjvlB6VYwpg1dGxX0iv9wDRencIrzSerE3W2Y1F
 6xNuH6opDA6T2O9PIcRCaLBoiNnAeS+V1sq7eaNJCU6954PIt11xcIp444I4olPybyw0b0
 3o/s5OYh5yd6fyL0G25Rkvj90WRuOD4bOy/tYkKmUg7vJuOFlG9W2ueK/O+Obd9k4muQuB
 h0EHxZOofdTb4IQsZAdOo72fltuzs1dZoZVaG8TQ0BF/WRU+mIzjnQnm3Zmu7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RCC5dnnv
Subject: Re: [Buildroot] [PATCH 1/1] package/espflash: add
 BR2_PACKAGE_HAS_UDEV dependency
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

Hello Torben,

On Sun, 28 Jul 2024 23:42:22 +0200
Torben Voltmer <mail@t-voltmer.net> wrote:

> Adding the dependency on BR2_PACKAGE_HAS_UDEV, since espflash links libudev
> (via the libudev-sys crate). This should fix some of the autobuilder
> failures caused by the espflash package.
> 
> Signed-off-by: Torben Voltmer <mail@t-voltmer.net>

Thanks a lot for the patch! However, this patch is not sufficient,
indeed your patch will not ensure that udev is built before espflash.
Therefore, you need to add ESPFLASH_DEPENDENCIES = udev in the .mk file.

Also, in the commit log, could you be more affirmative than "it should
fix some of the autobuilder failures"? Does it fix, or it doesn't?

If it does fix autobuilder issues, could you add something like this:

Fixes:

  http://autobuild.buildroot.net/results/339a5c9a82d2c2d2bd08f9a728b9ee8e8ab48928/

> diff --git a/package/espflash/Config.in b/package/espflash/Config.in
> index 2a7a0f6b38..62b1dc381c 100644
> --- a/package/espflash/Config.in
> +++ b/package/espflash/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_ESPFLASH
>  	bool "espflash"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_HOST_RUSTC
>  	help
>  	  Serial flasher utilities for Espressif devices, based
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_ESPFLASH
>  	  ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.
>  
>  	  https://github.com/esp-rs/espflash
> +
> +comment "espflash needs udev /dev management"
> +	depends on !BR2_PACKAGE_HAS_UDEV

You also need to add:

	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS

here so that the comment doesn't appear on architectures which are
anyway not supported by Rust.

Could you adjust those small details, and send a v2?

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
