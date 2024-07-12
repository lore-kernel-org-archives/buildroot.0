Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA23C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960CE6089F;
	Fri, 12 Jul 2024 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLbw3T-MTvca; Fri, 12 Jul 2024 18:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5275D613D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5275D613D7;
	Fri, 12 Jul 2024 18:34:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 089C61BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA9BA613D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnVTKESAxT4u for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 316546089F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 316546089F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 316546089F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:34:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4279f48bd94so6823995e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720809250; x=1721414050;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8t69FBP2z+akSveqBJJ+lhIin+Z9G4t+P+VleT31Yg=;
 b=SeoROP3S31eb7OxeH4j8VPLQAwNvxQGcT7LpOifU0SnBFJhogEHaWyNp1TA343nJYI
 oESeR3Gk/VXPix3uMZKnJcpE0+9IyGdPV85ms8q5ActIrHm7B/krQ/zndhsFZUVsY9bQ
 WPUQgALgvVFk9tNF6PwZhNWgV9kqoKQ5OK9EViCNw3PjxCzaNzM3OPS81THlxBAVxIVw
 pzy1mOqFYszhIkXtAuN58EkO5IpigKYVnUHRC29UCUAajQiHQCkzdB66dVNqOKf1CU9h
 CE0m+gaIEzsrfvNfqKi5K5cZM/621Yn+KpYZTPeGsYWPsEBYfZTPdh4eRvPmV92u3+Yk
 cBFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF1p/yqa5eXSWHa2mHerUsGuT4E9b1RRpdBuyux1KMEA3oTlw/16dcKrd+zJlC1ZE2GHCBIlZW99ChSzrPPzQXuIpDm0qSZg==
X-Gm-Message-State: AOJu0Yysysb8lTDBaBkNuFX2/t221ovTGH1vU6PKTwsLVqmROP/n3fEt
 a1Z2jOfqHuSS2nm7neLg/GjvTPQdWLfeErodDGu1NG1KB5ZlkxASINRlSRht7b8=
X-Google-Smtp-Source: AGHT+IHwI/DYeqC9FzlQ5ziELfq18B1ZMt7FvjA/6jqczAv1g86aozBma45lSztr0gonbxj+bRVFjQ==
X-Received: by 2002:a05:600c:3ba9:b0:426:647b:1bf7 with SMTP id
 5b1f17b1804b1-426708f151bmr87035915e9.32.1720809249620; 
 Fri, 12 Jul 2024 11:34:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276a62sm31039355e9.24.2024.07.12.11.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 11:34:09 -0700 (PDT)
Message-ID: <2667bda5-a919-469c-9de5-2d78da18b96f@mind.be>
Date: Fri, 12 Jul 2024 20:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-30-ricardo.martincoski@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230101233653.487175-30-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720809250; x=1721414050; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S8t69FBP2z+akSveqBJJ+lhIin+Z9G4t+P+VleT31Yg=;
 b=BXuRj8VvRP2bVNiNtGcv0NzNhDE9p0Thsx3SHaatlCc7Oj6KLLd3+7gPKBaERPKw1a
 WS0UHuaBcSY3v/ChqPTtoFVNAkIjJQx1wUmI+Qyjm0kBe+Ql0ZFPlHZQOkiiVHuk09jj
 TYPF4hUS+OKWiYURkh7iCeK4vwqjuo2GbjWcWoqA0jEs+Q/JhCGUS+BvhQw1YBXP+nmV
 OoYZS/bs9uH1AsCVTjtTTPawAkI2G79sXBCLFN0a4izaYjc/p4r8oL01Zs0E+NCgvC9x
 PUAA4zAj1oyC30FLSZSdfJn0CXnqr8dYemHCC0mny0WWlIlu5l6DKHcCKS49+cWHP9iR
 3i+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BXuRj8Vv
