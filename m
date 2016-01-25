From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jan 2016 22:59:40 +0100
Subject: [Buildroot] [PATCH 1/8] libunwind: fix C library dependency
In-Reply-To: <1453148701-10036-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A69ACC.1030505@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> The libunwind package currently dependency on glibc *or* uclibc
> snapshot. However, we are going to remove the support for uclibc
> snapshot, and uClibc-ng has equivalent functionality as uclibc
> snapshot. Moreover, musl is also capable of building libunwind for
> certain architectures.
> 
> Therefore, this commit reworks the architecture dependencies of
> libunwind, to make it available on all architectures for which it is
> supported, depending on the capabilities of the different C libraries,
> and the implementation of libunwind on each architecture.
> 
> On some architectures, libunwind uses the C library *context()
> functions, which are not provided by musl at all, and not provided by
> uClibc on all architectures. But on some other architectures,
> libunwind does not use the C library *context() functions, which
> explains why it can be built with musl on such architectures.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libunwind/Config.in | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
> index 85cb472..6f747ae 100644
> --- a/package/libunwind/Config.in
> +++ b/package/libunwind/Config.in
> @@ -1,15 +1,32 @@
> +# libunwind is only available for a certain subset of the
> +# architectures (as visible in the list of architectures supported
> +# with the glibc C library below).
> +#
> +# In addition to this, on some architectures libunwind requires the
> +# *context() function from the C library, which are only available on
> +# certain architectures in uClibc, and not available at all on
> +# musl. But on some other architectures, libunwind works without using
> +# the *context() functions, which allows it to be built with musl.
> +config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_TOOLCHAIN_USES_GLIBC && \
> +		(BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
> +		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64)
> +	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
> +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
> +		 BR2_x86_64)
> +	default y if BR2_TOOLCHAIN_USES_MUSL && \
> +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64)
> +
>  config BR2_PACKAGE_LIBUNWIND
>  	bool "libunwind"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # {g,s}etcontext
> -	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
> -		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS

Build tested on musl and x86_64.
Checked that libunwind doesn't build with uClibc-snapshot and uClibc-ng.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  	help
>  	  C API to determine the call-chain of a program.
>  
>  	  http://www.nongnu.org/libunwind/index.html
>  
> -comment "libunwind needs a uclibc snapshot or (e)glibc toolchain w/ threads"
> -	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
> -		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
> +comment "libunwind needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
