Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F21C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E756069D;
	Sat, 31 May 2025 16:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWY9IEtR1A3h; Sat, 31 May 2025 16:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2303B60751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2303B60751;
	Sat, 31 May 2025 16:47:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43AD6235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE4160751
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNo9NKGD0JJz for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29A666072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A666072E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29A666072E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED7E91C00BA; Sat, 31 May 2025 18:47:02 +0200 (CEST)
Message-ID: <111575be-02b1-4bd8-9598-24ebc491625d@rnout.be>
Date: Sat, 31 May 2025 18:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <1089203+tpetazzoni@users.noreply.github.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250309162614.2549737-1-dungeonlords789@naver.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250309162614.2549737-1-dungeonlords789@naver.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Q4FLfTOzraeA/34Pysp2P5SEO9umw6M/nkikQjl2YHs=;
 b=EENIERFL6tweuJ44+pIxh7gdXjyvdSZMBaNbe2JTN50lRf67R/c37MNK0RiSnp+gQ01QQQ
 H1yk0LsErGhNdYwdWdQMGmtC0faaapFVRWSDzPYcaVgWGIKTMBwBgIOf5MfUnPVPQ1mJLv
 7pBOSVPKXcL4V7v5T1T28DalKy9XAX8aKb0XrjBdD+Y7B5J3/Cegb69XhYxq28PgVckfnL
 iWR9PfUTCAsSyIEpeLqAkqNB0xMAhxEH3TEPW93GSvEkVSodpH4MzjJYmHc+Pxu0q5JAol
 mJviKtcv9GUWeXAWJxfI8pG/dO+1u69EeFrT8fNpKKZjkhs9yeNVJpdyvQQWmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EENIERFL
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-meson: change build sub-dir
 name
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



On 09/03/2025 17:26, Cherniaev Andrei wrote:
> I encountered a situation where build/ is not empty folder so when all files in build/ was removed by buildroot I was not able to use meson, example https://gitlab.com/buildroot.org/buildroot/-/issues/64
> The choice of "build" as the build sub-directorty is a bit stupid.
> 
> Co-Authored-By: Thomas Petazzoni <1089203+tpetazzoni@users.noreply.github.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-meson.mk | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index bc805b799c..30271e35e5 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -147,12 +147,12 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
>   #
>   #
>   define $(2)_CONFIGURE_CMDS
> -	rm -rf $$($$(PKG)_SRCDIR)/build
> -	mkdir -p $$($$(PKG)_SRCDIR)/build
> +	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
> +	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
>   	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
>   	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
>   	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
> -	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> +	    > $$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
>   	PATH=$$(BR_PATH) \
>   	CC_FOR_BUILD="$$(HOSTCC)" \
>   	CXX_FOR_BUILD="$$(HOSTCXX)" \
> @@ -162,21 +162,21 @@ define $(2)_CONFIGURE_CMDS
>   		--libdir=lib \
>   		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
>   		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
> -		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> +		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
>   		-Db_pie=false \
>   		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
>   		-Dstrip=false \
>   		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
>   		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
>   		$$($$(PKG)_CONF_OPTS) \
> -		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
> +		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
>   endef
>   else
>   
>   # Configure package for host
>   define $(2)_CONFIGURE_CMDS
> -	rm -rf $$($$(PKG)_SRCDIR)/build
> -	mkdir -p $$($$(PKG)_SRCDIR)/build
> +	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
> +	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
>   	$$(HOST_CONFIGURE_OPTS) \
>   	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
>   		--prefix=$$(HOST_DIR) \
> @@ -188,7 +188,7 @@ define $(2)_CONFIGURE_CMDS
>   		--wrap-mode=nodownload \
>   		-Dstrip=true \
>   		$$($$(PKG)_CONF_OPTS) \
> -		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
> +		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
>   endef
>   endif
>   endif
> @@ -203,12 +203,12 @@ ifndef $(2)_BUILD_CMDS
>   ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
>   	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
>   endef
>   else
>   define $(2)_BUILD_CMDS
>   	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
>   endef
>   endif
>   endif
> @@ -220,7 +220,7 @@ endif
>   ifndef $(2)_INSTALL_CMDS
>   define $(2)_INSTALL_CMDS
>   	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
>   endef
>   endif
>   
> @@ -231,7 +231,7 @@ endif
>   ifndef $(2)_INSTALL_STAGING_CMDS
>   define $(2)_INSTALL_STAGING_CMDS
>   	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
>   endef
>   endif
>   
> @@ -242,7 +242,7 @@ endif
>   ifndef $(2)_INSTALL_TARGET_CMDS
>   define $(2)_INSTALL_TARGET_CMDS
>   	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
>   endef
>   endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
