Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB97C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77CD822E7;
	Wed,  7 Feb 2024 15:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAssYkyJe32m; Wed,  7 Feb 2024 15:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6BAA81EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BAA81EB7;
	Wed,  7 Feb 2024 15:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8B11BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57659401B1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9w-SBi2sKDx1 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4E5340184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E5340184
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E5340184
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:13:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D9A1A13F89C;
 Wed,  7 Feb 2024 16:13:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 16:13:20 +0100
Date: Wed, 7 Feb 2024 16:13:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcOeEMfwX4XlRXO7@landeda>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-3-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202093625.1409559-3-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707318806;
 bh=n7rS7diXV60tLRb9bUozh9PcTGhd9ESDKZz6ZTBDFds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XwkBQtjuui/6GAayVrfIM8ALPQpbHOd5i0w10MoOgp8pfxxZrTxPmVATlXrFykfOA
 F3hfpkxZepw+pONtUinR5xJxru8V+DZCgat/wX+DkR1Z1tWVibIRk6njzFcAFKERgu
 FIHPNhAjA82WDwlUgV49UdXiKAqdXMlJpltv+b+dzFEu+YOFGUljIylcWZcWegfpF/
 /txpZ2oVWaMOExpmK8c6+F7EYShRHywi09taAX3B9O6VRvg/W63YOOrsI0dKzugt8e
 c8FawYJt0w3fxePhIu1VxG97Ww76hqZ43bWSqXVn3csQ28pGubQX5bqZmvxt1zl8GC
 I0vaag4siKYqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XwkBQtju
Subject: Re: [Buildroot] [PATCH v4 2/7] package/pkg-meson.mk: add rust
 cross-compiler support
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
> This change is needed to be able to build target packages requiring
> rust. If a package has rust in its project or in an add_language()
> call in their meson.build file, meson will try to find a suitable
> compiler for this language[1]. If the language is classified as
> required but not found, it will abort the build.
> 
> It is necessary to specify rust and rust_ld separately in
> support/misc/cross-compilation.conf.in. If you specify it in one line
> just as "rust", it will generate the following warning:
>     WARNING: Please do not put -C linker= in your compiler command,
>     set rust_ld=command in your cross file or use the RUST_LD environment
>     variable, otherwise meson will override your selection.
> 
> [1] https://mesonbuild.com/Reference-manual_functions.html#add_languages
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
>  package/pkg-meson.mk                   | 13 +++++++++++++
>  support/misc/cross-compilation.conf.in |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 65cabf23ba..25dd4f0d7f 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -82,6 +82,16 @@ else
>  PKG_MESON_TARGET_FC = /bin/false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
> +PKG_MESON_TARGET_RUSTC = $(HOST_DIR)/bin/rustc
> +PKG_MESON_TARGET_RUSTC_LINKER = $(notdir $(TARGET_CROSS))gcc

Why can't PKG_MESON_TARGET_RUSTC_LINKER be an absolute path, when
PKG_MESON_TARGET_RUSTC is one, and [...]

> +PKG_MESON_TARGET_RUSTC_TARGET_NAME = $(RUSTC_TARGET_NAME)
> +else
> +PKG_MESON_TARGET_RUSTC = /bin/false
> +PKG_MESON_TARGET_RUSTC_LINKER = /bin/false

[...] especially since here PKG_MESON_TARGET_RUSTC_LINKER is an absolute
path?

Regards,
Yann E. MORIN.

> +PKG_MESON_TARGET_RUSTC_TARGET_NAME =
> +endif
> +
>  # Generates sed patterns for patching the cross-compilation.conf template,
>  # since Flags might contain commas the arguments are passed indirectly by
>  # variable name (stripped to deal with whitespaces).
> @@ -91,6 +101,7 @@ define PKG_MESON_CROSSCONFIG_SED
>          -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
>          -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
>          -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
> +        -e "s%@TARGET_RUSTC@%$(PKG_MESON_TARGET_RUSTC)%g" \
>          -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
>          -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
>          -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
> @@ -99,6 +110,8 @@ define PKG_MESON_CROSSCONFIG_SED
>          -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
>          -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
>          -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
> +        -e "s%@TARGET_RUSTC_LINKER@%$(PKG_MESON_TARGET_RUSTC_LINKER)%g" \
> +        -e "s%@RUSTC_TARGET_NAME@%$(PKG_MESON_TARGET_RUSTC_TARGET_NAME)%g" \
>          -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
>          -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
>          -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
> diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
> index a58ab553d0..21cec10b82 100644
> --- a/support/misc/cross-compilation.conf.in
> +++ b/support/misc/cross-compilation.conf.in
> @@ -13,6 +13,8 @@ fortran = '@TARGET_FC@'
>  pkg-config = '@PKGCONF_HOST_BINARY@'
>  g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>  g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
> +rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
> +rust_ld = '@TARGET_RUSTC_LINKER@'
>  
>  [built-in options]
>  c_args = [@TARGET_CFLAGS@]
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
