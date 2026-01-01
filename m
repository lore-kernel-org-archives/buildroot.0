Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33171EED603
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB8040636;
	Thu,  1 Jan 2026 13:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlmY28dkK0aj; Thu,  1 Jan 2026 13:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B146F40645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767274876;
	bh=jJ/d6pKv0+afwplcR4cTgNQ4HXpni+4YI+TGGCFKjX4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kZP/GY8goHvs8NITtzO3jzVXQ+/t9mFm43pzzJHWw5KhrkIqGLNERNu0HsLb67T9F
	 njV5IegzNku9KzHcWfRo73Smk1UGhcnj4Zkq/JaESRG7z5RgQ/GD+AcHXqIqLPgRvb
	 tcihoLLpUr1BkH/Wih/aQRJnA0mGP8N0OyIqkAezvRRSxpdQy/rD0n5WUEM0FDbIQR
	 Pyzn5CBZklucbtqx3g5/LbY9U9C5+tsAsFkUQPHbXT37lF6ST7E1Y4c1zweb/KxlRK
	 xw1oc3QDf/EYdq6E4/9Iwspr/5gm1em1tYRtFKKPKjeSkrq6LUScqNuCQZjjUJgDSf
	 PN9Qotdp1msfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B146F40645;
	Thu,  1 Jan 2026 13:41:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02577351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E755B60665
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGnI31Uc42aG for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC5826064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5826064A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC5826064A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:41:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 58A0D1A259B;
 Thu,  1 Jan 2026 13:41:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2276A606B6;
 Thu,  1 Jan 2026 13:41:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 567C0113B029E; Thu,  1 Jan 2026 14:41:10 +0100 (CET)
Date: Thu, 1 Jan 2026 14:41:09 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
Message-ID: <20260101144109.4ae20fd8@windsurf>
In-Reply-To: <20251109101711.493759-2-dario.binacchi@amarulasolutions.com>
References: <20251109101711.493759-1-dario.binacchi@amarulasolutions.com>
 <20251109101711.493759-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767274871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LFqAL6oCRkpUxF31ghT1JkbCKFYXiUcOoz/ydeyEKV0=;
 b=quBUzKwY52baCRi6NqQ9bydSqmYygedd7Y8WUyzQhdEXdeo1eafAZKctZF1H4o56jm6nr/
 M/raDGIGPsTuHvSqQtCxZD3xiTJA/X96ZTo9As0y1GCZKZtvxQVvm9YR5qE7QPAf6uCHk1
 yCQ9wXNi09WtZsOviLYOBAp/8C0fWj+MCKxmU8avqALZZU5xvG892wksyxj+hNm3gKyW1k
 3fzBtxjLcYiraZO7ig/0S9GXQSo+mtxj9fZEUHzvpSEdRKTWNOrgy0Oi1PUC+SoI5v3kCw
 9ELgEmjSR/tWA451wTZH8L0YzxmjGY+CF3BpkI/WiQ3zxleDp4MIo5wZcn2C5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=quBUzKwY
Subject: Re: [Buildroot] [PATCH v2 2/2] package/drogon: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sun,  9 Nov 2025 11:17:08 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Drogon is a C++17/20 based HTTP application framework. It can be used to
> easily build various types of web application server programs using C++.
> 
> Project page: https://github.com/drogonframework/drogon
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks a lot for this new package proposal. It looks pretty good
overall, I only have a few requests below.


> diff --git a/package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch b/package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch
> new file mode 100644
> index 000000000000..70ec298cf5b8
> --- /dev/null
> +++ b/package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch
> @@ -0,0 +1,81 @@
> +From 3eda90ee8f46a9f309bf27e7faaf7f2dea1a7fde Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Tue, 23 Sep 2025 11:37:59 +0200
> +Subject: [PATCH] cmake: fix cross-compiling for drogon_ctl
> +
> +Fix the the following errors raised by building drogon in Buildroot:
> +
> +[ 70%] Generating filter_cc.h, filter_cc.cc
> +cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/config_yaml.csp
> +cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/demoMain.csp
> +cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/filter_cc.csp
> +[ 71%] Generating test_main.h, test_main.cc
> +cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/cmake.csp
> +/bin/sh: 1: ./_drogon_ctl: Exec format error
> +/bin/sh: 1: ./_drogon_ctl: Exec format error
> +make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:88: drogon_ctl/config_yaml.h] Error 126
> +make[4]: *** Waiting for unfinished jobs....
> +make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:95: drogon_ctl/demoMain.h] Error 126
> +/bin/sh: 1: ./_drogon_ctl: Exec format error
> +make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:102: drogon_ctl/filter_cc.h] Error 126
> +/bin/sh: 1: ./_drogon_ctl: Exec format error
> +make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:74: drogon_ctl/cmake.h] Error 126
> +
> +When building drogon_ctl during cross-compilation, the host version of
> +_drogon_ctl must be used to generate output files, since the target
> +binary cannot run on the host.
> +
> +The change ensures that drogon_ctl builds correctly both for native and
> +cross-compiling environments.
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/drogonframework/drogon/pull/2389/commits/3eda90ee8f46a9f309bf27e7faaf7f2dea1a7fde

