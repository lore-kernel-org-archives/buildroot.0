From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 16:51:27 +0100
Subject: [Buildroot] [PATCH v1 3/3] efibootmrg: Allow build with uClibc
In-Reply-To: <20161127143204.116740-4-andriy.shevchenko@linux.intel.com>
References: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
 <20161127143204.116740-4-andriy.shevchenko@linux.intel.com>
Message-ID: <20161127165127.1bfaa10c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 16:32:04 +0200, Andy Shevchenko wrote:
> Details at https://github.com/rhinstaller/efibootmgr/issues/61.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to next, after fixing a few issues, see below.

> diff --git a/package/efibootmgr/0001-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
> new file mode 100644
> index 0000000..1e3f9ec
> --- /dev/null
> +++ b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
> @@ -0,0 +1,38 @@
> +From bbfcc60497c326576bb23cb01d90115ef3cf6947 Mon Sep 17 00:00:00 2001
> +From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> +Date: Fri, 25 Nov 2016 20:26:52 +0200
> +Subject: [PATCH 1/1] Allow build with uClibc

[PATCH] instead of [PATCH 1/1]

Also, the subject "Allow build with uClibc" is not quite correct, it's
more "Remove unneeded header includes".

> diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
> index 988bf6d..8860e5d 100644
> --- a/package/efibootmgr/Config.in
> +++ b/package/efibootmgr/Config.in
> @@ -1,10 +1,10 @@
>  config BR2_PACKAGE_EFIBOOTMGR
>  	bool "efibootmgr"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
> -	depends on BR2_TOOLCHAIN_USES_GLIBC # efivar

Wrong, efivar still depends on !BR2_TOOLCHAIN_USES_MUSL

>  comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"

You forgot to update this comment, so I did it.

>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> -		!BR2_TOOLCHAIN_USES_GLIBC || \\

Here, I changed to:

		BR2_TOOLCHAIN_USES_MUSL

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
