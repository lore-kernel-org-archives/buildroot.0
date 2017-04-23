From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 13:59:40 +0200
Subject: [Buildroot] [PATCH v3] package: protobuf/python-protobuf: bump
 to v3.2.0.
In-Reply-To: <20170421160637.6206-1-mrugiero@gmail.com>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <20170421160637.6206-1-mrugiero@gmail.com>
Message-ID: <20170423115940.GA12996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario, All,

On 2017-04-21 13:06 -0300, mrugiero at gmail.com spake thusly:
> From: "Mario J. Rugiero" <mrugiero@gmail.com>
> 
> Both packages are coupled, so both were bumped and build-tested.
> The atomics' support patch is no longer needed, and neither is
> the autoreconf option, and SPARC64 is no longer broken.
> To make sure of this, one config of each of the following archs
> was tested (base defconfig in parens):
> PowerPC (qemu_ppc_g3beige_defconfig)
> SPARC (qemu_sparc_ss10_defconfig)
> SPARC64 (qemu_sparc64_sun4u_defconfig)

This is causing a truckload of build failures:

    http://autobuild.buildroot.org/?reason=host-protobuf-3.2.0

    http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
    http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
    http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/

And so on...

Note however that all build failures occur on Thomas' autobuilder
instance, which is running quite an old distro (on purpose).

Are there requirements about a sufficiuently recent gcc version, for
C++11 or some such?

Regards,
Yann E. MORIN.

> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---
>  ...configure.ac-check-if-libatomic-is-needed.patch | 34 ----------------------
>  package/protobuf/Config.in                         |  6 +---
>  package/protobuf/protobuf.hash                     |  2 +-
>  package/protobuf/protobuf.mk                       |  7 ++---
>  package/python-protobuf/python-protobuf.hash       |  3 +-
>  package/python-protobuf/python-protobuf.mk         |  2 +-
>  6 files changed, 8 insertions(+), 46 deletions(-)
>  delete mode 100644 package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
>  mode change 120000 => 100644 package/python-protobuf/python-protobuf.hash
> 
> diff --git a/package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch b/package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
> deleted file mode 100644
> index fffdf49fa..000000000
> --- a/package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f020fe05a20dfcd16cd7df833dcf3cdeef770538 Mon Sep 17 00:00:00 2001
> -From: Carlos Santos <casantos@datacom.ind.br>
> -Date: Thu, 11 Feb 2016 10:58:35 -0200
> -Subject: [PATCH 2/2] configure.ac: check if libatomic is needed
> -
> -Compilation of protobuf for PowerPC and SPARC may fail due to missing
> -references to __atomic_fetch_add_4 and __atomic_compare_exchange_4.
> -
> -The __atomic_*() intrinsics for all sizes are provided by libatomic when
> -gcc is >= 4.8. This can be achieved by adding this to configure.ac:
> -
> -    AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
> -
> -Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ----
> - configure.ac | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c07067c..88d4a0d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -160,6 +160,8 @@ AM_CONDITIONAL([HAVE_PTHREAD], [test "x$acx_pthread_ok" = "xyes"])
> - # We still keep this for improving pbconfig.h for unsupported platforms.
> - AC_CXX_STL_HASH
> - 
> -+AC_SEARCH_LIBS([__atomic_load_4], [atomic])
> -+
> - case "$target_os" in
> -   mingw* | cygwin* | win*)
> -     ;;
> --- 
> -2.5.0
> -
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index bece56c29..03d118cfc 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -13,10 +13,6 @@
>  # *could* technically build with gcc 4.7. This is probably not a big deal,
>  # and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
>  #
> -# The SPARC64 build fails due to a missing definition of Atomic64. This
> -# has been fixed on the master branch but the build still breaks due to
> -# undefined references to internal NoBarrier_Atomic*() functions.
> -#
>  # host-protobuf only builds on certain architectures
>  config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	bool
> @@ -24,8 +20,8 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	default y if BR2_i386
>  	default y if BR2_mipsel
>  	default y if BR2_x86_64
> +	default y if BR2_sparc64
>  	default y if BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on !BR2_sparc64 # missing definition of Atomic64
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_USE_MMU # fork()
>  
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index b681650a1..9ec6bc759 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146 protobuf-v3.0.0.tar.gz
> +sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 72930c1fe..a3e96d4f8 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,12 +7,11 @@
>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works, as they share the same
>  # version/site variables.
> -PROTOBUF_VERSION = v3.0.0
> -PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
> +PROTOBUF_VERSION = 3.2.0
> +PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
> +PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
>  PROTOBUF_LICENSE = BSD-3-Clause
>  PROTOBUF_LICENSE_FILES = LICENSE
> -# no configure script
> -PROTOBUF_AUTORECONF = YES
>  
>  # N.B. Need to use host protoc during cross compilation.
>  PROTOBUF_DEPENDENCIES = host-protobuf
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> deleted file mode 120000
> index 57a40ce5b..000000000
> --- a/package/python-protobuf/python-protobuf.hash
> +++ /dev/null
> @@ -1 +0,0 @@
> -../protobuf/protobuf.hash
> \ No newline at end of file
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> new file mode 100644
> index 000000000..c87403f24
> --- /dev/null
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 c574e2b2178ffe66599274e8cfa11ecf83799a7992be30f0b68fb33ea0a0f1af protobuf-python-3.2.0.tar.gz
> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> index 5a6488918..b91ba4933 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> -PYTHON_PROTOBUF_SOURCE = $(PROTOBUF_SOURCE)
> +PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
>  PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
>  PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
>  PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
> -- 
> 2.12.2
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
