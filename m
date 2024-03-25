Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61656C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3753608CC;
	Mon, 25 Mar 2024 22:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YtcyzY7sgQ0; Mon, 25 Mar 2024 22:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF659608DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF659608DB;
	Mon, 25 Mar 2024 22:37:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12F611BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8AED608C1
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou0dBW9Bab5y for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BC98608E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC98608E3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BC98608E3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:36:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4148cd86470so3456105e9.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406214; x=1712011014;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SGRVjDhLgXsu1GcgnkM0zrMyyb6zjd+F2fzRZHNTeDY=;
 b=JzyqgDeQ8C+C4nBSLUT6ZOV9TKCZShvQCRNL9U+kLUvCcqRODNggu/i/H9vnDLoVmY
 DH1XDqE8LXJX4W0rfEXgvknVk9Rg4yAq/wf6J83PWGM8AsOlbSw+jqHCrZInYnL1AkbG
 o3h2fBxKAzNxljgpvpfQKQFfMGjJ/EYJDjSpie2eAW6p1RmPcS81VSkoAq9vz7IeA60p
 4zM0pq1eRXnegViwXKahYq256iM/PphStN1A/z5hiH/0wNilclB1DvE49KN8Xpbh+GlG
 WWnvBWSQOubz5+H6E3r4d/ofpSYnRBE1HpzgTH7cALRmMCD90KklLJ20Sll6gUHHVwEg
 wDQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL8rlg3HL0ywVNogCL0bUnSGooG8u2B8kvHPy7pvDy9hjdi53XUQEc7jz9NPTYcZI+TTNxezrapmm/P575xhidUktRqJjOOw==
X-Gm-Message-State: AOJu0YyMpXT2pfisGeR7azfZdR0aW1MLv6wHSArjx29UzHOx5f9Beeoe
 9RkrxocKTKFHNs4MPGxTEtf0nq4L3cEEh27Ez3ia3dqeicFAgX3wHEUnHYBIy1g=
X-Google-Smtp-Source: AGHT+IFJlfRRNxdGq8HdODVJGWaAwynjkqOaCFHimpeza7ieNCtBwxAzLzqnxse9qmTt/4iDvru3OQ==
X-Received: by 2002:a05:600c:22c7:b0:414:392:38d2 with SMTP id
 7-20020a05600c22c700b00414039238d2mr7092594wmg.24.1711406213969; 
 Mon, 25 Mar 2024 15:36:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b00414896b61e4sm4747608wmo.16.2024.03.25.15.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 15:36:53 -0700 (PDT)
Message-ID: <edeee9c6-f3ff-40cf-8f78-cb4855dd937a@mind.be>
Date: Mon, 25 Mar 2024 23:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20240307015107.2908128-1-christian@aperture.us>
 <20240307015107.2908128-2-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20240307015107.2908128-2-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711406214; x=1712011014; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SGRVjDhLgXsu1GcgnkM0zrMyyb6zjd+F2fzRZHNTeDY=;
 b=MZ6lTy+Aj1+KEH+F8g8O7dnbA+lcDrE7uVFW1GyFOVCQWb76D4gTkPt++CvfnX/S71
 CcaJtH+xF06phxoGrl89FU8xbkmxGu3Q9WzlYqkEM9w7nSiKCc6tWVtqS3JEfG3aSdAn
 2caXuJKQV7SM7O+FG9brXWQPMA9jpZ9yB6OUq89LLi5VIgt/fmU6/on81smVdW2CuFMA
 ogcVFaknb6Fp1Sf7+mqOD7sW6SmM6qVa2ttkd8R8nUmnbF+R5RKhhTXN3GxnuKrz5Mmo
 iicjj2ClfCqNXG/6g0wb9CILSUQyINpG/tbBokLYtBjIZhe3Kpt/CYZBcGnooWyb5JOV
 GeZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MZ6lTy+A
Subject: Re: [Buildroot] [PATCH v1 2/3] package/go-bootstrap-stage3: add
 stage3 for go1.22 support
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



