From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Nov 2014 22:39:01 +0100
Subject: [Buildroot] [PATCH branch/next] libgpg-error: bump version to
 1.17
In-Reply-To: <1417190105-22992-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417190105-22992-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141128223901.04c2f3a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 28 Nov 2014 15:55:05 +0000, Vicente Olivert Riera wrote:

> diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
> index 8287f98..2b46ffd 100644
> --- a/package/libgpg-error/Config.in
> +++ b/package/libgpg-error/Config.in
> @@ -1,5 +1,10 @@
>  config BR2_PACKAGE_LIBGPG_ERROR
>  	bool "libgpg-error"
> +	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
> +		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		BR2_mk68 || BR2_powerpc || BR2_powerpc64 || \
> +		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || BR2_sh4a || \
> +		BR2_sh4aeb || BR2_sparc || BR2_x86_64

As Gustavo pointed out, you need to propagate this to the reverse
dependencies of libgpg-error. To do this, please add a
BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable.

BTW, did you investigate a bit why libgpg-error now has some
architecture-specific stuff? It seems strange for such a library.


> +ifeq ($(findstring mips,$(BR2_ARCH)),aarch64)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = aarch64
> +else
> +ifeq ($(findstring arm,$(BR2_ARCH)),arm)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
> +LIBGPG_ERROR_ARCH = arm
> +else
> +ifeq ($(findstring m68k,$(BR2_ARCH)),m68k)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = m68k
> +else
> +ifeq ($(findstring mips,$(BR2_ARCH)),mips)
> +ifeq ($(findstring el,$(BR2_ARCH)),el)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = mipsel
> +else
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = mips
> +endif
> +else
> +ifeq ($(findstring powerpc64le,$(BR2_ARCH)),powerpc64le)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = powerpc64le
> +else
> +ifeq ($(findstring powerpc64,$(BR2_ARCH)),powerpc64)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = powerpc64
> +else
> +ifeq ($(findstring powerpc,$(BR2_ARCH)),powerpc)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = powerpc
> +else
> +ifeq ($(findstring sh4,$(BR2_ARCH)),sh4)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = sh4
> +else
> +ifeq ($(findstring sparc,$(BR2_ARCH)),sparc)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = sparc
> +else
> +ifeq ($(findstring x86_64,$(BR2_ARCH)),x86_64)
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +LIBGPG_ERROR_ARCH = x86_64
> +else
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +LIBGPG_ERROR_ARCH = i486
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif

There's no need for this long list of endif, you can normally write:

ifeq (....)
...
else ifeq (....)
...
else ifeq (....)
...
else
...
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
