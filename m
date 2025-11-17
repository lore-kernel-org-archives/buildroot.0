Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9911ACE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFED40A21;
	Mon, 17 Nov 2025 20:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Scc42LreUsX7; Mon, 17 Nov 2025 20:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F36340AB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F36340AB2;
	Mon, 17 Nov 2025 20:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E811BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 185E040AB2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODQYnA5rjj0n for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B02A940A21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02A940A21
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B02A940A21
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:02:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA6C3B979430; Mon, 17 Nov 2025 21:02:49 +0100 (CET)
Message-ID: <74bcb47d-fcb5-4789-8b79-4f4f076c4f83@rnout.be>
Date: Mon, 17 Nov 2025 21:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251026211817.2695263-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251026211817.2695263-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409769; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QV2yRDRwNVEmAdYiQ00SvNFiaKIOULCXZhIpMcJIjeU=;
 b=XO7uOtbvIc8aOnaVX+PuXL/3KLVK9wmCCokBZmxTNXIhNYKBmcnmh0evJCHW611kQUGMCK
 2q+2v9B3DjBhS7wgmEHsBhBCLLtpHgPidmI3WgY4zufy5vP/7CnwWVnoeTgnB6zWMeTPiK
 eYDqbejPm0F/cbP+x0L+wrpmMor2qAFDt56Ry/RuB9NwZT6X9MAwYPUqRlmqxI2GyV5M1s
 204tPOfpKvRE8bbI+wVjNw5YT4KFGLjDGNw0hHvM46kk5gXIcHWpri1Mgw7NbX36laZFiz
 YiHiglCdVZsYDT3ZrLdByQZnqqwIOtQJNS/M7dyIOdo3/dqr1sYclMl/RGm8bA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XO7uOtbv
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: needs threads
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



On 26/10/2025 22:18, Bernd Kuhls wrote:
> Buildroot commit accb006d9b62079b56bc1f1388b558a60dde277a bumped libheif
> to version 1.20.1 which includes several commits unconditionally depen-
> ding on std::mutex which requires a toolchain with threads:
> 
> https://github.com/strukturag/libheif/commit/14f956726c79747fc1fb8c041ed767c1632704eb
> https://github.com/strukturag/libheif/commit/6bb8cdaa8a7ba78066c899c3791546b80051c70a
> 
> Added dependency to BR2_TOOLCHAIN_HAS_THREADS to Config.in, removed
> configure options handling non-threaded toolchains and adjusted a
> Config.in comment of the only dependee kodi-imagedecoder-heif.
> 
> Fixes:
> https://autobuild.buildroot.net/results/28b/28bf68147382dada33cbf9b299396dfdee3fbbe6/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-imagedecoder-heif/Config.in | 2 +-
>   package/libheif/Config.in                | 6 ++++--
>   package/libheif/libheif.mk               | 7 -------
>   3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
> index d0950385a0..f41b164ff4 100644
> --- a/package/kodi-imagedecoder-heif/Config.in
> +++ b/package/kodi-imagedecoder-heif/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
>   	bool "kodi-imagedecoder-heif"
>   	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265, libheif
>   	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
>   	select BR2_PACKAGE_LIBDE265
> diff --git a/package/libheif/Config.in b/package/libheif/Config.in
> index 1452cf2718..0ae86a07f4 100644
> --- a/package/libheif/Config.in
> +++ b/package/libheif/Config.in
> @@ -3,11 +3,13 @@ config BR2_PACKAGE_LIBHEIF
>   	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	help
>   	  libheif is an HEIF and AVIF file format decoder and encoder.
>   
>   	  https://github.com/strukturag/libheif
>   
> -comment "libheif needs a toolchain w/ C++, gcc >= 4.8"
> +comment "libheif needs a toolchain w/ C++, threads, gcc >= 4.8"
>   	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 13e8295b0e..d82ec6a0ec 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -72,17 +72,10 @@ else
>   LIBHEIF_CONF_OPTS += -DWITH_X265=OFF
>   endif
>   
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -LIBHEIF_CONF_OPTS += -DENABLE_MULTITHREADING_SUPPORT=ON
>   ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
>   LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=OFF
>   else
>   LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=ON
>   endif
> -else
> -LIBHEIF_CONF_OPTS += \
> -	-DENABLE_MULTITHREADING_SUPPORT=OFF \
> -	-DENABLE_PARALLEL_TILE_DECODING=OFF
> -endif
>   
>   $(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
