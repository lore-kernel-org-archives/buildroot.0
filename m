From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 23:12:39 +0200
Subject: [Buildroot] [PATCH 01/11] toolchain: Make vendor configurable
In-Reply-To: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
Message-ID: <20140403211239.GB17328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, Maarten, All,

On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> This is used in the GNU configuration name (machine triple/quadruple).
> 
> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
> Acked-By: Paul Cercueil <paul@crapouillou.net>

NAK, there's a better patch pending for that:
    http://patchwork.ozlabs.org/patch/335670/

Regards,
Yann E. MORIN.

> ---
>  Makefile                                |  1 +
>  package/Makefile.in                     |  2 +-
>  toolchain/toolchain-buildroot/Config.in | 11 +++++++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 41c51c6..09be13c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -307,6 +307,7 @@ QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
>  
>  # Strip off the annoying quoting
>  ARCH:=$(call qstrip,$(BR2_ARCH))
> +VENDOR:=$(call qstrip,$(BR2_VENDOR))
>  
>  KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>  	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 454f614..d102009 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -21,7 +21,7 @@ MAKE1:=$(HOSTMAKE) -j1
>  MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>  
>  # Compute GNU_TARGET_NAME
> -GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
> +GNU_TARGET_NAME=$(ARCH)-$(VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
>  
>  # Blackfin FLAT needs uclinux
>  ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 07db50b..9d97487 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -70,6 +70,17 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
> +config BR2_VENDOR
> +	string "Toolchain vendor in GNU configuration name"
> +	default "buildroot"
> +	help
> +	  The GNU build system identifies a machine using configuration name
> +	  in the following format:
> +	    <arch>-<vendor>-<kernel>-<os>
> +	  This option lets you select the vendor part of that string.
> +
> +	  Usually it is best to stick with the default value of "buildroot".
> +
>  source "package/uclibc/Config.in"
>  source "package/glibc/Config.in"
>  source "package/binutils/Config.in.host"
> -- 
> 1.9.0
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
