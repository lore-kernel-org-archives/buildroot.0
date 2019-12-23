From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:34:40 +0100
Subject: [Buildroot] [PATCH 1/1] pakcage/libasio: new package
In-Reply-To: <20191130232931.2482617-1-aduskett@gmail.com>
References: <20191130232931.2482617-1-aduskett@gmail.com>
Message-ID: <20191223203440.5b9bb215@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Minor nit: pakcage -> package in the commit title. See below for more
comments.

On Sat, 30 Nov 2019 15:29:31 -0800
aduskett at gmail.com wrote:


> diff --git a/package/libasio/0002-fix-static-linking-with-openssl-support.patch b/package/libasio/0002-fix-static-linking-with-openssl-support.patch
> new file mode 100644
> index 0000000000..e450212938
> --- /dev/null
> +++ b/package/libasio/0002-fix-static-linking-with-openssl-support.patch
> @@ -0,0 +1,30 @@
> +From 70f76fdcd127d1bd59b43f46267a21949c552026 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Sat, 30 Nov 2019 14:17:10 -0800
> +Subject: [PATCH] fix static linking with openssl support
> +
> +Dynamic builds of libcrypto would also include libz, but during static builds
> +this is not true. Always specifying -lz fixes building against static builds of
> +openssl.
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + asio/configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/asio/configure.ac b/asio/configure.ac
> +index 2e20b84..ca74108 100644
> +--- a/asio/configure.ac
> ++++ b/asio/configure.ac
> +@@ -60,7 +60,7 @@ AC_CHECK_HEADER([openssl/ssl.h],,
> + ],[])
> + 
> + if test x$OPENSSL_FOUND != xno; then
> +-  LIBS="$LIBS -lssl -lcrypto"
> ++  LIBS="$LIBS -lssl -lcrypto -lz"

It is a bit sad that this is forced in all builds. We generally handle
this either by using pkg-config in the .ac file (best) or
alternatively, by using pkg-config in the .mk file, and passing the
appropriate LIBS option in <pkg>_CONF_ENV.

However, this library is a header-only library, so it doesn't really
need to link with OpenSSL or bother with static linking issues. Only
the examples/tests need that.

So I'd say that a better solution is a patch that adds
--disable-examples/--disable-tests options, and then uses them.

> diff --git a/package/libasio/Config.in b/package/libasio/Config.in
> new file mode 100644
> index 0000000000..8689018d8a
> --- /dev/null
> +++ b/package/libasio/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_LIBASIO
> +	bool "libasio"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS

Could you explain this dependency? Indeed, this dependency is already
part of BR2_TOOLCHAIN_HAS_GCC_BUG_64735. 

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
