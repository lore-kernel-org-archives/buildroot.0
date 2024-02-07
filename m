Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37843C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05E083B8C;
	Wed,  7 Feb 2024 15:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzjHhNu2CBY2; Wed,  7 Feb 2024 15:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C7383B8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C7383B8D;
	Wed,  7 Feb 2024 15:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 392591BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 264AE83B8D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_2itzy6d6fe for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB06083B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB06083B8C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB06083B8C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:08:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A1B1413F8A2;
 Wed,  7 Feb 2024 16:08:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 16:08:42 +0100
Date: Wed, 7 Feb 2024 16:08:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcOc-u_S09WCYWE1@landeda>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-4-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202093625.1409559-4-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707318528;
 bh=+7n5pVOrJGpSPD2dnXtMB6gwHlIVStOENXQWHwSDKOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mbnfke9OWgVb8ObGVryqoY5+mg0/YxjCbLtwzCPJynKu5ZEfoemu6p1mr9AokkXL8
 3da3PCC8yU1ZeyYKWQwU+8reNc29VprpMZEcZngS5QNmhQnroGFKmY3T9r+oMEu4Aq
 y3d/NntezOkZ8ngS0eN5oP1eQX6ypY49jvBAZqpRZgWrKrxeqygvdGnWBVN54CAm80
 0Hk1lmrh/AdktT2vWNHSstEhlYkRLPH/34dp7/nmEGTk3WQynyeapBG9eSM10bnziR
 ubbPbb6Sa5WfZAt3gt88wwaYmv5T9/2X4bNxw+PvYWoBLWGaLR4TC+D9+o7eQuVLxk
 bl0csoxLGC7Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Mbnfke9O
Subject: Re: [Buildroot] [PATCH v4 3/7] package/spirv-llvm-translator: add
 target variant to provide LLVMSPIRVLib
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
> From: Romain Naour <romain.naour@smile.fr>
> 
> This target version is needed for Rusticl which is an LLVM based OpenCL
> framework[1]. Rusticl allow programs to compile OpenCL C/C++ code
> at runtime with Clang. Clang generates LLVM IR which is translated into
> SPIR-V by spirv-llvm-translator. Finally, mesa can use its internal
> tools to manage SPIR-V.
> 
> [1]: https://docs.mesa3d.org/rusticl.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
[--SNIP--]
> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> index 523890a986..8361a74c59 100644
> --- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> @@ -10,7 +10,7 @@ SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c
>  SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
>  SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
>  SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
> -HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
> +HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers spirv-headers zlib

It looks dubious that a host package, host-spirv-llvm-translator,
depends on target packages, spirv-headers and zlib.

If this is really the case, then this would require a good explanation
in the commit log.

>  HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
>  	-DLLVM_BUILD_TOOLS=ON \
>  	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
> @@ -19,4 +19,14 @@ HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
>  	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
>  	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include
>  
> +SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
> +SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm llvm
> +SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
> +	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_DIR}/usr \

    $ ./utils/docker-run make check-package
    package/spirv-llvm-translator/spirv-llvm-translator.mk:25: use $() to delimit variables, not ${}

Regards,
Yann E. MORIN.

> +	-DLLVM_BUILD_TOOLS=ON \
> +	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
> +	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
> +	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
> +
> +$(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
