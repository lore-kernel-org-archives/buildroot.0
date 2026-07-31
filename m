Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C9C55173
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 18:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEED41156;
	Fri, 31 Jul 2026 18:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-tiDddtL-kK; Fri, 31 Jul 2026 18:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10D744115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785524391;
	bh=fatZcEfBm3ww6hv+4y/w74IbsD9Yyf5mIHQdUveB+Ts=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lKTC5VJekyU0ZPRpHUKt+OjYjo8j9dPoUetpnDoKaH7j0STnEqfcMa7Atd6ATZp2P
	 eLzV0f9uiOrp2ovubkbAHn7bW/5CJgISizNDhsFDbYaoN7QTR+rp+XNmtDHnF+/E3N
	 IQP4B2yOrt6IsHwYzdiCqCHCcitYOL3IRa62wIDYaVbKe7mTlfiT+1J0IRVNjyKszM
	 xg8YiWsJfNWwuP3YEQkJVxkqal1TVMfStC9ZOydM/24Foc+UXLlMPxznvfLbr7mVLT
	 bvjKRsMsGIwAoJaKXbOTipHTr8F6nTnquzRXrC7rYGOpVoaupITw4FsPlcM1ir9E8v
	 gi7pUSv5Jbn9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D744115D;
	Fri, 31 Jul 2026 18:59:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C96436E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 18:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2286280C04
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3B47_0ydK4nP for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 18:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30F8880956
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F8880956
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30F8880956
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 18:59:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 18BB71A1329
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 18:59:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC4976039A
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 18:59:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0226D11C16C9D; 
 Fri, 31 Jul 2026 20:59:40 +0200 (CEST)
Date: Fri, 31 Jul 2026 20:59:40 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <amzvreeFgp0eJyM4@windsurf>
References: <20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731-heaptrack-v1-1-c558715cb4c3@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785524381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=pMrdXXnslDutUKx43z9lV2lg4TpQUJKCPEsgcNfAGKQ=;
 b=0mwJNunyiWXib+bwTYejXO+dNiDlQNsKdtgnPVpVgREKsLS27b6nD44PXOtbqNATBWxt3l
 K9rT0R8xHR6dWEdhXgOEd/d5Z3sQXknGsxf/7EVPCIW1cccsr5ihxt1ynYitLDgFhsMlLu
 jss6uSVn7A3+T1o4KMr55MP+2+iS7EQrQg0A4+rYM0Rwkq0Lqg8X8Kt0QwBymHPtoVluyG
 LmaXHNPmmZatjDN9XEI5vKQgadXX4YSMkQ9kDgCgAzGpdVhdzCn5C98HkQ0Jwlk3tDdL5R
 bzajbwCNV2x8BIg4T4paFIf4QjgavxPrUHeQ20oBI8S7x+wLwaXM2p0d5Gzapw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0mwJNuny
Subject: Re: [Buildroot] [PATCH] package/heaptrack: new package
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

Hello,

On Fri, Jul 31, 2026 at 07:25:35PM +0200, Luca Ceresoli wrote:

> diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
> new file mode 100644
> index 000000000000..ea54195c9318
> --- /dev/null
> +++ b/package/heaptrack/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_HEAPTRACK
> +	bool "heaptrack"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LINUX_KERNEL

You also need to replicate the "depends on" the things you select, so:

	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
	depends on BR2_USE_WCHAR # boost, elfutils
	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
	depends on !BR2_STATIC_LIBS # libunwind, elfutils

Also, I'm curious about the BR2_LINUX_KERNEL dependency. heaptrack
builds its own kernel modules?

> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_IOSTREAMS
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	# For heaptrack_print
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_LIBUNWIND
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_ELFUTILS

Also, these selects should be sorted alphabetically.

> +	help
> +	  Heaptrack traces all memory allocations and annotates these
> +	  events with stack traces. Dedicated analysis tools then allow
> +	  you to interpret the heap memory profile to find hotspots,
> +	  memory leaks, allocation hotspots and temporary allocations.
> +
> +	  Zstandard offers better (de)compression performance compared
> +	  with gzip/zlib, making heaptrack faster and datafiles smaller,
> +	  so enabling BR2_PACKAGE_ZSTD is recommended.
> +
> +	  https://apps.kde.org/heaptrack/
> +
> +comment "heaptrack needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

This needs to be updated with the dependencies above.

> diff --git a/package/heaptrack/heaptrack.hash b/package/heaptrack/heaptrack.hash
> new file mode 100644
> index 000000000000..d9eb6010ac18
> --- /dev/null
> +++ b/package/heaptrack/heaptrack.hash
> @@ -0,0 +1 @@
> +sha256  e69de2209ab0e16c8e26c1b60feeb852b3a88e46a4f16588c08254e1bd81a183  heaptrack-3e6cce3d210a6672fe6f92de0bed567c49b7a9c5-git4.tar.gz

Add comment indicating the provenance of this hash.

Add the hashes of the license files.

> diff --git a/package/heaptrack/heaptrack.mk b/package/heaptrack/heaptrack.mk
> new file mode 100644
> index 000000000000..6349e7aeb04d
> --- /dev/null
> +++ b/package/heaptrack/heaptrack.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# heaptrack
> +#
> +################################################################################
> +
> +HEAPTRACK_SITE_METHOD = git
> +HEAPTRACK_SITE = https://invent.kde.org/sdk/heaptrack.git
> +HEAPTRACK_VERSION = 3e6cce3d210a6672fe6f92de0bed567c49b7a9c5
> +HEAPTRACK_LICENSE = LGPL-2.1-or-later, GPL-2.0-or-later (heaptrack_interpret)
> +HEAPTRACK_LICENSE_FILES = LICENSES/LGPL-2.1-only.txt \
> +			  LICENSES/GPL-2.0-or-later.txt \
> +			  LICENSES/LGPL-2.1-or-later.txt \
> +			  LICENSES/BSL-1.0.txt \
> +			  LICENSES/MIT.txt \
> +			  LICENSES/Apache-2.0.txt \
> +			  LICENSES/BSD-3-Clause.txt

One tab indentation for follow-up lines is enough.

> +HEAPTRACK_DEPENDENCIES = host-pkgconf linux boost libunwind zlib elfutils
> +HEAPTRACK_CONF_OPTS += -DHEAPTRACK_BUILD_GUI=OFF -DHEAPTRACK_BUILD_PRINT=ON
> +
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +HEAPTRACK_DEPENDENCIES += zstd
> +endif
> +
> +$(eval $(cmake-package))
> 
> ---
> base-commit: 9bc585a804b2ce7b5f82f538f6108cca27c3116a
> change-id: 20260731-heaptrack-cd4f6f8fcec8

Would it be difficult to add a test case in support/testing/?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
