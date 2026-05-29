Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B3CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B89641FCF;
	Fri, 29 May 2026 08:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhYXxGzmOcCe; Fri, 29 May 2026 08:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C84421FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043350;
	bh=KvHalN3AiyOb5f9H2t1IflOKiFWk6MYZdEgpfsz5KS4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jUGIjyD8d9u/voEei9Qq2gQjavXWA48zq0ZCVnSuKD9pYaIx9CIVJ4kWAXgLn8hLw
	 Z5NeKHPnBPiDKZ80I+W9qnBefT4v2pY4YXtN9DvSyYF41eV+sxT/Dtsvb0ywWH1MCH
	 ZJD+EKekAcCaqcNR0ixgdSsH9kQPI/Sx4wb86zWl9dA0Pq+vHfuVheNX3g8StY/ANl
	 znW8d2zhnKn49hHFWhwnGcXwBoSQFKi1nbmE7DLWfW1sX7WGcQ74j5P4A+7MqWw1GX
	 2iQ81mP1ufw1Ap3K7vMkn430/Glu6ZkrQH1TanhUzVr0jw6saO2hOHi/WQJunRe1Il
	 z1j6a02xXJr6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C84421FB;
	Fri, 29 May 2026 08:29:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0085D288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E41AD61341
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAVtSRIJDini for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2100361317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2100361317
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2100361317
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso117591465e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043345; x=1780648145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aIeUmovT6JVhYAv7cJB1bbhwfygCgI51hjuNBQLoC8g=;
 b=VexnnjvG36mMhlSxjcP+oEYH2hL0L+Q5OGnYIysD/xN2F/G7JEGPXeLhj4kNVBDL9w
 CHexTniikOsohD0OWM9dDvPLiPvuvySFrT5KkELUJaSP2+GmyqPHEtIayAGSOIAGUXss
 RPgs/tpxEC9V5JoWaR/4uqkQ15C5CVSQTKwNUHfssSsoQOLzqPx9Sa+ytD+016xPFWUG
 RVaxJ+CNSE69F0FBY7QMcFOXdHydP2VAOAnbsyR4Ud5WdasydBGtoyh1zL4jAvHr22hn
 QsZK3UqlPZMcp8zbYs5aNJpMLxmi5M1JZbY9JryW5Vs7DqJScykpY5gckni5xKvyA+vD
 boog==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EyduhIRNArDcj1SeUS9sVia4RBhuAS/8a3hHsmGfTM/O0vli4GHZJxWo4p1sMBHOYWkXf2zshzrQ=@buildroot.org
X-Gm-Message-State: AOJu0YyzFAfV3ZNlwYRdH2+VvhZb1OZR1iAIyRw/6+HmTie7opej4b7E
 uAOXjJ4h90eJVHNwN8uFwzie+9CSDhL0QC386FYHKN0AXFyvKys235wkxWKfxxj/dN2GNh/PH0p
 HePAh
X-Gm-Gg: Acq92OGDIjlTjcCoLTgj/arD2OEB+oFb6NRPhhUeOPog5t3GbC6Ozu/OfNw1Zr3xbup
 qXGEDUYu6o0ndtFUU3Rn6PbOc8ddefFw9Sx44ez8/bPMsJPct/kjMdlvcxIodvdPbqJxBNBeSej
 314+fFp4By/swWiWWs7HMXrlage+UnNMmFMneidFKmRUjSrWtJ6isSz5F4sspKG69+fFyERCGu0
 ivmiKcwFaZroXBLbebOKOeLQENKDDlZyB3JPDuJk+yqw3A4zEqbxxDKkkSRwbi7aGJmJB79/+Yi
 +mQhuYeHIJ0uevPDcc5OpRqHbNC0gy1uNr5slyMn+gIr8xl1D4318nRaGa7SwMOOdkz+1uO/itt
 +DkBNu60s4c1jozOLoICxhsVqrzof1wc7YE7Zbag4C+gksK4b4G3EFxcBH6oFDL85A3ffQHy9SU
 zdTgAdC2r+dq7lwM355kdYEBaEfC5KHVPO1CPwavg1j8ogKLTCRhrgSXMDFA==
