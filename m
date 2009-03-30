From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2009 15:32:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
 external-toolchain gcc uClibc
In-Reply-To: <20090130162827.2A05D765E9@busybox.osuosl.org>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
Message-ID: <20090330153259.0a7ee398@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry for coming back to this change so late, but I don't really agree
with the change (or at least don't understand why it was done).

I initially split the BR2_LARGEFILE, BR2_INET_RPC, BR2_INET_IPV6,
BR2_ENABLE_LOCALE options in two files, so that the description would
be different depending on whether you're using a Buildroot toolchain or
an external toolchain.

Currently, users using the external toolchain have to answer the
following misleading options :

 [ ] Enable largefile support
 [ ] Enable IPV6
 [ ] Enable RPC
 [ ] Enable locale support

They are misleading because these options cannot be enabled/disabled:
the external toolchain has already been compiled. However, they must
be set *according* to how the external toolchain was compiled.

I'm sure there was an issue with how I solved this problem, but I don't
see which one. Could you explain it again ?

Thanks!

Thomas

Le Fri, 30 Jan 2009 16:28:26 +0000 (UTC),
laird at uclibc.org a ?crit :

> Author: laird
> Date: 2009-01-30 16:28:26 +0000 (Fri, 30 Jan 2009)
> New Revision: 25170
> 
> Log:
> Extend External Toolchain options (match buildroot built toolchain): 
> 
> Have added options that mean you can set the same BR2_XXXX variables
> for external toolchain and internal (buildroot built) toolchain.
> 
> This means the same set of packages can be built now me as for
> you.....
> 
> Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>
> 
> 
> 
> Modified:
>    trunk/buildroot/toolchain/Config.in.2
>    trunk/buildroot/toolchain/binutils/Config.in
>    trunk/buildroot/toolchain/external-toolchain/Config.in.2
>    trunk/buildroot/toolchain/gcc/Config.in
>    trunk/buildroot/toolchain/uClibc/Config.in
> 
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/Config.in.2
> ===================================================================
> --- trunk/buildroot/toolchain/Config.in.2	2009-01-30 14:41:04
> UTC (rev 25169) +++ trunk/buildroot/toolchain/Config.in.2
> 2009-01-30 16:28:26 UTC (rev 25170) @@ -1,35 +1,56 @@
>  #
> -
> -if BR2_TOOLCHAIN_SOURCE
> -source "toolchain/elf2flt/Config.in"
> -source "toolchain/mklibs/Config.in"
> -source "toolchain/sstrip/Config.in"
> -
> -config BR2_ENABLE_MULTILIB
> -	bool "Enable multilib support?"
> -	help
> -	    Build libraries to support different ABIs.
> -
>  config BR2_LARGEFILE
>  	bool "Enable large file (files > 2 GB) support?"
>  	depends on !BR2_cris
>  	help
> -	    Enable large file (files > 2 GB) support
> +	  If you are building your own toolchain and you want to 
> +	  support files larger than 2GB then enable this option.
> +	  If you have an external binary toolchain that has been 
> +	  built with large file support (files > 2GB) then enable 
> +	  this option.
>  
>  config BR2_INET_IPV6
>  	bool "Enable IPv6"
>  	help
> -	    Enable IPv6.
> +	  If you are building your own toolchain and you want to 
> +	  enable IPV6 support then enable this option.
> +	  If you have an external binary toolchain that has been 
> +	  built with IPV6 support then enable this option.
>  
>  config BR2_INET_RPC
>  	bool "Enable RPC"
>  	help
> -	    Enable RPC. RPC support is needed for nfs.
> +	  Enable RPC. RPC support is needed for nfs.
> +	  If you are building your own toolchain and you want to 
> +	  enable RPC support then enable this option.
> +	  If you have an external binary toolchain that has been 
> +	  built with RPC support then enable this option.
>  
> +config BR2_ENABLE_LOCALE
> +	bool "Enable locale/gettext/i18n support?"
> +	help
> +	  If you are building your own toolchain and you want to 
> +	  enable locale/gettext/i18n support then enable this option.
> +	  If you have an external binary toolchain that has been 
> +	  built with locale/gettext/i18n support then enable this
> option. +
> +config BR2_ENABLE_LOCALE_PREGENERATED
> +	bool "Use pregenerated locale data?"
> +	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_SOURCE
> +	help
> +	  Instead of generating the locale data locally you can
> optionally
> +	  download a pregenerated set of locales.
> +
> +	  Say N here unless your buildhost lacks locale support and
> you
> +	  desparately want to use internationalization on your
> target. +
>  config BR2_USE_WCHAR
>  	bool "Enable WCHAR support"
>  	help
> -	  Enable WCHAR. WCHAR support is needed for several packages
> +	  If you are building your own toolchain and you want to 
> +	  enable WCHAR support then enable this option.
> +	  If you have an external binary toolchain that has been
> built 
> +	  with WCHAR support then enable this option.
>  
>  config BR2_SOFT_FLOAT
>  	bool "Use software floating point by default"
> @@ -42,6 +63,66 @@
>  
>  	  Most people will answer N.
>  
> +choice
> +	prompt "Thread library implementation"
> +	default BR2_PTHREADS_OLD
> +	help
> +	  If you are building your own toolchain then select the
> type of 
> +	  libpthreads you want to use.
> +	  Not all thread variants work with all versions of uClibc,
> +	  the "linuxthreads (stable/old)" may be a working fallback
> +	  if you need threading at all.
> +	  If you have an external binary toolchain then select the
> type 
> +	  of libpthreads it was built with.
> +
> +	config BR2_PTHREADS_NONE
> +		bool "none"
> +
> +	config BR2_PTHREADS
> +		bool "linuxthreads"
> +
> +	config BR2_PTHREADS_OLD
> +		bool "linuxthreads (stable/old)"
> +
> +	config BR2_PTHREADS_NATIVE
> +		bool "Native POSIX Threading (NPTL)"
> +endchoice
> +
> +config BR2_GCC_CROSS_CXX
> +	bool
> +	help
> +	  If you are building your own toolchain and want to build 
> +	  a C++ cross-compiler this needs to be enabled.
> +	  If you have an external binary toolchain that has a C++
> compiler
> +	  and you want to use it then you need to enable this option.
> +
> +config BR2_INSTALL_LIBSTDCPP
> +	bool "Build/install c++ compiler and libstdc++?"
> +	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT &&
> BR2_TOOLCHAIN_SOURCE)
> +	select BR2_GCC_CROSS_CXX
> +	help
> +	  If you are building your own toolchain and want to build
> and install
> +	  the C++ compiler and library then you need to enable this
> option.
> +	  If you have an external toolchain that has been built with
> C++ 
> +	  support and you want to use the compiler / library then
> you need 
> +	  to select this option.
> +
> +config BR2_TARGET_OPTIMIZATION
> +	string "Target Optimizations"
> +	default "-Os -pipe"
> +	help
> +	  Optimizations to use when building for the target host.
> +
> +if BR2_TOOLCHAIN_SOURCE
> +source "toolchain/elf2flt/Config.in"
> +source "toolchain/mklibs/Config.in"
> +source "toolchain/sstrip/Config.in"
> +
> +config BR2_ENABLE_MULTILIB
> +	bool "Enable multilib support?"
> +	help
> +	    Build libraries to support different ABIs.
> +
>  config BR2_VFP_FLOAT
>  	bool "Use ARM Vector Floating Point unit"
>  	depends on !BR2_SOFT_FLOAT
> @@ -54,12 +135,6 @@
>  	  
>  	  Most people will answer N.
>  
> -config BR2_TARGET_OPTIMIZATION
> -	string "Target Optimizations"
> -	default "-Os -pipe"
> -	help
> -	  Optimizations to use when building for the target host.
> -
>  config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
>  	bool "Include target utils in cross toolchain"
>  	default y
> 
> Modified: trunk/buildroot/toolchain/binutils/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/binutils/Config.in	2009-01-30
> 14:41:04 UTC (rev 25169) +++
> trunk/buildroot/toolchain/binutils/Config.in	2009-01-30
> 16:28:26 UTC (rev 25170) @@ -13,7 +13,6 @@ depends on BR2_DEPRECATED
> || (BR2_avr32 && BR2_EXT_BINUTILS_VERSION_2_17) bool "binutils 2.17"
>  
> -
>  	config BR2_BINUTILS_VERSION_2_17_50_0_17
>  		depends on !BR2_avr32 && !BR2_nios2
>  		depends on BR2_DEPRECATED
> 
> Modified: trunk/buildroot/toolchain/external-toolchain/Config.in.2
> ===================================================================
> --- trunk/buildroot/toolchain/external-toolchain/Config.in.2
> 2009-01-30 14:41:04 UTC (rev 25169) +++
> trunk/buildroot/toolchain/external-toolchain/Config.in.2
> 2009-01-30 16:28:26 UTC (rev 25170) @@ -14,64 +14,4 @@ This the the
> external toolchain prefix. For example: armeb-unknown-linux-gnu,
> mipsel-unknown-linux-gnu, etc. 
> -choice
> -	prompt "Thread library implementation"
> -	default BR2_EXT_PTHREADS_OLD
> -	help
> -	  Select the version of libpthreads used in the external
> toolchain. -
> -	config BR2_EXT_PTHREADS_NONE
> -		bool
> -		prompt "none"
> -
> -	config BR2_EXT_PTHREADS
> -		bool
> -		prompt "linuxthreads"
> -
> -	config BR2_EXT_PTHREADS_OLD
> -		bool
> -		prompt "linuxthreads (stable/old)"
> -
> -	config BR2_EXT_PTHREADS_NATIVE
> -		bool
> -		prompt "Native POSIX Threading (NPTL)"
> -endchoice
> -
> -config BR2_LARGEFILE
> -	bool "Toolchain supports large files (> 2 GB) ?"
> -	depends on !BR2_cris
> -	default y
> -	help
> -	  Set this option if the external toolchain supports large
> -	  files (> 2 GB)
> -
> -
> -config BR2_INET_IPV6
> -	bool "Toolchain supports IPv6 ?"
> -	help
> -	  Set this option if the external toolchain supports IPv6.
> -
> -config BR2_INET_RPC
> -	bool "Toolchain supports RPC ?"
> -	help
> -	  Set this option if the external toolchain supports RPC.
> -
> -config BR2_SOFT_FLOAT
> -	bool "Toolchain supports soft float ?"
> -	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel ||
> BR2_powerpc
> -	help
> -	  Set this option if the external toolchain supports soft
> float. -
> -config BR2_GCC_CROSS_CXX
> -	bool "Toolchain has C++ cross-compiler ?"
> -	help
> -	  Set this option if the external toolchain has a C++
> -	  cross-compiler.
> -
> -config BR2_TARGET_OPTIMIZATION
> -	string "Target Optimizations"
> -	default "-Os -pipe"
> -	help
> -	  Optimizations to use when building for the target host.
> -
>  endif
> 
> Modified: trunk/buildroot/toolchain/gcc/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/gcc/Config.in	2009-01-30
> 14:41:04 UTC (rev 25169) +++
> trunk/buildroot/toolchain/gcc/Config.in	2009-01-30 16:28:26
> UTC (rev 25170) @@ -125,25 +125,12 @@ help
>  	  Any additional gcc configure options you may want to
> include.... 
> -config BR2_GCC_CROSS_CXX
> -	bool "C++ cross-compiler support"
> -	help
> -	  Build a C++ cross-compiler
> -
>  config BR2_GCC_CROSS_FORTRAN
>  	bool "Fortran cross-compiler support"
>  	depends on !BR2_avr32
>  	help
>  	  Build a Fortran cross-compiler
>  
> -config BR2_INSTALL_LIBSTDCPP
> -	bool "Build/install c++ compiler and libstdc++?"
> -	# >= 4.2.0 work fine without LARGEFILE
> -	select BR2_LARGEFILE if !BR2_GCC_SUPPORTS_SYSROOT
> -	select BR2_GCC_CROSS_CXX
> -	help
> -	  Build/install c++ compiler and libstdc++?
> -
>  config BR2_INSTALL_LIBGCJ
>  	bool "Build/install java compiler and libgcj?"
>  	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
> 
> Modified: trunk/buildroot/toolchain/uClibc/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/uClibc/Config.in	2009-01-30
> 14:41:04 UTC (rev 25169) +++
> trunk/buildroot/toolchain/uClibc/Config.in	2009-01-30 16:28:26
> UTC (rev 25170) @@ -48,43 +48,6 @@ See also docs/README in this
> package. If unsure, use the default.
>  
> -config BR2_ENABLE_LOCALE
> -	bool "Enable locale/gettext/i18n support?"
> -	help
> -	  Enable locale/gettext/i18n support?
> -
> -config BR2_ENABLE_LOCALE_PREGENERATED
> -	bool "Use pregenerated locale data?"
> -	depends on BR2_ENABLE_LOCALE
> -	help
> -	  Instead of generating the locale data locally you can
> optionally
> -	  download a pregenerated set of locales.
> -
> -	  Say N here unless your buildhost lacks locale support and
> you
> -	  desparately want to use internationalization on your
> target. -
> -choice
> -	prompt "Thread library implementation"
> -	default BR2_PTHREADS_OLD
> -	help
> -	  Select the version of libpthreads you want to use.
> -	  Not all thread variants work with all versions of uClibc,
> -	  the "linuxthreads (stable/old)" may be a working fallback
> -	  if you need threading at all.
> -
> -	config BR2_PTHREADS_NONE
> -		bool "none"
> -
> -	config BR2_PTHREADS
> -		bool "linuxthreads"
> -
> -	config BR2_PTHREADS_OLD
> -		bool "linuxthreads (stable/old)"
> -
> -	config BR2_PTHREADS_NATIVE
> -		bool "Native POSIX Threading (NPTL)"
> -endchoice
> -
>  config BR2_PTHREAD_DEBUG
>  	bool "Thread library debugging"
>  	depends on BR2_PTHREADS || BR2_PTHREADS_OLD ||
> BR2_PTHREADS_NATIVE
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
