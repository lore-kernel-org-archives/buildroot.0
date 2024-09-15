Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2AFC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5098409A2;
	Sun, 15 Sep 2024 14:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXm3uK2ZArhH; Sun, 15 Sep 2024 14:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A944063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A944063E;
	Sun, 15 Sep 2024 14:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCA941BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBAA2607D7
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5706g5pvBMZ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E13A607C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E13A607C5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E13A607C5
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:14:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.92])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 718FF20039F;
 Sun, 15 Sep 2024 16:14:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Sep 2024 16:14:05 +0200
Date: Sun, 15 Sep 2024 16:14:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZubrrZkLW8Gbic5q@landeda>
References: <20240914152323.2630539-1-thomas.perale@mind.be>
 <20240914152323.2630539-2-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914152323.2630539-2-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726409654;
 bh=86e+e0VkcePvkcK2Z/Spww3Hux/FfkZCp+9UKGmt9F4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWmWp11jgOADhinxul9RWyJNI6+1fpLStWA/EFH2+Bng27RgZtO0buZEiBDPleej8
 W5c56v4qsZYBGQsZFbXm2P2yC4XfBgtxLOHKl0895KUvHBHyi5Yb26S1J+FasV2/Co
 4walcJEnC7/i77ckS5Ki1fpv44Kf5yTWO/HquLEJw8FiJeFHo40Za6i64LyGiSY3mo
 pBoK3KIlITee3xGR2zFJoRfdypYCXd5oeuyP/JdAVyE/isBjdGGXlNWnuuwEZCYYsU
 Xkr5O8GDiG87imLXA3ldsRtLsMeLV42mbEys+t/moho7dklR6zhq0z6M+o/ZSaaNIo
 vFq8RvkWmJQbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sWmWp11j
Subject: Re: [Buildroot] [PATCH 1/2] package/go/go-bin: new host-go provider
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-09-14 17:23 +0200, Thomas Perale via buildroot spake thusly:
> This package provides a pre-built version for the host-go virtual
> package introduced in the previous commits:
> 
>  - host-go-bin installs a pre-built version of the Go compiler.
> 
> By default, host-go remains built from sources to keep the same
> behavior as the former version.
> 
> The menuconfig entry for host-go is updated to expose the host-go-bin
> provider. The dependencies are set as such as if host-go-src does not
> support the host architecture, it will automatically fall back to
> host-go-bin and vice versa.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

I've done a few changes:

  - update hashes for 1.22.7
  - add hash for the source tarball
  - set _DL_SUBDIR
  - don't set a prompt to BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH

Applied to master with those fixes, thanks a lot!

Regards,
Yann E. MORIN.

