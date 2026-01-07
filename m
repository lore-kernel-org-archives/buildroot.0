Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EB5D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AFC040CEF;
	Wed,  7 Jan 2026 17:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WqUA58oz3Gw; Wed,  7 Jan 2026 17:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022D940CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808134;
	bh=FQgdWW+uZEq5x2QGvKX9S/WVpG5ElQbydBgpMfcaew8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WXzH9Qe9Zsb5nvOPbDGzqfVinx+FAwccxnyOfsS4J+9nsnLTLoas+1lzgBWz/R8L2
	 fbdzm/10YG3V2vE/ZcneguJT58g0cayhdDFFuTTYk3ullC7julfr2ewKswOuwWwpEW
	 dDXSBmQIuJDqlpYZUJfNiIEz9MzXbjLM55mlEnjwoxb+Lbf2CPYW42lGQkwoh8wvTI
	 BeAzneCDnTqxUCXkRGosn/9YM/w5JhOuYcYv+jH6PTUfhg6uVC0FQ8I3Oc9jN9VKx2
	 HFHwAiJjjiaJ5SxsF5z0frk9J2xsBS4Kv8ZdpjMsPgtTj9WoPdicF0hD2eJxLA3Ilc
	 F+dKUhxW1slGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022D940CCE;
	Wed,  7 Jan 2026 17:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF3125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 839B140263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRYzn78s1bMz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5261340128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5261340128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5261340128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F4B9B97A70C; Wed,  7 Jan 2026 18:48:18 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:15 +0100
Message-ID: <20260107174815.224284-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122211223.1401842-1-bernd@kuhls.net>
References: <20251122211223.1401842-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808099; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=jAEb3TeVpIxsZCi18vJOHg5+5CuzILUnX17sM4ECGWU=;
 b=GjVGgYESh0z4sfWeG0mOYCUXR1YJFqJVUADCHbqlVhReVNf+PZUwEW6TSeUMfkSpv+5TMs
 qb7383ufsh6cm35fB49fHyCprE+FLDJveFd2tUOdYfYB+qcwm27ZdtWcckZRNUIVk8TpqE
 SlsIdNdVd6l5Ihga1UAY64/3ZqqJdpfQcS8HjUO+K+ll6zIUo3bI3L0RMJnR9DaFlf41MX
 MoQeEyp3D5C7bzkwcWGQJaXo/uYT8HSuD43cEsmMuesgh6SK9Z+/A5XLM8NOxcO0lFRDLo
 c8EDeK6BZyUjPD7z2V8CdxrjeB5c5HfWyabF1KoIrxf8YTYak+7h36BdJ2iPOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=GjVGgYES
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libmbus: bump version to
 0.9.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release notes:
