Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E69CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61472827B5;
	Tue, 12 May 2026 21:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBFIfzPNhhFj; Tue, 12 May 2026 21:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC604827A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778621625;
	bh=Is9c6HDfvR4QoSB4xqqq2tQrhAHUoVd70HNopPdpwhU=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=oXQGQGg8AHGWeLThU1hk7bdbQrrjxm3iriFGBa58RK319OnWJIzbYSv1MGeUDf0nw
	 7gFpMi9Uxg2wUKZ8nGELzgshVrv766PCYqxO3fH/egAoD2ETllIj9BWGjp5W+YC1Nc
	 DGjy+WniygQ+YSypAIuZrWYWXE7tEEVN4qfCX13O5TSgCRlHJIdfKIPZE0oG971MBR
	 4+zGRdIbz4yzf80/YJmscrMihM5krdZ1gyrqMVZQ54uRMPzrZufJiTj4R97P/AfYc0
	 5+P6ql8Yq1VyXhWlAg0TPnF32A7Rx3AV2nj4D2zJWXLgMVu2PnCSap0apVHo6O6UPb
	 Y6nLqf4W4GDMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC604827A5;
	Tue, 12 May 2026 21:33:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 426D015F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27D07827A0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yYAIbiA7LSM for <buildroot@buildroot.org>;
 Tue, 12 May 2026 21:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D87382792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D87382792
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D87382792
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:33:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so60036285e9.2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778621620; x=1779226420;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J9abkTUQBmIqUHSrgwGAFY0AZ2H1HTsMuG+ht6IrwRE=;
 b=L8ff5kamNtOTLdVwBjyBXbM25uqsWKHTryc7zm/Rtf55fC70xb4rjL3YCO+6Iwh6iu
 i9F9nVsh6YxN2e2ChCT13wcL/iNJzdk7spU1KMSSNT5ngzykpacA2ccXYZKEKZXgxHhN
 tq0dU0e2mc++xIQSKgYFkCIaf2SQ4cIL2k7gBPtzP+9pTHy4VlVMzcg5Rmw7UeS+mYGZ
 K7b0CO3sfLq7v7lXH8iloY3CqFSSh99Flax2w/MKW+UaJes87QPj8arSFfiQmZE5JYml
 nJqvJygbdEObfjc8vIUZC4XLWrjfkvWdphCHYxDGF0i/yzENevql7fz9W2KW+tc1e/l4
 Q0qQ==
X-Gm-Message-State: AOJu0YyqYXCfSVepiqzoDMhlEldn1oewONVgm2qSA8lqBJ4Xr3jRSWHz
 +CX/M9e5aysHcmOkCcz9Ro7E7BOiK9edZ+7IivumMmwU4kaf/3a3bVP8
X-Gm-Gg: Acq92OEJf8qpkZopnJOV0H0hfCO36XVhvbSiT5qzJfJIcz+eOvoLWCwoUvCk0g8u740
 gbZSqcj/MEdHWFgXVX72CXCX0A1YwRmED4Y9jLUS3KQ4Nnqy5ktt1C3gAZf7qB/keVOs0d8x9g7
 jz3+gCeglHC9EWZDw/gagEFo8EUdCbTLsW3gbb91f68w8f8xpvvA3rT5VO0FHyI41O6hrkeEMvZ
 LoDAe6X/sbERLo5SgEu2uZwcy/pHw9lTzbEvtMVcAr54ztfB4eB32ywKxwOnO3RVmocmS+hlEFJ
 IJkqCpRVfBegCa1gL82/fiVa6udQNGhYzYR9qwebUkiS3YXt8YVhlCeD/zNAU7C4veQdNe/yhJt
 zUqfaO6caoES3bzBoqAGp0nQSLupRZjc4VRH/Z3YAPqVxcetUdD3REWOwvX9aRx1fr2IhCt6lRG
 5u4bkJeAmSYZ5dJBHKccO9K9vOfU4/sJssdKfqovrNvTtT4lYhI5l9js7jsB1Z