X-Received: by 2002:a05:600c:34d4:b0:490:9e5b:9e31 with SMTP id
 5b1f17b1804b1-4909e5ba0c2mr21410655e9.0.1780043344400; 
 Fri, 29 May 2026 01:29:04 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm12392805e9.5.2026.05.29.01.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:04 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:03 +0200
Message-ID: <20260529082903.56290-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20250916224602.2935203-1-james.hilliard1@gmail.com>
References: <20250916224602.2935203-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043345; x=1780648145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIeUmovT6JVhYAv7cJB1bbhwfygCgI51hjuNBQLoC8g=;
 b=h0wGy457n0Q0NXZs1JwIIflN/X/0BcyFqV9JcdjaiujhVDTGXTq9QHwgdW5nYaRIwd
 74KaT+3SZEzu7Yxi3rwyfJgRp9YrJKpeP1MDSFVd8xGwhCZfQNp1Cv0TP3MWHSY+aiJY
 VVjtAbFBbb+7f19Qn8HRYyE++Z4ZFdJtO1vjA38kXiIzCBWjKzKxwOiS9T2VhoekLgMk
 H9oCHwH4xQV0I2WixNob398rpEzkl+uhCuFN7gF2USC/WZxrliy20JdKiPUNUFJdJawR
 IlV7YTC95BOVlfvGj2Z8JG5Sfe9/jLZyJo1HzEqWg9tMbQGVB5cHe4Uc/ZSZ9zRsoug4
 c/tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h0wGy457
Subject: Re: [Buildroot] [PATCH v2 1/2] package/go: bump to version 1.25.1
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
> Building Go 1.24 and later requires Go 1.22.6 or later for bootstrap.
> 
> To support this we use our previous Go version 1.23.12 as the version
> for go-bootstrap-stage4 and have the build for Go 1.25.1 depend on
> go-bootstrap-stage4.
> 
> Go version 1.23.12 is the latest go version we can build using
> go-bootstrap-stage3.
> 
> The package build for go-bootstrap-stage4 if effectively identical to
> go-bootstrap-stage3 with only the Go version and stage number changed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Christian Stewart <christian@aperture.us>

Applied to 2025.02.x. Thanks

