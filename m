From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:51:08 +0200
Subject: [Buildroot] [PATCH v3 10/10] package/cargo-bin: remove and use
 cargo-bin from rust-bin package
In-Reply-To: <20200207180829.165689-11-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-11-arnout@mind.be>
Message-ID: <20200727135108.3b6b3be1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  7 Feb 2020 19:08:29 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> From: Patrick Havelange <patrick.havelange@essensium.com>
> 
> Rust upstream distributes tarballs with separate rust and cargo
> binaries, but also tarballs with everything together. The latter
> contains a bit more than what we need, so the download is slightly
> larger than separate cargo-bin and rust-bin. But it simplifies our life
> if we do the same in rust-bin as in rust (i.e. get both rust and cargo).
> 
> Also added hashes for rust-bin powerpc64le, which was missing before.

Actually the powerpc64le hash was not needed, since we don't support
powerpc64le as a host architecture for Rust currently:

config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
        bool
        default y if BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

>  HOST_RUST_BIN_PROVIDES = host-rustc
> -HOST_RUST_BIN_DEPENDENCIES = host-cargo-bin
>  
> -HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
> -
> -HOST_RUST_BIN_EXTRA_DOWNLOADS = \
> -	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
> +HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
>  
>  ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
> -HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
> +HOST_RUST_BIN_EXTRA_DOWNLOADS = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz

I've kept a += here, there was no reason to do this change, and we
prefer assignments in conditions to use += instead of =.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
