Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9E3C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E066103B
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02E066103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B51DF6078B;
	Sat, 31 Jul 2021 09:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdsLQgdXBRc8; Sat, 31 Jul 2021 09:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62F460600;
	Sat, 31 Jul 2021 09:53:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DAE1BF2F3
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3501740472
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqh3ag9HC8E5 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 09:53:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 302964046F
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 09:53:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C93E578035B;
 Sat, 31 Jul 2021 11:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627725205;
 bh=/UDZxjrTdAl0ohDIPk6iZE/Hnv5m6baanZEUbD5Pesk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kwj3D75/xmu+VXVR7Ql9HVbrr0BuKIE49ZUmGd7kVn/AWwcqwwUQgTwHK2JuhWC/E
 1cTfT4VB3qcYNTvjGOVGzFkuQGOuubuXXeTqGXif9cpYo+0eVzzs1KESRo5XC+XVGA
 Wf75+vN0zFm3vNXRlqgTEb2tFnp2P14GKk75E0MRiQHDva1b2bcr1rpLLrMHN84aEH
 eJ+OnptMC50qvvej2UhH6qv16n8Q8RzVfPzTBDJJQlVtPwpzW08bDXQNshNNr6g1Ig
 oiMuc3WOBiU5euj5cmBhuI2FDxeLaNW6/xf56899C5ZXeLLk/r/dS3RVW25+lOgrbN
 n1UY78AqEBOxA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 11:53:20 +0200
Date: Sat, 31 Jul 2021 11:53:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210731095320.GJ3189549@scaer>
References: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: fix build without SSP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-07-01 19:47 +0200, Fabrice Fontaine spake thusly:
> Build without SSP fails since bump to version 0.27.4 in commit
> bcace429426ee91aac56f3dcc33b69e22141d384
> 
> This is due to the fact that
> https://github.com/Exiv2/exiv2/commit/bbe0b70840cf28b7dd8c0b7e9bb1b741aeda2efd
> removed the wrong GCC_ prefix from HAS_FSTACK_PROTECTOR_STRONG variable
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dd-BUILD_WITH_STACK_PROTECTOR-option.patch | 52 +++++++++++++++++++

This patch does not apply:

    >>> exiv2 0.27.4 Patching

    Applying 0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch using patch:
    patching file CMakeLists.txt
    Hunk #1 succeeded at 47 with fuzz 1 (offset -5 lines).
    patching file cmake/compilerFlags.cmake
    Hunk #1 FAILED at 44 (different line endings).
    1 out of 1 hunk FAILED -- saving rejects to file cmake/compilerFlags.cmake.rej
    make[1]: *** [package/pkg-generic.mk:227: /home/ymorin/dev/buildroot/O/build/exiv2-0.27.4/.stamp_patched] Error 1
    make: *** [Makefile:23: _all] Error 2

Could you look into this, please?

Regards,
Yann E. MORIN.

>  package/exiv2/exiv2.mk                        |  4 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
> 
> diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
> new file mode 100644
> index 0000000000..aced5ab311
> --- /dev/null
> +++ b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
> @@ -0,0 +1,52 @@
> +From 8651c9f823ace70b6609b10aeef0c0740636b570 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 1 Jul 2021 19:31:25 +0200
> +Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
> +
> +Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
> +toolchains that don't support stack-protector:
> +
> +/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/9.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: utils.cpp:(.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag[_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag]+0xd0): undefined reference to `__stack_chk_fail'
> +
> +Indeed, support for -fstack-protector-strong can't be detected through
> +check_cxx_compiler_flag as some toolchains need to link with -lssp to
> +enable SSP support
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/Exiv2/exiv2/pull/1756]
> +---
> + CMakeLists.txt            | 1 +
> + cmake/compilerFlags.cmake | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9fe8b5f9..aabb3dca 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -52,6 +52,7 @@ mark_as_advanced(
> +     EXIV2_TEAM_USE_SANITIZERS
> + )
> + 
> ++option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
> + option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
> + option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
> + include(cmake/gcovr.cmake REQUIRED)
> +diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
> +index c8a85c59..20f6ac53 100644
> +--- a/cmake/compilerFlags.cmake
> ++++ b/cmake/compilerFlags.cmake
> +@@ -44,7 +44,7 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
> +             if(HAS_FCF_PROTECTION)
> +                 add_compile_options(-fcf-protection)
> +             endif()
> +-            if(HAS_FSTACK_PROTECTOR_STRONG)
> ++            if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
> +                 add_compile_options(-fstack-protector-strong)
> +             endif()
> +         endif()
> +-- 
> +2.30.2
> +
> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
> index 52bf03fc63..33222e6381 100644
> --- a/package/exiv2/exiv2.mk
> +++ b/package/exiv2/exiv2.mk
> @@ -12,7 +12,9 @@ EXIV2_LICENSE = GPL-2.0+
>  EXIV2_LICENSE_FILES = COPYING
>  EXIV2_CPE_ID_VENDOR = exiv2
>  
> -EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
> +EXIV2_CONF_OPTS += \
> +	-DBUILD_WITH_STACK_PROTECTOR=OFF \
> +	-DEXIV2_BUILD_SAMPLES=OFF
>  
>  ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
>  EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
