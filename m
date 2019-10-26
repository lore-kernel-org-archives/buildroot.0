From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:47:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/uvw: new package
In-Reply-To: <20191026133844.10536-1-asafka7@gmail.com>
References: <20191026133844.10536-1-asafka7@gmail.com>
Message-ID: <20191026154736.5858f89d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Sat, 26 Oct 2019 16:38:44 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> diff --git a/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch b/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
> new file mode 100644
> index 0000000000..01068d0427
> --- /dev/null
> +++ b/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
> @@ -0,0 +1,32 @@
> +From 1d784a0067b7123971c834c77f4f137acca56ae6 Mon Sep 17 00:00:00 2001
> +From: Asaf Kahlon <asafka7@gmail.com>
> +Date: Fri, 25 Oct 2019 19:09:14 +0300
> +Subject: [PATCH 1/1] CMakeLists.txt: allow in-tree build
> +
> +Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Any reason for this instead of:

UVW_SUPPORTS_IN_SOURCE_BUILD = NO

 ?


> diff --git a/package/uvw/Config.in b/package/uvw/Config.in
> new file mode 100644
> index 0000000000..c539693831
> --- /dev/null
> +++ b/package/uvw/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_UVW
> +	bool "uvw"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on BR2_USE_MMU # libuv
> +	depends on !BR2_STATIC_LIBS # libuv
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	select BR2_PACKAGE_LIBUV
> +	help
> +	  Header-only, event based, tiny and easy to use
> +	  libuv wrapper in modern C++.
> +
> +	  https://github.com/skypjack/uvw
> +
> +comment "uvw needs a toolchain w/ NPTL, dynamic library, gcc >= 7"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7

The gcc 7.x conditions should be OR'ed with the NPTL and dynamic
library condition.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