X-Received: by 2002:a05:600c:c170:b0:48e:526e:1040 with SMTP id
 5b1f17b1804b1-48fc9a46ecamr6316685e9.23.1778621619725; 
 Tue, 12 May 2026 14:33:39 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549120f1f9sm35684307f8f.24.2026.05.12.14.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 14:33:39 -0700 (PDT)
Date: Tue, 12 May 2026 23:33:36 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20260512213336.GA71206@pevik>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
 <20260204154340.766528-5-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204154340.766528-5-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778621620; x=1779226420; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9abkTUQBmIqUHSrgwGAFY0AZ2H1HTsMuG+ht6IrwRE=;
 b=gjwFMwjWgzx10X3DoG3EfXmyygRkudRm8KIRFlHY0a9vETzMGw8XHVvh7g9CU9fcwB
 SYwXpLYfJs8oaTu2lCaq1aSW9xBdt2eAPU1QLYjw6ZhhD0Y84YYR1Ggs0OXx5LXZ8Szh
 lu2TSI484aCrkDTIO/iRbJJfHzjbAKgjSSOiMFsf0jVhZCZ0Q0lgIHYwbpr6Z3c1PMnJ
 gMRKq/ZpeaKlv90hLKodmz3QFww9WzBsD5aDi48Obs8kYHWo6DEWNM0RWYk64T3neCmA
 tkJOQFz4bJyhYdRt5HCIvDSOvarsGThIjfWvPhisOtXV3o5XaYE6PHg+e8loCpbj00Os
 R2Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gjwFMwjW
Subject: Re: [Buildroot] [PATCH v3 4/7] support/kconfig: reference
 environment variables directly (remove 'option env=')
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org,
 Kanak Shilledar <kanak.shilledar@axis.com>, Peter Seiderer <ps.report@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

[ Cc Kanak, Edgar involved in a fix for an old version [2] ]

> - reference environment variables directly (remove 'option env='), see
>   upstream commit [1]:

>   BR2_VERSION --> BR2_VERSION_FULL
>   BR2_HOSTARCH --> HOSTARCH
>   BR2_SKIP_LEGACY --> SKIP_LEGACY
>   BR2_BASE_DIR --> BASE_DIR
>   BR2_HOST_GCC_VERSION --> HOST_GCC_VERSION
>   BR2_DEFCONFIG_FROM_ENV --> BR2_DEFCONFIG

I'm very sorry for late reply.

Unfortunately this patch does not apply:

error: patch failed: Config.in:15
error: Config.in: patch does not apply
error: patch failed: toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in:1
error: toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in: patch does not apply
error: patch failed: toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in:1
error: toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in: patch does not apply
error: patch failed: toolchain/toolchain-external/toolchain-external-arm-arm/Config.in:7
error: toolchain/toolchain-external/toolchain-external-arm-arm/Config.in: patch does not apply
Patch failed at 0001 support/kconfig: reference environment variables directly (remove 'option env=')

@Titouan (or Peter) could you please send a new version?

It'd be also great if you address concerns raised by Peter and Yann.

