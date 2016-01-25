From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jan 2016 23:41:13 +0100
Subject: [Buildroot] [PATCH 3/8] mongrel2: allow using uClibc but only
 on certain architectures
In-Reply-To: <1453148701-10036-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A6A489.70105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> mongrel2 uses  the {get,make,swap}context functions:
> 
>  - With glibc, no problem, they are available on all supported
>    architectures
> 
>  - With uClibc, they are available only on a subset of the
>    architectures. Until now, only BR2_UCLIBC_VERSION_SNAPSHOT
>    configurations were allowed to select mongrel2, but we are going to
>    get rid of the uClibc snapshot version, and uClibc-ng is as capable
>    as the uClibc snapshot. However, only certain architectures have
>    the *context() functions.
> 
>  - With musl, there is no *context() support.
> 
> Since this dependency is quite complicated, we introduce a
> BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS hidden boolean to encode which C
> libraries are supported.
> 
> Also, listing the supported uClibc architectures would be too long in
> the comment, so we simply indicate that the package needs uClibc or
> glibc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mongrel2/Config.in | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
> index 1c7b495..49dd6fd 100644
> --- a/package/mongrel2/Config.in
> +++ b/package/mongrel2/Config.in
> @@ -1,10 +1,16 @@
> -comment "mongrel2 needs a toolchain w/ C++, threads, wchar, dynamic library"
> -	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
> -		BR2_TOOLCHAIN_USES_GLIBC || \
> -		BR2_arm
> +# mongrel2 uses {get,make,swap}context() functions, which are
> +# available in glibc for all architectures and in uClibc only for a
> +# subset of the architectures
> +config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
> +	bool
> +	default y if BR2_TOOLCHAIN_USES_GLIBC
> +	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
> +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_x86_64)

In the libunwind patch BR2_mips64 and BR2_mips64el where dropped from the
libunwind's supported architecture. Why they are not here ?

Best regards,
Romain

> +
> +comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> -		BR2_STATIC_LIBS
> +		BR2_STATIC_LIBS || !BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
>  
>  config BR2_PACKAGE_MONGREL2
>  	bool "mongrel2"
> @@ -14,11 +20,7 @@ config BR2_PACKAGE_MONGREL2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
>  	depends on BR2_USE_WCHAR # zeromq -> util-linux
>  	depends on !BR2_STATIC_LIBS # uses dlopen()
> -	# {get,make,swap}context functions present in
> -	# {e,}glibc and in uClibc's master branch. Source has arm workaround
> -	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
> -		BR2_TOOLCHAIN_USES_GLIBC || \
> -		BR2_arm
> +	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
>  	help
>  	  Mongrel2 is an application, language, and network architecture
>  	  agnostic web server that focuses on web applications using
> 