> ---
>  package/go/Config.in.host        | 22 ++++++++++++++++------
>  package/go/go-bin/Config.in.host | 13 +++++++++++++
>  package/go/go-bin/go-bin.hash    |  8 ++++++++
>  package/go/go-bin/go-bin.mk      | 20 ++++++++++++++++++++
>  package/go/go.mk                 |  2 ++
>  5 files changed, 59 insertions(+), 6 deletions(-)
>  create mode 100644 package/go/go-bin/Config.in.host
>  create mode 100644 package/go/go-bin/go-bin.hash
>  create mode 100644 package/go/go-bin/go-bin.mk
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index eefca03b02..435faec555 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  
>  # CGO linking for the host. Since we use the same compiler for target
>  # and host, if the target can't do CGO linking, then the host can't.
> @@ -57,7 +57,8 @@ if BR2_PACKAGE_HOST_GO
>  
>  choice
>  	prompt "Go compiler variant"
> -	default BR2_PACKAGE_HOST_GO_SRC
> +	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	help
>  	  Select a Go compiler variant.
>  
> @@ -65,18 +66,27 @@ choice
>  
>  config BR2_PACKAGE_HOST_GO_SRC
>  	bool "host go (source)"
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
>  	help
>  	  This package will build the go compiler for the host.
>  
> -endchoice
> +config BR2_PACKAGE_HOST_GO_BIN
> +	bool "host go (pre-built)"
> +	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
> +	help
> +	  This package will install pre-built versions of the compiler
>  
> -endif
> +endchoice
>  
>  config BR2_PACKAGE_PROVIDES_HOST_GO
>  	string
> -	# Default to host-go-src, as the only provider for now
> -	default "host-go-src"
> +	# Default to host-go-src
> +	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
> +	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
> +
> +endif
>  
> +source "package/go/go-bin/Config.in.host"
>  source "package/go/go-bootstrap-stage1/Config.in.host"
>  source "package/go/go-bootstrap-stage2/Config.in.host"
>  source "package/go/go-bootstrap-stage3/Config.in.host"
> diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
> new file mode 100644
> index 0000000000..51fe3c3fdc
> --- /dev/null
> +++ b/package/go/go-bin/Config.in.host
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
> +	string "Translate the HOSTARCH into the architecture name used by the Go compiler"
> +	default "armv6l" if BR2_HOSTARCH = "arm"
> +	default "arm64" if BR2_HOSTARCH = "aarch64"
> +	default "ppc64le" if BR2_HOSTARCH = "powerpc64le"
> +	default "s390x" if BR2_HOSTARCH = "s390x"
> +	default "386" if BR2_HOSTARCH = "x86"
> +	default "amd64" if BR2_HOSTARCH = "x86_64"
> +
> +config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
> diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
> new file mode 100644
> index 0000000000..12fd4c2816
> --- /dev/null
> +++ b/package/go/go-bin/go-bin.hash
> @@ -0,0 +1,8 @@
> +# sha256 checksum from https://go.dev/dl/
> +sha256  3ea4c78e6fa52978ae1ed2e5927ad17495da440c9fae7787b1ebc1d0572f7f43  go1.22.5.linux-386.tar.gz
> +sha256  904b924d435eaea086515bc63235b192ea441bd8c9b198c507e85009e6e4c7f0  go1.22.5.linux-amd64.tar.gz
> +sha256  8d21325bfcf431be3660527c1a39d3d9ad71535fabdf5041c826e44e31642b5a  go1.22.5.linux-arm64.tar.gz
> +sha256  8c4587cf3e63c9aefbcafa92818c4d9d51683af93ea687bf6c7508d6fa36f85e  go1.22.5.linux-armv6l.tar.gz
> +sha256  5312bb420ac0b59175a58927e70b4660b14ab7319aab54398b6071fabcbfbb09  go1.22.5.linux-ppc64le.tar.gz
> +sha256  24c6c5c9d515adea5d58ae78388348c97614a0c21ac4d4f4c0dab75e893b0b5d  go1.22.5.linux-s390x.tar.gz
> +sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
> new file mode 100644
> index 0000000000..155483a2fc
> --- /dev/null
> +++ b/package/go/go-bin/go-bin.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# go-bin
> +#
> +################################################################################
> +
> +GO_BIN_SITE = https://go.dev/dl
> +HOST_GO_BIN_ACTUAL_SOURCE_TARBALL = go$(GO_VERSION).src.tar.gz
> +GO_BIN_LICENSE = BSD-3-Clause
> +GO_BIN_LICENSE_FILES = LICENSE
> +
> +HOST_GO_BIN_PROVIDES = host-go
> +
> +HOST_GO_BIN_SOURCE = go$(GO_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
> +
> +define HOST_GO_BIN_INSTALL_CMDS
> +	$(GO_BINARIES_INSTALL)
> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 4c56660651..f48d25d415 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -71,6 +71,8 @@ HOST_GO_TARGET_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
>  	GOOS="linux" \
>  	GOARCH=$(GO_GOARCH) \
> +	$(if $(GO_GO386),GO386=$(GO_GO386)) \
> +	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
>  	CC="$(TARGET_CC)" \
>  	CXX="$(TARGET_CXX)" \
>  	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> -- 
> 2.46.0
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