It seems like this PR has been merged. Could you replace all Upstream:
links with the link to the final commit? And if any changes were made
as part of the review process, update the patches accordingly?

> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/drogonframework/drogon/pull/2389/commits/77a8e3c91494ae094b5b1b18594ffaec11d37310

Same.

> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/drogonframework/drogon/pull/2389/commits/535892bf6958c8d5619251ead204ada0002a8674

Same.

> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/an-tao/trantor/pull/380

Here as well, the PR has been merged, so this should be updated.

> diff --git a/package/drogon/Config.in b/package/drogon/Config.in
> new file mode 100644
> index 000000000000..0db4258e309e
> --- /dev/null
> +++ b/package/drogon/Config.in
> @@ -0,0 +1,40 @@
> +config BR2_PACKAGE_DROGON
> +	bool "drogon"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_JSONCPP
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Drogon is a C++17/20 based HTTP application framework.
> +	  Drogon can be used to easily build various types of web
> +	  application server programs using C++.
> +
> +	  https://github.com/drogonframework/drogon
> +
> +if BR2_PACKAGE_DROGON
> +
> +config BR2_PACKAGE_DROGON_BROTLI
> +	bool "build Brotli"

What does this do? In Buildroot, Brotli is another package. Is it
related? Unrelated? Is this option enabling Brotli support? Does it
need the external brotli library provided by package/brotli?

A help text would be good, in fact.

> +config BR2_PACKAGE_DROGON_CTL
> +	bool "build drogon_ctl"

What does this do? A help text would be good.

> +	select BR2_PACKAGE_HOST_DROGON

This option is not needed I believe.

> +
> +config BR2_PACKAGE_DROGON_EXAMPLES
> +	bool "build examples"
> +
> +config BR2_PACKAGE_DROGON_ORM
> +	bool "build orm"

A help text would be nice.

> +
> +config BR2_PACKAGE_DROGON_YAML_CONFIG
> +	bool "build yaml config"

A help text would be nice.

> diff --git a/package/drogon/Config.in.host b/package/drogon/Config.in.host
> new file mode 100644
> index 000000000000..b3b691e2cfe2
> --- /dev/null
> +++ b/package/drogon/Config.in.host
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_HOST_DROGON

This option is not needed, host-drogon is just a build dependency of
drogon, so we don't need to have a visible menuconfig option for it.

> +	bool "drogon"

This should have been:

	bool "host-drogon"

but it's anyway not needed.

> +	depends on BR2_HOST_INSTALL_LIBSTDCPP

Option doesn't exist.

> +	depends on BR2_HOST_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20

Same.

> +	depends on BR2_HOST_TOOLCHAIN_HAS_THREADS

Same.

> +	select BR2_HOST_PACKAGE_JSONCPP
> +	select BR2_HOST_PACKAGE_UTIL_LINUX
> +	select BR2_HOST_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_HOST_PACKAGE_ZLIB

Those options don't exist.

(But this is moot, as this whole file should be dropped, but I just
wanted to point out that you got it wrong on this).

> diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
> new file mode 100644
> index 000000000000..64ad08f4ab42
> --- /dev/null
> +++ b/package/drogon/drogon.mk
> @@ -0,0 +1,62 @@
> +################################################################################
> +#
> +# drogon
> +#
> +################################################################################
> +
> +DROGON_VERSION = v1.9.11
> +# DROGON_SITE = $(call github,drogonframework,drogon,v$(DROGON_VERSION))

Remove this line.

> +DROGON_SITE = https://github.com/drogonframework/drogon
> +DROGON_SITE_METHOD = git
> +DROGON_GIT_SUBMODULES = YES
> +DROGON_LICENSE = MIT
> +DROGON_LICENSE_FILES = LICENSE
> +DROGON_INSTALL_STAGING = YES

> +DROGON_DEPENDENCIES = jsoncpp util-linux zlib
> +HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
> +
> +DROGON_CONF_OPTS = \
> +	-DBUILD_TESTS=OFF
> +
> +HOST_DROGON_CONF_OPTS = \
> +	-DBUILD_TESTS=OFF \
> +	-DBUILD_EXAMPLES=OFF
> +
> +ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
> +DROGON_CONF_OPTS += -DBUILD_BROTLI=ON
> +else
> +DROGON_CONF_OPTS += -DBUILD_BROTLI=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DROGON_CTL),y)
> +# When we have drogon_ctl for the target, we need to build the
> +# _drogon_ctl tool with host-drogon support so that it can be
> +# run during the building process
> +DROGON_DEPENDENCIES += host-drogon
> +DROGON_CONF_OPTS += -DBUILD_CTL=ON
> +HOST_DROGON_CONF_OPTS += -DBUILD_CTL=ON

Since host-drogon is only built when BR2_PACKAGE_DROGON_CTL, this
-DBUILD_CTL=ON for HOST_DROGON_CONF_OPTS should be in the unconditional
assignment of HOST_DROGON_CONF_OPTS (with -DBUILD_TESTS=OFF,
-DBUILD_EXAMPLES=OFF).

Could you adjust those details, and send a new iteration?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
