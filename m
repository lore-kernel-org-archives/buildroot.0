From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 18:43:35 +0100
Subject: [Buildroot] [PATCH 1/1] [V3] toolchain: control vendor part in
 GNU_TARGET_NAME
In-Reply-To: <884EA965490E3C4D8E66AEF41E9802500939A1@ezex10.ezchip.com>
References: <1393908571-30334-1-git-send-email-noamc@ezchip.com>
 <884EA965490E3C4D8E66AEF41E9802500939A1@ezex10.ezchip.com>
Message-ID: <53176247.1040108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/14 05:51, Noam Camus wrote:
> This option allows to customize the "vendor" part of the
> toolchain tuple, where the toolchain tuple has the form
> <cpu>-<vendor>-<kernel>-<os>. Use this option in situations
> where gcc might make different decisions based on the vendor
> part of the tuple.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Makefile.in                     |   12 +++++++++++-
>  toolchain/toolchain-buildroot/Config.in |   17 +++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 454f614..121fe74 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -20,8 +20,18 @@ endif
>  MAKE1:=$(HOSTMAKE) -j1
>  MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
> 
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),)
> +VENDOR:=buildroot
> +else
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),unknown)
> +$(error The value 'unknown' is not allowed. It might be confused with native toolchain)
> +else
> +VENDOR:=$(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
> +endif
> +endif

 I don't think it's a good idea to treat the case that vendor is empty
specially. Anyway, it will never be empty or unknown, because it always
includes quotes - it should be qstripped first.

 Therefore, this is better (also note the fixed spacing and := ):

VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
ifeq ($(VENDOR),)
$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR is not allowed to be empty)
endif
ifeq ($(VENDOR),unknown)
$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
        It might be confused with the native toolchain)
endif


 I would also prefer to name the internal variable TARGET_VENDOR, similar
to TARGET_OS.

> +
>  # Compute GNU_TARGET_NAME
> -GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
> +GNU_TARGET_NAME=$(ARCH)-$(VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> 
>  # Blackfin FLAT needs uclinux
>  ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 07db50b..34f78ae 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -70,6 +70,23 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>         default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>         default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
> 
> +config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> +       string "custom toolchain vendor name"
> +       default "buildroot"
> +       help
> +
> +         This option allows to customize the "vendor" part of the
> +         toolchain tuple, where the toolchain tuple has the form
> +         <cpu>-<vendor>-<kernel>-<os>. The default value, "buildroot",

 It's more like <arch>-<vendor>-<os>-<libc>

> +         is fine for most cases, except in very specific situations
> +         where gcc might make different decisions based on the vendor
> +         part of the tuple. The value "unknown" is not allowed, as the
> +         cross-compiling toolchain might then be confused with the
> +         native toolchain when the target and host architecture are
> +         identical.
> +
> +         If you're not sure, just leave the default "buildroot" value.

 With my comment above, Yann's comment about rewriting this is no longer
correct of course.


 Regards,
 Arnout

> +
>  source "package/uclibc/Config.in"
>  source "package/glibc/Config.in"
>  source "package/binutils/Config.in.host"
> --
> 1.7.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
