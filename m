From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:56:46 +0200
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.23.1
In-Reply-To: <1534399959-15617-1-git-send-email-angelo@amarulasolutions.com>
References: <1534399959-15617-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180816115646.58f52f54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 08:12:39 +0200, Angelo Compagnucci wrote:
> This patch bumps sysdig to version 0.23.1, adds a new dependency on
> elfutils and adds hash for the license file.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I've applied to next. However, there was still a bug.

> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 6ccb706..49ebb6e 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -4,7 +4,9 @@ config BR2_PACKAGE_SYSDIG
>  	depends on BR2_INSTALL_LIBSTDCPP # libjson
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> -	depends on !BR2_STATIC_LIBS # luajit
> +	depends on !BR2_STATIC_LIBS # luajit, elfutils
> +	depends on BR2_USE_WCHAR # elfutils
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_LUAJIT
>  	select BR2_PACKAGE_JSONCPP
> @@ -13,6 +15,7 @@ config BR2_PACKAGE_SYSDIG
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_JQ
>  	select BR2_PACKAGE_LIBB64
> +	select BR2_PACKAGE_ELFUTILS
>  	help
>  	  Sysdig is open source, system-level exploration:
>  	  capture system state and activity from a running Linux
> @@ -22,7 +25,8 @@ config BR2_PACKAGE_SYSDIG
>  
>  	  http://sysdig.org
>  
> -comment "sysdig needs a toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
> +comment "sysdig needs a toolchain w/ C++, gcc >= 4.8, dynamic library, uclibc or glibc and a Linux kernel to be built"
>  	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
> +		|| !BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_USES_GLIBC

The opposite of:

  BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC

is not:

  !BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_USES_GLIBC

Indeed, with this expression, if glibc is used,
BR2_TOOLCHAIN_USES_UCLIBC is false,
therefore !BR2_TOOLCHAIN_USES_UCLIBC is true, and the comment is
displayed... even if you're using glibc, which is a valid configuration!

The proper expression is:

  !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

In this case, if you use glibc, BR2_TOOLCHAIN_USES_UCLIBC ||
BR2_TOOLCHAIN_USES_GLIBC is true, and therefore the overall expression
is false, and the comment is not displayed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