Kind regards,
Petr

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8
[2] https://lore.kernel.org/buildroot/1d003106-63b6-49d5-90c0-4f7c0f2f1f79@grenoble.cnrs.fr/
[3] https://lore.kernel.org/buildroot/20260205082847.4b855528@pc-1/

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  Config.in                                     | 47 +++++--------------
>  Config.in.legacy                              |  6 +--
>  linux/Config.ext.in                           |  2 +-
>  package/amlogic-boot-fip/Config.in.host       |  2 +-
>  package/erlang/Config.in                      |  6 +--
>  package/flutter-sdk-bin/Config.in.host        |  2 +-
>  package/go/go-bootstrap-stage1/Config.in.host |  6 +--
>  package/google-breakpad/Config.in.host        | 12 ++---
>  package/jpeg/Config.in                        |  2 +-
>  package/kvm-unit-tests/Config.in              |  2 +-
>  package/luajit/Config.in                      |  4 +-
>  package/mono/Config.in                        |  4 +-
>  package/nodejs/Config.in.host                 |  8 ++--
>  package/openjdk/Config.in                     |  4 +-
>  package/openssl/Config.in                     |  2 +-
>  package/protobuf/Config.in                    | 22 ++++-----
>  package/qt5/qt5webengine/Config.in            |  2 +-
>  package/rustc/Config.in.host                  | 16 +++----
>  package/sam-ba/Config.in.host                 |  2 +-
>  package/supertuxkart/Config.in                |  4 +-
>  package/ti-cgt-pru/Config.in.host             |  2 +-
>  package/ti-gfx/Config.in                      |  2 +-
>  package/wine/Config.in                        |  6 +--
>  system/Config.in                              |  4 +-
>  toolchain/toolchain-external/Config.in        |  2 +-
>  .../Config.in                                 |  2 +-
>  .../toolchain-external-arm-aarch64/Config.in  |  2 +-
>  .../toolchain-external-arm-arm/Config.in      |  2 +-
>  .../toolchain-external-bootlin/Config.in      |  2 +-
>  .../toolchain-external-synopsys-arc/Config.in |  2 +-
>  30 files changed, 78 insertions(+), 103 deletions(-)

> diff --git a/Config.in b/Config.in
> index bb70964609..85cdb3b413 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -1,6 +1,6 @@


> -mainmenu "Buildroot $BR2_VERSION Configuration"
> +mainmenu "Buildroot $(BR2_VERSION_FULL) Configuration"

>  config BR2_HAVE_DOT_CONFIG
>  	bool
> @@ -15,63 +15,46 @@ config BR2_HAVE_DOT_CONFIG
>  config BR2_BROKEN
>  	bool

> -config BR2_VERSION
> -	string
> -	option env="BR2_VERSION_FULL"
> -
> -config BR2_HOSTARCH
> -	string
> -	option env="HOSTARCH"
> -
> -config BR2_BASE_DIR
> -	string
> -	option env="BASE_DIR"
> -
>  # br2-external paths definitions
> -source "$BR2_BASE_DIR/.br2-external.in.paths"
> -
> -# Hidden config symbols for packages to check system gcc version
> -config BR2_HOST_GCC_VERSION
> -	string
> -	option env="HOST_GCC_VERSION"
> +source "$(BASE_DIR)/.br2-external.in.paths"

>  config BR2_HOST_GCC_AT_LEAST_4_9
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "4 9"
> +	default y if "$(HOST_GCC_VERSION)" = "4 9"

>  config BR2_HOST_GCC_AT_LEAST_5
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "5"
> +	default y if "$(HOST_GCC_VERSION)" = "5"
>  	select BR2_HOST_GCC_AT_LEAST_4_9

>  config BR2_HOST_GCC_AT_LEAST_6
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "6"
> +	default y if "$(HOST_GCC_VERSION)" = "6"
>  	select BR2_HOST_GCC_AT_LEAST_5

>  config BR2_HOST_GCC_AT_LEAST_7
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "7"
> +	default y if "$(HOST_GCC_VERSION)" = "7"
>  	select BR2_HOST_GCC_AT_LEAST_6

>  config BR2_HOST_GCC_AT_LEAST_8
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "8"
> +	default y if "$(HOST_GCC_VERSION)" = "8"
>  	select BR2_HOST_GCC_AT_LEAST_7

>  config BR2_HOST_GCC_AT_LEAST_9
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "9"
> +	default y if "$(HOST_GCC_VERSION)" = "9"
>  	select BR2_HOST_GCC_AT_LEAST_8

>  config BR2_HOST_GCC_AT_LEAST_10
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "10"
> +	default y if "$(HOST_GCC_VERSION)" = "10"
>  	select BR2_HOST_GCC_AT_LEAST_9

