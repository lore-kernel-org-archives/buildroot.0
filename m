Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547CCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FE9810D8;
	Fri, 29 May 2026 08:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fcuyXUFZx1g; Fri, 29 May 2026 08:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7822D80FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043368;
	bh=LaorsAz5Ak8GfGfs2P5RJSquNeI+Sz+NLSxxodCiFTU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qTPO4br4dfA2bhyJQxwAOeiusphkVIbtSQtfFL+UPJedueCra0kSm/ZGpwP5obqZO
	 WXj9hZI9BfhpHYxQv8QWU6R0zqocbSHrg3Vl+7ILB5I691lVOhgBRZUgYDiEwJL/A4
	 L3QiuYE0cogz2/qAFoy0vq+YHeEUJsadWj6aqEnHEbELjCNK5MapTYNTKT5U6BfUgl
	 Hp/d2kPV2EOggnt2+rlQla837vA33icbtYFUnEAxjwvVP1+hvUifuRPsh3+uJ+arz1
	 tFCIwOigAndEdwiVV7ig7m3ATytIL6V/h4TQWCgjIHE4k80UezA1jdFF57h03j8yBq
	 vxDc33TkXzfVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7822D80FD7;
	Fri, 29 May 2026 08:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6449728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44E3261523
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDRMRDZovPGs for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9CD061517
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9CD061517
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9CD061517
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so103954f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043358; x=1780648158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6fck0P84v4MqK4Cs91NH/uthMmliWCWzsWW9gUfngIo=;
 b=XMT2bvasCzKg0wSQQpJrsmt6TB2S+I+v84V9DeXsdZNQ/hf0jGGaYNOtFgT6kLqNEr
 y/8MOG3zb5dBjBr6vaPtDUEhKoCdNFHvkCPPZjBBPPNJ7/sM6liZ/jqqNVRjz4BNbhDS
 gC+b+ELTe3BCcNmfXc/svtCwN3ChdKFt2Pg1zimu2kjazExP6mNBksV6V7CRnsFPszIU
 WSW2DF8c4XjZ3Efb/LKRpxaMNN0Enjfp5IcYGcERUxV5CS/hDULNMbV/aQgOg0loGw8W
 vC5A0HD1IFGUltPY1o/ETogEeU9sUAQSgdQGXpW/aEb02m0/vRUf1aO4gLDO76MYzg/L
 I8ag==
X-Forwarded-Encrypted: i=1;
 AFNElJ9NZ7ar+QxjOfH+aNTS2hyZhwXO0OlnvT26HIe69+Abk6UkGSMryY/F83KKq2iaiYNa7aeH3cCu9fo=@buildroot.org
X-Gm-Message-State: AOJu0Yx5tQ7WLx5w46EDuBNwhuax4ZfWA/7gsnG7Ql0+MN0R941jdE0z
 fOF9rn0jmA2CeEk1eQ52IOKJs+Q/mx/Y8fFWlCFgb0cD/TpAHqclhva12/5mEMp3Zhf+FJLPXQu
 fkGGC
X-Gm-Gg: Acq92OEldrbERlcexDEmtdYYUO78/yKn1OPkNlGzoK8F6ConicWMEInhXpvDA+l6LIH
 zxYadPGUdixV0m9IEhkXUfvdaKkN79RJCi7w9FkGEBBAvQo8vphsL4A/FmuZ8tqVgIFnjwurkUR
 +ihG2YfKAoVf6hkhDDw9TAkkaRc+DtyvIkMc14PsVi4sZPiFhq2e4VZuBpIBQlMAulP+vYjB/ZT
 7Abkzm8qRO4KsBcFsrQF+r/7Uxhi/VWW1Hcn/uwPvhX16wkTyyDBX6OcMf0aUIacgLThXqzFzEG
 pS3dkQCSlGZppoNnNDEM064JgC65ZnjW2g79LZsaH2FbCg56YTpwERo4P1RVvbTI8qeLR6N+SsL
 snym2s6yKFIQjkw8qChHKQ2EcJxfw+I1mUizelEoHd7Xx053mtXfn16kMFpuGIefRR6eSzzfAmW
 RnfBVbz55seQJdhxJMZ54yLObRq9vAl9TZyobEQIKPvTLeM7wCDbSgCwX0qAUTO6FQwAoH
