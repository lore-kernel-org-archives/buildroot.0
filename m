Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B0C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2565B402BD;
	Sun, 15 Sep 2024 09:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwm1k7fxVQtN; Sun, 15 Sep 2024 09:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06B77402CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B77402CD;
	Sun, 15 Sep 2024 09:17:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62A841BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F27281771
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrp9otfcltgj for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07578813FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07578813FF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07578813FF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:17:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-374c6187b6eso2677455f8f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726391866; x=1726996666;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+MrET6ls1OiKrCE412N4VNDSe141Me9/Y1RtWS1qSvE=;
 b=EOK76D+JXSNjFZNSx7cIyL1aXzm85MmEeurJmBVnTegr2vaNg/LpnK1FD8pA2ZTJWq
 UacPNXcMlY5aXgklgyMYrBIVB+A7cja3wiS//YdEez+hppA6KMMju4JZw1dojFweUBlB
 5lFYz8R5Pa7QyBXIBBsuUkHK0fyZK6t+t3elJEf/j9YXF+mjg/v911MPjzlXUvFmWQne
 1tZkRWTeu+KbSRiPK1QzTdw5O7n7uWMD3ZKrE3GOVAX1IgH5Jf87aewIShkXGQh4sUQG
 2D4vF9M+w6GrtF0UX8ix3n6fwu5INQwfRXfSgxcC7lw0rmp9SbOfv3Mys76k1ZVbqPdI
 zPAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO+dqSOrutFpVhK979D2AVbaRMYBpQxUqq70TAn8Z9p1gTHM4JFGtloJKgK/8378bFPdQrk1RJ4U4=@buildroot.org
X-Gm-Message-State: AOJu0YzVKKlUUhJJpl1FJ0eHNiaEH6UgvpZZ+fTTIayNU5qThp3Aavzr
 LqAIY9L9xNAWnN9gZoWN0J22S1yxm5dI1XQ0DGLx+Y1WbwacQioRrO8bfs94ts4=
X-Google-Smtp-Source: AGHT+IECPyl8QaCVNrk4rNU6r9y8CLb+FhOoIzuRp7mymOhkmJsV48qo4M2GpOtfpqukyn09UPVg3w==
X-Received: by 2002:adf:a407:0:b0:374:c90c:226 with SMTP id
 ffacd0b85a97d-378c2cfec60mr6767947f8f.9.1726391865728; 
 Sun, 15 Sep 2024 02:17:45 -0700 (PDT)
Received: from [10.20.31.55] (roof.metalab.wien.funkfeuer.at. [78.41.112.119])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e80c5sm4178563f8f.39.2024.09.15.02.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 02:17:45 -0700 (PDT)
Message-ID: <302021cc-1bc6-4ac1-b1e1-be63902f2a9a@mind.be>
Date: Sun, 15 Sep 2024 11:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726391866; x=1726996666; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+MrET6ls1OiKrCE412N4VNDSe141Me9/Y1RtWS1qSvE=;
 b=cMxbiRa5jIiRxCyPrIqHQd5jhYeDMdgjaA/5HLCC3DLcCN5ovuVH8HDw7sycg7MyMq
 LNBftPTIhYPnBQlM9Xuc7Cu0JqslApo8KXy3VG4c89ifocdiCThumHxur7gzP1Lok8sP
 QDgvk80yZfVjwPgrgDzywWzWJVN1AkbkaXCSV4uF/+5OSvqJSHkThxy3dWonRjzE5XL9
 H742KOr2XYOwfsI9qVRV/XEsWim9YcoN7OSzFgB2Cxk3Ax/G2s+TlXFbwNZfpic9yr9z
 I7PQW6ABUK9FQSgwf0KVp/2JlJlQIzmH9JNlJYCCVKolEGlUFZPLCFsfTKn+6cTm6W8T
 B7yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cMxbiRa5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Christian,

On 19/08/2024 22:33, Christian Stewart via buildroot wrote:
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

  We discussed this use case at the Buildroot Developer meeting. Clearly we do 
want to support this use case in Buildroot. However, we think it should be more 
generic. In particular, we want to be able to build go-src without going through 
all three of the bootstrap stages even if the host architecture is supported. 
The use case there is if there's a security or other patch that you want to 
apply to go-src.

  The solution is quite simple: make this approach an option, rather than 
automatically selecting depending on if go-bootstrap-stage1 is supported or not. 
Something like: when you select go-src, a new choice pops up to choose between 
full bootstrap or bootstrap from a downloaded binary.


> This patch adds a fallback to require a host Go compiler to build host-go-src
> when BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS is not set.

  We also discussed this one. Relying on the host Go compiler is tricky because 
