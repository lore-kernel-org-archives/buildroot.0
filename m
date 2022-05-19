Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0786C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 20:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2718B844B8;
	Thu, 19 May 2022 20:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6bgdmO6Rg2g; Thu, 19 May 2022 20:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CED2C84452;
	Thu, 19 May 2022 20:57:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43F631BF2BA
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30D6840610
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 20:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=iki.fi
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oms5J7ADsuKS for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 20:57:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BF0040121
 for <buildroot@buildroot.org>; Thu, 19 May 2022 20:57:03 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4443020167;
 Thu, 19 May 2022 23:48:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1652993292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+bb9gCVTzkAEWqfMTecKZ96hIwhOPIyWju7tlVnUz4=;
 b=PNzFTlWgqq76yHatoijQ+Z69A10BYKMyY66mOqMspHoOVzmuoDql10bMtMv6igE326OoKv
 GCP8zVOZ0xvipwmUtHjBri3oBN7alq0uvGmrKQapVxP3FKFItocxyhAmMprIHHPUiGqso/
 IZmQmRi+Eio1J/eSFHrTOo+B6beWNo0=
Date: Thu, 19 May 2022 23:46:36 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YoasrMbgylv3vbYn@iki.fi>
References: <20220517172110.22265-1-jarkko.sakkinen@iki.fi>
 <469edce9-3d4d-0339-5974-bd553c7d3460@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <469edce9-3d4d-0339-5974-bd553c7d3460@mind.be>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1652993292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+bb9gCVTzkAEWqfMTecKZ96hIwhOPIyWju7tlVnUz4=;
 b=HWOqXDmmuMwaE+Qt4RjiNyAJv509YonBHRzHp0XkRgPUKijmrH7X3w97fiC+iMNf3Dfogw
 WlIWiafL8zRMEqTkE1E1OZu6TfGVzQDnwg8wKlm10lonxiSXNCRBvSO/3YtzTc5hNl9r5q
 DvvMI2omtRiyejByJc5RwWQM/OcEMkg=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1652993292; a=rsa-sha256; cv=none;
 b=SAgwX+cH88TNomPnJfa34rLQBnp8GeemAmbndVO/SQpdmse7J6y9EYlJna9RK9pONqcuPP
 oYpMd/LlDln4QRB7TnufW2/yKVuLIWc/WV+7srSOwp6zwpK3cHUEw8V1J3YS5cddzUr5qk
 cGIJ8gTznVJJj++zMCDR3CMQrLK6F/c=
Subject: Re: [Buildroot] [PATCH RFC] package/enarx: add
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 18, 2022 at 08:23:43PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 17/05/2022 19:21, Jarkko Sakkinen wrote:
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
> > ---
> > Hi,
> > 
> > This is not a patch that I intend to include BuildRoot yet but to
> > show changes I needed to make to get nightly Rust working, many of
> > which are quite unorthodox.
> 
>  Well, for sure we can't accept to swith the rust version to nightly
> unconditionally.
> 
>  What we could accept is either:
> 
> - have nightly as an option for host-rust;
> - add a generic version option to host-rust, similar to the version options
> in kernel and U-Boot.

Yeah, I get this. There's good reasons to have such *opt-in* support
because Rust is getting used in the embedded field and that field tends
to be interested unstable features (such as naked functions just name
an example).


