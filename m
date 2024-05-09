Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B534AC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 19:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C5641FAD;
	Thu,  9 May 2024 19:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBPp84KK6qo2; Thu,  9 May 2024 19:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F4B41FA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F4B41FA0;
	Thu,  9 May 2024 19:52:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A47D11BF33F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 19:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA7841FA0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 19:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YezmfHlUJhdx for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 19:52:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88F4441F9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F4441F9C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F4441F9C
 for <buildroot@buildroot.org>; Thu,  9 May 2024 19:52:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E1441C0004;
 Thu,  9 May 2024 19:51:58 +0000 (UTC)
Date: Thu, 9 May 2024 21:51:56 +0200
To: Nick Whitlock <nick.whitlock@eizo.com>
Message-ID: <20240509215156.7185ff8f@windsurf>
In-Reply-To: <20240509190028.693457-1-nick.whitlock@eizo.com>
References: <20240509190028.693457-1-nick.whitlock@eizo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715284318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpIdPObrtqaHrChxwGHpfEdhImZ0+ByUPKrZZcHm0Pc=;
 b=ZEmf0dke5j7qTQsO8rJ5G0VL9b8SiXfMV8Ee2piaRSa7p/n8m/WH37ATauRQb4BDc4Y387
 WC0LsBUMR+1+KFuoG1UVd00/KksSZbLCOF0mM709XFIdp9JtjcCLh95Wag9yoAq9OsuSW8
 oTxYaJ8uduDRaJ/FvsoPNx+D2O+XJIx6xWJAKGuj6tlXK6unFNe2jIOHbh7MOil4EbrzEE
 Vw0f76ZdZbENWKnvAOKlVRvf/QXRpZ74FxvW3vT4RaW9eH1Y1eRpeQbxp/UfU+kLdPGaB7
 ztTbw/HXMNk5LHQXyJWCo7PNHChRCM0gkrbATxw+upmHEMrJrBDCwmCaZmQqeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZEmf0dke
Subject: Re: [Buildroot] [PATCH] package/nvidia-driver: bump version to
 550.78
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nick,

Thanks for your patch, a number of comments/questions below.

On Thu,  9 May 2024 15:00:27 -0400
Nick Whitlock <nick.whitlock@eizo.com> wrote:

> A configuration value was also added to check if the user wants
> to install GTK integration for the NVIDIA driver.
> 
> This has been confirmed to work on kernel 6.14.

Kernel 6.14 ? You're ahead of your time, there's no such thing as Linux
6.14.

We need your patch to have your Signed-off-by line, otherwise we
unfortunately cannot apply it.

> ---
>  package/nvidia-driver/Config.in          |  4 ++
>  package/nvidia-driver/nvidia-driver.hash |  8 +--
>  package/nvidia-driver/nvidia-driver.mk   | 72 +++++++++++++-----------
>  3 files changed, 47 insertions(+), 37 deletions(-)
> 
> diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> index a8617a939b..996f2f6eea 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -90,4 +90,8 @@ config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
>  	  provides Unified Memory access to the GPU and CPU memories for
>  	  CUDA programs.
>  
> +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> +	bool "GTK support"
> +	depends on BR2_PACKAGE_NVIDIA_DRIVER_MODULE

Why does this have a depends on BR2_PACKAGE_NVIDIA_DRIVER_MODULE ? From
what I can see in your patch, this option is merely installing more
user-space libraries, so why do you make this depend on the driver
module being enabled?

> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
> index 620112e6c8..163a168dae 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
> -# Locally computed
> -sha256  94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677db  NVIDIA-Linux-x86-390.151.run
> -sha256  6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
> -sha256  bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
> +# Locally computed:
> +md5 c289987ebda8e9419a73e7e8e3409244  NVIDIA-Linux-x86_64-550.78.run
> +sha1 4e33f1e9d6274fdef630a3a1b903901c09149e40  NVIDIA-Linux-x86_64-550.78.run
> +sha256 34070434527ec9d575483e7f11ca078e467e73f6defc54366ecfbdcfe4a3bf73 NVIDIA-Linux-x86_64-550.78.run

A number of things are not correct:

- You should keep the license file hashes

- You should keep the spacing: 2 spaces between each field

- Are these hashes provided by some authoritative source upstream? If
  so, indicate where. Otherwise, keeping the locally calculated sha256
  is sufficient.

> -NVIDIA_DRIVER_VERSION = 390.151
> -NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> -NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> -NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
> +# NVIDIA drivers now are bundled 64-bit and 32-bit together in one .run file.

This should be in the commit log, not in a comment here.

> +NVIDIA_DRIVER_VERSION = 550.78
> +NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86_64/$(NVIDIA_DRIVER_VERSION)
> +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86_64-$(NVIDIA_DRIVER_VERSION).run
>  NVIDIA_DRIVER_LICENSE = NVIDIA Software License
>  NVIDIA_DRIVER_LICENSE_FILES = LICENSE
>  NVIDIA_DRIVER_REDISTRIBUTE = NO
> @@ -23,30 +23,15 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
>  NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext
>  NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
>  
> -# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
> -# has been replaced with libGL.so.1.0.0. Installing both is technically
> -# possible, but great care must be taken to ensure they do not conflict,
> -# so that EGL still works. The legacy library exposes an NVidia-specific
> -# API, so it should not be needed, except for legacy, binary-only
> -# applications (in other words: we don't care).
> -#
> -# libGL.so.1.0.0 is the new vendor-neutral library, aimed at replacing
> -# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The latter contains
> -# NVidia extensions (which is deemed bad now), while the former follows
> -# the newly-introduced vendor-neutral "dispatching" API/ABI:
> -#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
> -# However, this is not very useful to us, as we don't support multiple
> -# GL providers at the same time on the system, which this proposal is
> -# aimed at supporting.
> -#
> -# So we only install the legacy library for now.

You probably need to explain in the commit log why this is all going
away.


>  NVIDIA_DRIVER_LIBS += \
>  	$(NVIDIA_DRIVER_LIBS_GL) \
> @@ -87,13 +77,26 @@ endef
>  # wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
> -	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> -	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
> +	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION) /
> +	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) /
> +	libnvidia-ngx.so.$(NVIDIA_DRIVER_VERSION) /
> +	libnvidia-opticalflow.so.$(NVIDIA_DRIVER_VERSION) /

These lines end with slashes instead of backslashes, not sure how this
can work. Did you test this part?

Could you fix those different issues, and send a v2 of this patch?

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
