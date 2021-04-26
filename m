From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:51:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/libgeos: use specific bug
 instead of BR2_nios2 to disable package
In-Reply-To: <20210317163459.1916948-2-giulio.benetti@benettiengineering.com>
References: <20210314233231.351fce1c@windsurf.home>
 <20210317163459.1916948-1-giulio.benetti@benettiengineering.com>
 <20210317163459.1916948-2-giulio.benetti@benettiengineering.com>
Message-ID: <1e867adb-5f08-de1e-f187-cc04a2f28d12@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/03/2021 17:34, Giulio Benetti wrote:
> Let's use the _BUG_ form for disabling this package instead of BR2_nios2
> architecture as we already use it for other packages.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

 Applied to master, thanks. I made the following changes:

     - put 27597 after 21464 instead of before it;
     - propagate dependency to postgis;
     - mention the bugs in the comments.

postgis didn't exist yet at the time so that's no surpise... The rest is nitpicking.


 Regards,
 Arnout

> ---
>  package/libgeos/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
> index bbcafe7740..8759d2011e 100644
> --- a/package/libgeos/Config.in
> +++ b/package/libgeos/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGEOS
>  	bool "libgeos"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on !BR2_nios2
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
>  	help
>  	  GEOS (Geometry Engine - Open Source) is a C++ port of the
> @@ -14,5 +14,6 @@ config BR2_PACKAGE_LIBGEOS
>  	  https://trac.osgeo.org/geos
>  
>  comment "libgeos needs a toolchain w/ C++, wchar"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> -	depends on !BR2_nios2 || !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
> +		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
> 