> 
> > 
> > I'd like to get ideas based on those how to properly make BuildRoot
> > to support nightly Rust in addition to the stable version. I can look
> > into that myself, as long as I get some feedback/tips on how to do
> > things better.
> > 
> > BR, Jarkko
> > 
> >   package/Config.in                             |   1 +
> >   package/enarx/Config.in                       |   9 ++
> >   package/enarx/enarx.mk                        |  16 +++
> >   package/enarx/remove-incompatible-flags.patch |  36 +++++
> >   package/pkg-cargo.mk                          |  10 +-
> >   package/rust-bin/rust-bin.hash                | 129 ------------------
> >   package/rust-bin/rust-bin.mk                  |   2 +-
> >   package/rust/rust.hash                        |   6 -
> >   package/rust/rust.mk                          |   2 +-
> >   9 files changed, 69 insertions(+), 142 deletions(-)
> >   create mode 100644 package/enarx/Config.in
> >   create mode 100644 package/enarx/enarx.mk
> >   create mode 100644 package/enarx/remove-incompatible-flags.patch
> >   delete mode 100644 package/rust-bin/rust-bin.hash
> >   delete mode 100644 package/rust/rust.hash
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index 8892134133..11a08930ae 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2538,6 +2538,7 @@ menu "System tools"
> >   	source "package/efivar/Config.in"
> >   	source "package/embiggen-disk/Config.in"
> >   	source "package/emlog/Config.in"
> > +	source "package/enarx/Config.in"
> >   	source "package/ftop/Config.in"
> >   	source "package/getent/Config.in"
> >   	source "package/gkrellm/Config.in"
> > diff --git a/package/enarx/Config.in b/package/enarx/Config.in
> > new file mode 100644
> > index 0000000000..a2b9939def
> > --- /dev/null
> > +++ b/package/enarx/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_ENARX
> > +	bool "enarx"
> > +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> > +	select BR2_PACKAGE_HOST_RUSTC
> 
>  You'd have to select BR2_PACKAGE_HOST_RUSTC_NIGHTLY here as well if the
> package uses the nightly features.

+1

> 
> > +	help
> > +	  Application deployment system enabling applications to run within
> > +	  Trusted Execution Environments (TEEs
> > +
> > +	  https://github.com/enarx/enarx
> > diff --git a/package/enarx/enarx.mk b/package/enarx/enarx.mk
> > new file mode 100644
> > index 0000000000..1eaa23d1d6
> > --- /dev/null
> > +++ b/package/enarx/enarx.mk
> > @@ -0,0 +1,16 @@
> > +################################################################################
> > +#
> > +# enarx
> > +#
> > +################################################################################
> > +
> > +ENARX_VERSION = master
> > +ENARX_SITE = $(call github,enarx,enarx,$(ENARX_VERSION))
> > +ENARX_LICENSE = GPL3
> 
>  GPL-3.0 (and check if it's not +)

It's not :-)

> 
> > +ENARX_LICENSE_FILES = LICENSE
> > +ENARX_CARGO_BUILD_OPTS = \
> > +	-Z bindeps
> > +ENARX_CARGO_INSTALL_OPTS = \
> > +	-Z bindeps
> > +
> > +$(eval $(cargo-package))
> > diff --git a/package/enarx/remove-incompatible-flags.patch b/package/enarx/remove-incompatible-flags.patch
> > new file mode 100644
> > index 0000000000..de0fa9b73e
> > --- /dev/null
> > +++ b/package/enarx/remove-incompatible-flags.patch
> > @@ -0,0 +1,36 @@
> > +From ee444d43531dfd463732dc934716e9798e75cbce Mon Sep 17 00:00:00 2001
> > +From: Jarkko Sakkinen <jarkko@profian.com>
> > +Date: Mon, 16 May 2022 11:16:35 +0300
> > +Subject: [PATCH] build: remove incompatible flags
> > +
> > +Signed-off-by: Jarkko Sakkinen <jarkko@profian.com>
> > +---
> > + crates/shim-kvm/build.rs | 2 --
> > + crates/shim-sgx/build.rs | 2 --
> > + 2 files changed, 4 deletions(-)
> > +
> > +diff --git a/crates/shim-kvm/build.rs b/crates/shim-kvm/build.rs
> > +index 6cfbd707..47aa7799 100644
> > +--- a/crates/shim-kvm/build.rs
> > ++++ b/crates/shim-kvm/build.rs
> > +@@ -5,6 +5,4 @@ fn main() {
> > +         "cargo:rustc-link-arg-bin=enarx-shim-kvm=-T{}/layout.ld",
> > +         std::env::var("CARGO_MANIFEST_DIR").unwrap()
> > +     );
> > +-    println!("cargo:rustc-link-arg-bin=enarx-shim-kvm=-Wl,--sort-section=alignment");
> > +-    println!("cargo:rustc-link-arg-bin=enarx-shim-kvm=-nostartfiles");
> 
>  This doesn't look like a patch that will be acceptable upstream. Is it even
> acceptable for us, can you simply removes those linker options?

I'll look into this.

> 
> > + }
> > +diff --git a/crates/shim-sgx/build.rs b/crates/shim-sgx/build.rs
> > +index efe9d836..239262f2 100644
> > +--- a/crates/shim-sgx/build.rs
> > ++++ b/crates/shim-sgx/build.rs
> > +@@ -5,6 +5,4 @@ fn main() {
> > +         "cargo:rustc-link-arg-bin=enarx-shim-sgx=-T{}/layout.ld",
> > +         std::env::var("CARGO_MANIFEST_DIR").unwrap()
> > +     );
> > +-    println!("cargo:rustc-link-arg-bin=enarx-shim-sgx=-Wl,--sort-section=alignment");
> > +-    println!("cargo:rustc-link-arg-bin=enarx-shim-sgx=-nostartfiles");
> > + }
> > +--
> > +2.36.1
> > +
> > diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> > index f7e3f39503..a808a38c51 100644
> > --- a/package/pkg-cargo.mk
> > +++ b/package/pkg-cargo.mk
> > @@ -21,7 +21,7 @@
> >   ################################################################################
> >   PKG_COMMON_CARGO_ENV = \
> > -	CARGO_HOME=$(HOST_DIR)/share/cargo
> > +	CARGO_HOME=$(HOME)/.cargo
> 
>  This is definitely not good, we don't want to use $(HOME)/.cargo to avoid
> messing up things with cargo stuff done outside of buildroot.

