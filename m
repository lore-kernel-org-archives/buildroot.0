Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE95C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82DAE841B9;
	Fri, 29 Aug 2025 08:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aG4K1Gjnk6O; Fri, 29 Aug 2025 08:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B251841BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B251841BA;
	Fri, 29 Aug 2025 08:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D59BD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59F15841B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g54mYiIm9f_n for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00192841B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00192841B4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00192841B4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:52:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F81FB978442; Fri, 29 Aug 2025 10:52:14 +0200 (CEST)
Message-ID: <f70a2963-c790-479b-b077-e25f16f0e78b@rnout.be>
Date: Fri, 29 Aug 2025 10:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>
References: <20250818201444.3210542-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250818201444.3210542-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756457535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=tS+7kGQcFQjsVT6Qi2UQEa/FAL7Sc5R4dweMvD60UJ8=;
 b=l326mGf0P5eE6BIGdcLtSReSaG11hV7jUOen0vbqu115PVeizZIWZQ9CInWCEk9OP6Qr9h
 KXzWIfMAgZlV572VG7UlzqTxOluINujYsKy55OO+BjaZ7zVnCtgrs9w2U94z7qf40wgAxf
 lsBjFOCpREX3UKShObOOl7kFYh+ETYo5ceVb7wcf5DhX7do0xPX2ocf8i7V0V7ntBUyfO3
 MXvDnBRl7xhHroxTjfn8/XdCvfTnEgINklbs0NcoyBJRS6lbJ3zGQRHvC9hWRPsc2a8Adz
 9SkInoiN56zrIdI+RFsGJVwFxAgYzF2PW0P+cvdoHNuqUDU1cF4J/zEej7geFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=l326mGf0
Subject: Re: [Buildroot] [PATCH] package/python3: drop !uclibc || headers
 5.1 dependency
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



On 18/08/2025 22:14, Thomas Petazzoni via buildroot wrote:
> The following dependency:
> 
>    depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> 
> was added by commit d63e207eb869063f82c867658676c2903beb08cb, which
> bumped python3 from 3.12.9 to 3.13.2.
> 
> The commit log states:
> 
>      The package selection logic has changed to require time64 support for
>      uClibc by mirroring the logic from uclibc.mk (kernel headers >=5.1).
> 
> but doesn't provide any additional detail about the issue encountered.
> 
> The problem is that this dependency has not been propagated to reverse
> dependencies, causing this kind of kconfig warnings:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON3
>    Depends on [n]: BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && (!BR2_TOOLCHAIN_USES_UCLIBC [=y] || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 [=n])
>    Selected by [y]:
>    - BR2_PACKAGE_AVOCADO [=y] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
>    - BR2_PACKAGE_LIBSIGROKDECODE [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n]
>    - BR2_PACKAGE_OPKG_UTILS [=y] && BR2_PACKAGE_BUSYBOX [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
> 
> However, propagating this dependency to all reverse dependencies of
> python3 would be pretty annoying, especially as the dependency is kind
> of "clunky". This made us question whether this dependency could be
> dropped. And in fact, we could not reproduce any build failure, even
> by using a 2018 uclibc toolchain, based on gcc 6.x, headers 4.1.x and
> uClibc 1.0.28. This can be tested by building the following
> configuration:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2018.02-1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_PYTHON3=y
> 
> It needs to be built in an environment that has libmpfr.so.4 installed
> as the pre-built toolchain from that era did not include it. An easy
> way to achieve this is to build this configuration under an old
> Buildroot Docker container:
> 
> IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3
> 
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks, after rewriting the commit message to reflect the 
actual (runtime) issue. Thanks Vincent.

  I'm also working on a patch that introduces a build-time check instead of this 
config-time dependency.k

  Regards,
  Arnout

> ---
>   package/python3/Config.in | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 7491067140..cfc08bad86 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -1,6 +1,6 @@
> -comment "python3 needs a toolchain w/ wchar, threads, dynamic library, time64 support"
> +comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || (!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 && BR2_TOOLCHAIN_USES_UCLIBC)
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>   
>   config BR2_PACKAGE_PYTHON3
>   	bool "python3"
> @@ -9,7 +9,6 @@ config BR2_PACKAGE_PYTHON3
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
>   	depends on !BR2_STATIC_LIBS
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1  # need time64 support in uclibc
>   	select BR2_PACKAGE_LIBFFI
>   	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
>   	select BR2_PACKAGE_HOST_PYTHON3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
