Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D0D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E130940EE2;
	Wed,  7 Jan 2026 17:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYDmt6okgGof; Wed,  7 Jan 2026 17:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E8A40EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808276;
	bh=YWT3K0fFtEIqT/y32kFlD1/CJ7CN0rZmDAYGho9wZGs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BAy/rNw/OFLTb+/pqXNTrltjkXWyPugH8I58KPe+64BR3N513fyj38C+kYl6ILPtT
	 GWry8vJzMcwAr8HxcRf2uVX/LbJBA0J7AveBvhH0CYvElsdqD6bSIgCoLVbb7jPdeF
	 Z+z5o5n/y5+YNM6mhs612O81cmep/4py6GMhOEMMLVfmsiz6pKEC3BvuDc3Rj5gbJL
	 7Ti3vKLMJDNdQc73L9wRFKNGrAgmCiwfLcdR8uupq4iXk1A/XKnkzMDfPmKGmig3xi
	 DnR0YzQd1xwXczoqjSwSPAPTK0i5GwNYzR1RwVoG39MlGUj7H7cxJ8Lhruh83D5yCO
	 s0tPqZBaNyLDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E8A40EC9;
	Wed,  7 Jan 2026 17:51:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1204F25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECE8C40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE4drCIPbuMv for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E343340128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E343340128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E343340128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08BA0B97A704; Wed,  7 Jan 2026 18:51:12 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:11 +0100
Message-ID: <20260107175111.227567-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226171448.1213664-2-thomas.petazzoni@bootlin.com>
References: <20251226171448.1213664-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808272; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=NsO5AxROtRxa8zfSnKSMMfYy9fVlKAnEwqcJ/+4yKJo=;
 b=hgXkzLupFaIsqqCkWi3AUFsk8J/E8vkyP+w5YrkZQ6B82lTLHT8ej2dMR+6pe79il2tVSL
 cTfS/Ipmk7oux3whNP4tn+6MJff+PSEJ32NwUMZJaa6BzniE95py+B6j4dEsYTt0hkdURF
 R7w+sIPLtD6ZtdqHs7mOprG5zgoujlqowwsrgxxD0km3A0Y/v/ecclEDF+5fkmAcUnz+uP
 KBtrS8RSsJjgJ4oLqzH0YmLOWAg+SaO5YuiQrSLHNDtm76VmlMo3otAiiSeFC4P/ZnZFAZ
 6jJyxbdO6QDDIJqI69UXJMvIuDm0Dds39Y01H2uESOxw9wwhv65AhYOqZ/38rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hgXkzLup
Subject: Re: [Buildroot] [PATCH 2/3] package/opencv3: drop support for
 protobuf
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
> The protobuf support breaks the build, as protobuf includes
> libabseil-cpp headers, which now require C++14. opencv3 doesn't have
> any ENABLE_CXX14 option, so for the time being, disable protobuf
> support until someone bothers enough to fix this up.
> 
> While we suspect a libabseil-cpp version bump to be responsible for
> the issue, we are not 100% sure. However, the issue is definitely
> present in Buildroot 2025.02.x, as it can be reproduced using the
> following defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_OPENCV3=y
> BR2_PACKAGE_OPENCV3_LIB_SHAPE=y
> BR2_PACKAGE_OPENCV3_LIB_STITCHING=y
> BR2_PACKAGE_OPENCV3_LIB_SUPERRES=y
> BR2_PACKAGE_OPENCV3_LIB_TS=y
> BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB=y
> BR2_PACKAGE_OPENCV3_WITH_PROTOBUF=y
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/39432e7746e6bc5224592a7d2f744ca992bd529a/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  Config.in.legacy           |  7 +++++++
>  package/opencv3/Config.in  | 12 ------------
>  package/opencv3/opencv3.mk | 12 +-----------
>  3 files changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 7c598e0e68..03e0673fba 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
> +	bool "opencv3 protobuf support removed"
> +	select BR2_LEGACY
> +	help
> +	  Support for OpenCV 3 protobuf support has been removed as it
> +	  was no longer compatible with recent versions of protobuf.
> +
>  config BR2_PACKAGE_LIBDNET_PYTHON
>  	bool "libdnet python module removed"
>  	select BR2_LEGACY
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index c4c5d22a54..6c4d4e9c8a 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -278,18 +278,6 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
>  	help
>  	  Use shared libpng from the target system.
>  
> -config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
> -	bool "protobuf support"
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
> -	select BR2_PACKAGE_PROTOBUF
> -	help
> -	  Use shared protobuf from the target system.
> -
> -comment "protobuf support needs a toolchain w/ gcc >= 8"
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -
>  config BR2_PACKAGE_OPENCV3_WITH_TIFF
>  	bool "tiff support"
>  	select BR2_PACKAGE_TIFF
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 8a862a47b1..3fcf2543a7 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -223,6 +223,7 @@ OPENCV3_CONF_OPTS += \
>  	-DWITH_OPENEXR=OFF \
>  	-DWITH_OPENNI2=OFF \
>  	-DWITH_OPENNI=OFF \
> +	-DWITH_PROTOBUF=OFF \
>  	-DWITH_UNICAP=OFF \
>  	-DWITH_VA=OFF \
>  	-DWITH_VA_INTEL=OFF \
> @@ -282,17 +283,6 @@ else
>  OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
> -# protobuf needs c++11 (since 3.6.0)
> -OPENCV3_CONF_OPTS += \
> -	-DENABLE_CXX11=ON \
> -	-DPROTOBUF_UPDATE_FILES=ON \
> -	-DWITH_PROTOBUF=ON
> -OPENCV3_DEPENDENCIES += protobuf
> -else
> -OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
>  OPENCV3_CONF_OPTS += -DWITH_QT=5
>  OPENCV3_DEPENDENCIES += qt5base
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
