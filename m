Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD54CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EAE983B25;
	Fri, 29 May 2026 13:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSSYfHLPPq_E; Fri, 29 May 2026 13:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8427583B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061706;
	bh=Mm0M3NAY383k3yRxN5m06WIH11AC7bwtAX6Ku3hlAfs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OAguBlt4RZVX1TTgm3q0RLuhHsEMNZ8W7qwSRZR7BaQbg6wZcICgI6gmeMZByzi/p
	 IOFp42J15EEDcCFNID5dnAx02sz8rYZX9WheXtYXGoYAhuSxdupTuGnMKcxYzeXkl/
	 FhZQFrMxcVoxkiGal+ISQRYfcmdfHDXWYckVOe2S9ZXLPedozHluNCILjgDUaHfZ9c
	 6P2OvFyXKznsxMtgxTQfzWl/9EeNg6NyWMB73jVrz9REvlD7Dpnme/h4DOlGEAvbm5
	 t30nsU1JWyaYWLjBS6OjKYeKAhCG9om0m8dYBygUd/0QmeROm4QBOxoUNEG3l48Tg0
	 kuvrZtpJDs1ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8427583B34;
	Fri, 29 May 2026 13:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C070288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08C9561405
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1A4PvK-3WQmJ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70416613D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70416613D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70416613D6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:35:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85FFEB97C675; Fri, 29 May 2026 15:35:00 +0200 (CEST)
Message-ID: <4679b1b6-ed8a-4d15-a603-1da8cecc5542@rnout.be>
Date: Fri, 29 May 2026 15:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260506184057.665854-1-bernd@kuhls.net>
 <20260506184057.665854-11-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260506184057.665854-11-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780061701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vyXsWnumlEs/P5+ykqGUA0gvYDQbMym98VzA6QsgsMc=;
 b=Rl3P7sfN7eU939Q4FdU58A0xtcIt2keP5FVjbyXzbLb2Otsd2IwIRC6CwjSBmAJSDmO8mI
 zNUKWBR11HqSEY2TBRPGS0+MAJKVW13LQG8yWEKyObS7R71LWkqacOhBfooz39+c5xTIM8
 SZVDVpC0HPKEjcHEMu6B4fOjxvokx5i95DZfPgBU+4QT7piTmB0MZCT+/seQ4FSkCoZkTo
 Z7UyPtrtLxO/AqiFvYTU+V+bNieEI+/HNxDturktxh36MdzAYYueFVgCi+OlU3iP3CLioh
 LJ0X7xymL8kgqwZm63ofDWypdyTp9XqLHP5H6C43DA0BHP9lURMDatPubW/0OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Rl3P7sfN
Subject: Re: [Buildroot] [PATCH 10/12] package/igt-gpu-tools: only needs
 libudev, not udev daemon
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



On 06/05/2026 20:40, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/igt-gpu-tools/Config.in        | 6 +++---
>   package/igt-gpu-tools/igt-gpu-tools.mk | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
> index 00dc59a2ae..72d3f0b0db 100644
> --- a/package/igt-gpu-tools/Config.in
> +++ b/package/igt-gpu-tools/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
>   	depends on BR2_ENABLE_LOCALE
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_PACKAGE_HAS_LIBUDEV
>   	depends on BR2_USE_WCHAR # elfutils, procps-ng
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
>   	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
> @@ -40,10 +40,10 @@ config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
>   
>   endif
>   
> -comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
> +comment "igt-gpu-tools needs libudev and a toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
>   	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
> -	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
> +	depends on !BR2_PACKAGE_HAS_LIBUDEV || BR2_STATIC_LIBS || \
>   		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
>   		!BR2_ENABLE_LOCALE || \
>   		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
> diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
> index 6e6d4278f1..953440368c 100644
> --- a/package/igt-gpu-tools/igt-gpu-tools.mk
> +++ b/package/igt-gpu-tools/igt-gpu-tools.mk
> @@ -19,9 +19,9 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
>   	libglib2 \
>   	libpciaccess \
>   	pciutils \
> +	libudev \

  Something went wrong with alphabetical ordering here. Fixed.

  Regards,
  Arnout

>   	pixman \
>   	procps-ng \
> -	udev \
>   	zlib
>   
>   IGT_GPU_TOOLS_CONF_OPTS = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
