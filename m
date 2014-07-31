From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 19:25:20 +0200
Subject: [Buildroot] [PATCH v2 1/9] toolchain: Add config option for
 atomic intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140731172520.GD3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anton, All,

On 2014-07-31 17:24 +0400, Anton Kolesov spake thusly:
> GCC has several builtin functions that implement atomic operations. Those
> functions are architecture specific and may not be implemented by the
> specific toolchain. In case of GCC for ARC those functions rely on
> LLOCK/SCOND instructions which are optional in ARC CPU's. If ARC CPU doesn't
> support those instructions but software tries to use them, then application
> will be aborted with Illegal instruction exception. To avoid confusion user
> should first specify that their CPU supports atomic extension, which will
> allow selection of packages that use builtin atomic functions.

I think what Thomas and I discussed, was to have a patch series that
does the following changes:

   1- introduce BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS;
   2- have all current architectures, that have atomics, select that new
      symbol (note: i386 does not, i486 and above have, for example);
   3- convert packages (one patch par package) to depend on it;
   4- introduce BR2_ARC_ATOMIC_EXT that selects it, too.

This is more logical: you first add a new option, and then you gradually
start using it, until finally you airrive to what you eventually wanted.

Regards,
Yann E. MORIN.

> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> ---
>  arch/Config.in.arc            | 5 +++++
>  package/Makefile.in           | 4 ++++
>  toolchain/toolchain-common.in | 4 ++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index 60b59f0..836cfef 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -1,3 +1,8 @@
> +# Choise of atomic instructions presence
> +config BR2_ARC_ATOMIC_EXT
> +	bool "Atomic extension (LLOCK/SCOND instructions)"
> +	select BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +
>  config BR2_ARCH
>  	default "arc"	if BR2_arcle
>  	default "arceb"	if BR2_arceb
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 02f6e3d..106a04c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -102,6 +102,10 @@ ifeq ($(BR2_xtensa),y)
>  TARGET_ABI += -mlongcalls -mtext-section-literals
>  endif
>  
> +ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
> +TARGET_ABI += -matomic
> +endif
> +
>  STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
>  STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
>  
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 13de9e5..f9cb7cf 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -44,6 +44,10 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  config BR2_TOOLCHAIN_HAS_SSP
>  	bool
>  
> +config BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +	bool
> +	default y if !BR2_arc
> +
>  config BR2_ENABLE_LOCALE_PURGE
>  	bool "Purge unwanted locales"
>  	help
> -- 
> 1.8.4.1
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
