Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D79D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE72540621;
	Sun, 28 Dec 2025 13:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKh_gVGTj6EH; Sun, 28 Dec 2025 13:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 508A8405AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766928175;
	bh=BM4oXe+sOZXm0shbTqwKTrt/8JtTeRItpKMUtDfRgNc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c+x4mnoN4/v0esw1qZ5ejm1cM+fW93TRwrKBiGHlHWS7bJtU2M5VEvgdfVIqE2ocw
	 EcSJZ9pDYfMbYs2ZXfqtwiSPQyYIR7TfjWVAJrbKIFkfnY11yK76Wb0QD1g3BTz5FU
	 mvFAetuJhm+rtNAWEP9/cbO2GhFMQ5Gnk3Sf6MMShpd0xJZAPWRn+7p9faZ1VWulXn
	 0/ajjkIiACxKyHWposTyse4uBEMpl23/5wa7CV7FC7D5OWoDRkHL5sxD1+5fXZplSj
	 4VQLypZj3FhsR18x7C2s7n1aB6cQgvnvZ5h8I+JGgdzZ/2Bt66qvoz6vBlnfq5eAgW
	 9KEnprfUQaTQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508A8405AD;
	Sun, 28 Dec 2025 13:22:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 537ECD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5053860837
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUXPJ-635AVN for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 006406079B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006406079B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 006406079B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:22:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D99B81A24C2;
 Sun, 28 Dec 2025 13:22:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94CA560725;
 Sun, 28 Dec 2025 13:22:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 070A611978D94; Sun, 28 Dec 2025 14:22:45 +0100 (CET)
Date: Sun, 28 Dec 2025 14:22:44 +0100
To: Vincent Jardin via buildroot <buildroot@buildroot.org>
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <20251228142244.137df857@windsurf>
In-Reply-To: <20251205100626.66819-2-vjardin@free.fr>
References: <20251205100626.66819-1-vjardin@free.fr>
 <20251205100626.66819-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766928167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KRJygRARQwvi5TH118hwYQ+eXNOPkFtS15NqnuIKS0A=;
 b=ib9IRAcv9W9OFtXvofCYrYqg39Q+5Df/3fRXDQfqjKIlUMtn535iiWjJVAX67hSvK6ExqT
 lBfueLsR8Fv4vLuaWgL5thZ/RqHKEXvzeJCsZBgHpvQIVI4ok5jz0vkRNGDZ/phjWmZDx1
 wnf18GkeskZKeJhgWWIrRx6kBFNA3DfDBsBTltqXgF+WmqLQPQN8zRg+5CaZhngQc5kOYX
 piXH72Z6vXPbxRNnziyScKpyhzmr1W7DNRrTmKq6gPki2PpsDJcYllPVCrl7haeTAZGZVJ
 VMPc8V6UNNNioFTpVwVOYyV/QYpTLHmBY9vVqXVy/GA3ZHUEFz4HNdgRmPQfxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ib9IRAcv
Subject: Re: [Buildroot] [PATCH 1/2] libyang-cpp: new package
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

I have applied your patch, after doing a small number of tweaks, see
below.

On Fri,  5 Dec 2025 11:06:25 +0100
Vincent Jardin via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/libyang-cpp/Config.in b/package/libyang-cpp/Config.in
> new file mode 100644
> index 0000000000..5bb79ffb2e
> --- /dev/null
> +++ b/package/libyang-cpp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBYANG_CPP
> +	bool "libyang-cpp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_PACKAGE_LIBYANG

You forgot to replicate the "depends on" of BR2_PACKAGE_LIBYANG, so I
fixed this to:

        bool "libyang-cpp"
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
        depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
        depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
        depends on !BR2_STATIC_LIBS # libyang
        select BR2_PACKAGE_LIBYANG

> +	help
> +	  C++ bindings for the libyang library (v4).
> +
> +	  libyang-cpp implements modern C++ RAII wrappers around the libyang

This line was too long, spotted by "make check-package".

> +	  C API, used by sysrepo, Kea + NETCONF, etc.
> +
> +	  https://github.com/CESNET/libyang-cpp
> +
> +comment "libyang-cpp needs a toolchain w/ C++, gcc >= 10"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10

Had to update this according to the new dependencies.

> diff --git a/package/libyang-cpp/libyang-cpp.mk b/package/libyang-cpp/libyang-cpp.mk
> new file mode 100644
> index 0000000000..1fb109b03d
> --- /dev/null
> +++ b/package/libyang-cpp/libyang-cpp.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libyang-cpp
> +#
> +################################################################################
> +
> +LIBYANG_CPP_VERSION = 4
> +LIBYANG_CPP_SITE = $(call github,CESNET,libyang-cpp,v$(LIBYANG_CPP_VERSION))
> +LIBYANG_CPP_LICENSE = BSD-3-Clause
> +LIBYANG_CPP_LICENSE_FILES = LICENSE
> +
> +LIBYANG_CPP_INSTALL_STAGING = YES
> +
> +LIBYANG_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +LIBYANG_CPP_DEPENDENCIES = libyang

A bit too many empty lines here (really just a matter of taste).

> +LIBYANG_CPP_CONF_OPTS = \
> +	-DBUILD_TESTING=OFF \

-DBUILD_TESTING=OFF is not needed, it's already passed by default by
cmake-package.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
