Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E12AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DB0418CD;
	Mon, 20 Jun 2022 19:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79DB0418CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoBC_JD5S4Ez; Mon, 20 Jun 2022 19:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD3F41837;
	Mon, 20 Jun 2022 19:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD3F41837
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B52711BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F0E440B64
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0E440B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ksb-ynDj3TM for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA8440B63
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BA8440B63
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id fd6so13731023edb.5
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fL2M+pwdBpEom8gEtLcH1cFamvHy1PkIpLC9ICEDiAw=;
 b=OO0+NaQwBIksbP/rPqrSORlhO8ieJdHD2AHWDRBb8l1J4i0J6LVG6sWycQpIgm7040
 CuHMQCwpf78MW3pdzBmLHOKqbbBiBgG0+GI5GmxBEhf6gDNxof6ObXwIxEDOmHy5yA5z
 BQzc3Mxkg+Bowv/SxP4OHRBO5PrgPhwp6Hq6cqv63OwKN1BdR4006U+xD3h0JuqNUFLa
 nGZH+Urb0Rstyedr4ZMRa95E9/+C45fQzwJL+LguwxIFgyo5Bh9feVMGkqtgy0NsLuXT
 S1D3G27nxHmOim3xej3GeltSLMzIaHqPZs8GQ5idtqzV+Zbe/+PIN4MmXorK8sf8+8fM
 G3MQ==
X-Gm-Message-State: AJIora+NWVAC3hxRvFYXR+kOlpfW/W6plG+/wZCyz4cxGers1puAAGzL
 x11PWZFY/QtLaIAMM4/TUc1E8w==
X-Google-Smtp-Source: AGRyM1uxkrbw0F8NpgmHJ+QqCKZM2PlCpQt+AEkcN+u64ZM2ukqlYV4VYyJdwQFlH8timQlAPiOSBA==
X-Received: by 2002:a05:6402:2554:b0:42d:ee79:559d with SMTP id
 l20-20020a056402255400b0042dee79559dmr31432113edb.175.1655753661485; 
 Mon, 20 Jun 2022 12:34:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906328200b00722dceb3f8bsm508653ejw.151.2022.06.20.12.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:34:20 -0700 (PDT)
Message-ID: <7c693be3-5b9d-757d-a2b3-4f081faa9f5a@mind.be>
Date: Mon, 20 Jun 2022 21:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fL2M+pwdBpEom8gEtLcH1cFamvHy1PkIpLC9ICEDiAw=;
 b=J/hJxmqY6P36iy91EOyYBypErg3u+E39/tMTlJ++iMlcPf1zO+Rj7v9yjjpzXBYjj4
 pb9yNYzg5fgU3daO05i/qIJF71yw757jVyS66uSHZsUX0z7zuTsjF6IHZ4oVasGKq9j/
 BBQQxQ/1sa7p05kH4+J5QcInEPdtsQgZ/xPmuKyQ3DNlFrj3UNokXYwX8J9rkM/PHaDD
 0JarmgX1dyNx5aN2zK760sFCCa17z8dl/1IG613R6lddtd+MEULWSihGgcxdd0j/4lLi
 ddj3CjdeNHNyD9ub4b8HQq6jl2Z+i1gneao6CsUzgPB4/ZZHxIlLV0euIFS0hr5JLl/M
 JvaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J/hJxmqY
Subject: Re: [Buildroot] [PATCH v12 01/11] package/llvm: bump to version
 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2022 00:22, James Hilliard wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Series applied to master, thanks!

  Regards,
  Arnout