> ---
> Changes v1 -> v2:
>   - fix license hash
> ---
>  package/go/Config.in.host                     |  9 +--
>  ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
>  package/go/go-bootstrap-stage4/Config.in.host |  4 ++
>  .../go-bootstrap-stage4.hash                  |  3 +
>  .../go-bootstrap-stage4.mk                    | 54 ++++++++++++++
>  package/go/go-src/go-src.mk                   |  4 +-
>  package/go/go.hash                            | 16 ++---
>  package/go/go.mk                              |  2 +-
>  8 files changed, 148 insertions(+), 15 deletions(-)
>  create mode 100644 package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
>  create mode 100644 package/go/go-bootstrap-stage4/Config.in.host
>  create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
>  create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index a42e37f90b..7ba70c9843 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,7 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> @@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  
>  # CGO linking for the host. Since we use the same compiler for target
>  # and host, if the target can't do CGO linking, then the host can't.
> @@ -57,7 +57,7 @@ if BR2_PACKAGE_HOST_GO
>  
>  choice
>  	prompt "Go compiler variant"
> -	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
>  	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	help
>  	  Select a Go compiler variant.
> @@ -66,7 +66,7 @@ choice
>  
>  config BR2_PACKAGE_HOST_GO_SRC
>  	bool "host go (source)"
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
>  	help
>  	  This package will build the go compiler for the host.
>  
> @@ -90,3 +90,4 @@ source "package/go/go-bin/Config.in.host"
>  source "package/go/go-bootstrap-stage1/Config.in.host"
>  source "package/go/go-bootstrap-stage2/Config.in.host"
>  source "package/go/go-bootstrap-stage3/Config.in.host"
> +source "package/go/go-bootstrap-stage4/Config.in.host"
> diff --git a/package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> new file mode 100644
> index 0000000000..58f4581b02
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> @@ -0,0 +1,71 @@
> +From 6b05378097c6a386ed9912d2471976dc39504e86 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@aperture.us>
> +Date: Thu, 27 Jul 2023 21:28:47 -0700
> +Subject: [PATCH] cmd/dist: set buildvcs=false when building go-bootstrap
> +
> +When building go-bootstrap as part of the make.bash process, the cmd/dist
> +invokes the bootstrap Go compiler to build the go_bootstrap tool:
> +
> +${GOROOT_BOOTSTRAP}/bin/go install -tags=math_big_pure_go compiler_bootstrap purego bootstrap/cmd/...
> +
> +If there is an invalid .git directory in a parent of ${GOROOT_BOOTSTRAP},
> +make.bash will fail. Reproduction of the issue:
> +
> +  mkdir go-issue-61620
> +  cd ./go-issue-61620
> +  wget https://go.dev/dl/go1.19.11.src.tar.gz
> +  mkdir go-bootstrap
> +  tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
> +  cd ./go-bootstrap/src/
> +  bash make.bash
> +  cd ../../
> +  wget https://go.dev/dl/go1.20.6.src.tar.gz
> +  mkdir go
> +  tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
> +  printf "gitdir: ../../does/not/exist/.git" > ./.git
> +  cd ./go/src/
> +  GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
> +
> +The build fails with the following error:
> +
> +  Building Go toolchain1 using [snip]/go-1.19.10.
> +  error obtaining VCS status: exit status 128
> +    Use -buildvcs=false to disable VCS stamping.
> +  go tool dist: FAILED: [snip]/go-1.19.10/bin/go install -tags=math_big_pure_go \
> +    compiler_bootstrap purego bootstrap/cmd/...: exit status 1
> +
> +This change unconditionally sets -buildvcs=false when compiling go-bootstrap. We
> +don't need the revision information in those binaries anyway. Setting this flag
> +was previously not done as we were unsure if the go-bootstrap compiler would be
> +new enough to support the buildvcs build flag. Since Go 1.20.x, Go 1.19.x is the
> +minimum version for go-bootstrap, and supports -buildvcs=false. We can now set
> +-buildvcs=false without worrying about compatibility.
> +
> +Related: https://github.com/golang/go/issues/54852
> +Fixes: https://github.com/golang/go/issues/61620
> +
> +Upstream: https://github.com/golang/go/pull/61621
> +
> +Signed-off-by: Christian Stewart <christian@aperture.us>
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + src/cmd/dist/buildtool.go | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
> +index a528d7aa76..3b411d6ebb 100644
> +--- a/src/cmd/dist/buildtool.go
> ++++ b/src/cmd/dist/buildtool.go
> +@@ -221,6 +221,9 @@ func bootstrapBuildTools() {
> + 	cmd := []string{
> + 		pathf("%s/bin/go", goroot_bootstrap),
> + 		"install",
> ++		// Fixes cases where an invalid .git is present in a parent of GOROOT_BOOTSTRAP.
> ++		// See: https://github.com/golang/go/issues/61620
> ++		"-buildvcs=false",
> + 		"-tags=math_big_pure_go compiler_bootstrap purego",
> + 	}
> + 	if vflag > 0 {
> +--
> +2.41.0
> +
> diff --git a/package/go/go-bootstrap-stage4/Config.in.host b/package/go/go-bootstrap-stage4/Config.in.host
> new file mode 100644
> index 0000000000..292486582c
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage4/Config.in.host
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
> new file mode 100644
> index 0000000000..eb10323ece
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
> @@ -0,0 +1,3 @@
> +# From https://go.dev/dl
> +sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
> +sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
> new file mode 100644
> index 0000000000..db0c85e3d0
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# go-bootstrap-stage4
> +#
> +################################################################################
> +
> +# Use last Go version that go-bootstrap-stage3 can build: v1.23.x
> +# See https://go.dev/doc/go1.24#bootstrap
> +GO_BOOTSTRAP_STAGE4_VERSION = 1.23.12
> +GO_BOOTSTRAP_STAGE4_SITE = https://storage.googleapis.com/golang
> +GO_BOOTSTRAP_STAGE4_SOURCE = go$(GO_BOOTSTRAP_STAGE4_VERSION).src.tar.gz
> +
> +GO_BOOTSTRAP_STAGE4_LICENSE = BSD-3-Clause
> +GO_BOOTSTRAP_STAGE4_LICENSE_FILES = LICENSE
> +
> +# Use go-bootstrap-stage3 to bootstrap.
> +HOST_GO_BOOTSTRAP_STAGE4_DEPENDENCIES = host-go-bootstrap-stage3
> +
> +HOST_GO_BOOTSTRAP_STAGE4_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE4_VERSION)
> +
> +# The go build system is not compatible with ccache, so use
> +# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> +HOST_GO_BOOTSTRAP_STAGE4_MAKE_ENV = \
> +	GO111MODULE=off \
> +	GOCACHE=$(HOST_GO_HOST_CACHE) \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
> +	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
> +	GOROOT="$(@D)" \
> +	GOBIN="$(@D)/bin" \
> +	GOOS=linux \
> +	CC=$(HOSTCC_NOCCACHE) \
> +	CXX=$(HOSTCXX_NOCCACHE) \
> +	CGO_ENABLED=0
> +
> +define HOST_GO_BOOTSTRAP_STAGE4_BUILD_CMDS
> +	cd $(@D)/src && \
> +		$(HOST_GO_BOOTSTRAP_STAGE4_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> +endef
> +
> +define HOST_GO_BOOTSTRAP_STAGE4_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/bin/gofmt
> +
> +	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/
> +
> +	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/pkg
> +	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/pkg/
> +	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/pkg/
> +
> +	# The Go sources must be installed to the host/ tree for the Go stdlib.
> +	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE4_ROOT)/
> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index c1f11a2262..9a18b6afe8 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -16,7 +16,7 @@ GO_SRC_CPE_ID_PRODUCT = go
>  
>  HOST_GO_SRC_PROVIDES = host-go
>  HOST_GO_SRC_DEPENDENCIES = \
> -	host-go-bootstrap-stage3 \
> +	host-go-bootstrap-stage4 \
>  	$(HOST_GO_DEPENDENCIES_CGO)
>  
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> @@ -37,7 +37,7 @@ endif
>  HOST_GO_SRC_MAKE_ENV = \
>  	GO111MODULE=off \
>  	GOCACHE=$(HOST_GO_HOST_CACHE) \
> -	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
>  	GOROOT_FINAL=$(HOST_GO_ROOT) \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> diff --git a/package/go/go.hash b/package/go/go.hash
> index dc88e9beab..60d61433fc 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
> -sha256  3b2fd446e26642555d1446a38ccbefb2a30bba3179d3ef132ed64d3c63b0c42a  go1.23.12.linux-386.tar.gz
> -sha256  d3847fef834e9db11bf64e3fb34db9c04db14e068eeb064f49af747010454f90  go1.23.12.linux-amd64.tar.gz
> -sha256  52ce172f96e21da53b1ae9079808560d49b02ac86cecfa457217597f9bc28ab3  go1.23.12.linux-arm64.tar.gz
> -sha256  9704eba01401a3793f54fac162164b9c5d8cc6f3cab5cee72684bb72294d9f41  go1.23.12.linux-armv6l.tar.gz
> -sha256  1a7cc5f7baeaf39125dce5d660a39438e7f0e04d13d3498590d240aae976b565  go1.23.12.linux-ppc64le.tar.gz
> -sha256  2f43708aa0922d692da0a1fc775475c343907610bec77002de1bbe37601ea338  go1.23.12.linux-s390x.tar.gz
> -sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> +sha256  d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594  go1.25.1.src.tar.gz
> +sha256  d03cdcbc9bd8baf5cf028de390478e9e2b3e4d0afe5a6582dedc19bfe6a263b2  go1.25.1.linux-386.tar.gz
> +sha256  7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e  go1.25.1.linux-amd64.tar.gz
> +sha256  65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d  go1.25.1.linux-arm64.tar.gz
> +sha256  eb949be683e82a99e9861dafd7057e31ea40b161eae6c4cd18fdc0e8c4ae6225  go1.25.1.linux-armv6l.tar.gz
> +sha256  8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f  go1.25.1.linux-ppc64le.tar.gz
> +sha256  9cfe517ba423f59f3738ca5c3d907c103253cffbbcc2987142f79c5de8c1bf93  go1.25.1.linux-s390x.tar.gz
> +sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 69ca746783..535787c92a 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.23.12
> +GO_VERSION = 1.25.1
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
