Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837B0C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0984F60FA6;
	Fri, 15 Mar 2024 19:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xCz_FHpwVyl; Fri, 15 Mar 2024 19:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEE6660F8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE6660F8E;
	Fri, 15 Mar 2024 19:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E90521BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6AF58237A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzypZ0I_8chu for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7071B81757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7071B81757
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7071B81757
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:22:20 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-513d717269fso1738881e87.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530538; x=1711135338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPut9G+2tjtVgfG29I1vz5sYBG3GROWkBQZZWlwCVAU=;
 b=t8uTLAAp5rGVRa+kG90lI6ac9exhkiMUce51TmMIO4AV/3csgYUpXdNkQuyApEg+cP
 Jc7kcXB9iqYfR8mxrqvB2Q+7YQ8woQPkqSLq//v3nHO+HqeEe75DWEEuw8ZgzP7kkjxw
 XsH+NnsJ9s8qsUMgcfIPB2VP2Q3dp0LSlPnrjHwzi3SlwjXBhYSiPLKZuoHQ434eYAOl
 gaPa2v5NuqsPomdKIips7qAM87PcezIFsuXk4P81j0MpmDFEpZZZk3dCpoLrjNsqNAtS
 4mI5qFW87yAX2yUGFa0+QGN0OW7edDKFoIGCC8O5sf8I8VfdOx6aySIEy+GUZI2FhvCR
 Xwvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR5TsPauQqC4/WmK9e6DTJOmVseKgFd73Jdh/CV2NunWWdb6Ma3PZkH6PumRz4FXBo9ShvAAiZ8NI/Qq23HuMFq65mKN19ow==
X-Gm-Message-State: AOJu0YyAn5JGl2uzohrdLtEqNOZr/yst10e2qaXJOtbwzBnek/dLoNMD
 LB7PU1/cdXrVsd66JbRYmoBS5NXj0PO3qtZzuWFfGQY2LPKXKkQCv4rlx4AR95s=
X-Google-Smtp-Source: AGHT+IEz4W1QYmLOuk1bUO9FZcjXJbSHxEjvi5Y/kG1z9MvXe3uqjEjx+o6q3SKckAcrHaOLDNp29g==
X-Received: by 2002:a19:a408:0:b0:513:572f:88f0 with SMTP id
 q8-20020a19a408000000b00513572f88f0mr2886024lfc.41.1710530537904; 
 Fri, 15 Mar 2024 12:22:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:22:17 -0700 (PDT)
Message-ID: <af379656-9aca-4979-b5b1-f0ab586bb9cb@mind.be>
Date: Fri, 15 Mar 2024 20:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>, buildroot@buildroot.org
References: <20240314214422.676788-2-wilfred.mallawa@wdc.com>
In-Reply-To: <20240314214422.676788-2-wilfred.mallawa@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530538; x=1711135338; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XPut9G+2tjtVgfG29I1vz5sYBG3GROWkBQZZWlwCVAU=;
 b=RkEDQSbR+bx//QQrSgC6up+GELI4LDkkwozl8LVkva7cy0GZf5PtIln0hWQvZZji6L
 1r7EqoYUJzhoyNwy4LAUx4iV9VO4DC70lTeLC1JfVqtTaU16fO5LyRuSpGCmUkZ9PBGx
 sd72pD9skSokjDsGbbDhu254RMW7ZAihJsC/N+/Oxx6xR7P4IobFxHp7QXOM0L52Rdw/
 B1Hqqv7DBn8lhwulSOBPiOCjtrwmKxiw7tjROV+6NQ6O4XIeVSbyoxG15toArJxyDZLD
 pVajiFFFDaD1MoZleR0kIY9ySMHhwsHV14y0o4Vrkt8K/xS5La0S8Lp5X4gaVZfh7oA6
 VrlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RkEDQSbR
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Alistair Francis <alistair.francis@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 22:44, Wilfred Mallawa via buildroot wrote:
> Additionally, add an upstream patch that fixes the configuration for
> "NONE" toolchain variant in libspdm. That is, where the build
> environment provides compile/link options.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...eLists-remove-fixed-options-for-NONE.patch | 52 +++++++++++++++++++
>   package/libspdm/libspdm.hash                  |  2 +-
>   package/libspdm/libspdm.mk                    |  2 +-
>   3 files changed, 54 insertions(+), 2 deletions(-)
>   create mode 100644 package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
> 
> diff --git a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
> new file mode 100644
> index 0000000000..0de0ad0079
> --- /dev/null
> +++ b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
> @@ -0,0 +1,52 @@
> +From d4d6b138d727e484fa9d0fef476ca181681d0695 Mon Sep 17 00:00:00 2001
> +From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> +Date: Mon, 19 Feb 2024 09:56:14 +1000
> +Subject: [PATCH] CMakeLists: remove fixed options for NONE
> +
> +The use of the NONE toolchain option is such that we can provide at the
> +build project level (buildroot etc...). However, the changes introduced
> +in 811f2b596def04b3a36368cf2098546d7907767f set certain compiler/linker
> +option that does not comply with the definition of the options as
> +specified in [1]. This change removes those options.
> +
> +[1] https://github.com/DMTF/libspdm/blob/main/doc/build.md#linux-builds-inside-build-environments
> +
> +Upstream: https://github.com/DMTF/libspdm/commit/d4d6b138d727e484fa9d0fef476ca181681d0695
> +Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> +---
> + CMakeLists.txt | 19 -------------------
> + 1 file changed, 19 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9c300cc817..f6cf17d269 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -618,25 +618,6 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
> +         SET(CMAKE_EXE_LINKER_FLAGS "")
> +
> +         SET(CMAKE_C_LINK_EXECUTABLE "")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "NONE")
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-            ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual -Wno-error=implicit-function-declaration)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_LINKER ${CMAKE_C_COMPILER})
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +     endif()
> +
> +     if(NOT TOOLCHAIN STREQUAL "NIOS2_GCC")
> +--
> +2.43.2
> +
> diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
> index 23faba1c4b..32415bcfce 100644
> --- a/package/libspdm/libspdm.hash
> +++ b/package/libspdm/libspdm.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  84d4a755f57b17775c63b5c8be646d518ce34d5d1b85994b6150ebce9d31b183  libspdm-3.1.1.tar.gz
> +sha256  0ee460c0ce5c4d126ca65f9c4bdabd5725b87cec7160b2d06721169df58f3a95  libspdm-3.2.0.tar.gz
>   sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> index 34dbb457c4..2ec35be0ac 100644
> --- a/package/libspdm/libspdm.mk
> +++ b/package/libspdm/libspdm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBSPDM_VERSION = 3.1.1
> +LIBSPDM_VERSION = 3.2.0
>   LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
>   LIBSPDM_LICENSE = BSD-3-Clause
>   LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
