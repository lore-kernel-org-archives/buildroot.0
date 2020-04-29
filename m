From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 15:08:27 +0200
Subject: [Buildroot] [PATCH] package/cunit: switch to maintain fork
 version 3.2.6
In-Reply-To: <20200428221018.1317-1-ryan.barnett@rockwellcollins.com>
References: <20200428221018.1317-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20200429150827.20ac5a0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Apr 2020 17:10:18 -0500
Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:

> Changes which were made to the package include:
> 
>  * Switch to CMake build system
>  * Requires BR2_USE_MMU for '-rdynamic' (CMake test)

-rdynamic is more related to shared libraries than MMU support. You can
have a pure static library system on a MMU-capable system, and some
no-MMU platforms support shared libraries.

> diff --git a/package/cunit/Config.in b/package/cunit/Config.in
> index 8bcfa2a4ec..53d8be2307 100644
> --- a/package/cunit/Config.in
> +++ b/package/cunit/Config.in
> @@ -1,6 +1,12 @@
>  config BR2_PACKAGE_CUNIT
>  	bool "cunit"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU
>  	help
> -	  An automated testing framework in 'C'.
> +	  An automated testing framework in 'C' forked from the
> +	  Sourceforge CUnit which is currently unmaintained.
>  
> -	  http://cunit.sourceforge.net/
> +	  https://gitlab.com/cunity/cunit
> +
> +comment "cunit needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

This comment would have required a "depends on BR2_USE_MMU". But most
likely, it will be a !BR2_STATIC_LIBS dependency instead.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
