From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 08:45:48 +0200
Subject: [Buildroot] [PATCH 1/9] arc: Support option of atomic extension
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140730084548.05bd6dec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 28 Jul 2014 22:02:00 +0400, Anton Kolesov wrote:

> GCC has several builtin functions that implement atomic operations. In GCC
> for ARC those functions rely on LLOCK/SCOND instructions which are optional
> in ARC CPU's. If software uses those functions and as a result those
> instructions, it will be abort with Illegal instruction exception. To avoid
> confusion user should first specify that their CPU supports atomic
> extension, which will allow selection of packages that use builtin atomic
> functions.
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> ---
>  arch/Config.in.arc  | 4 ++++
>  package/Makefile.in | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index 60b59f0..9edcbd4 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -1,3 +1,7 @@
> +# Choise of atomic instructions presence
> +config BR2_ARC_ATOMIC_EXT
> +	bool "Atomic extension (LLOCK/SCOND instructions)"
> +
>  config BR2_ARCH
>  	default "arc"	if BR2_arcle
>  	default "arceb"	if BR2_arceb
> diff --git a/package/Makefile.in b/package/Makefile.in
> index fc55850..3d25d2a 100644
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

I think this is looking generally good, but after discussing with Yann,
I think we'd prefer to have a slightly more generic solution. First, a
hidden kconfig boolean that tells whether the compiler has the atomic
intrinsics:

config BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
	bool

and then architectures would "select" this hidden boolean whenever they
have the atomic intrinsics, and packages would use this hidden boolean
to create the dependencies.

What do you think about this? It's not a big change compared to what
you have done, it only pushes things to be a little bit more generic.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
