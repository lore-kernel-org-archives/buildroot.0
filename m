Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F10C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14554606C4;
	Wed, 21 Feb 2024 17:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xl4B5pMvFTyE; Wed, 21 Feb 2024 17:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F978606C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F978606C8;
	Wed, 21 Feb 2024 17:50:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8C61BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9612C81770
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBVvlOTueBYW for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F3B281765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F3B281765
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F3B281765
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:50:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7BEDE13F8CF;
 Wed, 21 Feb 2024 18:50:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:50:25 +0100
Date: Wed, 21 Feb 2024 18:50:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-ID: <ZdY34dDgt1oNPx5n@landeda>
References: <20240221004400.27429-1-wilfred.mallawa@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221004400.27429-1-wilfred.mallawa@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708537828;
 bh=h5Ouwi1aKzdZ1GgplRzXl4CR8rZF5wKaK/TPzw/O49A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OtdHKOu8rEGxWA4Tp/DpWaLg+QdE6Tsmq5UfBr6clBXQky5AC9nhLWRLAE4itsp/3
 IVRxsZBcY+rBdzWUd80oAGdN+WP7tbiuZIo/mBEouAw6MafpfCrpc04E1Y+eIHfnbc
 olIJQce/hKYi+KWhvfZ66lLMWBWwsWBpTyjLmCQS8NOikBOk96/p4ZaocZn7VklLFk
 iQj4CCI/x4TdC3abmnVJqVmP4t1Z21AT8RaCjGlXeUEaklDe37U43OW1rkmkg8VZH+
 jocaCUu2aDiC60fYseRNzfFI/fbZ+DOz/ASI1OBn813j5toATUgaRvcPXqsxarOmTF
 c5JrwyIWaUlRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OtdHKOu8
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wilfred, All,

On 2024-02-21 10:44 +1000, Wilfred Mallawa via buildroot spake thusly:
> Additionally, add an upstream patch that fixes the configuration for
> "NONE" toolchain variant in libspdm. That is, where the build
> environment provides compile/link options.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  ...eLists-remove-fixed-options-for-NONE.patch | 51 +++++++++++++++++++
>  package/libspdm/libspdm.hash                  |  2 +-
>  package/libspdm/libspdm.mk                    |  2 +-
>  3 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644 package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
> 
> diff --git a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
> new file mode 100644
> index 0000000000..0d1287a769
> --- /dev/null
> +++ b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
> @@ -0,0 +1,51 @@
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
> +Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

    $ ./utils/docker-run make check-package
    package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)

So you need to add:
    Upstream: https://github.com/DMTF/libspdm/commit/d4d6b138d727e484fa9d0fef476ca181681d0695

Also, as I understand it, NONE is thus no longer a valid value for
-DTOOLCHAIN, so you should drop that from libspdm.mk as well, right?

Regards,
Yann E. MORIN.

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
>  # Locally calculated
> -sha256  84d4a755f57b17775c63b5c8be646d518ce34d5d1b85994b6150ebce9d31b183  libspdm-3.1.1.tar.gz
> +sha256  0ee460c0ce5c4d126ca65f9c4bdabd5725b87cec7160b2d06721169df58f3a95  libspdm-3.2.0.tar.gz
>  sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> index 34dbb457c4..2ec35be0ac 100644
> --- a/package/libspdm/libspdm.mk
> +++ b/package/libspdm/libspdm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSPDM_VERSION = 3.1.1
> +LIBSPDM_VERSION = 3.2.0
>  LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
>  LIBSPDM_LICENSE = BSD-3-Clause
>  LIBSPDM_LICENSE_FILES = LICENSE.md
> -- 
> 2.43.2
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
