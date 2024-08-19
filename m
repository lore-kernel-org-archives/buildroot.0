Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E32C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D556083E;
	Mon, 19 Aug 2024 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iWZSlqmagxx; Mon, 19 Aug 2024 21:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C00605FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C00605FC;
	Mon, 19 Aug 2024 21:17:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE9B1BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B5A3605FC
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7amo_d5syoD for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C26F605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C26F605C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C26F605C6
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:17:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C338E13F880;
 Mon, 19 Aug 2024 23:17:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 23:17:32 +0200
Date: Mon, 19 Aug 2024 23:17:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZsO2bDVn41vsZfq1@landeda>
References: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724102257;
 bh=AdCmfUv3TUyrvlPScd3fjchqsDIXS2mBNEOZoFUAyQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9tADtZ7QGvBCti5kX2x4phXht52lazAf3CLMgZvISormBYHGve92KN4nZCrIHT4c
 hv9g35dd/5p2TMHV+1rF2K68We9sOxoz0UxyTcU1cz5PWaGxM/RlnogXtXK2QzgfLU
 Vw7uRz73R+fYGhOaNSYkFUtPuKdd9pwXd7jmLKVBxhZjnOK6asris7GSZtxhohriMm
 pAlwj3LlaD+1XvdXRaiCD0X6/KTkdUStwpnf3hdM54LMAa/wM8jszcOKd+XH5sGmOi
 igqwX35l0x5mLz3stwU8s9Qd1Gepboorof+RDb9oyKhXWJrY+7vkau9GX4Nw7w+tjA
 MZHrMzwF2iMNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D9tADtZ7
Subject: Re: [Buildroot] [PATCH v8 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-08-19 13:33 -0700, Christian Stewart via buildroot spake thusly:
> All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
> compiled Go version to use to build from source.
> 
> https://golang.org/doc/install/source#bootstrapFromSource
> 
> The process for "bootstrapping" the Go compiler in Buildroot is:
> 
> 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
> 2. Build go-bootstrap-stage1 (which is Go 1.4.x and written in C)
> 3. Build go-bootstrap-stage2 (which is Go 1.19.x and written in Go)
> 4. Build go-bootstrap-stage3 (which is Go 1.21.x and written in Go)
> 5. Build go-src (written in Go) using go-bootstrap-stage3.
> 
> go-bootstrap-stage1 does not work on 64-bit arm. The Go 1.4.x bootstrap compiler
> is compatible with x86, x86_64, and arm (32 bit) only.
> 
> This patch adds a fallback to require a host Go compiler to build host-go-src
> when BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS is not set.
> 
> Recent changes added go-src with the intent of adding go-bin later. This
> commit changes go-src to depend on the host Go compiler to bootstrap
> go-src on architectures that cannot build go-bootstrap-stage1 (such as arm64).
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Thanks for this new iteration. But I'd rather first have the support for
host-go-bin, rather than rely on the system go.

Indeed, usng host-go-bin would not require the user to install go on
their system; host-go-bin can be used on oder distributions where a go
compiler is not available, or where the go compiler is too old to build
go-src.

So, I am not convinced about this "use the system go" solution.

Regards,
Yann E. MORIN.

> ---
> 
> changes prior to inclusion in this series:
> 
>  - thanks Thomas for the review & suggestions
>  - added NEEDS_HOST_GO boolean
>  - added dependency checks to support/dependencies/dependencies.sh
>  - removed unnecessary changes to go-bootstrap package
>  - add dependency on toolchain if Cgo is enabled
>  - updates for go1.20
>  - updates for go-bootstrap-stage{1,2}
> 
> changes from v1 -> v2:
> 
>  - remove whitespace fix in bootstrap stage2
> 
> changes from v2 -> v3:
> 
>  - rebase
> 
> changes from v7 -> v8:
> 
> - rebase on go-src changes
> - Discussion related to adding go-src and go-bin:
>   - https://patchwork.ozlabs.org/project/buildroot/patch/20230711220849.1702358-4-christian@aperture.us/
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  Config.in                            |  4 ++++
>  package/go/Config.in.host            |  3 +--
>  package/go/go-src/go-src.mk          | 12 ++++++++----
>  support/dependencies/dependencies.sh |  4 ++++
>  4 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index df43db7eff..bd7227a049 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -68,6 +68,10 @@ config BR2_HOST_GCC_AT_LEAST_11
>  # When adding new entries above, be sure to update
>  # the HOSTCC_MAX_VERSION variable in the Makefile.
> 
> +# Hidden boolean selected if bootstrapping Go w/ GCC is not supported.
> +config BR2_NEEDS_HOST_GO
> +	bool
> +
>  # Hidden boolean selected by packages in need of Java in order to build
>  # (example: kodi)
>  config BR2_NEEDS_HOST_JAVA
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 11ce6df369..e006dfc830 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,6 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> @@ -34,7 +33,6 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> 
>  # Go packages should select BR2_PACKAGE_HOST_GO
>  config BR2_PACKAGE_HOST_GO
> @@ -53,6 +51,7 @@ choice
> 
>  config BR2_PACKAGE_HOST_GO_SRC
>  	bool "host go (source)"
> +	select BR2_NEEDS_HOST_GO if
> !BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
>  	help
>  	  This package will build the go compiler for the host.
> 
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index 0d1a9b3187..7e78f6e4d2 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -12,9 +12,7 @@ GO_SRC_LICENSE_FILES = LICENSE
>  GO_SRC_CPE_ID_VENDOR = golang
> 
>  HOST_GO_SRC_PROVIDES = host-go
> -HOST_GO_SRC_DEPENDENCIES = \
> -	host-go-bootstrap-stage3 \
> -	$(HOST_GO_DEPENDENCIES_CGO)
> +HOST_GO_SRC_DEPENDENCIES = $(HOST_GO_DEPENDENCIES_CGO)
> 
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> 
> @@ -34,7 +32,6 @@ endif
>  HOST_GO_SRC_MAKE_ENV = \
>  	GO111MODULE=off \
>  	GOCACHE=$(HOST_GO_HOST_CACHE) \
> -	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
>  	GOROOT_FINAL=$(HOST_GO_ROOT) \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> @@ -44,6 +41,13 @@ HOST_GO_SRC_MAKE_ENV = \
>  	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
>  	$(HOST_GO_SRC_CROSS_ENV)
> 
> +# Use the Go compiler bootstrapped by Buildroot if available.
> +# Otherwise, use the host Go compiler.
> +ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS),y)
> +HOST_GO_DEPENDENCIES += host-go-bootstrap-stage3
> +HOST_GO_MAKE_ENV += GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT)
> +endif
> +
>  define HOST_GO_SRC_BUILD_CMDS
>  	cd $(@D)/src && \
>  		$(HOST_GO_SRC_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> diff --git a/support/dependencies/dependencies.sh
> b/support/dependencies/dependencies.sh
> index 6d5fc36037..7b1c51b4f1 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -217,6 +217,10 @@ if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
>  	fi
>  fi
> 
> +if grep -q ^BR2_NEEDS_HOST_GO=y $BR2_CONFIG ; then
> +	check_prog_host "go"
> +fi
> +
>  if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
>  	check_prog_host "java"
>  	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
> -- 
> 2.45.2
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
