From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:38:59 +0100
Subject: [Buildroot] [PATCH 3/3] package/sysdig: bump to version 0.26.4
In-Reply-To: <20191207191704.647337-3-fontaine.fabrice@gmail.com>
References: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
 <20191207191704.647337-3-fontaine.fabrice@gmail.com>
Message-ID: <20191208153859.7f81ef5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Dec 2019 20:17:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - License is now Apache-2.0 except driver that is MIT and GPL-2.0:
>   https://github.com/draios/sysdig/commit/e404c50c346ce1a2750446aeaac59f4062f33b0a
> - grpc is a mandatory dependency since version 0.25.0 and
>   https://github.com/draios/sysdig/commit/4362475c8a5c578c057d7ac16e453c6b2cf6c13e
> - tbb is a mandatory dependency since version 0.24.0 and
>   https://github.com/draios/sysdig/commit/69ad6dd5144cfe30b2eac5a8ef56dffd178a11a3
> - driver/driver_config.h is not prebuilt so generate it
> - Fix build with kernel >= 5.1 thanks to
>   https://github.com/draios/sysdig/commit/a6ab1e66fc05a02178e051ea2441633996d5871e
> 
> Fixes:
>  - fix build with kernel >= 5.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

A few minor comments. Since there are some issues/comments on the tbb
patch itself, I guess you could fix up the comments on this patch at
the same time.

> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 672c44d211..2471a41537 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -1,21 +1,26 @@
>  config BR2_PACKAGE_SYSDIG
>  	bool "sysdig"
>  	depends on BR2_LINUX_KERNEL
> -	depends on BR2_INSTALL_LIBSTDCPP # libjson
> +	depends on BR2_INSTALL_LIBSTDCPP # libjson, grpc -> protobuf, tbb

No need for "grpc -> protobuf", just "grpc". If we start replicating
the complete dependency chain in comments, it really becomes too much
IMO.

>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> -	depends on !BR2_STATIC_LIBS # luajit, elfutils
> +	depends on !BR2_STATIC_LIBS # luajit, elfutils, grpc -> protobuf, tbb
>  	depends on BR2_USE_WCHAR # elfutils
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # grpc -> protobuf, tbb
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_LUAJIT
>  	select BR2_PACKAGE_JSONCPP
> +	select BR2_PACKAGE_GRPC
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_JQ
>  	select BR2_PACKAGE_LIBB64
>  	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_TBB

A preliminary commit re-ordering the list of selects to be sorted
alphabetically would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