> ---
> Changes v11 -> v12:
>    - add gcc 5 dependency due to c++14 requirement
>    - propagate gcc 5 reverse dependency
>    - remove unsupported config options
> ---
>   package/clang/Config.in  |  6 +++---
>   package/llvm/Config.in   |  6 +++---
>   package/llvm/llvm.hash   |  2 +-
>   package/llvm/llvm.mk     | 20 ++++++--------------
>   package/mesa3d/Config.in |  6 +++---
>   5 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/package/clang/Config.in b/package/clang/Config.in
> index a67e7631a8..7c732c7af7 100644
> --- a/package/clang/Config.in
> +++ b/package/clang/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_CLANG
>   	bool "clang"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> @@ -14,10 +14,10 @@ config BR2_PACKAGE_CLANG
>   
>   	  http://clang.llvm.org
>   
> -comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
> +comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
>   		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
>   comment "clang needs a toolchain not affected by GCC bug 64735"
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 6ec2ffcfe6..c1887e36dd 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
>   config BR2_PACKAGE_LLVM
>   	bool "llvm"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> @@ -55,10 +55,10 @@ config BR2_PACKAGE_LLVM_BPF
>   
>   endif
>   
> -comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
> +comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
>   		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
>   comment "llvm needs a toolchain not affected by GCC bug 64735"
> diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
> index 6bf2755777..e93a922492 100644
> --- a/package/llvm/llvm.hash
> +++ b/package/llvm/llvm.hash
> @@ -1,3 +1,3 @@
>   # locally calculated
> -sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
> +sha256 ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5 llvm-11.1.0.src.tar.xz
>   sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 6c721c30b9..825de96392 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # LLVM, Clang and lld should be version bumped together
> -LLVM_VERSION = 9.0.1
> +LLVM_VERSION = 11.1.0
>   LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
>   LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
>   LLVM_LICENSE = Apache-2.0 with exceptions
> @@ -157,15 +157,9 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
>   HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
>   LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
>   
> -# Disable C++1y (ISO C++ 2014 standard)
> -# Disable C++1z (ISO C++ 2017 standard)
> -# Compile llvm with the C++11 (ISO C++ 2011 standard) which is the fallback.
> -HOST_LLVM_CONF_OPTS += \
> -	-DLLVM_ENABLE_CXX1Y=OFF \
> -	-DLLVM_ENABLE_CXX1Z=OFF
> -LLVM_CONF_OPTS += \
> -	-DLLVM_ENABLE_CXX1Y=OFF \
> -	-DLLVM_ENABLE_CXX1Z=OFF
> +# Compile llvm with the C++14 (ISO C++ 2014 standard).
> +HOST_LLVM_CONF_OPTS += -DCMAKE_CXX_STANDARD=14
> +LLVM_CONF_OPTS += -DCMAKE_CXX_STANDARD=14
>   
>   # Disabled, requires sys/ndir.h header
>   # Disable debug in module
> @@ -237,13 +231,11 @@ endif
>   HOST_LLVM_CONF_OPTS += \
>   	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
>   	-DLLVM_BUILD_RUNTIME=OFF \
> -	-DLLVM_INCLUDE_RUNTIMES=OFF \
> -	-DLLVM_POLLY_BUILD=OFF
> +	-DLLVM_INCLUDE_RUNTIMES=OFF
>   LLVM_CONF_OPTS += \
>   	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
>   	-DLLVM_BUILD_RUNTIME=OFF \
> -	-DLLVM_INCLUDE_RUNTIMES=OFF \
> -	-DLLVM_POLLY_BUILD=OFF
> +	-DLLVM_INCLUDE_RUNTIMES=OFF
>   
>   HOST_LLVM_CONF_OPTS += \
>   	-DLLVM_ENABLE_WARNINGS=ON \
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index e41da562dc..b0ebc09212 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -24,7 +24,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
>   config BR2_PACKAGE_MESA3D_LLVM
>   	bool "llvm support"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> @@ -32,10 +32,10 @@ config BR2_PACKAGE_MESA3D_LLVM
>   	depends on BR2_USE_WCHAR # std::wstring
>   	select BR2_PACKAGE_LLVM
>   
> -comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
> +comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
>   		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
>   comment "llvm support needs a toolchain not affected by GCC bug 64735"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
