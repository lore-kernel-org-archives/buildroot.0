From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Mar 2014 18:59:49 +0200
Subject: [Buildroot] [PATCH 1/1] [V6] toolchain: control vendor part in
 GNU_TARGET_NAME
In-Reply-To: <884EA965490E3C4D8E66AEF41E9802500AA064@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E9802500AA064@ezex10.ezchip.com>
Message-ID: <20140331165949.GA5004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, All,

On 2014-03-09 07:15 +0000, Noam Camus spake thusly:
> 
> This option allows to customize the "vendor" part of the
> toolchain tuple, where the toolchain tuple has the form
> <arch>-<vendor>-<os>-<libc>. Use this option in situations
> where gcc might make different decisions based on the vendor
> part of the tuple.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>

Small nit below...

> ---
>  package/Makefile.in                     |   17 ++++++++++++++++-
>  toolchain/toolchain-buildroot/Config.in |   16 ++++++++++++++++
>  2 files changed, 32 insertions(+), 1 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 454f614..bd9f18c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -20,8 +20,23 @@ endif
>  MAKE1:=$(HOSTMAKE) -j1
>  MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>  
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> +TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
> +else
> +TARGET_VENDOR = buildroot
> +endif
> +
> +# Sanity checks
> +ifeq ($(TARGET_VENDOR),)
> +$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR is not allowed to be empty)
> +endif
> +ifeq ($(TARGET_VENDOR),unknown)
> +$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
> +        It might be confused with the native toolchain)
> +endif
> +
>  # Compute GNU_TARGET_NAME
> -GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
> +GNU_TARGET_NAME=$(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
>  
>  # Blackfin FLAT needs uclinux
>  ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 07db50b..3487327 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -70,6 +70,22 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
> +config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> +	string "custom toolchain vendor name"
> +	default "buildroot"
> +	help
> +	  This option allows to customize the "vendor" part of the
> +	  toolchain tuple, where the toolchain tuple has the form
> +	  <arch>-<vendor>-<os>-<libc>. The default value, "buildroot",
> +	  is fine for most cases, except in very specific situations
> +	  where gcc might make different decisions based on the vendor
> +	  part of the tuple. The value "unknown" is not allowed, as the
> +	  cross-compiling toolchain might then be confused with the
> +	  native toolchain when the target and host architecture are
> +	  identical.

      This can not be empty either.

With that added:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	  If you're not sure, just leave the default "buildroot" value.
> +
>  source "package/uclibc/Config.in"
>  source "package/glibc/Config.in"
>  source "package/binutils/Config.in.host"
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