>  config BR2_HOST_GCC_AT_LEAST_11
>  	bool
> -	default y if BR2_HOST_GCC_VERSION = "11"
> +	default y if "$(HOST_GCC_VERSION)" = "11"
>  	select BR2_HOST_GCC_AT_LEAST_10

>  config BR2_HOST_GCC_AT_LEAST_12
> @@ -223,14 +206,10 @@ config BR2_TAR_OPTIONS

>  endmenu

> -config BR2_DEFCONFIG_FROM_ENV
> -	string
> -	option env="BR2_DEFCONFIG"
> -
>  config BR2_DEFCONFIG
>  	string "Location to save buildroot config"
> -	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
> -	default "$(CONFIG_DIR)/defconfig"
> +	default "$(BR2_DEFCONFIG)" if "$(BR2_DEFCONFIG)" != ""
> +	default "\$(CONFIG_DIR)/defconfig"
>  	help
>  	  When running 'make savedefconfig', the defconfig file will be
>  	  saved in this location.
> @@ -1026,4 +1005,4 @@ source "package/Config.in.host"
>  source "Config.in.legacy"

>  # br2-external menus definitions
> -source "$BR2_BASE_DIR/.br2-external.in.menus"
> +source "$(BASE_DIR)/.br2-external.in.menus"
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 2971699c78..5dc86189b7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -90,11 +90,7 @@

>  # [End of example]

> -config BR2_SKIP_LEGACY
> -	bool
> -	option env="SKIP_LEGACY"
> -
> -if !BR2_SKIP_LEGACY
> +if "$(SKIP_LEGACY)" = ""

>  config BR2_LEGACY
>  	bool
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 3b72d3cf60..adc9c5c5a4 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -56,6 +56,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
>  	  RTAI Kernel part.

>  # kernel extensions from br2-external trees, if any
> -source "$BR2_BASE_DIR/.br2-external.in.linux"
> +source "$(BASE_DIR)/.br2-external.in.linux"

>  endmenu
> diff --git a/package/amlogic-boot-fip/Config.in.host b/package/amlogic-boot-fip/Config.in.host
> index bccc6296d1..54f4075f27 100644
> --- a/package/amlogic-boot-fip/Config.in.host
> +++ b/package/amlogic-boot-fip/Config.in.host
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
>  	bool "host amlogic-boot-fip"
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on "$(HOSTARCH)" = "x86_64"
>  	help
>  	  Firmware Image Package (FIP) sources used to sign Amlogic
>  	  u-boot binaries in LibreELEC images
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 724f91123b..f3830cefad 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "aarch64"
> -	default y if BR2_HOSTARCH = "x86_64"
> -	default y if BR2_HOSTARCH = "x86"
> +	default y if "$(HOSTARCH)" = "aarch64"
> +	default y if "$(HOSTARCH)" = "x86_64"
> +	default y if "$(HOSTARCH)" = "x86"

>  config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	bool
> diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
> index 181a2ee6e5..c1c97e2ca8 100644
> --- a/package/flutter-sdk-bin/Config.in.host
> +++ b/package/flutter-sdk-bin/Config.in.host
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "x86_64"
> +	default y if "$(HOSTARCH)" = "x86_64"

