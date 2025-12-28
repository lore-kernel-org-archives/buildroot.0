Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8EFD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA0C812F2;
	Sun, 28 Dec 2025 13:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jB6lb95X2sB; Sun, 28 Dec 2025 13:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89373810EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766928305;
	bh=ouWfpy4Ze/abi9qtIzRIVWb1p0Qtp0HQFIxaIMqX+fM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kp79d5uadIS+UnuZrPikPyjGIObPgGDKg2sHw+CFfyBKSH+7cpLY0FoJ1JjPhVIGc
	 yZODMe7bMySmYnV9Yak0ixaqREmxqXDiZOt7nMvI/M2R4wPhpdstqwKcgfa47T2+1s
	 TbmkdRCQQ3GrXBOLo4M45XpnsGgp4SOwygn3xHOBeU289ONu1gmxrCyZMHWJeLVqFw
	 RYnFxHoVdzMYZZNFPOwQmZasTx4+mQBgUJWm6FuAAYMgeDWmqThEruaXmuArfA3rIm
	 puCKMwjfA6Ljh2AV14mFex3QN5SJyB4nA3Qd4u/C8897L3FvIYh29RvpEoOK4837+L
	 mR/8yH5wKBNew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89373810EE;
	Sun, 28 Dec 2025 13:25:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CE671E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 228596079B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzpLK3f8Fuap for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08CE960708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08CE960708
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08CE960708
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:25:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9BD41C1D709
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:24:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D7DF760725;
 Sun, 28 Dec 2025 13:24:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F88A11978D94; Sun, 28 Dec 2025 14:24:56 +0100 (CET)
Date: Sun, 28 Dec 2025 14:24:55 +0100
To: Vincent Jardin via buildroot <buildroot@buildroot.org>
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <20251228142455.46efcdd0@windsurf>
In-Reply-To: <20251205100626.66819-3-vjardin@free.fr>
References: <20251205100626.66819-1-vjardin@free.fr>
 <20251205100626.66819-3-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766928297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CnwhO6eJVs7Ys/aS3f1JknRw9WJ2Jpm6DGjpli2voV0=;
 b=aJxM3wbknEewaQ5+i4sHzFGC1B3HY2+H+RuQ9cFI/nU7EmbY55c1o7PwOxt8eXSl65qUup
 82MaAiThgQx9S5PlJ/EkRikVZPwiRkzbqextZXAp0IJfCn6lUDFd3PP72tpDoOLDd03p2c
 w/wJXO0H1bvNYm7W5yKrH6fg3/ZYMJ8RKJIjiifqf5d9fAy+m/vjaVdQoJUHEWpoh5KcEc
 W1whDVW0yLFg5pQ2N6NBOVlTCIsjPkR8FIi5CCi7V2sCV5TGnKXdYgTefuXFAKS+kE0KPx
 mNhBmBCsTvimj4b8S7EHodfXaoMeWiyiUEIc2Je19XFXr98lfEXPlMtVc+K6kA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=aJxM3wbk
Subject: Re: [Buildroot] [PATCH 2/2] package/sysrepo-cpp: new package
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

Hello Vincent,

Thanks for the patch, which I have applied with a few tweaks, see below.

On Fri,  5 Dec 2025 11:06:26 +0100
Vincent Jardin via buildroot <buildroot@buildroot.org> wrote:


> diff --git a/package/sysrepo-cpp/Config.in b/package/sysrepo-cpp/Config.in
> new file mode 100644
> index 0000000000..5cdfefa025
> --- /dev/null
> +++ b/package/sysrepo-cpp/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_SYSREPO_CPP
> +	bool "sysrepo-cpp"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

I had to update this to properly propagate all the dependencies:

        depends on BR2_USE_MMU # sysrepo
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # sysrepo
        depends on !BR2_STATIC_LIBS # sysrepo, libyang-cpp
        depends on BR2_INSTALL_LIBSTDCPP # sysrepo, libyang-cpp
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libyang-cpp
        depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang-cpp
        # std::timespec build issue
        depends on !BR2_TOOLCHAIN_USES_UCLIBC

> +	select BR2_PACKAGE_SYSREPO
> +	select BR2_PACKAGE_LIBYANG_CPP
> +	help
> +	  C++20 RAII bindings for the sysrepo YANG datastore library.
> +
> +	  This library provides modern C++ object-oriented bindings on top

Line was too long.

> +	  of sysrepo, using RAII for automatic lifetime management.
> +
> +	  https://github.com/sysrepo/sysrepo-cpp
> +
> +comment "sysrepo-cpp needs a toolchain w/ C++, threads, dynamic libs, gcc >= 10"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> +		   BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10

Updated this based on the dependencies.


> diff --git a/package/sysrepo-cpp/sysrepo-cpp.mk b/package/sysrepo-cpp/sysrepo-cpp.mk
> new file mode 100644
> index 0000000000..bbe81289b1
> --- /dev/null
> +++ b/package/sysrepo-cpp/sysrepo-cpp.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# sysrepo-cpp
> +#
> +################################################################################
> +
> +SYSREPO_CPP_VERSION = 6
> +SYSREPO_CPP_SITE    = $(call github,sysrepo,sysrepo-cpp,v$(SYSREPO_CPP_VERSION))

We don't align spaces.

> +

Excessive empty line.

> +SYSREPO_CPP_LICENSE = BSD-3-Clause
> +SYSREPO_CPP_LICENSE_FILES = LICENSE
> +
> +SYSREPO_CPP_INSTALL_STAGING = YES
> +SYSREPO_CPP_INSTALL_TARGET  = YES

This last line is not needed, that's the default.

> +
> +SYSREPO_CPP_CONF_OPTS += \
> +	-DCMAKE_BUILD_TYPE=Release \

Not needed, CMAKE_BUILD_TYPE is handled by the cmake-package infra.

> +	-DBUILD_TESTING=OFF \

Same.

> +	-DWITH_DOCS=OFF \
> +	-DWITH_EXAMPLES=OFF
> +
> +SYSREPO_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +SYSREPO_CPP_DEPENDENCIES = sysrepo libyang-cpp
> +
> +$(eval $(cmake-package))

Applied with those tweaks. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
