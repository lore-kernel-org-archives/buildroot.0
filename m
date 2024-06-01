Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EEC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989B3606F3;
	Sat,  1 Jun 2024 15:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYLFQDFgYO3v; Sat,  1 Jun 2024 15:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0976E6070B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0976E6070B;
	Sat,  1 Jun 2024 15:41:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2A01BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 463BC4239A
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6OxOB2jdKTE for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D1CE40491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1CE40491
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D1CE40491
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:41:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2503913F89C;
 Sat,  1 Jun 2024 17:41:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:41:36 +0200
Date: Sat, 1 Jun 2024 17:41:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltBMAVYJwl5dANu@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-3-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-3-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717256501;
 bh=7n8/aqULQ79fiqxfAO/ONeoO1x89qgstaTckJAdvTjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/rhEOHwqWwOfBn5Tp4UEzKWXapl4Nsc2UGbn/gtm6uCV6tNEh+M9vc2ZvJulq+v9
 HT6rszXylWPI4ANEOB7J6DuC/YDF4rs5equxH5utaSJNlv26fy7RvzVjhkGvKFXTjB
 YAMgvm7xRN5o/ktfJVQAL9qxmzr5xIPhBv/xsn6z0kHd5YsgYcDTu6SD573lE11dUZ
 gT7wrVwd4474zfg7sVCcL/zO4ngcGZiTPBBFEubKJ4H1k7awDDy6UfKa9hFBwBPKdL
 a17T+BLHwARuuO2AR2lWwx/AGynMRu91vx5pNP0m+imX6uL1epRyZqsk8bG+ONjWFg
 G4xJv958qt6vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s/rhEOHw
Subject: Re: [Buildroot] [PATCH v2 2/6] package/go: new subdirectory for go
 variants
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
> Move every go compiler-related packages into a newly created
> package/go/ subdirectory.
> 
> This subdirectory structure moves the GO_VERSION variable into the
> common package/go/go.mk file. In the next commits, host-go will be
> turned into a virtual-package and the common GO_VERSION force the
> providers to use the same Go compiler version.
> Common variables to all providers are kept in package/go/go.mk and
> package/go/Config.in.host.
> Also, the subdirectory structure forces the evaluation of the common
> GO_VERSION before the providers access it.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to next, thanks.