On 07/03/2024 02:51, Christian Stewart via buildroot wrote:
> Add a third bootstrap stage with Go1.21.x necessary for go1.22 bootstrap.
> 
> go-bootstrap-stage1 is Go1.4.x, the final version to support bootstrap using a C
> compiler (later versions require the Go compiler for bootstrapping).
> 
> See: https://go.dev/doc/install/source#bootstrapFromSource
> 
> go-bootstrap-stage2 is Go 1.19.13, the last version to support bootstrap using
> the Go1.4.x compiler.
> 
> go-bootstrap-stage3 is Go 1.21.8, the last version to support bootstrap using
> the Go1.19.13 compiler. Go 1.20 requires a minimum of go 1.17.13 to bootstrap.
> 
> See: https://go.dev/doc/go1.20#bootstrap
> 
> This patch is in preparation for bumping the host-go package to >go1.22.x, which
> requires a minimum of Go1.20.x for bootstrap.
> 
> See: https://go.dev/doc/go1.22#bootstrap
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in.host                        |  1 +
>   package/go-bootstrap-stage3/Config.in.host    |  4 ++
>   .../go-bootstrap-stage3.hash                  |  3 ++
>   .../go-bootstrap-stage3.mk                    | 53 +++++++++++++++++++
>   5 files changed, 62 insertions(+)
>   create mode 100644 package/go-bootstrap-stage3/Config.in.host
>   create mode 100644 package/go-bootstrap-stage3/go-bootstrap-stage3.hash
>   create mode 100644 package/go-bootstrap-stage3/go-bootstrap-stage3.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a6364cdd44..abcf29b2fc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -595,6 +595,7 @@ F:	package/fuse-overlayfs/
>   F:	package/go/
>   F:	package/go-bootstrap-stage1/
>   F:	package/go-bootstrap-stage2/
> +F:	package/go-bootstrap-stage3/
>   F:	package/gocryptfs/
>   F:	package/mbpfan/
>   F:	package/moby-buildkit/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index f03ca16b7b..9543a22ffc 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -46,6 +46,7 @@ menu "Host utilities"
>   	source "package/go/Config.in.host"
>   	source "package/go-bootstrap-stage1/Config.in.host"
>   	source "package/go-bootstrap-stage2/Config.in.host"
> +	source "package/go-bootstrap-stage3/Config.in.host"
>   	source "package/google-breakpad/Config.in.host"
>   	source "package/gptfdisk/Config.in.host"
>   	source "package/imagemagick/Config.in.host"
> diff --git a/package/go-bootstrap-stage3/Config.in.host b/package/go-bootstrap-stage3/Config.in.host
> new file mode 100644
> index 0000000000..1714c2fb15
> --- /dev/null
> +++ b/package/go-bootstrap-stage3/Config.in.host
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
> diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.hash b/package/go-bootstrap-stage3/go-bootstrap-stage3.hash
> new file mode 100644
> index 0000000000..b1aed10c7c
> --- /dev/null
> +++ b/package/go-bootstrap-stage3/go-bootstrap-stage3.hash
> @@ -0,0 +1,3 @@
> +# From https://go.dev/dl
> +sha256  dc806cf75a87e1414b5b4c3dcb9dd3e9cc98f4cfccec42b7af617d5a658a3c43  go1.21.8.src.tar.gz
> +sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go-bootstrap-stage3/go-bootstrap-stage3.mk
> new file mode 100644
> index 0000000000..553256bcb8
> --- /dev/null
> +++ b/package/go-bootstrap-stage3/go-bootstrap-stage3.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# go-bootstrap-stage3
> +#
> +################################################################################
> +
> +# Use last Go version that go-bootstrap-stage2 can build: v1.21.x
> +# See https://go.dev/doc/go1.22#bootstrap
> +GO_BOOTSTRAP_STAGE3_VERSION = 1.21.8
> +GO_BOOTSTRAP_STAGE3_SITE = https://storage.googleapis.com/golang
> +GO_BOOTSTRAP_STAGE3_SOURCE = go$(GO_BOOTSTRAP_STAGE3_VERSION).src.tar.gz
> +
> +GO_BOOTSTRAP_STAGE3_LICENSE = BSD-3-Clause
> +GO_BOOTSTRAP_STAGE3_LICENSE_FILES = LICENSE
> +
> +# Use go-bootstrap-stage2 to bootstrap.
> +HOST_GO_BOOTSTRAP_STAGE3_DEPENDENCIES = host-go-bootstrap-stage2
> +
> +HOST_GO_BOOTSTRAP_STAGE3_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE3_VERSION)
> +
> +# The go build system is not compatible with ccache, so use
> +# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> +HOST_GO_BOOTSTRAP_STAGE3_MAKE_ENV = \
> +	GO111MODULE=off \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
> +	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
> +	GOROOT="$(@D)" \
> +	GOBIN="$(@D)/bin" \
> +	GOOS=linux \
> +	CC=$(HOSTCC_NOCCACHE) \
> +	CXX=$(HOSTCXX_NOCCACHE) \
> +	CGO_ENABLED=0

  When trying to build in the context of the runtime tests, I get this error:

cd /home/tmp/brtest/TestMender/build/host-go-bootstrap-stage3-1.21.8/src && 
GO111MODULE=off GOROOT_BOOTSTRAP=/home/tmp/brtest/TestMender/host/lib/go-1.19.13 
GOROOT_FINAL=/home/tmp/brtest/TestMender/host/lib/go-1.21.8 
GOROOT="/home/tmp/brtest/TestMender/build/host-go-bootstrap-stage3-1.21.8" 
GOBIN="/home/tmp/brtest/TestMender/build/host-go-bootstrap-stage3-1.21.8/bin" 
GOOS=linux CC=/usr/bin/gcc CXX=/usr/bin/g++ CGO_ENABLED=0 ./make.bash
Building Go cmd/dist using /home/tmp/brtest/TestMender/host/lib/go-1.19.13. 
(go1.19.13 linux/amd64)
build cache is required, but could not be located: GOCACHE is not defined and 
neither $XDG_CACHE_HOME nor $HOME are defined

  I suspect that we need either GOCACHE=$(HOST_GO_HOST_CACHE) or GOCACHE=(some 
other path). I tested with the first option and that seems to work. So I made 
that change and committed. Let's see if the autobuilders complain...

  Regards,
  Arnout


> +
> +define HOST_GO_BOOTSTRAP_STAGE3_BUILD_CMDS
> +	cd $(@D)/src && \
> +		$(HOST_GO_BOOTSTRAP_STAGE3_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
> +endef
> +
> +define HOST_GO_BOOTSTRAP_STAGE3_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/bin/go
> +	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/bin/gofmt
> +
> +	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/
> +
> +	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg
> +	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg/
> +	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg/
> +
> +	# The Go sources must be installed to the host/ tree for the Go stdlib.
> +	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/
> +endef
> +
> +$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
