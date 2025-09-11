Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20755CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E647A40D94;
	Thu, 11 Sep 2025 19:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-KXGmDEkA2j; Thu, 11 Sep 2025 19:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CFE40DA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3CFE40DA7;
	Thu, 11 Sep 2025 19:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D9BD443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F3656F4B6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4qDD9-k2fwH for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 499E46F4B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 499E46F4B3
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 499E46F4B3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-62598fcf41aso1449417a12.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618769; x=1758223569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pQfUcKuQ9dWVqRhO29Q8P2jmgXdzHkXVwsZMpaosn4=;
 b=YWzz7f6rdloaFLzpsvPrcyrlqEAbJr4vdrOgoa64A3CLh6M9FWMjl+7jJo0/hLZCG8
 +yDW8KRwfjrJIiRKZqrqeA1aytOWBR5D+RUuW0LJpn7IA89je7qGeW0LTl9J11sen+WL
 PWqUHgL0efsJNJ47acs9Sy8MWQ7AvGgLvDyYqHZ2jfZnCISG/xyg+LS16x5GmfHWfuG+
 nFxi8OP1xjSrN61RGWKBCvXJ7fEZcvWNuloLXutiEa9NqiaZiBhGC0uc8cgjMR8l44Iv
 NwJEbUHoJYNE77f+3s5FfqMXSKLXkaxRUOIrYfEjWY21Qkzi/EXaoPdSuq4JCpPZNvED
 jecQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4hNB0WSeYtOxwuHamz+Jp2rZ9eYz2fO/GQuwsgVzv3Y6gvF6o1Y/X3onZXHuzfsmHUiIKEc5wqeI=@buildroot.org
X-Gm-Message-State: AOJu0Yyg3R5xr5YboQ6ENNuQfwPlZaB1x3bLB0M6YvQy8lCBgnybq0Kk
 1eeCmo6Mv+qY2aNQRB0U2Ix25pr/rH+GINXeP3I/tq3RW2tKLwMVtpLe7JjWoOnk4xU=
X-Gm-Gg: ASbGncs+TJIlXfJx3zTEeaatoj6Rw1n0EigzZz9ZU9ukSOvV4SlgX5p2Llq2za0TPJE
 yurXUyQvHCWPuOFqf+dEeBrwCXjpYFZ7NmFVQRsIavu/4oNPEXpuyassCxIXS2WaaRDSf5XFQsA
 y8A9+uzUCDleqTYu/IwaJ7hOUfZyip00mzqiEJ5OLXOYfhGIdokKjHOCA471+1pUaEMYQh6Z+J1
 BJSWb+y2h+iylbsUYLqgv8rJmh3zNKkfo4gxVOfgDZ8Tiv8a43JWl1LevVGlR09bnBIdiltAyuT
 SDQLZ97Zh7oPmrJ7rrC2aCTV/eK/Hh4H8/O1OAtyQZDPNeUXd5TKza2RdKXk7Wxmf/3BgPPyOns
 Qup+1ggKMo50rkBXEPjc5aXliei2CMoHiT+hU
X-Google-Smtp-Source: AGHT+IEkwPVTco5eUw8khQmotVTqddIo/Q8KNtYTnJWKToPqfpajvEpIm3M5kEM7OONpXBQ2DV7V/A==
X-Received: by 2002:a17:907:3c91:b0:b04:26d8:97b7 with SMTP id
 a640c23a62f3a-b07c3573a59mr33714066b.17.1757618769134; 
 Thu, 11 Sep 2025 12:26:09 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd309sm193568766b.53.2025.09.11.12.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:26:08 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:25:46 +0200
Message-Id: <20250911192546.2672578-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905055201.76291-1-bernd@kuhls.net>
References: <20250905055201.76291-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618769; x=1758223569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pQfUcKuQ9dWVqRhO29Q8P2jmgXdzHkXVwsZMpaosn4=;
 b=c/Z/PN3Ar5SicXNiODCfahwMLklSdRgpI635MtHNY5fNZlFZw7pf8DPRgPRoYv+EUI
 LFpy6mEmS98SXtpxUccLsTN1bNd+X8/ERKYjOjahPlWNgm1qEBJ2coRJ90/nFqcrdM2p
 yZofMHjJsJ0TybtUCIBwm4JUAZFauriGYKRdV6BMCE1eDZaADRjBkMVCwpFuWa1gUQCM
 +nrQuPtQM39ozzRQ7e08dnhrBxfcYxy2cNYVS2foPYbT64r0cj2oaDibcfic4U5mKnYP
 GBrKuC6fsQCMi7t8U21wk9dVCes0sDz9dRyV4k+B95nCaUlfKnGQ6xAFHLDjrbwRIjjC
 yfYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c/Z/PN3A
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: security bump version to
 0.28.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Changelog:
