From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2015 09:59:55 +0100
Subject: [Buildroot] [PATCH] xc3sprog: new package
In-Reply-To: <1424339546-12050-1-git-send-email-julien.boibessot@free.fr>
References: <1424339546-12050-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20150319085955.GB4367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2015-02-19 10:52 +0100, julien.boibessot at free.fr spake thusly:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> These tools can be useful on Host during development and on target
> for BR based production testbench for example.
> Both usage were tested at Armadeus Systems.
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
[--SNIP--]
> diff --git a/package/xc3sprog/Config.in b/package/xc3sprog/Config.in
> new file mode 100644
> index 0000000..41ed939
> --- /dev/null
> +++ b/package/xc3sprog/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_XC3SPROG
> +	bool "xc3sprog"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi
> +	depends on BR2_USE_WCHAR # FILE
                             ^^^^^^
What does that mean? 'FILE' is not usual as a comment for a dependency.
Did you mean the 'file' package? If so you're not selecting it...

> +	select BR2_PACKAGE_LIBFTDI

Is it possible to use libftdi1 instead of libftdi?

(warning: if so, libftdi1 is not yet a host-package.)

> +	help
> +	  xc3sprog is a suite of utilities for programming Xilinx FPGAs, CPLDs,
> +	  and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters
> +	  under Linux (xc3sprog, xc2c_warp, readdna, bitparse, jedecparse,
> +	  srecparse, detectchain).
> +
> +	  xc3sprog depends on libftdi and so will auto-select it.

That last sentence is not needed.

> +	  http://xc3sprog.sourceforge.net/
> +
> +comment "xc3sprog needs a toolchain w/ C++, threads, wchar"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS \
> +		&& BR2_USE_WCHAR)
> diff --git a/package/xc3sprog/Config.in.host b/package/xc3sprog/Config.in.host
> new file mode 100644
> index 0000000..29a8b78
> --- /dev/null
> +++ b/package/xc3sprog/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_XC3SPROG
> +	bool "host xc3sprog"
> +	select BR2_PACKAGE_HOST_LIBFTDI
> +	help
> +	  xc3sprog is a suite of utilities for programming Xilinx FPGAs, CPLDs,
> +	  and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters
> +	  under Linux (xc3sprog, xc2c_warp, readdna, bitparse, jedecparse,
> +	  srecparse, detectchain).
> +
> +	  xc3sprog depends on libftdi and so will auto-select it.

Ditto: last sentence not needed.

Regards,
Yann E. MORIN.

> +	  http://xc3sprog.sourceforge.net/
> diff --git a/package/xc3sprog/xc3sprog.mk b/package/xc3sprog/xc3sprog.mk
> new file mode 100644
> index 0000000..1dcfeb3
> --- /dev/null
> +++ b/package/xc3sprog/xc3sprog.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# xc3sprog
> +#
> +################################################################################
> +
> +XC3SPROG_VERSION = 772
> +XC3SPROG_SITE = https://svn.code.sf.net/p/xc3sprog/code/trunk
> +XC3SPROG_SITE_METHOD = svn
> +X3CSPROG_LICENSE = GPLv2+
> +X3CSPROG_LICENSE_FILES = COPYING
> +X3CSPROG_DEPENDENCIES = libftdi host-pkgconf
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