>  config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
>  	bool "host flutter-sdk-bin"
> diff --git a/package/go/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
> index 56a743caf9..50caad0a8b 100644
> --- a/package/go/go-bootstrap-stage1/Config.in.host
> +++ b/package/go/go-bootstrap-stage1/Config.in.host
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS
>  	bool
>  	# See src/cmd/dist/unix.c for the list of supported architectures
> -	default y if BR2_HOSTARCH = "x86"
> -	default y if BR2_HOSTARCH = "x86_64"
> -	default y if BR2_HOSTARCH = "arm"
> +	default y if "$(HOSTARCH)" = "x86"
> +	default y if "$(HOSTARCH)" = "x86_64"
> +	default y if "$(HOSTARCH)" = "arm"
> diff --git a/package/google-breakpad/Config.in.host b/package/google-breakpad/Config.in.host
> index 28d304766a..84e95957b2 100644
> --- a/package/google-breakpad/Config.in.host
> +++ b/package/google-breakpad/Config.in.host
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "x86_64"
> -	default y if BR2_HOSTARCH = "x86"
> -	default y if BR2_HOSTARCH = "arm"
> -	default y if BR2_HOSTARCH = "aarch64"
> -	default y if BR2_HOSTARCH = "mips"
> -	default y if BR2_HOSTARCH = "mipsel"
> +	default y if "$(HOSTARCH)" = "x86_64"
> +	default y if "$(HOSTARCH)" = "x86"
> +	default y if "$(HOSTARCH)" = "arm"
> +	default y if "$(HOSTARCH)" = "aarch64"
> +	default y if "$(HOSTARCH)" = "mips"
> +	default y if "$(HOSTARCH)" = "mipsel"
> diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
> index 371f89aa49..0a7e01d28b 100644
> --- a/package/jpeg/Config.in
> +++ b/package/jpeg/Config.in
> @@ -40,7 +40,7 @@ config BR2_PACKAGE_JPEG_TURBO
>  	  http://www.libjpeg-turbo.org

>  # libjpeg from br2-external trees, if any
> -source "$BR2_BASE_DIR/.br2-external.in.jpeg"
> +source "$(BASE_DIR)/.br2-external.in.jpeg"

>  endchoice

> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index 817d3c4a8f..87e7125313 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -20,7 +20,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
>  	# gcc 4.5 at least. on i386, we use the target gcc, while on
>  	# x86-64 we use the host gcc (see .mk file for details)
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
> -	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
> +	depends on "$(HOSTARCH)" = "x86_64" || !BR2_x86_64
>  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
>  	help
>  	  kvm-unit-tests is a project as old as KVM. As its name
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 31e9e0243e..408032c7e8 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -7,9 +7,9 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	default y if BR2_powerpc
>  	# -m32 flag is used for 32bit builds and host-luajit has
>  	# limited architecture support
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
>  	# Building for 64-bit target requires a 64-bit host
> -	depends on !BR2_ARCH_IS_64 || BR2_HOSTARCH = "x86_64"
> +	depends on !BR2_ARCH_IS_64 || "$(HOSTARCH)" = "x86_64"

>  config BR2_PACKAGE_LUAJIT
>  	bool "luajit"
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 0152df8268..354dc56d24 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "x86_64"
> -	default y if BR2_HOSTARCH = "x86"
> +	default y if "$(HOSTARCH)" = "x86_64"
> +	default y if "$(HOSTARCH)" = "x86"

>  config BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	bool
> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> index a8ab89176c..a8b0f3997d 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs/Config.in.host
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "aarch64"
> -	default y if BR2_HOSTARCH = "arm"
> -	default y if BR2_HOSTARCH = "ppc64le"
> -	default y if BR2_HOSTARCH = "x86_64"
> +	default y if "$(HOSTARCH)" = "aarch64"
> +	default y if "$(HOSTARCH)" = "arm"
> +	default y if "$(HOSTARCH)" = "ppc64le"
> +	default y if "$(HOSTARCH)" = "x86_64"

>  comment "host nodejs needs a host gcc >= 8"
>  	depends on !BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
> diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
> index 7f29e7a489..271e3fa029 100644
> --- a/package/openjdk/Config.in
> +++ b/package/openjdk/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "x86_64"
> -	default y if BR2_HOSTARCH = "aarch64"
> +	default y if "$(HOSTARCH)" = "x86_64"
> +	default y if "$(HOSTARCH)" = "aarch64"

>  # Taken from make/autoconf/platform.m4
>  config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index d255a05596..ca9d1a7e50 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -59,7 +59,7 @@ config BR2_PACKAGE_LIBRESSL
>  source "package/libressl/Config.in"

