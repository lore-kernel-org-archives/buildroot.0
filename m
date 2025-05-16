Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A4EC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6BB41772;
	Fri, 16 May 2025 17:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4KosrkzBCQ7; Fri, 16 May 2025 17:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60411417A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60411417A0;
	Fri, 16 May 2025 17:59:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76ADD13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB2241779
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqaxbbUGgKj3 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3850740853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3850740853
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3850740853
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F9FB1C1104; Fri, 16 May 2025 19:59:35 +0200 (CEST)
Message-ID: <f8fc1b51-bb13-4c04-8fb4-9bcfd9a28b36@rnout.be>
Date: Fri, 16 May 2025 17:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakob Kastelic <jkastelic@thinksrs.com>, buildroot@buildroot.org
References: <20241219214555.3435133-1-jkastelic@thinksrs.com>
Content-Language: en-GB, fr-BE
Cc: vincent.stehle@arm.com
In-Reply-To: <20241219214555.3435133-1-jkastelic@thinksrs.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J+GwInlhrPTX1npX7gimt4LqYFTh9ZRlViM9cBZZ2p0=;
 b=DgWNNy6WW6N7JdTFYdf4w+FOH53O5qw5uc/LsjXT1m3cG0l5NAtU1whgu6VNvgtKbbLC1/
 GXbsqIw4P9XOsln/ivWzsRkpMpwI8MGatOAUZLs5Ygvh87wuA5JWqOdaPxAi8oQEjfnzNe
 H8hxOfTfChah5SXqenowafcfaJjzcJYNSpZc09zdKTCBrTjv3MqU7VaB2sSvA+4GZs6Oqb
 uWGNjHzQ5rN5+So5KX1mMquVmITMOtqj9MVIPtfE8xl1WPYDDA5jAzhpmttuQxY9QsXfaX
 dZauHSohG0rufySfenotmcQftlPAbGY4TBRlbMUgeGAAGDZYGzNV4/mzADPbTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DgWNNy6W
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: optional
 Linux as BL33
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Jakob,

  Very interesting contribution! Sorry that it took us so long to react... I 
have a few questions. I'm also adding Vincent in Cc since he has more knowledge 
about this.

On 19/12/2024 22:45, Jakob Kastelic wrote:
> Arm Trusted Firmware (TF-A) can be used to load U-Boot or another
> bootloader, which in turn loads the Linux kernel. However, TF-A is
> capable of loading the kernel directly. To this end, we need to define
> the BL33 and BL33_CFG compile options containing, respectively, the
> zImage and the DTB.

  I didn't even know this was possible, so I checked the documentation, and it 
talks about setting ARM_LINUX_KERNEL_AS_BL33=1 so I think that should be set as 
well? Perhaps you use a patched TF-A version that has this set by default?

  Also, on aarch64, it seems you have to set RESET_TO_SP_MIN=1 to be able to use 
this option.

  Perhaps it would also be a good idea to add a variant of the qemu defconfigs 
that tests this option. We can use the qemu_arm_vexpress_tz_defconfig, drop 
U-Boot from it, and switch to booting to Linux directly from TF-A. For aarch64 
unfortunately we have no defconfigs that don't require UEFI so we don't have 
anything to test this option with.

  If you don't feel comfortable testing on aarch64, please add a "depends on 
BR2_arm || BR2_armeb" and mention in the commit message why it's excluded.


> This config introduces a new config option,
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33, which sets the BL33 and
> BL33_CFG parameters, and ensures that the kernel is built before the
> TF-A by having linux as a _DEPENDENCY of the TF-A.
> 
> Signed-off-by: Jakob Kastelic <jkastelic@thinksrs.com>
> ---
>   boot/arm-trusted-firmware/Config.in           | 19 +++++++++++++++++++
>   .../arm-trusted-firmware.mk                   |  6 ++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index c8deede9cd..929561fc87 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -182,6 +182,25 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
>   	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
>   	  build system, the dependency between ATF and EDK is reversed.
>   
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33
> +	bool "Linux kernel"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  This option allows to embed the Linux kernel as the BL33 part
> +	  of the ARM Trusted Firmware.
> +
> +	  Do not choose this option if you intend to use U-Boot or
> +	  another second-stage bootloader. With this option, TF-A starts
> +	  Linux directly.
> +
> +	  With this option chosen, whenever the Linux zImage changes,
> +	  TF-A may need need to be re-built to create the latest FIP
> +	  file. Since Buildroot does not track package dependencies,
> +	  this has to be done manually by invoking `make
> +	  arm-trusted-firmware-rebuild`. The final boot medium image may
> +	  need to be re-generated as well to include the latest FIP file
> +	  version.
> +
>   endchoice
>   
>   if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 172a930b5c..6fc15ab700 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -132,6 +132,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UB
>   ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
>   endif
>   
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/zImage

  On aarch64, it is Image, not zImage. If you can't test it on aarch64, I'

  Perhaps we should also depend on BR2_LINUX_KERNEL_ZIMAGE || 
BR2_LINUX_KERNEL_APPENDED_ZIMAGE (|| BR2_LINUX_KERNEL_IMAGE for aarch64) 
otherwise the zImage will not appear in BINARIES_DIR.


  Regards,
  Arnout

> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33_CFG=$(BINARIES_DIR)/$(LINUX_DTBS)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += linux
> +endif
> +
>   ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
>   ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
>   ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