Subject: Re: [Buildroot] [PATCH 29/29] docs/manual: standardize references
 to the generic infra
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2023 00:36, Ricardo Martincoski wrote:
> Currently the text for each package infra that mentions the usage of
> variables already provided by the generic infra diverge from each other:
> - some (golang, kconfig, python) add a cross-referece to the generic
>    infra chapter;
> - kconfig does not list any example;
> - some mention _LICENSE as an example, others don't;
> - some (cargo, golang, python) add an 'etc.' at the end of the examples,
>    giving the idea that can be more symbols provided by the generic
>    infra than the ones listed;
> - most have the text 'works by defining a number of variables before
>    calling the +<macro-name>+ macro', except golang and kconfig;
> - some actually list 'A few additional variables' but keep using some
>    old reference as 'An additional variable';
> - some say 'First, all the package metadata' and other only 'All the
>    package metadata';
> - most mention _SUBDIR as an example of variable supported by the
>    generic infra, even the generic infra manual not mentioning it.
> 
> The _SUBDIR variable is a tricky one. It *is* declared for the generic
> infra package (and all package infras that inherit from the generic

  I don't agree with this _SUBDIR discussion. I think it simply should be 
documented in the generic package infra, together with SRCDIR and BUILDDIR.

> one), but it is really used in certain conditions.
> package/pkg-generic.mk uses <pkg>_SUBDIR only to define:
> (2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
> and it also uses <pkg>_SRCDIR only to define:
> $(2)_BUILDDIR                   ?= $$($(2)_SRCDIR)
> so the generic package infra does not really uses _SUBDIR by itself in
> the common scenario.
> So the manual entry for the generic infra seems correct in not
> mentioning _SUBDIR.
> Also any package infra that inherits from the generic one (by calling
> inner-generic-package) needs to use one of the three variables in order
> to support _SUBDIR: _BUILDDIR, _SRCDIR or _SUBDIR.
> That is the case for: autotools (_SRCDIR), cargo (_SRCDIR, _SUBDIR),
> cmake (_BUILDDIR, _SRCDIR), luarocks (_SRCDIR, _SUBDIR),
> meson (_SRCDIR), perl (_SRCDIR), python (_BUILDDIR), qmake (_BUILDDIR)
> and waf (_SRCDIR).
> Of course the .mk file for a package using the generic infra can define
> this symbol and use it, directly or indirectly, for example, in its
> _INSTALL_TARGET_CMDS.
> Also any package infra, even the ones that do not use directly any of
> the three variables above, can use _SUBDIR when the package uses the
> macros KCONFIG_ENABLE_OPT, KCONFIG_SET_OPT or KCONFIG_DISABLE_OPT
> declared in package/pkg-utils.mk.
> 
> Improve the correctness for the manual by standardizing the text among
> the package infras:
> - use the same text "All the package metadata information variables that
>    exist in the generic package infrastructure also exist in the
>    <name> infrastructure:" for all of them;
> - add the cross-reference for all of them;
> - do not mention _SUBDIR as a variable that exist on generic infra;
> - use the same set of examples for all infras: "_VERSION, _SOURCE,
>    _PATCH, _SITE, _DEPENDENCIES, _LICENSE, _LICENSE_FILES, etc.";

  I don't actually think those examples add much value. They were also still 
slightly different between different infras, e.g. sometimes using FOO and 
sometimes LIBFOO. I just dropped the examples completely. This also nicely 
sidesteps the _SUBDIR issue.

> - wrap the modified text at 72 columns;

  Should be 80, actually. I didn't fix that.

  Applied to master, thanks.

  Regards,
  Arnout

> - add "macro" to golang and luarocks infra;
> - use "A few additional variables" for qmake and waf.
> 
> At same time, add a missing format on golang manual for
> BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.
> 
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>   docs/manual/adding-packages-autotools.txt | 11 +++++------
>   docs/manual/adding-packages-cargo.txt     |  9 +++++----
>   docs/manual/adding-packages-cmake.txt     | 10 +++++-----
>   docs/manual/adding-packages-golang.txt    |  9 +++++----
>   docs/manual/adding-packages-kconfig.txt   | 18 ++++++++++++++----
>   docs/manual/adding-packages-luarocks.txt  | 12 +++++++-----
>   docs/manual/adding-packages-meson.txt     |  9 +++++----
>   docs/manual/adding-packages-perl.txt      | 12 ++++++------
>   docs/manual/adding-packages-python.txt    |  4 ++--
>   docs/manual/adding-packages-qmake.txt     | 12 ++++++------
>   docs/manual/adding-packages-rebar.txt     | 13 ++++++-------
>   docs/manual/adding-packages-waf.txt       | 12 ++++++------
>   12 files changed, 72 insertions(+), 59 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> index a041d91eb6..0cec82d95f 100644
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -76,12 +76,11 @@ Just like the generic infrastructure, the autotools infrastructure
>   works by defining a number of variables before calling the
>   +autotools-package+ macro.
>   
> -First, all the package metadata information variables that exist in the
> -generic infrastructure also exist in the autotools infrastructure:
> -+LIBFOO_VERSION+, +LIBFOO_SOURCE+,
> -+LIBFOO_PATCH+, +LIBFOO_SITE+,
> -+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+,
> -+LIBFOO_INSTALL_STAGING+, +LIBFOO_INSTALL_TARGET+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the autotools infrastructure: +LIBFOO_VERSION+,
> ++LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+,
> ++LIBFOO_LICENSE+, +LIBFOO_LICENSE_FILES+, etc.
>   
>   A few additional variables, specific to the autotools infrastructure,
>   can also be defined. Many of them are only useful in very specific
> diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
> index e18fd9ce23..4eedda8dc6 100644
> --- a/docs/manual/adding-packages-cargo.txt
> +++ b/docs/manual/adding-packages-cargo.txt
> @@ -64,10 +64,11 @@ Just like the generic infrastructure, the Cargo infrastructure works
>   by defining a number of variables before calling the +cargo-package+
>   or +host-cargo-package+ macros.
>   
> -First, all the package metadata information variables that exist in
> -the generic infrastructure also exist in the Cargo infrastructure:
> -+FOO_VERSION+, +FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+,
> -+FOO_DEPENDENCIES+, +FOO_LICENSE+, +FOO_LICENSE_FILES+, etc.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the Cargo infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
> ++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
> ++FOO_LICENSE_FILES+, etc.
>   
>   A few additional variables, specific to the Cargo infrastructure, can
>   also be defined. Many of them are only useful in very specific cases,
> diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
> index 541d7422cf..e69f072bb5 100644
> --- a/docs/manual/adding-packages-cmake.txt
> +++ b/docs/manual/adding-packages-cmake.txt
> @@ -75,11 +75,11 @@ Just like the generic infrastructure, the CMake infrastructure works
>   by defining a number of variables before calling the +cmake-package+
>   macro.
>   
> -First, all the package metadata information variables that exist in
> -the generic infrastructure also exist in the CMake infrastructure:
> -+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
> -+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
> -+LIBFOO_INSTALL_TARGET+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the Cmake infrastructure: +LIBFOO_VERSION+, +LIBFOO_SOURCE+,
> ++LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+, +LIBFOO_LICENSE+,
> ++LIBFOO_LICENSE_FILES+, etc.
>   
>   A few additional variables, specific to the CMake infrastructure, can
>   also be defined. Many of them are only useful in very specific cases,
> diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
> index c952cde577..95fa083f69 100644
> --- a/docs/manual/adding-packages-golang.txt
> +++ b/docs/manual/adding-packages-golang.txt
> @@ -56,16 +56,17 @@ The main macro of the Go package infrastructure is
>   ability to build host packages is also available, with the
>   +host-golang-package+ macro.
>   Host packages built by +host-golang-package+ macro should depend on
> -BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.
> ++BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS+.
>   
>   Just like the generic infrastructure, the Go infrastructure works
> -by defining a number of variables before calling the +golang-package+.
> +by defining a number of variables before calling the +golang-package+
> +macro.
>   
>   All the package metadata information variables that exist in the
>   xref:generic-package-reference[generic package infrastructure] also
>   exist in the Go infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
> -+FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
> -+FOO_LICENSE+, +FOO_LICENSE_FILES+, +FOO_INSTALL_STAGING+, etc.
> ++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
> ++FOO_LICENSE_FILES+, etc.
>   
>   Note that it is not necessary to add +host-go+ in the
>   +FOO_DEPENDENCIES+ variable of a package, since this basic dependency
> diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
> index a35681775f..10901cf339 100644
> --- a/docs/manual/adding-packages-kconfig.txt
> +++ b/docs/manual/adding-packages-kconfig.txt
> @@ -15,10 +15,20 @@ expose the package's +menuconfig+ target as +foo-menuconfig+ in
>   Buildroot, and to handle the copying back and forth of the configuration
>   file in a correct way.
>   
> -The +kconfig-package+ infrastructure is based on the +generic-package+
> -infrastructure. All variables supported by +generic-package+ are
> -available in +kconfig-package+ as well. See
> -xref:generic-package-reference[] for more details.
> +The main macro of the kconfig package infrastructure is
> ++kconfig-package+: like +generic-package+ it works by defining a number
> +of variables providing metadata information about the package, and then
> +calling +kconfig-package+ macro.
> +
> +Just like the generic infrastructure, the kconfig infrastructure works
> +by defining a number of variables before calling the +kconfig-package+
> +macro.
> +
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the kconfig infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
> ++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
> ++FOO_LICENSE_FILES+, etc.
>   
>   In order to use the +kconfig-package+ infrastructure for a Buildroot
>   package, the minimally required lines in the +.mk+ file, in addition to
> diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
> index 70f48fc02c..f76dcb33ad 100644
> --- a/docs/manual/adding-packages-luarocks.txt
> +++ b/docs/manual/adding-packages-luarocks.txt
> @@ -73,16 +73,18 @@ infrastructures in Buildroot, respectively.
>   
>   The main macro of the LuaRocks package infrastructure is +luarocks-package+:
>   like +generic-package+ it works by defining a number of variables providing
> -metadata information about the package, and then calling +luarocks-package+.
> +metadata information about the package, and then calling +luarocks-package+
> +macro.
>   
>   Just like the generic infrastructure, the LuaRocks infrastructure works
>   by defining a number of variables before calling the +luarocks-package+
>   macro.
>   
> -First, all the package metadata information variables that exist in
> -the generic infrastructure also exist in the LuaRocks infrastructure:
> -+LUA_FOO_VERSION+, +LUA_FOO_SOURCE+, +LUA_FOO_SITE+,
> -+LUA_FOO_DEPENDENCIES+, +LUA_FOO_LICENSE+, +LUA_FOO_LICENSE_FILES+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the LuaRocks infrastructure: +LUA_FOO_VERSION+,
> ++LUA_FOO_SOURCE+, +LUA_FOO_PATCH+, +LUA_FOO_SITE+,
> ++LUA_FOO_DEPENDENCIES+, +LUA_FOO_LICENSE+, +LUA_FOO_LICENSE_FILES+, etc.
>   
>   Two of them are populated by the LuaRocks infrastructure (for the
>   +download+ step). If your package is not hosted on the LuaRocks mirror
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index 029c8c2488..13407d814d 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -76,10 +76,11 @@ packages is also available, with the +host-meson-package+ macro.
>   Just like the generic infrastructure, the Meson infrastructure works by defining
>   a number of variables before calling the +meson-package+ macro.
>   
> -First, all the package metadata information variables that exist in the generic
> -infrastructure also exist in the Meson infrastructure: +FOO_VERSION+,
> -+FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
> -+FOO_INSTALL_STAGING+, +FOO_INSTALL_TARGET+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the Meson infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
> ++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
> ++FOO_LICENSE_FILES+, etc.
>   
>   A few additional variables, specific to the Meson infrastructure, can also be
>   defined. Many of them are only useful in very specific cases, typical packages
> diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
> index 6ce693fd6e..73cfd50d09 100644
> --- a/docs/manual/adding-packages-perl.txt
> +++ b/docs/manual/adding-packages-perl.txt
> @@ -85,12 +85,12 @@ Just like the generic infrastructure, the Perl/CPAN infrastructure
>   works by defining a number of variables before calling the
>   +perl-package+ macro.
>   
> -First, all the package metadata information variables that exist in the
> -generic infrastructure also exist in the Perl/CPAN infrastructure:
> -+PERL_FOO_VERSION+, +PERL_FOO_SOURCE+,
> -+PERL_FOO_PATCH+, +PERL_FOO_SITE+,
> -+PERL_FOO_SUBDIR+, +PERL_FOO_DEPENDENCIES+,
> -+PERL_FOO_INSTALL_TARGET+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the Perl/CPAN infrastructure: +PERL_FOO_VERSION+,
> ++PERL_FOO_SOURCE+, +PERL_FOO_PATCH+, +PERL_FOO_SITE+,
> ++PERL_FOO_DEPENDENCIES+, +PERL_FOO_LICENSE+, +PERL_FOO_LICENSE_FILES+,
> +etc.
>   
>   Note that setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect
>   unless a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined. The perl
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index 500967f235..0b0f644a79 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -81,8 +81,8 @@ All the package metadata information variables that exist in the
>   xref:generic-package-reference[generic package infrastructure] also
>   exist in the Python infrastructure: +PYTHON_FOO_VERSION+,
>   +PYTHON_FOO_SOURCE+, +PYTHON_FOO_PATCH+, +PYTHON_FOO_SITE+,
> -+PYTHON_FOO_SUBDIR+, +PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
> -+PYTHON_FOO_LICENSE_FILES+, +PYTHON_FOO_INSTALL_STAGING+, etc.
> ++PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
> ++PYTHON_FOO_LICENSE_FILES+, etc.
>   
>   Note that:
>   
> diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
> index 699d082aa1..ac34b37264 100644
> --- a/docs/manual/adding-packages-qmake.txt
> +++ b/docs/manual/adding-packages-qmake.txt
> @@ -51,13 +51,13 @@ Just like the generic infrastructure, the QMake infrastructure works
>   by defining a number of variables before calling the +qmake-package+
>   macro.
>   
> -First, all the package metadata information variables that exist in
> -the generic infrastructure also exist in the QMake infrastructure:
> -+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
> -+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
> -+LIBFOO_INSTALL_TARGET+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the QMake infrastructure: +LIBFOO_VERSION+, +LIBFOO_SOURCE+,
> ++LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+, +LIBFOO_LICENSE+,
> ++LIBFOO_LICENSE_FILES+, etc.
>   
> -An additional variable, specific to the QMake infrastructure, can
> +A few additional variables, specific to the QMake infrastructure, can
>   also be defined.
>   
>   * +LIBFOO_CONF_ENV+, to specify additional environment variables to
> diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
> index d78b3171d8..bc3d890707 100644
> --- a/docs/manual/adding-packages-rebar.txt
> +++ b/docs/manual/adding-packages-rebar.txt
> @@ -51,13 +51,12 @@ Just like the generic infrastructure, the +rebar+ infrastructure works
>   by defining a number of variables before calling the +rebar-package+
>   macro.
>   
> -First, all the package metadata information variables that exist in
> -the generic infrastructure also exist in the +rebar+ infrastructure:
> -+ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
> -+ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
> -+ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
> -+ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+,
> -+ERLANG_FOOBAR_LICENSE+ and +ERLANG_FOOBAR_LICENSE_FILES+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the +rebar+ infrastructure: +ERLANG_FOOBAR_VERSION+,
> ++ERLANG_FOOBAR_SOURCE+, +ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
> ++ERLANG_FOOBAR_DEPENDENCIES+, +ERLANG_FOOBAR_LICENSE+,
> ++ERLANG_FOOBAR_LICENSE_FILES+, etc.
>   
>   A few additional variables, specific to the +rebar+ infrastructure,
>   can also be defined. Many of them are only useful in very specific
> diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
> index 101cddf1f1..6f08053237 100644
> --- a/docs/manual/adding-packages-waf.txt
> +++ b/docs/manual/adding-packages-waf.txt
> @@ -51,13 +51,13 @@ Just like the generic infrastructure, the Waf infrastructure works
>   by defining a number of variables before calling the +waf-package+
>   macro.
>   
> -First, all the package metadata information variables that exist in
> -the generic infrastructure also exist in the Waf infrastructure:
> -+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
> -+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
> -+LIBFOO_INSTALL_TARGET+.
> +All the package metadata information variables that exist in the
> +xref:generic-package-reference[generic package infrastructure] also
> +exist in the Waf infrastructure: +LIBFOO_VERSION+, +LIBFOO_SOURCE+,
> ++LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+, +LIBFOO_LICENSE+,
> ++LIBFOO_LICENSE_FILES+, etc.
>   
> -An additional variable, specific to the Waf infrastructure, can
> +A few additional variables, specific to the Waf infrastructure, can
>   also be defined.
>   
>   * +LIBFOO_SUBDIR+ may contain the name of a subdirectory inside the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
