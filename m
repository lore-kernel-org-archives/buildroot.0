From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 00:34:43 +0200
Subject: [Buildroot] [Patch v7 01/10] rustc: new virtual package
In-Reply-To: <20170723081206.7774-2-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-2-eric.le.bihan.dev@free.fr>
Message-ID: <804837fe-f89d-175a-129f-6061d9f11b08@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:11, Eric Le Bihan wrote:
[snip]
> +RUST_TARGET_NAME := $(subst buildroot,unknown,$(GNU_TARGET_NAME))

 GNU_TARGET_NAME is not exactly predictable - in particular, the buildroot bit
depends on (or may depend on) BR2_TOOLCHAIN_BUILDROOT_VENDOR. So instead, I'd
build up RUST_TARGET_NAME explicitly as
$(RUST_ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(RUST_ABI)

 As you can see, instead of redefining RUST_TARGET_NAME below, it's also better
to first define its components and then build it properly.

 And finally, does rust work with TARGET_OS == uclinux, LIBC == uclibc/musl, ABI
== spe/gnueabi/eabihf ?


> +
> +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +RUST_TARGET_NAME := $(subst arm-,armv7-,$(RUST_TARGET_NAME))
> +endif
> +
> +ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> +RUST_TARGET_NAME := $(subst -gnu,-gnuabi64,$(RUST_TARGET_NAME))
> +endif
> +
> +ifeq ($(HOSTARCH),x86_64)
> +RUST_HOST_ARCH = x86_64
> +else ifeq ($(HOSTARCH),x86)
> +RUST_HOST_ARCH = i686

 And in other cases? I guess Config.in somewhere should specify the constraints
on the host arch as well.

 Also, this is better expressed as

ifeq ($(HOSTARCH),x86)
RUST_HOST_ARCH = i686
else
RUST_HOST_ARCH = $(HOSTARCH)
endif


 Regards,
 Arnout


> +endif
> +
> +RUST_HOST_NAME = $(RUST_HOST_ARCH)-unknown-linux-gnu
> +
> +$(eval $(host-virtual-package))

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