> https://exiv2.org/whatsnew.html
> https://github.com/Exiv2/exiv2/blob/v0.28.7/doc/ChangeLog
> 
> Release notes of 0.28.0 with a long list of security-related fixes:
> https://github.com/Exiv2/exiv2/issues/2406#issuecomment-1529139799
> 
> 0.28.1 fixed CVE-2023-44398: https://github.com/Exiv2/exiv2/issues/2813
> 
> 0.28.2 fixed CVE-2024-24826 & CVE-2024-25112:
> https://github.com/Exiv2/exiv2/issues/2914
> 
> 0.28.3 fixed CVE-2024-39695: https://github.com/Exiv2/exiv2/issues/3008
> 
> 0.28.5 fixed CVE-2025-26623: https://github.com/Exiv2/exiv2/issues/3181
> 
> 0.28.6 fixed
> * [CVE-2025-54080](https://github.com/Exiv2/exiv2/security/advisories/GHSA-496f-x7cq-cq39)
> * [CVE-2025-55304](https://github.com/Exiv2/exiv2/security/advisories/GHSA-m54q-mm9w-fp6g)
> 
> Please read https://github.com/Exiv2/exiv2/issues/2406 for the discussion
> whether these CVEs are relevant and their status of backporting to the
> 0.27.x branch.
> 
> Removed patch which is included in this release.
> Switch to github helper due to upstream not providing tarballs anymore.
> 
> Added optional support for inih:
> https://github.com/Exiv2/exiv2/commit/43c9ec0f5095d92e2dd748c6c0b6f7ae4e6c73bf
> and brotli:
> https://github.com/Exiv2/exiv2/commit/557a5cebd52ced79d11080089d8e2874126fb038
> both introduced in the 0.28.x branch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...dd-BUILD_WITH_STACK_PROTECTOR-option.patch | 54 -------------------
>  package/exiv2/Config.in                       | 12 +++++
>  package/exiv2/exiv2.hash                      |  2 +-
>  package/exiv2/exiv2.mk                        | 19 +++++--
>  4 files changed, 29 insertions(+), 58 deletions(-)
>  delete mode 100644 package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
> 
> diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
> deleted file mode 100644
> index 18684ebbfa..0000000000
> --- a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 4bb57da5fb0bb0d7e747b9e325e9ec0876ffc1f9 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 31 Jul 2021 16:36:50 +0200
> -Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
> -
> -Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
> -toolchains that don't support stack-protector:
> -
> -/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/9.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: utils.cpp:(.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag[_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag]+0xd0): undefined reference to `__stack_chk_fail'
> -
> -Indeed, support for -fstack-protector-strong can't be detected through
> -check_cxx_compiler_flag as some toolchains need to link with -lssp to
> -enable SSP support
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
> -
> -Upstream: https://github.com/Exiv2/exiv2/commit/f31c0eba098889899d29b7b0da830aee2b62a7b8
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - CMakeLists.txt            | 1 +
> - cmake/compilerFlags.cmake | 4 ++--
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 6f0da06a..0746ee14 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -47,6 +47,7 @@ mark_as_advanced(
> -     EXIV2_TEAM_USE_SANITIZERS
> - )
> - 
> -+option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
> - option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
> - option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
> - 
> -diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
> -index 35faf501..0a646e50 100644
> ---- a/cmake/compilerFlags.cmake
> -+++ b/cmake/compilerFlags.cmake
> -@@ -33,8 +33,8 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
> -             endif()
> -             if(HAS_FCF_PROTECTION)
> -                 add_compile_options(-fcf-protection)
> --            endif()
> --            if(HAS_FSTACK_PROTECTOR_STRONG)
> -+              endif()
> -+	    if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
> -                 add_compile_options(-fstack-protector-strong)
> -             endif()
> -         endif()
> --- 
> -2.31.1
> -
> diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
> index 8407c25b41..c65e484b2e 100644
> --- a/package/exiv2/Config.in
> +++ b/package/exiv2/Config.in
> @@ -20,6 +20,18 @@ config BR2_PACKAGE_EXIV2
>  
>  if BR2_PACKAGE_EXIV2
>  
> +config BR2_PACKAGE_EXIV2_BROTLI
> +	bool "Brotli support"
> +	select BR2_PACKAGE_BROTLI
> +	help
> +	  Build with Brotli support for JPEG XL
> +
> +config BR2_PACKAGE_EXIV2_INIH
> +	bool "Inih support"
> +	select BR2_PACKAGE_INIH
> +	help
> +	  Build with inih support
> +
>  config BR2_PACKAGE_EXIV2_PNG
>  	bool "PNG image support"
>  	select BR2_PACKAGE_ZLIB
> diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
> index c871277801..1c85f2e1db 100644
> --- a/package/exiv2/exiv2.hash
> +++ b/package/exiv2/exiv2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6  exiv2-0.27.6-Source.tar.gz
> +sha256  5e292b02614dbc0cee40fe1116db2f42f63ef6b2ba430c77b614e17b8d61a638  exiv2-0.28.7.tar.gz
>  sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
> index 869f8e48dd..e5b55ecde7 100644
> --- a/package/exiv2/exiv2.mk
> +++ b/package/exiv2/exiv2.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -EXIV2_VERSION = 0.27.6
> -EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
> -EXIV2_SITE = https://github.com/Exiv2/exiv2/releases/download/v$(EXIV2_VERSION)
> +EXIV2_VERSION = 0.28.7
> +EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
>  EXIV2_INSTALL_STAGING = YES
>  EXIV2_LICENSE = GPL-2.0+
>  EXIV2_LICENSE_FILES = COPYING
> @@ -16,6 +15,20 @@ EXIV2_CONF_OPTS += \
>  	-DBUILD_WITH_STACK_PROTECTOR=OFF \
>  	-DEXIV2_BUILD_SAMPLES=OFF
>  
> +ifeq ($(BR2_PACKAGE_EXIV2_BROTLI),y)
> +EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BROTLI=ON
> +EXIV2_DEPENDENCIES += brotli
> +else
> +EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BROTLI=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_EXIV2_INIH),y)
> +EXIV2_CONF_OPTS += -DEXIV2_ENABLE_INIH=ON
> +EXIV2_DEPENDENCIES += inih
> +else
> +EXIV2_CONF_OPTS += -DEXIV2_ENABLE_INIH=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
>  EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
>  else
> -- 
> 2.47.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
