Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD864CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8228182219;
	Fri, 29 Aug 2025 17:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpuzGvRNl8OF; Fri, 29 Aug 2025 17:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B09C818E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B09C818E6;
	Fri, 29 Aug 2025 17:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C5069
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC8058187F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0C4uVmbexhD for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C0D381B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0D381B52
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C0D381B52
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:49:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28AB1B9783D4; Fri, 29 Aug 2025 19:49:44 +0200 (CEST)
Message-ID: <e5042ffe-2e86-452a-802c-287894da1d92@rnout.be>
Date: Fri, 29 Aug 2025 19:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: David Lechner <david@lechnology.com>
References: <20250828132749.41538-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828132749.41538-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756489784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=TM+ZRRoL8RtcXvI2OpwbaegbA2GH4S7OdKlAKJNzpcs=;
 b=AhLsttXaJR2ewuBHhKj1bRYrWW0edGKlAEdpqq9B76TtckPQXC+DfY5HBrAv6a6OWl63hB
 gMRBGAcX82yKQU5tBeErTaLCWpI3OHr5R9tUUW9Ic4Ow47sc+h+xmxusd64sKrqKmFELht
 3yzFMLOaxN7ibubBFwbVFm0ak6z7RJ/nME+kIsfBvLTTnQVtM/6OrPSpFfa8sMZ2Jw+Fhx
 mgcIN29iNnJ/ekzZ3nOM3XQA/XJBZDjuggtiA+WwuYHM8gzFC/JkGEAJxTG81tjwZksjRM
 klXLoAQqKupHnWw+avGSEDoOCDGvTvZn18sA6NQS/AYLSBMu9fyR7Jlum9fp7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AhLsttXa
Subject: Re: [Buildroot] [PATCH] package/ev3dev-linux-drivers: remove package
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



On 28/08/2025 15:27, Titouan Christophe via buildroot wrote:
> These external linux drivers haven't seen any activity in Buildroot
> for a while, and are anyway aimed at an old kernel version (4.19).
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy                                     |  7 +++++++
>   DEVELOPERS                                           |  2 --
>   linux/Config.ext.in                                  | 10 ----------
>   linux/linux-ext-ev3dev-linux-drivers.mk              | 12 ------------
>   package/Config.in                                    |  1 -
>   package/ev3dev-linux-drivers/Config.in               | 12 ------------
>   package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk | 11 -----------
>   package/ev3dev-linux-drivers/lego-linux-drivers.hash |  2 --
>   8 files changed, 7 insertions(+), 50 deletions(-)
>   delete mode 100644 linux/linux-ext-ev3dev-linux-drivers.mk
>   delete mode 100644 package/ev3dev-linux-drivers/Config.in
>   delete mode 100644 package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
>   delete mode 100644 package/ev3dev-linux-drivers/lego-linux-drivers.hash
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0bedc24dce..82e6e25558 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2025.08"
>   
> +config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
> +	bool "ev3dev Linux drivers have been removed"
> +	select BR2_LEGACY
> +	help
> +	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project
> +	  are targetting an outdated kernel which is no longer supported
> +
>   config BR2_KERNEL_HEADERS_6_15
>   	bool "kernel headers version 6.15.x are no longer supported"
>   	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 537a8bc516..80a9c4e227 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -836,9 +836,7 @@ F:	package/libtalloc/
>   N:	David Lechner <david@lechnology.com>
>   F:	board/lego/ev3/
>   F:	configs/lego_ev3_defconfig
> -F:	linux/linux-ext-ev3dev-linux-drivers.mk
>   F:	package/brickd/
> -F:	package/ev3dev-linux-drivers/
>   
>   N:	David Pierret <david.pierret@smile.fr>
>   F:	package/bat/
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 3cbf42d344..229d6b8c76 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -55,16 +55,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
>   	help
>   	  RTAI Kernel part.
>   
> -#-------------------------------------------------------------------------------
> -# ev3dev Linux drivers
> -config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
> -	bool "ev3dev Linux drivers"
> -	select BR2_PACKAGE_EV3DEV_LINUX_DRIVERS
> -	help
> -	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project.
> -
> -	  https://github.com/ev3dev/lego-linux-drivers
> -
>   #-------------------------------------------------------------------------------
>   # fbtft
>   config BR2_LINUX_KERNEL_EXT_FBTFT
> diff --git a/linux/linux-ext-ev3dev-linux-drivers.mk b/linux/linux-ext-ev3dev-linux-drivers.mk
> deleted file mode 100644
> index 3bb12db38d..0000000000
> --- a/linux/linux-ext-ev3dev-linux-drivers.mk
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -################################################################################
> -#
> -# Patch the linux kernel with ev3dev extension
> -#
> -################################################################################
> -
> -LINUX_EXTENSIONS += ev3dev-linux-drivers
> -
> -define EV3DEV_LINUX_DRIVERS_PREPARE_KERNEL
> -	mkdir -p $(LINUX_DIR)/drivers/lego
> -	cp -dpfr $(EV3DEV_LINUX_DRIVERS_DIR)/* $(LINUX_DIR)/drivers/lego/
> -endef
> diff --git a/package/Config.in b/package/Config.in
> index 899301078e..02d9a27d0f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -512,7 +512,6 @@ endmenu
>   	source "package/esp-hosted/Config.in"
>   	source "package/espflash/Config.in"
>   	source "package/eudev/Config.in"
> -	source "package/ev3dev-linux-drivers/Config.in"
>   	source "package/evemu/Config.in"
>   	source "package/evtest/Config.in"
>   	source "package/fbtft/Config.in"
> diff --git a/package/ev3dev-linux-drivers/Config.in b/package/ev3dev-linux-drivers/Config.in
> deleted file mode 100644
> index 9be2f282e9..0000000000
> --- a/package/ev3dev-linux-drivers/Config.in
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# Prompt-less option, because this package is not doing anything except
> -# downloading the ev3dev driver sources. The real work is done by a Linux
> -# extension.
> -config BR2_PACKAGE_EV3DEV_LINUX_DRIVERS
> -	bool
> -	depends on BR2_LINUX_KERNEL
> -	help
> -	  Linux drivers for LEGO MINDSTORMS EV3
> -
> -	  This is only the download helper for the kernel patch.
> -
> -	  https://github.com/ev3dev/lego-linux-drivers
> diff --git a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk b/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
> deleted file mode 100644
> index 92e8927817..0000000000
> --- a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -################################################################################
> -#
> -# ev3dev Linux drivers
> -#
> -################################################################################
> -
> -EV3DEV_LINUX_DRIVERS_VERSION = 0e551eb25ae8600c1f178814781bfb42dc835496
> -EV3DEV_LINUX_DRIVERS_SITE = $(call github,ev3dev,lego-linux-drivers,$(EV3DEV_LINUX_DRIVERS_VERSION))
> -EV3DEV_LINUX_DRIVERS_LICENSE = GPL-2.0
> -
> -$(eval $(generic-package))
> diff --git a/package/ev3dev-linux-drivers/lego-linux-drivers.hash b/package/ev3dev-linux-drivers/lego-linux-drivers.hash
> deleted file mode 100644
> index cc48f65395..0000000000
> --- a/package/ev3dev-linux-drivers/lego-linux-drivers.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# locally computed
> -sha256  9d2740b348c8d43e7e15fedc4cec99bf351a3a2ba8691f2a07c439a9c034bc04  lego-linux-drivers-0e551eb25ae8600c1f178814781bfb42dc835496.tar.gz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
