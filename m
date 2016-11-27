From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 16:50:15 +0100
Subject: [Buildroot] [PATCH v1 2/3] efivar: allow build with uClibc
In-Reply-To: <20161127143204.116740-3-andriy.shevchenko@linux.intel.com>
References: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
 <20161127143204.116740-3-andriy.shevchenko@linux.intel.com>
Message-ID: <20161127165015.6cd4680d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 16:32:03 +0200, Andy Shevchenko wrote:
> Details at https://github.com/rhinstaller/efivar/issues/76.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I've applied to next, but several things were wrong in there, see below.

> +++ b/package/efivar/0002-Allow-build-with-uClibc.patch
> @@ -0,0 +1,38 @@
> +From 2255601757a8a58baddad2d37d0bcc6b003a3732 Mon Sep 17 00:00:00 2001
> +From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> +Date: Fri, 25 Nov 2016 19:42:27 +0200
> +Subject: [PATCH 2/2] Allow build with uClibc

[PATCH] instead of [PATCH 2/2].

Also, please submit this patch upstream if not already done.

> diff --git a/package/efivar/Config.in b/package/efivar/Config.in
> index 466a30a..5fd3360 100644
> --- a/package/efivar/Config.in
> +++ b/package/efivar/Config.in
> @@ -11,7 +11,6 @@ config BR2_PACKAGE_EFIVAR
>  		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
>  	# doesn't build with uclibc due to lack of uchar.h
>  	# doesn't build with musl due to lack of __bswap_constant_16
> -	depends on BR2_TOOLCHAIN_USES_GLIBC

Then what about musl? The build on musl continues to fail, so I've
changed this to:

	depends on !BR2_TOOLCHAIN_USES_MUSL

>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	select BR2_PACKAGE_POPT
>  	help
> @@ -21,7 +20,6 @@ config BR2_PACKAGE_EFIVAR
>  
>  comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"

You forgot to update this comment, so I did it.

>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> -		!BR2_TOOLCHAIN_USES_GLIBC || \

And I changed this to:
		BR2_TOOLCHAIN_USES_MUSL || \

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
