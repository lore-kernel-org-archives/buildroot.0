From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Feb 2018 11:02:13 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/gdb: bump to version 8.1
In-Reply-To: <20180205211015.26819-3-thomas.petazzoni@bootlin.com>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180207100213.GB2464@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-02-05 22:10 +0100, Thomas Petazzoni spake thusly:
> From: Romain Naour <romain.naour@gmail.com>
> 
> https://sourceware.org/ml/gdb-announce/2018/msg00001.html
> 
> gdb 8.1 has a new optional dependency on mpfr, which according to the
> NEWS file:
> 
>    GDB now uses the GNU MPFR library, if available, to emulate target
>    floating-point arithmetic during expression evaluation when the
>    target uses different floating-point formats than the host.  At
>    least version 3.1 of GNU MPFR is required.
> 
> So for the target gdb, this is unnecessary, and therefore we
> forcefully disable mpfr support by passing --without-mpfr.
> 
> For the host gdb, it would potentially be useful, but since it's a new
> feature that isn't essential, we for now keep it disabled as well. An
> option may be added later if needed.

Agreed.

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [Thomas: change mpfr handling.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gdb/Config.in.host | 6 ++++++
>  package/gdb/gdb.hash       | 1 +
>  package/gdb/gdb.mk         | 4 +++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 8676c6f01b..ae9a7257dd 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -64,6 +64,11 @@ config BR2_GDB_VERSION_8_0
>  	# Needs a C++11 compiler
>  	depends on BR2_HOST_GCC_AT_LEAST_4_8
>  
> +config BR2_GDB_VERSION_8_1
> +	bool "gdb 8.1.x"
> +	# Needs a C++11 compiler
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8

And there you would have added:

    select BR2_PACKAGE_GDB_NEEDS_CXX11

Otherwise;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +
>  endchoice
>  
>  endif
> @@ -76,4 +81,5 @@ config BR2_GDB_VERSION
>  	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
>  	default "7.12.1"   if BR2_GDB_VERSION_7_12
>  	default "8.0.1"    if BR2_GDB_VERSION_8_0
> +	default "8.1"      if BR2_GDB_VERSION_8_1
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index 62edd93792..3af72db23d 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -3,6 +3,7 @@ sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe5049
>  sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
>  sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
>  sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
> +sha512  ffd82f415d7652d62dad1716c307836f594217a363429609beb7d70239e8bf06b73b393345b0e000796228e56681ed7656ac3c8be05e91d6d652ab0d5b1dc357	gdb-8.1.tar.xz
>  
>  # Locally calculated (fetched from Github)
>  sha512  e57582766e7d510b26bea63606429e6289414c31c60e28fef24d3d82fa20fb5a1f92b3831fde53e4f7c178c9e099609d3292628cf921a99109e297af4e5f83d9 	gdb-arc-2017.09-release-gdb.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 5ca464ad46..4aa1a42b0a 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -113,7 +113,8 @@ GDB_CONF_OPTS = \
>  	--with-curses \
>  	--without-included-gettext \
>  	--disable-werror \
> -	--enable-static
> +	--enable-static \
> +	--without-mpfr
>  
>  # When gdb is built as C++ application for ARC it segfaults at runtime
>  # So we pass --disable-build-with-cxx config option to force gdb not to
> @@ -200,6 +201,7 @@ HOST_GDB_CONF_OPTS = \
>  	--disable-werror \
>  	--without-included-gettext \
>  	--with-curses \
> +	--without-mpfr \
>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
>  
>  ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
