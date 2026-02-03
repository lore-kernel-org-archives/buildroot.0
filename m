Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA5EE8782A
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420DB83B60;
	Tue,  3 Feb 2026 13:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDs3FAFrF4Zi; Tue,  3 Feb 2026 13:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4650B83B64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770125620;
	bh=P74wWmjxcrnEGzL+5hP7mwzaYkX6EryxD0vrYbPf2qk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m9oVL55zUtsQt59HFIHQ44pwQALmHQstfYJXWgFN3j14UHXoIcsSM8zd8ELZl4JNi
	 bUuFYxjcDhwlXs3Mh+9VfRvRHATEmOxJyTcpDE4/0e5aXdHDCx+vL7mZgTNMi9ik8Z
	 TDCdFOv2GxWVi4oKmvm8fMvcSCpXJUpqdmTsCOxC8/CYxMnC0gNrLajbXDFiqZi+P1
	 lNz6fOgP3VBsR06YA2HwROEtSiQSptYpqqWLE+8SNuvTTHDwBV8B/PcOXbfPUXX0/U
	 0XeVbXvs4E0WLBcWgXeDvkHVlTu0imPpon2p6MEEVeaqRs5qE5DaY7lRMsq07pZ5wg
	 z52csMIfLg7Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4650B83B64;
	Tue,  3 Feb 2026 13:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA559F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD1A40461
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0--3hA9hdW4 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:33:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B964840060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B964840060
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B964840060
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:33:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 73397C211C9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:33:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2799C60728;
 Tue,  3 Feb 2026 13:33:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A20F119A8888; Tue,  3 Feb 2026 14:33:30 +0100 (CET)
Date: Tue, 3 Feb 2026 14:33:27 +0100
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYH4ESxcsrQj_6pZ@windsurf>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-3-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808133112.3212687-3-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770125613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UmAcNlGKYLqHxW5uTY5nzc51t5KjSz1CAvYU6oAK2UA=;
 b=MTph8Ms6YxMbV73rtJelk7zq4dXA/Ubxn9piflzHZsujD6Mz0DFh7H9CPsnea1Q+bxQvPm
 s7Vc+nUsxjig6mIk57oKomKBF23msOF/CLwfhDKJRFfZCz/hZSLjO2E7PK/uKTOf8qsuEA
 EhKUmRk+iSamdfmyO/uTiy6zXMQsuLzpGmOBips6gLu/+wEuwvM8+I3sayFjZNPoQ+NBOx
 pspYesWTo0UyXy72fOZmGK1w82rXFcxurTlUNTJDuhJR1D88qJIWKCySiMJ4xVLdYoK7c8
 zfOBpOQkT9fhxRGvrApzZ3Fc8bsWJef5Dtnc7lUswWIVSv3TDsgGvzFft2oalg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MTph8Ms6
Subject: Re: [Buildroot] [RFC PATCH 2/5] package/rust-bin: add Rust sources
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

Thanks for this patch, and sorry for the delay in reviewing
it. Generally the approach looks good, but we have a few comments, see
below.

On Fri, Aug 08, 2025 at 03:31:09PM +0200, El Mehdi YOUNES via buildroot wrote:
> Rust-for-Linux requires the Rust standard library sources (e.g. core/lib.rs)
> to enable CONFIG_RUST. This patch provides them in rust-bin while keeping the
> prebuilt compiler tarball unchanged.
> 
> It adds HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(VER)-src.tar.xz to
> HOST_RUST_BIN_EXTRA_DOWNLOADS, and splits extra downloads into
> HOST_RUST_BIN_STD_TARBALLS (rust-std-*) and HOST_RUST_BIN_SOURCE_TARBALL so
> extraction is controlled separately: rust-std-* are unpacked under $(@D)/std,
> and rustc-<ver>-src.tar.xz is unpacked to rust-src then only the 'library/'
> subtree from the source tarball is installed $(HOST_DIR)/lib/rustlib/src/rust/.
> 
> The utils/update-rust script is also extended to generate the sha256 line for
> rustc-<ver>-src.tar.xz in package/rust-bin/rust-bin.hash.
> 
> see
> https://github.com/torvalds/linux/blob/master/Documentation/rust/quick-start.rst
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  package/rust-bin/rust-bin.hash |  2 ++
>  package/rust-bin/rust-bin.mk   | 18 ++++++++++++++++--
>  utils/update-rust              |  9 +++++++++
>  3 files changed, 27 insertions(+), 2 deletions(-)

First of all, fixing package/rust-bin is not sufficient, you also need
to ensure that package/rust does the right thing. Indeed, we have two
ways of proving the Rust compiler in Buildroot: using a pre-compiled
Rust compiler (package/rust-bin) or building the Rust compiler from
source (package/rust). The Rust support in Linux should work for both
cases.

> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index 215bd84ad3..2195584f8f 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -14,16 +14,19 @@ RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
>  HOST_RUST_BIN_PROVIDES = host-rustc
>  
>  HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
> +HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(RUST_BIN_VERSION)-src.tar.xz
> +HOST_RUST_BIN_STD_TARBALLS =

Setting to an empty variable is not really needed.

>  
>  ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
> -HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
> +HOST_RUST_BIN_STD_TARBALLS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz

This could be just a = sign.

>  endif
>  
> +HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL) $(HOST_RUST_BIN_STD_TARBALLS)
>  HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUSTC_HOST_NAME)
>  
>  define HOST_RUST_BIN_LIBSTD_EXTRACT
>  	mkdir -p $(@D)/std
> -	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
> +	$(foreach f,$(HOST_RUST_BIN_STD_TARBALLS), \

The change from HOST_RUST_BIN_EXTRA_DOWNLOADS to
HOST_RUST_BIN_STD_TARBALLS could actually go in a separate,
preparatory commit. It would make the commit adding the installation
of Rust sources shorter and simpler to review.

>  		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
>  			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
>  	)
> @@ -61,4 +64,15 @@ endef
>  
>  HOST_RUST_BIN_POST_INSTALL_HOOKS += HOST_RUST_INSTALL_CARGO_CONFIG
>  
> +define HOST_RUST_BIN_EXTRACT_SRC_LIBRARY
> +	mkdir -p $(@D)/rust-src
> +	$(call suitable-extractor,$(HOST_RUST_BIN_SOURCE_TARBALL)) \
> +	$(HOST_RUST_BIN_DL_DIR)/$(HOST_RUST_BIN_SOURCE_TARBALL) | \
> +	$(TAR) -C $(@D)/rust-src --strip-components=1 $(TAR_OPTIONS) -

Please indent follow-up lines, as such:

	$(call suitable-extractor,$(HOST_RUST_BIN_SOURCE_TARBALL)) \
	       $(HOST_RUST_BIN_DL_DIR)/$(HOST_RUST_BIN_SOURCE_TARBALL) | \
	       $(TAR) -C $(@D)/rust-src --strip-components=1 $(TAR_OPTIONS) -

so that's it's clearly visible it's the same command.

> +	mkdir -p $(HOST_DIR)/lib/rustlib/src/rust
> +	cp -a $(@D)/rust-src/library $(HOST_DIR)/lib/rustlib/src/rust/

Can we install in $(HOST_DIR)/src/rust for example? In PATCH 5/5,
you're anyway passing explicitly the path to the Rust source code.

Or do we need to use $(HOST_DIR)/lib/rustlib/src/rust/ because in the
package/rust case (where we build the compiler ourselves), the source
gets installed there automatically?

Could you fixup those issues and submit an updated version?

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