X-Received: by 2002:a05:6000:41e2:b0:45e:6518:21ad with SMTP id
 ffacd0b85a97d-45ef13fdceamr2915394f8f.3.1780043357473; 
 Fri, 29 May 2026 01:29:17 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3595ef4sm1676448f8f.37.2026.05.29.01.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:17 -0700 (PDT)
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:16 +0200
Message-ID: <20260529082916.57249-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260312075722.86111-1-christian@aperture.us>
References: <20260312075722.86111-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043358; x=1780648158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fck0P84v4MqK4Cs91NH/uthMmliWCWzsWW9gUfngIo=;
 b=aBmxjLkMtDzliYQkr7VXKtp0XBGQ340DJ8mcTV1zhmTe61D2SFBqSVGlbErbILTcCq
 tPvCpY+OrmuIzHIA0L5EQ5w93DWrH7fy8TkWujNqYMPJEaQ6VKE1VmtFiJ6zWZ+oPhgF
 /BCiidGcyzkqKQsv3VCbcZrbzk5W7JgCxYaN4R87TCnvrfMiKBNTbYpSAhTSGHn6Ux4U
 zY/ID3YK8mh3i/TeYHKLQTW5sHNC3uUM9J5bhvTKnksV2HrSTztqWbvgHtOBecZcU1BB
 thy4TC+j/ma+SJ3nkec/GHa7qATv1JGq0dNwbnX9kVuLgC3kFg61VRFNB/xgVd5ilb1Y
 Mo9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aBmxjLkM
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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
> Building Go 1.26 and later requires Go 1.24.6 or later for bootstrap.
> 
> To support this we use Go version 1.25.8 as the version for
> go-bootstrap-stage5 and have the build for Go 1.26.1 depend on
> go-bootstrap-stage5.
> 
> Go version 1.25.8 is the latest Go version we can build using
> go-bootstrap-stage4.
> 
> The package build for go-bootstrap-stage5 is effectively identical to
> go-bootstrap-stage4 with only the Go version and stage number changed.
> 
> Go 1.28 is expected to require a minor release of Go 1.26 for bootstrap.
> 
> Fixes the following security vulnerabilities:
> 
> - CVE-2026-25679: net/url: reject IPv6 literal not at start of host
> - CVE-2026-27142: html/template: URLs in meta attribute actions not escaped
> - CVE-2026-27137: crypto/x509: incorrect enforcement of email constraints
> - CVE-2026-27138: crypto/x509: panic in name constraint checking: certificates
> - CVE-2026-27139: os: FileInfo can escape from a Root
> 
> For full release notes, see:
> https://go.dev/doc/devel/release#go1.26.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> 

Applied to 2025.02.x. Thanks

