From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 15:30:01 +0100
Subject: [Buildroot] [PATCH/next v2 2/4] package/polkit: bump to version
 0.116
In-Reply-To: <20191124214823.2570598-3-aduskett@gmail.com>
References: <20191124214823.2570598-1-aduskett@gmail.com>
 <20191124214823.2570598-3-aduskett@gmail.com>
Message-ID: <20191125153001.03967851@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Nov 2019 13:48:21 -0800
aduskett at gmail.com wrote:

> diff --git a/package/polkit/Config.in b/package/polkit/Config.in
> index ac17cb4dc3..716fc44c93 100644
> --- a/package/polkit/Config.in
> +++ b/package/polkit/Config.in
> @@ -1,11 +1,17 @@
>  config BR2_PACKAGE_POLKIT
>  	bool "polkit"
> +	depends on BR2_INSTALL_LIBSTDCPP # spidermonkey
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # spidermonkey -> libnspr
> +	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS # spidermonkey
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # spidermonkey
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # spidermonkey -> pthread_getattr_np()
>  	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_USE_WCHAR # libglib2
> -	select BR2_PACKAGE_LIBGLIB2
> +	depends on !BR2_STATIC_LIBS # spidermonkey -> dlopen()
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # spidermonkey -> fenv

You don't really have to detail the transitive dependencies, i.e no
need to repeat dlopen(), fenv, etc.

>  	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_SPIDERMONKEY
>  	help
>  	  PolicyKit is a toolkit for defining and handling
>  	  authorizations. It is used for allowing unprivileged
> @@ -13,6 +19,10 @@ config BR2_PACKAGE_POLKIT
>  
>  	  http://www.freedesktop.org/wiki/Software/polkit
>  
> -comment "polkit needs a toolchain w/ wchar, threads"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "polkit needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
> +	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU || !BR2_USE_WCHAR
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +	!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

Please also fix this, as I reported on the spidermonkey patch.

>  # We could also support --with-authfw=pam
>  POLKIT_CONF_OPTS = \
>  	--with-authfw=shadow \
>  	--with-os-type=unknown \
>  	--disable-man-pages \
> -	--disable-examples
> +	--disable-examples \
> +	--enable-libsystemd-login=no \

	--disable-libsystemd-login

> +	--enable-libelogind=no

	--disable-libelogind

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