Agreed.

> [snip]
> > diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> > index 7cfe5cd6df..e073097991 100644
> > --- a/package/rust-bin/rust-bin.mk
> > +++ b/package/rust-bin/rust-bin.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> > -RUST_BIN_VERSION = 1.60.0
> > +RUST_BIN_VERSION = nightly
> 
>  This is also not good - nightly is a branch, not a tag, which is Not Done
> in Buildroot. If you want to support nightly, you're going to have to find a
> URL through which you can download an unchanging nightly version and use
> that.
> 
>  However, specifically for rust-bin, I think we should always use
> BR2_PACKAGE_HOST_RUST compiler variant for nightly, and keep rust-bin at the
> release version. rust-bin will only be used for building the nightly from
> source.

Ok

> 
> >   RUST_BIN_SITE = https://static.rust-lang.org/dist
> >   RUST_BIN_LICENSE = Apache-2.0 or MIT
> >   RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> > deleted file mode 100644
> > index 81f366e564..0000000000
> > --- a/package/rust/rust.hash
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
> > -# Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
> > -sha256  a025876deccbcb3f288d8e02623ea321f94623f31305d3c5c6f17855bb9685db  rustc-1.60.0-src.tar.xz
> > -# Locally generated
> > -sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
> > -sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> > diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> > index 445fde70a4..a3dfe7d5d2 100644
> > --- a/package/rust/rust.mk
> > +++ b/package/rust/rust.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> > -RUST_VERSION = 1.60.0
> > +RUST_VERSION = nightly
> >   RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
> >   RUST_SITE = https://static.rust-lang.org/dist
> 
>  So this would have to become something like:
> 
> ifeq ($(BR2_PACKAGE_HOST_RUSTC_NIGHTLY),y)
> RUST_VERSION = 2022-05-17
> RUST_SOURCE = rustc-nightly-src.tar.xz?version=$(RUST_VERSION)
> RUST_SITE = https://static.rust-lang.org/dist/$(RUST_VERSION)
> else
> RUST_VERSION = 1.60.0
> RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
> RUST_SITE = https://static.rust-lang.org/dist
> endif
> 
>  The ?version= thing is needed to be able to update the nightly version.
> When you update it, its hash will change, so we need to make sure it also
> has a different filename. Stuff after ? is ignored by the server, but will
> be added to the local filename. After updating, that version changes so the
> filename changes so it no longer conflicts with the hash.

Thank you for the verbose feedback! I knew that I have no idea what I'm
doing but other option would have been a silence so I had try some
sort of PoC to get further :-) I'll look forward into improving from
this based on the feedback.

>  Regards,
>  Arnout
> 
> 
> >   RUST_LICENSE = Apache-2.0 or MIT

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
