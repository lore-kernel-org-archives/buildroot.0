From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 1 Jan 2018 17:11:06 +0100
Subject: [Buildroot] [PATCH v9 1/8] rustc: new virtual package
In-Reply-To: <20171228172749.4b376a8c@windsurf.home>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-2-eric.le.bihan.dev@free.fr>
 <20171228172749.4b376a8c@windsurf.home>
Message-ID: <20180101161106.GA7252@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-12-28 17:27:49, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 28 Dec 2017 16:51:39 +0100, Eric Le Bihan wrote:
>
> > diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> > new file mode 100644
> > index 0000000000..16c95fa0b4
> > --- /dev/null
> > +++ b/package/rustc/Config.in.host
> > @@ -0,0 +1,17 @@
> > +config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> > +	bool
> > +	default y
> > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> > +	depends on BR2_i386 || BR2_x86_64 \
> > +		|| BR2_arm  || BR2_aarch64 \
> > +		|| BR2_powerpc  || BR2_powerpc64 \
> > +		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>
> This would be more readable as:
>
> 	default y if BR2_aarch64
> 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> 	default y if BR2_i386
> 	default y if ...
> 	default y if BR2_mips || BR2_mipsel
> 	default y if (BR2_mips64 || BR2_mips64el) && BR2_MIPS_NABI64
> 	default y if BR2_x86_64
>

OK.

> > +	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> > +	depends on !BR2_MIPS_NABI32
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
>
> Since it's weird for a host package to have a target architecture
> dependency and target C library dependency, it would be good to have a
> comment that explains this. I assume it's because of the Rust standard
> library, so something like:
>
> 	# The pre-built Rust standard library is only available for the
> 	# following architectures/ABIs, and is built against glibc.

OK.

> > diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
> > new file mode 100644
> > index 0000000000..4163a44bc1
> > --- /dev/null
> > +++ b/package/rustc/rustc.mk
> > @@ -0,0 +1,31 @@
> > +################################################################################
> > +#
> > +# rustc
> > +#
> > +################################################################################
> > +
> > +RUST_ARCH := $(call qstrip,$(BR2_ARCH))
> > +
> > +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> > +RUST_ARCH := armv7
> > +endif
> > +
> > +ifeq ($(BR2_ARM_EABI),y)
> > +RUST_ABI := eabi
> > +else ifeq ($(BR2_ARM_EABIHF),y)
> > +RUST_ABI := eabihf
> > +else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> > +RUST_ABI := abi64
> > +endif
>
> Perhaps this could be defined in the Config.in file as well ?
>
> config BR2_PACKAGE_HOST_RUSTC_ARCH
> 	string
> 	default "armv7" 	if BR2_ARM_CPU_ARMV7A
> 	default BR2_ARCH 	if !BR2_ARM_CPU_ARMV7A
>
> config BR2_PACKAGE_HOST_RUSTC_ABI
> 	string
> 	default "eabi" 		if BR2_ARM_EABI
> 	default "eabihf" 	if BR2_ARM_EABIHF
> 	default "abi64" 	if BR2_MIPS_NABI64

OK.

> > +RUST_TARGET_NAME := $(RUST_ARCH)-unknown-linux-gnu$(RUST_ABI)
>
> Why are you using := in this file instead of = ?

A long time ago, I ran into an error about $(RUST_TARGET_NAME) not being
defined, hence the simply expanded variable. I'll check this again.

Regards,

--
ELB