Note that we had since bumped to go 1.22.3, so I did fix the conflict
when applying; please have a look and shout at me if I borked something.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  2 +-
>  DEVELOPERS                                    |  3 --
>  package/Config.in.host                        |  3 --
>  package/go/Config.in.host                     |  4 ++
>  .../go-bootstrap-stage1/Config.in.host        |  0
>  .../go-bootstrap-stage1.hash                  |  0
>  .../go-bootstrap-stage1.mk                    |  0
>  .../go-bootstrap-stage2/Config.in.host        |  0
>  .../go-bootstrap-stage2.hash                  |  0
>  .../go-bootstrap-stage2.mk                    |  0
>  .../go-bootstrap-stage3/Config.in.host        |  0
>  .../go-bootstrap-stage3.hash                  |  0
>  .../go-bootstrap-stage3.mk                    |  0
>  package/go/go.mk                              | 40 +-------------
>  ...explicit-option-for-crosscompilation.patch |  0
>  ...ldvcs-false-when-building-go-bootstr.patch |  0
>  package/go/{ => go}/go.hash                   |  0
>  package/go/go/go.mk                           | 53 +++++++++++++++++++
>  18 files changed, 60 insertions(+), 45 deletions(-)
>  rename package/{ => go}/go-bootstrap-stage1/Config.in.host (100%)
>  rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.hash (100%)
>  rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.mk (100%)
>  rename package/{ => go}/go-bootstrap-stage2/Config.in.host (100%)
>  rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.hash (100%)
>  rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.mk (100%)
>  rename package/{ => go}/go-bootstrap-stage3/Config.in.host (100%)
>  rename package/{ => go}/go-bootstrap-stage3/go-bootstrap-stage3.hash (100%)
>  rename package/{ => go}/go-bootstrap-stage3/go-bootstrap-stage3.mk (100%)
>  rename package/go/{ => go}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
>  rename package/go/{ => go}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
>  rename package/go/{ => go}/go.hash (100%)
>  create mode 100644 package/go/go/go.mk
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 1b336ce7a3..b3eab26071 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -465,7 +465,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
>  package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
>  package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
>  package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
> -package/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
> +package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
>  package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
>  package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
>  package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 039b803d50..51fc4962c9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -603,9 +603,6 @@ F:	package/docker-engine/
>  F:	package/embiggen-disk/
>  F:	package/fuse-overlayfs/
>  F:	package/go/
> -F:	package/go-bootstrap-stage1/
> -F:	package/go-bootstrap-stage2/
> -F:	package/go-bootstrap-stage3/
>  F:	package/gocryptfs/
>  F:	package/mbpfan/
>  F:	package/moby-buildkit/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 9543a22ffc..2c481cfae7 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -44,9 +44,6 @@ menu "Host utilities"
>  	source "package/genpart/Config.in.host"
>  	source "package/gnupg/Config.in.host"
>  	source "package/go/Config.in.host"
> -	source "package/go-bootstrap-stage1/Config.in.host"
> -	source "package/go-bootstrap-stage2/Config.in.host"
> -	source "package/go-bootstrap-stage3/Config.in.host"
>  	source "package/google-breakpad/Config.in.host"
>  	source "package/gptfdisk/Config.in.host"
>  	source "package/imagemagick/Config.in.host"
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 0d89e875ad..7edf45850d 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -31,3 +31,7 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
>  	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +
> +source "package/go/go-bootstrap-stage1/Config.in.host"
> +source "package/go/go-bootstrap-stage2/Config.in.host"
> +source "package/go/go-bootstrap-stage3/Config.in.host"
> diff --git a/package/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
> similarity index 100%
> rename from package/go-bootstrap-stage1/Config.in.host
> rename to package/go/go-bootstrap-stage1/Config.in.host
> diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.hash b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
> similarity index 100%
> rename from package/go-bootstrap-stage1/go-bootstrap-stage1.hash
> rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
> diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> similarity index 100%
> rename from package/go-bootstrap-stage1/go-bootstrap-stage1.mk
> rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
> diff --git a/package/go-bootstrap-stage2/Config.in.host b/package/go/go-bootstrap-stage2/Config.in.host
> similarity index 100%
> rename from package/go-bootstrap-stage2/Config.in.host
> rename to package/go/go-bootstrap-stage2/Config.in.host
> diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
> similarity index 100%
> rename from package/go-bootstrap-stage2/go-bootstrap-stage2.hash
> rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
> diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
> similarity index 100%
> rename from package/go-bootstrap-stage2/go-bootstrap-stage2.mk
> rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
> diff --git a/package/go-bootstrap-stage3/Config.in.host b/package/go/go-bootstrap-stage3/Config.in.host
> similarity index 100%
> rename from package/go-bootstrap-stage3/Config.in.host
> rename to package/go/go-bootstrap-stage3/Config.in.host
> diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.hash b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.hash
> similarity index 100%
> rename from package/go-bootstrap-stage3/go-bootstrap-stage3.hash
> rename to package/go/go-bootstrap-stage3/go-bootstrap-stage3.hash
> diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
> similarity index 100%
> rename from package/go-bootstrap-stage3/go-bootstrap-stage3.mk
> rename to package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 0e39ad9f8c..104a4a73fb 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -5,14 +5,7 @@
>  ################################################################################
> 
>  GO_VERSION = 1.22.2
> -GO_SITE = https://storage.googleapis.com/golang
> -GO_SOURCE = go$(GO_VERSION).src.tar.gz
> 
> -GO_LICENSE = BSD-3-Clause
> -GO_LICENSE_FILES = LICENSE
> -GO_CPE_ID_VENDOR = golang
> -
> -HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
>  HOST_GO_ROOT = $(HOST_DIR)/lib/go
> @@ -96,15 +89,6 @@ else
>  HOST_GO_CGO_ENABLED = 0
>  endif
> 
> -HOST_GO_CROSS_ENV = \
> -	CC_FOR_TARGET="$(TARGET_CC)" \
> -	CXX_FOR_TARGET="$(TARGET_CXX)" \
> -	GOOS="linux" \
> -	GOARCH=$(GO_GOARCH) \
> -	$(if $(GO_GO386),GO386=$(GO_GO386)) \
> -	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> -	GO_ASSUME_CROSSCOMPILING=1
> -
>  else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  # host-go can still be used to build packages for the host. No need to set all
>  # the arch stuff since we will not be cross-compiling.
> @@ -123,27 +107,7 @@ HOST_GO_HOST_ENV = \
>  	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
>  	CGO_LDFLAGS="$(HOST_LDFLAGS)"
> 
> -# The go build system is not compatible with ccache, so use
> -# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> -HOST_GO_MAKE_ENV = \
> -	GO111MODULE=off \
> -	GOCACHE=$(HOST_GO_HOST_CACHE) \
> -	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
> -	GOROOT_FINAL=$(HOST_GO_ROOT) \
> -	GOROOT="$(@D)" \
> -	GOBIN="$(@D)/bin" \
> -	GOOS=linux \
> -	CC=$(HOSTCC_NOCCACHE) \
> -	CXX=$(HOSTCXX_NOCCACHE) \
> -	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> -	$(HOST_GO_CROSS_ENV)
> -
> -define HOST_GO_BUILD_CMDS
> -	cd $(@D)/src && \
> -		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> -endef
> -
> -define HOST_GO_INSTALL_CMDS
> +define GO_BINARIES_INSTALL
>  	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
>  	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
> 
> @@ -165,4 +129,4 @@ define HOST_GO_INSTALL_CMDS
>  	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
>  endef
> 
> -$(eval $(host-generic-package))
> +include $(sort $(wildcard package/go/*/*.mk))
> diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
> similarity index 100%
> rename from package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> rename to package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
> diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> similarity index 100%
> rename from package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> rename to package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> diff --git a/package/go/go.hash b/package/go/go/go.hash
> similarity index 100%
> rename from package/go/go.hash
> rename to package/go/go/go.hash
> diff --git a/package/go/go/go.mk b/package/go/go/go.mk
> new file mode 100644
> index 0000000000..c3c40922f4
> --- /dev/null
> +++ b/package/go/go/go.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# go
> +#
> +################################################################################
> +
> +GO_SITE = https://storage.googleapis.com/golang
> +GO_SOURCE = go$(GO_VERSION).src.tar.gz
> +
> +GO_LICENSE = BSD-3-Clause
> +GO_LICENSE_FILES = LICENSE
> +GO_CPE_ID_VENDOR = golang
> +
> +HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
> +
> +ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> +
> +HOST_GO_CROSS_ENV = \
> +	CC_FOR_TARGET="$(TARGET_CC)" \
> +	CXX_FOR_TARGET="$(TARGET_CXX)" \
> +	GOOS="linux" \
> +	GOARCH=$(GO_GOARCH) \
> +	$(if $(GO_GO386),GO386=$(GO_GO386)) \
> +	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> +	GO_ASSUME_CROSSCOMPILING=1
> +
> +endif
> +
> +# The go build system is not compatible with ccache, so use
> +# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> +HOST_GO_MAKE_ENV = \
> +	GO111MODULE=off \
> +	GOCACHE=$(HOST_GO_HOST_CACHE) \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
> +	GOROOT_FINAL=$(HOST_GO_ROOT) \
> +	GOROOT="$(@D)" \
> +	GOBIN="$(@D)/bin" \
> +	GOOS=linux \
> +	CC=$(HOSTCC_NOCCACHE) \
> +	CXX=$(HOSTCXX_NOCCACHE) \
> +	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> +	$(HOST_GO_CROSS_ENV)
> +
> +define HOST_GO_BUILD_CMDS
> +	cd $(@D)/src && \
> +		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> +endef
> +
> +define HOST_GO_INSTALL_CMDS
> +	$(GO_BINARIES_INSTALL)
> +endef
> +
> +$(eval $(host-generic-package))
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
