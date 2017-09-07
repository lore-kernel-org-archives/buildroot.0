From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 7 Sep 2017 19:02:03 +0200
Subject: [Buildroot] [Patch v7 01/10] rustc: new virtual package
In-Reply-To: <804837fe-f89d-175a-129f-6061d9f11b08@mind.be>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-2-eric.le.bihan.dev@free.fr>
 <804837fe-f89d-175a-129f-6061d9f11b08@mind.be>
Message-ID: <20170907170203.GA6001@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-08-11 00:34:43, Arnout Vandecappelle wrote:
>
>
> On 23-07-17 10:11, Eric Le Bihan wrote:
> [snip]
> > +RUST_TARGET_NAME := $(subst buildroot,unknown,$(GNU_TARGET_NAME))
>
>  GNU_TARGET_NAME is not exactly predictable - in particular, the buildroot bit
> depends on (or may depend on) BR2_TOOLCHAIN_BUILDROOT_VENDOR. So instead, I'd
> build up RUST_TARGET_NAME explicitly as
> $(RUST_ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(RUST_ABI)
>
>  As you can see, instead of redefining RUST_TARGET_NAME below, it's also better
> to first define its components and then build it properly.
>
>  And finally, does rust work with TARGET_OS == uclinux, LIBC == uclibc/musl, ABI
> == spe/gnueabi/eabihf ?

This looks like a good solution. Rust supports musl, but not uclibc. I
prefered to focus on glibc first. Then later, I'll add musl support.
>
>
> > +
> > +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> > +RUST_TARGET_NAME := $(subst arm-,armv7-,$(RUST_TARGET_NAME))
> > +endif
> > +
> > +ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> > +RUST_TARGET_NAME := $(subst -gnu,-gnuabi64,$(RUST_TARGET_NAME))
> > +endif
> > +
> > +ifeq ($(HOSTARCH),x86_64)
> > +RUST_HOST_ARCH = x86_64
> > +else ifeq ($(HOSTARCH),x86)
> > +RUST_HOST_ARCH = i686
>
>  And in other cases? I guess Config.in somewhere should specify the constraints
> on the host arch as well.

Rust provides rustc binaries for aarch64, arm, armv7, i686/x86, mips,
mipsel, mips64, mips64el powerpc, powerpc64, powerpc64le.

I only handled the x86/x86_64, without thinking about users running
Buildroot on these other architectures. I'll check this.

Anyway, the rust-bin patch modifies package/rustc/Config.in.host to add
$(BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS) which sets:

  depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

>  Also, this is better expressed as
>
> ifeq ($(HOSTARCH),x86)
> RUST_HOST_ARCH = i686
> else
> RUST_HOST_ARCH = $(HOSTARCH)
> endif

OK.

Thanks for the review!
