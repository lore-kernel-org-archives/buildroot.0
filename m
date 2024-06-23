Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2376EC2BA18
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DE280F05;
	Sun, 23 Jun 2024 21:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur89zDd_ed0i; Sun, 23 Jun 2024 21:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8E180EC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF8E180EC9;
	Sun, 23 Jun 2024 21:00:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C38F31BF2EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B137580E86
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ps2_cDLHujg for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 21:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93D3A80E7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D3A80E7E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93D3A80E7E
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 21:00:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6B3D813F8B9
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 23:00:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jun 2024 23:00:40 +0200
Date: Sun, 23 Jun 2024 23:00:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZniM-NFO98HzQCxT@landeda>
References: <20240620182144.3027565-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620182144.3027565-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719176441;
 bh=XKOnKXck5la1Wo/aldz96wbS2P51F74OgZ1+K8va66A=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=YOka5nY5fPKELIusd4Pn9BWx+JEhL5rCxXwhShS6Ck+vDm2lO5Wr+XZkAXWbmptx8
 y86dURIFa3l2FdgqqbLlgySJuk2+78upTVCLrHxNg1kbzeCWto1hEkqnTxbnBxZk8D
 tRs4eScQVb/dRue1EYH0EiOqgggl4JL3qH9LLz9ZNfZFwUcoyyB+zOi0PFhOMJwCNO
 01rDylfJwFcgrIY7JQFC5PC7TLoHJch0dZs5zoBhuSLGIVYtC0XMcK3LAcElwPhavg
 l0xgGouoBB+C5cibvV7QtwEVsPQSfHmF6R564J/uIfuCCE7F1YkGcv/fQiF0txkCNo
 XtwovvJA2/Xtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YOka5nY5
Subject: Re: [Buildroot] [PATCH] package/go: ensure the toolchain is
 available
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-20 20:21 +0200, Yann E. MORIN spake thusly:
> The toolchain is needed to build the final-stage go compiler, when it
> should have CGO support.
> 
> However, in commit 0290c543dec8 (package/go: new subdirectory for go
> variants), the HOST_GO_DEPENDENCIES assignment was only partially split
> off to the new location; part of it was left in the ole go.mk to act as
> common variables. With that commit, the go package had not been renamed,
> which meant that the dependencies were still correct.
> 
> But in commit fa2536ec9401 (package/go: make host package a virtual
> package), the 'go' package was renamed to 'go-src', and replaced by a
> 'go' virtual package.
> 
> The variables in the go-src package were properly renamed, and the
> variables in the go virtual package were properly _not_ renamed. As a
> consequence, the go-src package lost its dependency on the toolchain
> when needed, while the go virtual package still had it.
> 
> However, that was not correct when CGO is enabled (i.e. when the target
> has threads): go-src then fails to build:
> 
>     Building Go cmd/dist using [...]/host/lib/go-1.21.8. (go1.21.8 linux/amd64)
>     go tool dist: cannot invoke C compiler ["[...]/host/bin/aarch64-linux-gcc"]:
>     fork/exec [...]/host/bin/aarch64-linux-gcc: no such file or directory
> 
>     Go needs a system C compiler for use with cgo.
>     To set a C compiler, set CC=the-compiler.
>     To disable cgo, set CGO_ENABLED=0.
> 
> After some retro-thinking, the reasoning behind this was that the
> toolchain would _also_ be needed when using the prebuilt go-bin, which
> is indeed correct, so by having it as a dependency of the virtual
> package, it would ensure the toolchain be present in both cases, when
> building from scratch or when using a prebuilt go.
> 
> The oversight being that the toolchain is _also_ needed to actually
> build go when CGO is enabled.
> 
> We fix this by handling the toolchain dependency for CGO by exposing it
> in a variable, that can be used as a dependency in go-src, like is done
> to actually enable or disable CGO support.
> 
> We still ensure that host-go still depends on it, for a future go-bin
> provider.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/go/go-src/go-src.mk | 4 +++-
>  package/go/go.mk            | 5 ++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index 1e061e20bc..0d1a9b3187 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -12,7 +12,9 @@ GO_SRC_LICENSE_FILES = LICENSE
>  GO_SRC_CPE_ID_VENDOR = golang
>  
>  HOST_GO_SRC_PROVIDES = host-go
> -HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
> +HOST_GO_SRC_DEPENDENCIES = \
> +	host-go-bootstrap-stage3 \
> +	$(HOST_GO_DEPENDENCIES_CGO)
>  
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
>  
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 6f92893204..91a8fb828f 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -83,7 +83,7 @@ HOST_GO_TARGET_ENV = \
>  # any target package needing cgo support must include
>  # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -HOST_GO_DEPENDENCIES += toolchain
> +HOST_GO_DEPENDENCIES_CGO += toolchain
>  HOST_GO_CGO_ENABLED = 1
>  else
>  HOST_GO_CGO_ENABLED = 0
> @@ -95,6 +95,9 @@ else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  HOST_GO_CGO_ENABLED = 1
>  endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  
> +# Ensure the toolchain is available, whatever the provider
> +HOST_GO_DEPENDENCIES += $(HOST_GO_DEPENDENCIES_CGO)
> +
>  # For the convenience of host golang packages
>  HOST_GO_HOST_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
> -- 
> 2.45.1
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