>  # openssl from br2-external trees, if any
> -source "$BR2_BASE_DIR/.br2-external.in.openssl"
> +source "$(BASE_DIR)/.br2-external.in.openssl"

>  endchoice

> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index 633201b38c..1681e8976f 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -16,17 +16,17 @@
>  # host-protobuf only builds on certain architectures
>  config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "aarch64"
> -	default y if BR2_HOSTARCH = "arm"
> -	default y if BR2_HOSTARCH = "mips"
> -	default y if BR2_HOSTARCH = "mipsel"
> -	default y if BR2_HOSTARCH = "powerpc"
> -	default y if BR2_HOSTARCH = "powerpc64"
> -	default y if BR2_HOSTARCH = "powerpc64le"
> -	default y if BR2_HOSTARCH = "sparc"
> -	default y if BR2_HOSTARCH = "sparc64"
> -	default y if BR2_HOSTARCH = "x86"
> -	default y if BR2_HOSTARCH = "x86_64"
> +	default y if "$(HOSTARCH)" = "aarch64"
> +	default y if "$(HOSTARCH)" = "arm"
> +	default y if "$(HOSTARCH)" = "mips"
> +	default y if "$(HOSTARCH)" = "mipsel"
> +	default y if "$(HOSTARCH)" = "powerpc"
> +	default y if "$(HOSTARCH)" = "powerpc64"
> +	default y if "$(HOSTARCH)" = "powerpc64le"
> +	default y if "$(HOSTARCH)" = "sparc"
> +	default y if "$(HOSTARCH)" = "sparc64"
> +	default y if "$(HOSTARCH)" = "x86"
> +	default y if "$(HOSTARCH)" = "x86_64"

>  config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	bool
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 2c16d819d2..d40d007ed4 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  		BR2_mips || BR2_mips64
>  	# -m32 flag is used for 32bit builds and host tools have
>  	# limited architecture support
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index c3e9a13f39..2de23d3edc 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -2,14 +2,14 @@
>  # When adding new entries below, update RUST_HOSTS in utils/update-rust
>  config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_HOSTARCH = "aarch64"
> -	default y if BR2_HOSTARCH = "powerpc"
> -	default y if BR2_HOSTARCH = "powerpc64"
> -	default y if BR2_HOSTARCH = "powerpc64le"
> -	default y if BR2_HOSTARCH = "riscv64"
> -	default y if BR2_HOSTARCH = "s390x"
> -	default y if BR2_HOSTARCH = "x86"
> -	default y if BR2_HOSTARCH = "x86_64"
> +	default y if "$(HOSTARCH)" = "aarch64"
> +	default y if "$(HOSTARCH)" = "powerpc"
> +	default y if "$(HOSTARCH)" = "powerpc64"
> +	default y if "$(HOSTARCH)" = "powerpc64le"
> +	default y if "$(HOSTARCH)" = "riscv64"
> +	default y if "$(HOSTARCH)" = "s390x"
> +	default y if "$(HOSTARCH)" = "x86"
> +	default y if "$(HOSTARCH)" = "x86_64"

>  # The pre-built Rust standard library is only available for a number
>  # of architectures/C libraries combinations, with different levels of
> diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
> index cd11e8633e..9b2e2afb75 100644
> --- a/package/sam-ba/Config.in.host
> +++ b/package/sam-ba/Config.in.host
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_HOST_SAM_BA
>  	bool "host sam-ba"
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on "$(HOSTARCH)" = "x86_64"
>  	help
>  	  Atmel SAM-BA software provides an open set of tools for
>  	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
> index 0f6c244058..0aab4f9e9c 100644
> --- a/package/supertuxkart/Config.in
> +++ b/package/supertuxkart/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_SUPERTUXKART
>  	bool "supertuxkart"
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INSTALL_LIBSTDCPP # openal
> @@ -34,7 +34,7 @@ config BR2_PACKAGE_SUPERTUXKART
>  	  http://supertuxkart.sourceforge.net/Main_Page

