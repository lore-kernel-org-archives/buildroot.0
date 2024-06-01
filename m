Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C4C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4152E608C9;
	Sat,  1 Jun 2024 15:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJo9qBXB3sDF; Sat,  1 Jun 2024 15:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083E0608A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083E0608A1;
	Sat,  1 Jun 2024 15:42:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D446A1BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDEC440338
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HD4Orvhfo6uu for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92B824010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B824010C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92B824010C
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:42:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BF74713FA34;
 Sat,  1 Jun 2024 17:42:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:42:50 +0200
Date: Sat, 1 Jun 2024 17:42:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltBejK6FEumKQXB@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-5-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-5-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717256574;
 bh=hOHsFZjbo2kP//4ueDhV0BPFBAOcz+w9hvAxAQwIigY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HFetA31l73hTDEC2W847KgzflJ8YFNspYa372NzDdGiJjAEG9bguPDWEMarAn5TJM
 fXAyQTyh6sqsbsGJnPpRZoEszata0vtj88niVIBRvjBgrXeWwWIj0OfVwKq38+3ts9
 Mu9VkYk1ETk69XhNpaSxTY4xco2+vKt33tjJyg4Bx6MybnvtkOui1HPoukVUTGGyxK
 KMpJxyFEym4tDHfiRmv7o8nl+b2+OWsoXuUTr0ueVmPy27Z1gDXZ8Su5zsDbXqcfig
 724ioUdnwGgQ/UtYzEeHjeyNgxTA5wr2lJ1+nPQgfX1jjfZ205jD3Z3a75tfaG49dL
 72zugSy5LfaRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HFetA31l
Subject: Re: [Buildroot] [PATCH v2 4/6] package/go: make host package a
 virtual package
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
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> Turns host-go into a virtual package, with a single providers:
> 
>  - host-go-src, which builds host-go from source based on the same logic
>    that was previously used in package/go/go/go.mk, now moved to
>    package/go/go-src/go-src.mk to remove any ambiguity on the role of
>    the package.
> 
> In later commits, we'll add host-go-bin a prebuilt binary host go compiler
> as another provider.
> 
> A similar solution is proposed for host-rust.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  2 +-
>  package/go/Config.in.host                     | 24 +++++++++++++++++
>  ...explicit-option-for-crosscompilation.patch |  0
>  ...ldvcs-false-when-building-go-bootstr.patch |  0
>  package/go/{go/go.hash => go-src/go-src.hash} |  0
>  package/go/{go/go.mk => go-src/go-src.mk}     | 27 ++++++++++---------
>  package/go/go.mk                              |  2 ++
>  7 files changed, 41 insertions(+), 14 deletions(-)
>  rename package/go/{go => go-src}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
>  rename package/go/{go => go-src}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
>  rename package/go/{go/go.hash => go-src/go-src.hash} (100%)
>  rename package/go/{go/go.mk => go-src/go-src.mk} (66%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index b3eab26071..69681bfeaa 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -465,7 +465,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
>  package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
>  package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
>  package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
> -package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
> +package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
>  package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
>  package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
>  package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index e1833d0905..483393f8e4 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -37,6 +37,30 @@ config BR2_PACKAGE_HOST_GO
>  	bool
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> 
> +if BR2_PACKAGE_HOST_GO
> +
> +choice
> +	prompt "Go compiler variant"
> +	default BR2_PACKAGE_HOST_GO_SRC
> +	help
> +	  Select a Go compiler variant.
> +
> +	  Default to 'host-go-src'.
> +
> +config BR2_PACKAGE_HOST_GO_SRC
> +	bool "host go (source)"
> +	help
> +	  This package will build the go compiler for the host.
> +
> +endchoice
> +
> +config BR2_PACKAGE_PROVIDES_HOST_GO
> +	string
> +	# Default to host-go-src
> +	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
> +
> +endif
> +
>  source "package/go/go-bootstrap-stage1/Config.in.host"
>  source "package/go/go-bootstrap-stage2/Config.in.host"
>  source "package/go/go-bootstrap-stage3/Config.in.host"
> diff --git a/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
> similarity index 100%
> rename from package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
> rename to package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
> diff --git a/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> similarity index 100%
> rename from package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> rename to package/go/go-src/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> diff --git a/package/go/go/go.hash b/package/go/go-src/go-src.hash
> similarity index 100%
> rename from package/go/go/go.hash
> rename to package/go/go-src/go-src.hash
> diff --git a/package/go/go/go.mk b/package/go/go-src/go-src.mk
> similarity index 66%
> rename from package/go/go/go.mk
> rename to package/go/go-src/go-src.mk
> index c3c40922f4..1e061e20bc 100644
> --- a/package/go/go/go.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -1,21 +1,22 @@
>  ################################################################################
>  #
> -# go
> +# go-src
>  #
>  ################################################################################
> 
> -GO_SITE = https://storage.googleapis.com/golang
> -GO_SOURCE = go$(GO_VERSION).src.tar.gz
> +GO_SRC_SITE = https://storage.googleapis.com/golang
> +GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
> 
> -GO_LICENSE = BSD-3-Clause
> -GO_LICENSE_FILES = LICENSE
> -GO_CPE_ID_VENDOR = golang
> +GO_SRC_LICENSE = BSD-3-Clause
> +GO_SRC_LICENSE_FILES = LICENSE
> +GO_SRC_CPE_ID_VENDOR = golang
> 
> -HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
> +HOST_GO_SRC_PROVIDES = host-go
> +HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
> 
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> 
> -HOST_GO_CROSS_ENV = \
> +HOST_GO_SRC_CROSS_ENV = \
>  	CC_FOR_TARGET="$(TARGET_CC)" \
>  	CXX_FOR_TARGET="$(TARGET_CXX)" \
>  	GOOS="linux" \
> @@ -28,7 +29,7 @@ endif
> 
>  # The go build system is not compatible with ccache, so use
>  # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> -HOST_GO_MAKE_ENV = \
> +HOST_GO_SRC_MAKE_ENV = \
>  	GO111MODULE=off \
>  	GOCACHE=$(HOST_GO_HOST_CACHE) \
>  	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
> @@ -39,14 +40,14 @@ HOST_GO_MAKE_ENV = \
>  	CC=$(HOSTCC_NOCCACHE) \
>  	CXX=$(HOSTCXX_NOCCACHE) \
>  	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> -	$(HOST_GO_CROSS_ENV)
> +	$(HOST_GO_SRC_CROSS_ENV)
> 
> -define HOST_GO_BUILD_CMDS
> +define HOST_GO_SRC_BUILD_CMDS
>  	cd $(@D)/src && \
> -		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> +		$(HOST_GO_SRC_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
>  endef
> 
> -define HOST_GO_INSTALL_CMDS
> +define HOST_GO_SRC_INSTALL_CMDS
>  	$(GO_BINARIES_INSTALL)
>  endef
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 104a4a73fb..21cdb29f8f 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -129,4 +129,6 @@ define GO_BINARIES_INSTALL
>  	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
>  endef
> 
> +$(eval $(host-virtual-package))
> +
>  include $(sort $(wildcard package/go/*/*.mk))
> --
> 2.44.0
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