then you also have to check its version (which this patch doesn't do AFAICS). 
And it's always tricky to rely on host tools when it comes to reproducibility.

  So we think it's better to instead download the Go compiler. In terms of build 
time, it shouldn't make much of a difference whether it's downloaded or the host 
Go is used. And with the download it always works (at least on supported 
platforms), even if there is no Go installed on the host.


> Recent changes added go-src with the intent of adding go-bin later. This

  go-bin should hopefully be merged today.

  Ideally, it should be possible to reuse go-bin directly to replace 
go-bootstrap3, by adding some conditions to go-bin.mk (e.g. if it's used as 
bootstrap3, it has to be installed in a different location). But if that is too 
complex, it's also OK to create a completely separate go-boostrap3-bin.



> commit changes go-src to depend on the host Go compiler to bootstrap
> go-src on architectures that cannot build go-bootstrap-stage1 (such as arm64).
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> 
> ---
> 
> changes prior to inclusion in this series:
> 
>   - thanks Thomas for the review & suggestions
>   - added NEEDS_HOST_GO boolean
>   - added dependency checks to support/dependencies/dependencies.sh
>   - removed unnecessary changes to go-bootstrap package
>   - add dependency on toolchain if Cgo is enabled
>   - updates for go1.20
>   - updates for go-bootstrap-stage{1,2}
> 
> changes from v1 -> v2:
> 
>   - remove whitespace fix in bootstrap stage2
> 
> changes from v2 -> v3:
> 
>   - rebase
> 
> changes from v7 -> v8:
> 
> - rebase on go-src changes
> - Discussion related to adding go-src and go-bin:
>    - https://patchwork.ozlabs.org/project/buildroot/patch/20230711220849.1702358-4-christian@aperture.us/
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>   Config.in                            |  4 ++++
>   package/go/Config.in.host            |  3 +--
>   package/go/go-src/go-src.mk          | 12 ++++++++----
>   support/dependencies/dependencies.sh |  4 ++++
>   4 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index df43db7eff..bd7227a049 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -68,6 +68,10 @@ config BR2_HOST_GCC_AT_LEAST_11
>   # When adding new entries above, be sure to update
>   # the HOSTCC_MAX_VERSION variable in the Makefile.
> 
> +# Hidden boolean selected if bootstrapping Go w/ GCC is not supported.
> +config BR2_NEEDS_HOST_GO
> +	bool
> +
>   # Hidden boolean selected by packages in need of Java in order to build
>   # (example: kodi)
>   config BR2_NEEDS_HOST_JAVA
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 11ce6df369..e006dfc830 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,6 @@
>   config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   	bool
>   	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS

  So this would become something like

depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS \
	|| BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS

>   	# See https://go.dev/doc/install/source#environment
>   	# See src/go/build/syslist.go for the list of supported architectures
>   	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> @@ -34,7 +33,6 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>   config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>   	bool
>   	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> 
>   # Go packages should select BR2_PACKAGE_HOST_GO
>   config BR2_PACKAGE_HOST_GO
> @@ -53,6 +51,7 @@ choice
> 
>   config BR2_PACKAGE_HOST_GO_SRC
>   	bool "host go (source)"
> +	select BR2_NEEDS_HOST_GO if
> !BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS

  BTW, this line was wrapped...


  Regards,
  Arnout

>   	help
>   	  This package will build the go compiler for the host.
> 
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index 0d1a9b3187..7e78f6e4d2 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -12,9 +12,7 @@ GO_SRC_LICENSE_FILES = LICENSE
>   GO_SRC_CPE_ID_VENDOR = golang
> 
>   HOST_GO_SRC_PROVIDES = host-go
> -HOST_GO_SRC_DEPENDENCIES = \
> -	host-go-bootstrap-stage3 \
> -	$(HOST_GO_DEPENDENCIES_CGO)
> +HOST_GO_SRC_DEPENDENCIES = $(HOST_GO_DEPENDENCIES_CGO)
> 
>   ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> 
> @@ -34,7 +32,6 @@ endif
>   HOST_GO_SRC_MAKE_ENV = \
>   	GO111MODULE=off \
>   	GOCACHE=$(HOST_GO_HOST_CACHE) \
> -	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
>   	GOROOT_FINAL=$(HOST_GO_ROOT) \
>   	GOROOT="$(@D)" \
>   	GOBIN="$(@D)/bin" \
> @@ -44,6 +41,13 @@ HOST_GO_SRC_MAKE_ENV = \
>   	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
>   	$(HOST_GO_SRC_CROSS_ENV)
> 
> +# Use the Go compiler bootstrapped by Buildroot if available.
> +# Otherwise, use the host Go compiler.
> +ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS),y)
> +HOST_GO_DEPENDENCIES += host-go-bootstrap-stage3
> +HOST_GO_MAKE_ENV += GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT)
> +endif
> +
>   define HOST_GO_SRC_BUILD_CMDS
>   	cd $(@D)/src && \
>   		$(HOST_GO_SRC_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> diff --git a/support/dependencies/dependencies.sh
> b/support/dependencies/dependencies.sh
> index 6d5fc36037..7b1c51b4f1 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -217,6 +217,10 @@ if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
>   	fi
>   fi
> 
> +if grep -q ^BR2_NEEDS_HOST_GO=y $BR2_CONFIG ; then
> +	check_prog_host "go"
> +fi
> +
>   if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
>   	check_prog_host "java"
>   	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