>  comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 9"
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
> diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
> index eab3cd72d5..cf56854dd1 100644
> --- a/package/ti-cgt-pru/Config.in.host
> +++ b/package/ti-cgt-pru/Config.in.host
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
>  	depends on BR2_arm

>  config BR2_PACKAGE_HOST_TI_CGT_PRU
> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> index 40f46335a3..093417fa21 100644
> --- a/package/ti-gfx/Config.in
> +++ b/package/ti-gfx/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_TI_GFX
>  	bool "ti-gfx"
>  	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> index db3b1570ef..cb764f0c9b 100644
> --- a/package/wine/Config.in
> +++ b/package/wine/Config.in
> @@ -2,9 +2,9 @@ config BR2_PACKAGE_WINE_ARCH_SUPPORTS
>  	bool
>  	default y
>  	# Wine only builds on certain architectures
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
> -	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
> -	           BR2_HOSTARCH = "aarch64"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86" || \
> +	           "$(HOSTARCH)" = "powerpc" || "$(HOSTARCH)" = "arm" || \
> +	           "$(HOSTARCH)" = "aarch64"
>  	# Wine has much CPU specific code and mostly makes sense on x86
>  	depends on BR2_i386

> diff --git a/system/Config.in b/system/Config.in
> index 98bbd93092..47b22cb697 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -20,7 +20,7 @@ config BR2_ROOTFS_SKELETON_CUSTOM
>  	  Use custom target skeleton.

>  # skeleton from br2-external trees, if any
> -source "$BR2_BASE_DIR/.br2-external.in.skeleton"
> +source "$(BASE_DIR)/.br2-external.in.skeleton"

>  endchoice

> @@ -189,7 +189,7 @@ config BR2_INIT_NONE
>  	  or with a rootfs-overlay.

>  # Init systems from br2-external trees, if any
> -source "$BR2_BASE_DIR/.br2-external.in.init"
> +source "$(BASE_DIR)/.br2-external.in.init"

>  endchoice

> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 831387bc4e..11f107b41e 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -29,7 +29,7 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
>  source "toolchain/toolchain-external/toolchain-external-custom/Config.in"

>  # Toolchains from br2-external trees, if any
> -source "$BR2_BASE_DIR/.br2-external.in.toolchains"
> +source "$(BASE_DIR)/.br2-external.in.toolchains"

>  endchoice

> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> index 3a71e1356b..bf31e34c8f 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
>  	bool "Arm AArch64 BE 14.2.rel1"
>  	depends on BR2_aarch64_be
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on "$(HOSTARCH)" = "x86_64"
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> index 8582fe0ec8..dcdb925e6c 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
>  	bool "Arm AArch64 14.2.rel1"
>  	depends on BR2_aarch64
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> index 7b1a7fb27f..95237a1735 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> @@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
>  	depends on BR2_arm
>  	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
>  	depends on BR2_ARM_CPU_HAS_NEON
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
> +	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
>  	depends on BR2_ARM_EABIHF
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
> index 6552da9a84..1fa4fccb0f 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
>  	bool "Bootlin toolchains"
>  	depends on BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on "$(HOSTARCH)" = "x86_64"
>  	help
>  	  Bootlin toolchains are built using Buildroot for a large
>  	  number of architectures and C libraries configurations.
> diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> index 07688a1416..2847b34007 100644
> --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> @@ -3,7 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
>  	depends on BR2_arc750d || BR2_arc770d || \
>  		BR2_archs38_64mpy || BR2_archs38_full || \
>  		BR2_archs4x_rel31 || BR2_archs4x
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on "$(HOSTARCH)" = "x86_64"
>  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
>  	# The toolchains have libncurses and libexpat in their
>  	# sysroot, confusing Buildroot and causing build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
