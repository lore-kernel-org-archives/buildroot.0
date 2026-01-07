Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE3D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B71A40EC8;
	Wed,  7 Jan 2026 17:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkUH1d_a87ua; Wed,  7 Jan 2026 17:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6700D40EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808275;
	bh=tw291DIADqZmV9caqU+rmZTHaAECl9RLVvIzLq8e+j8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q+u0HQWIz0Mbf3bBYpcfI92TiklNEpN3d70bvZBvuFTarzMgq9z2rkCbm3aUuVi5h
	 a9PQjMyPTUQQjcDIt7J1LYsv61tsKYmBwLjjms5hrgsOpF77Oycg1NhSou/QKw9KEM
	 tQtP3OGC2MqIwPqsbfM/QRP/mo47G8MfIRrzN1QVAr3snatx1lbVPY0fNg3IgADadD
	 NLXMHvfxhpRxWfwaSCCAiK2G72C370Y8aDqlQrLdaOKErnFWN4ZZClk0sx2gcUaqvU
	 W5feisFXFn9RDiWeME+/zYhtcW/8mTzgsJkVQDrhFB/VVaeIaVMTaZXhjNYWha5XQg
	 wWZxMUH6diWbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6700D40EC9;
	Wed,  7 Jan 2026 17:51:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F1529ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A1D40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yPJ7hKHPakc for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41E9E40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41E9E40128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41E9E40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A87FEB97A70F; Wed,  7 Jan 2026 18:51:09 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:08 +0100
Message-ID: <20260107175108.227512-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226171448.1213664-3-thomas.petazzoni@bootlin.com>
References: <20251226171448.1213664-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808269; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=cddUJQc1y51SwoFF0AL299QWX8KZk1xwlWPybi1CZuE=;
 b=UkGgaJiD75eQmg5J3DZ9+dqHlZ15lYpqoAKAde3ftdByZaCc3mAiDWzn+DeUoGC31xqjix
 uUTvqrPPfAGGJhCxmKJu6OSLSIr+uawo8w6Ren8e1Lfs+jnaA6vzP8Fq7dmA+F6ZnhWDkO
 e6VRo8Yp4S4OTJBXXSPGXrlM7m7W6OthpwWvrAjSdkr7DMU/+sKcJG6jCh12Qw7tcVge7m
 QvKmKY3RjAoH3XHxn8qZz6yeRC83XWUEif3Zww2B1wl9DCtFZsDL+1nM6S64sOppFy1I8v
 KPPoIxddj7pYbKUcDuAmR5qB/HD9oDbncK1l1HS4NMprfDnHUF9o7dxBFV8mXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UkGgaJiD
Subject: Re: [Buildroot] [PATCH 3/3] package/opencv3: drop support for ffmpeg
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> opencv3's code is not compatible with newer versions of ffmpeg, and
> opencv3 is no longer maintained, so we have no choice but to disable
> its ffmpeg support.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/9ae3911583cccb6362f33cd82e5eaafb059fdc76/
> 
> It's not clear which ffmpeg version bump broken the build exactly, but
> this issue is definitely present in 2025.02.x as the following
> defconfig fails to build in a similar way on 2025.02.x:
> 
>  BR2_aarch64=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_PACKAGE_FFMPEG_NONFREE=y
>  # BR2_PACKAGE_FFMPEG_FFMPEG is not set
>  # BR2_PACKAGE_FFMPEG_INDEVS is not set
>  # BR2_PACKAGE_FFMPEG_OUTDEVS is not set
>  BR2_PACKAGE_OPENCV3=y
>  BR2_PACKAGE_OPENCV3_LIB_VIDEOIO=y
>  BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS=y
>  BR2_PACKAGE_OPENCV3_WITH_FFMPEG=y
>  BR2_PACKAGE_OPENCV3_INSTALL_DATA=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  Config.in.legacy           | 7 +++++++
>  package/ffmpeg/ffmpeg.mk   | 6 +++---
>  package/opencv3/Config.in  | 9 ---------
>  package/opencv3/opencv3.mk | 8 +-------
>  4 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 03e0673fba..51f77ad312 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
> +	bool "opencv3 ffmpeg support removed"
> +	select BR2_LEGACY
> +	help
> +	  Support for OpenCV 3 ffmpeg support has been removed as it
> +	  was no longer compatible with recent versions of ffmpeg.
> +
>  config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
>  	bool "opencv3 protobuf support removed"
>  	select BR2_LEGACY
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index cee34eba9e..f3b76f69b5 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -287,11 +287,11 @@ else
>  FFMPEG_CONF_OPTS += --disable-vdpau
>  endif
>  
> -# To avoid a circular dependency only use opencv if opencv itself does
> -# not depend on ffmpeg.
> -ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
> +ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),y)
>  FFMPEG_CONF_OPTS += --enable-libopencv
>  FFMPEG_DEPENDENCIES += opencv3
> +# To avoid a circular dependency only use opencv if opencv itself does
> +# not depend on ffmpeg.
>  else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
>  FFMPEG_CONF_OPTS += --enable-libopencv \
>  	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index 6c4d4e9c8a..ad8a075729 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -232,15 +232,6 @@ config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
>  
>  comment "3rd party support"
>  
> -config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
> -	bool "ffmpeg support"
> -	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> -	select BR2_PACKAGE_BZIP2
> -	select BR2_PACKAGE_FFMPEG
> -	select BR2_PACKAGE_FFMPEG_SWSCALE
> -	help
> -	  Use ffmpeg from the target system.
> -
>  config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
>  	bool "gstreamer-1.x"
>  	depends on BR2_USE_MMU # gstreamer1 -> libglib2
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 3fcf2543a7..9e488bed0c 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -212,6 +212,7 @@ OPENCV3_CONF_OPTS += \
>  	-DWITH_1394=OFF \
>  	-DWITH_CLP=OFF \
>  	-DWITH_EIGEN=OFF \
> +	-DWITH_FFMPEG=OFF \
>  	-DWITH_GDAL=OFF \
>  	-DWITH_GPHOTO2=OFF \
>  	-DWITH_GSTREAMER_0_10=OFF \
> @@ -232,13 +233,6 @@ OPENCV3_CONF_OPTS += \
>  
>  OPENCV3_DEPENDENCIES += host-pkgconf zlib
>  
> -ifeq ($(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),y)
> -OPENCV3_CONF_OPTS += -DWITH_FFMPEG=ON
> -OPENCV3_DEPENDENCIES += ffmpeg bzip2
> -else
> -OPENCV3_CONF_OPTS += -DWITH_FFMPEG=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
>  OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
>  OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
