From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:07:06 +0200
Subject: [Buildroot] [PATCH v2] libhttpserver: new package
In-Reply-To: <20190924122754.15416-1-stephan.hoffmann@ext.grandcentrix.net>
References: <20190924122754.15416-1-stephan.hoffmann@ext.grandcentrix.net>
Message-ID: <20190928230706.76c9a1f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Sep 2019 14:27:54 +0200
<stephan.hoffmann@ext.grandcentrix.net> wrote:

> From: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
> 
> libhttpserver is a C++ library for building high performance RESTfuls
> web servers. libhttpserver is built upon libmicrohttpd to provide a
> simple API for developers to create HTTP services in C++.
> 
> The installed pkg-config file contains an error, thus we include
> the patch 458d16b922304006fe418897044e14b0544a127a from the upstream
> repo that is not yet released.
> 
> Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>

I've applied, after making a few small changes.

First, the commit title prefix for package-related changes should
always be "package/<pkg>: <something>".

> diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
> new file mode 100644
> index 0000000000..7105dc67f2
> --- /dev/null
> +++ b/package/libhttpserver/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBHTTPSERVER
> +	bool "libhttpserver"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBMICROHTTPD
> +	help
> +	  libhttpserver is a C++ library for building high performance
> +	  RESTfuls web servers. libhttpserver is built upon
> +	  libmicrohttpd to provide a simple API for developers to
> +	  create HTTP services in C++.
> +
> +	  https://github.com/etr/libhttpserver
> +
> +comment "libhttpserver needs a toolchain w/ C++, threads"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)

We more commonly write:

	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

It is obviously exactly the same from a boolean point of view, but it's
what we use in the vast majority of packages.

> +LIBHTTPSERVER_VERSION = 0.17.5
> +LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
> +LIBHTTPSERVER_LICENSE = LGPL-2.1-or-later

We use LGPL-2.1+. I know it's not what SPDX recommends, but that's what
Buildroot uses, and we should be consistent across packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