> ---
> 
> v1 -> v2:
> 
> - fix license hash
> - document security fixes
> 
> ---
>  package/go/Config.in.host                     |  9 +--
>  ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
>  package/go/go-bootstrap-stage5/Config.in.host |  4 ++
>  .../go-bootstrap-stage5.hash                  |  3 +
>  .../go-bootstrap-stage5.mk                    | 54 ++++++++++++++
>  package/go/go-src/go-src.mk                   |  4 +-
>  package/go/go.hash                            | 14 ++--
>  package/go/go.mk                              |  2 +-
>  8 files changed, 147 insertions(+), 14 deletions(-)
>  create mode 100644 package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
>  create mode 100644 package/go/go-bootstrap-stage5/Config.in.host
>  create mode 100644 package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
>  create mode 100644 package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 7ba70c9843..79950983c1 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,7 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> @@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  
>  # CGO linking for the host. Since we use the same compiler for target
>  # and host, if the target can't do CGO linking, then the host can't.
> @@ -57,7 +57,7 @@ if BR2_PACKAGE_HOST_GO
>  
>  choice
>  	prompt "Go compiler variant"
> -	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
> +	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS
>  	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	help
>  	  Select a Go compiler variant.
> @@ -66,7 +66,7 @@ choice
>  
>  config BR2_PACKAGE_HOST_GO_SRC
>  	bool "host go (source)"
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS
>  	help
>  	  This package will build the go compiler for the host.
>  
> @@ -91,3 +91,4 @@ source "package/go/go-bootstrap-stage1/Config.in.host"
>  source "package/go/go-bootstrap-stage2/Config.in.host"
>  source "package/go/go-bootstrap-stage3/Config.in.host"
>  source "package/go/go-bootstrap-stage4/Config.in.host"
> +source "package/go/go-bootstrap-stage5/Config.in.host"
> diff --git a/package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> new file mode 100644
> index 0000000000..58f4581b02
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
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
> diff --git a/package/go/go-bootstrap-stage5/Config.in.host b/package/go/go-bootstrap-stage5/Config.in.host
> new file mode 100644
> index 0000000000..393780f21c
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage5/Config.in.host
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE4_ARCH_SUPPORTS
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> new file mode 100644
> index 0000000000..5e40ba7e6e
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> @@ -0,0 +1,3 @@
> +# From https://go.dev/dl
> +sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
> +sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> new file mode 100644
> index 0000000000..9006e5bf44
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# go-bootstrap-stage5
> +#
> +################################################################################
> +
> +# Use last Go version that go-bootstrap-stage4 can build: v1.25.x
> +# See https://go.dev/doc/go1.26#bootstrap
> +GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
> +GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
> +GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
> +
> +GO_BOOTSTRAP_STAGE5_LICENSE = BSD-3-Clause
> +GO_BOOTSTRAP_STAGE5_LICENSE_FILES = LICENSE
> +
> +# Use go-bootstrap-stage4 to bootstrap.
> +HOST_GO_BOOTSTRAP_STAGE5_DEPENDENCIES = host-go-bootstrap-stage4
> +
> +HOST_GO_BOOTSTRAP_STAGE5_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE5_VERSION)
> +
> +# The go build system is not compatible with ccache, so use
> +# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> +HOST_GO_BOOTSTRAP_STAGE5_MAKE_ENV = \
> +	GO111MODULE=off \
> +	GOCACHE=$(HOST_GO_HOST_CACHE) \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
> +	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE5_ROOT) \
> +	GOROOT="$(@D)" \
> +	GOBIN="$(@D)/bin" \
> +	GOOS=linux \
> +	CC=$(HOSTCC_NOCCACHE) \
> +	CXX=$(HOSTCXX_NOCCACHE) \
> +	CGO_ENABLED=0
> +
> +define HOST_GO_BOOTSTRAP_STAGE5_BUILD_CMDS
> +	cd $(@D)/src && \
> +		$(HOST_GO_BOOTSTRAP_STAGE5_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> +endef
> +
> +define HOST_GO_BOOTSTRAP_STAGE5_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/bin/gofmt
> +
> +	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/
> +
> +	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/pkg
> +	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/pkg/
> +	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/pkg/
> +
> +	# The Go sources must be installed to the host/ tree for the Go stdlib.
> +	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE5_ROOT)/
> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index ead535f4e0..7bdde1a8c1 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -16,7 +16,7 @@ GO_SRC_CPE_ID_PRODUCT = go
>  
>  HOST_GO_SRC_PROVIDES = host-go
>  HOST_GO_SRC_DEPENDENCIES = \
> -	host-go-bootstrap-stage4 \
> +	host-go-bootstrap-stage5 \
>  	$(HOST_GO_DEPENDENCIES_CGO)
>  
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> @@ -37,7 +37,7 @@ endif
>  HOST_GO_SRC_MAKE_ENV = \
>  	GO111MODULE=off \
>  	GOCACHE=$(HOST_GO_HOST_CACHE) \
> -	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE4_ROOT) \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE5_ROOT) \
>  	GOROOT_FINAL=$(HOST_GO_ROOT) \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 9a9a5a571a..bae223882a 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a  go1.25.7.src.tar.gz
> -sha256  2866517e9ca81e6a2e85a930e9b11bc8a05cfeb2fc6dc6cb2765e7fb3c14b715  go1.25.7.linux-386.tar.gz
> -sha256  12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005  go1.25.7.linux-amd64.tar.gz
> -sha256  ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129  go1.25.7.linux-arm64.tar.gz
> -sha256  1ba07e0eb86b839e72467f4b5c7a5597d07f30bcf5563c951410454f7cda5266  go1.25.7.linux-armv6l.tar.gz
> -sha256  42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f  go1.25.7.linux-ppc64le.tar.gz
> -sha256  c6b77facf666dc68195ecab05dbf0ebb4e755b2a8b7734c759880557f1c29b0c  go1.25.7.linux-s390x.tar.gz
> +sha256  3172293d04b209dc1144698e7ba13f0477f6ba8c5ffd0be66c20fdbc9785dfbb  go1.26.1.src.tar.gz
> +sha256  da75d696c6b9440fe9fb6418429f29eaeee947707ee8c6ddb567c558051a1cc2  go1.26.1.linux-386.tar.gz
> +sha256  031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a  go1.26.1.linux-amd64.tar.gz
> +sha256  a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7  go1.26.1.linux-arm64.tar.gz
> +sha256  c9937198994dc173b87630a94a0d323442bef81bf7589b1170d55a8ebf759bda  go1.26.1.linux-armv6l.tar.gz
> +sha256  f56eed002998f5f51fa07fd4ed0c5de5e02d51cec7a4007f771c7576620d9d45  go1.26.1.linux-ppc64le.tar.gz
> +sha256  60fe623ef63e6338c055ec0e0e3f4fa85c97a056de2d2f6ee38591e2bfa9cdde  go1.26.1.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index a9c7d1ddc6..6c57be0ad7 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.25.7
> +GO_VERSION = 1.26.1
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