> https://github.com/rscada/libmbus/blob/master/release_notes.txt
> 
> Downloading the source tarball is broken since at least Oct 30th, 2024
> as reported by the buildroot autobuilders:
> https://autobuild.buildroot.net/?reason=libmbus-0.8.0&step=50&start=50
> 
> Switching to the github helper provides the correct source code but the
> tarball downloaded has a different hash. A quick search did not provide
> alternative download locations for the original tarball
> libmbus-0.8.0.tar.gz.
> 
> To solve the broken build we do not only switch _SITE to github but also
> bump the package to 0.9.0 and add autoreconf which needs two directories
> being created in _POST_PATCH_HOOKS. One missing directory was already
> reported upstream: https://github.com/rscada/libmbus/issues/179
> 
> Updated license hash due to upstream commit:
> https://github.com/rscada/libmbus/commit/ab8919136d3cabb943b1cbdd4d6e2f7eea4b8f3f
> 
> Fixes:
> https://autobuild.buildroot.net/results/91a/91a82dc73bf87cf1969cd6a2ddea1809ab9a1613/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Sent for -next because 296 commits were committed between 0.8.0 and
> 0.9.0: https://github.com/rscada/libmbus/compare/0.8.0...0.9.0
> 
> Build-tested using this defconfig:
> BR2_PACKAGE_LIBMBUS=y
> 
>                              arm-aarch64 [ 1/35]: OK
>                    bootlin-aarch64-glibc [ 2/35]: OK
>                bootlin-arcle-hs38-uclibc [ 3/35]: OK
>                     bootlin-armv5-uclibc [ 4/35]: OK
>                      bootlin-armv7-glibc [ 5/35]: OK
>                    bootlin-armv7m-uclibc [ 6/35]: OK
>                       bootlin-armv7-musl [ 7/35]: OK
>                 bootlin-m68k-5208-uclibc [ 8/35]: OK
>                bootlin-m68k-68040-uclibc [ 9/35]: OK
>              bootlin-microblazeel-uclibc [10/35]: OK
>                 bootlin-mipsel32r6-glibc [11/35]: OK
>                    bootlin-mipsel-uclibc [12/35]: OK
>                  bootlin-openrisc-uclibc [13/35]: OK
>         bootlin-powerpc64le-power8-glibc [14/35]: OK
>            bootlin-powerpc-e500mc-uclibc [15/35]: OK
>                    bootlin-riscv32-glibc [16/35]: OK
>                    bootlin-riscv64-glibc [17/35]: OK
>                     bootlin-riscv64-musl [18/35]: OK
>                  bootlin-s390x-z13-glibc [19/35]: OK
>                       bootlin-sh4-uclibc [20/35]: OK
>                    bootlin-sparc64-glibc [21/35]: OK
>                     bootlin-sparc-uclibc [22/35]: OK
>                     bootlin-x86-64-glibc [23/35]: OK
>                      bootlin-x86-64-musl [24/35]: OK
>                    bootlin-x86-64-uclibc [25/35]: OK
>                    bootlin-x86-i686-musl [26/35]: OK
>                    bootlin-xtensa-uclibc [27/35]: OK
>                             br-arm-basic [28/35]: OK
>                     br-arm-full-nothread [29/35]: OK
>                       br-arm-full-static [30/35]: OK
>                    br-i386-pentium4-full [31/35]: OK
>                       br-mips64-n64-full [32/35]: OK
>                  br-mips64r6-el-hf-glibc [33/35]: OK
>                br-powerpc-603e-basic-cpp [34/35]: OK
>                br-powerpc64-power7-glibc [35/35]: OK
> 
> 35 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>  package/libmbus/libmbus.hash |  4 ++--
>  package/libmbus/libmbus.mk   | 12 ++++++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
> index 493bab5820..212ae9ddef 100644
> --- a/package/libmbus/libmbus.hash
> +++ b/package/libmbus/libmbus.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4  libmbus-0.8.0.tar.gz
> -sha256  ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74  COPYING
> +sha256  89fadb9074f5f719b2988cf30af1f8ced3e40f9f499b5b9047f8f33f876cce2d  libmbus-0.9.0.tar.gz
> +sha256  034b36d855501ea9c5588f4753335d08757149a02faf1d61baa9a6d861be4e3a  COPYING
> diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
> index 61f797b5b9..65287b083d 100644
> --- a/package/libmbus/libmbus.mk
> +++ b/package/libmbus/libmbus.mk
> @@ -4,10 +4,18 @@
>  #
>  ################################################################################
>  
> -LIBMBUS_VERSION = 0.8.0
> -LIBMBUS_SITE = http://www.rscada.se/public-dist
> +LIBMBUS_VERSION = 0.9.0
> +LIBMBUS_SITE = $(call github,rscada,libmbus,$(LIBMBUS_VERSION))
>  LIBMBUS_INSTALL_STAGING = YES
>  LIBMBUS_LICENSE = BSD-3-Clause
>  LIBMBUS_LICENSE_FILES = COPYING
> +# github tarball does not include configure
> +LIBMBUS_AUTORECONF = YES
> +# Autoreconf is missing some directories
> +define LIBMBUS_CREATE_DIRS
> +	mkdir -p $(@D)/libltdl
> +	mkdir -p $(@D)/m4
> +endef
> +LIBMBUS_POST_PATCH_HOOKS += LIBMBUS_CREATE_DIRS
>  
>  $(eval $(autotools-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
