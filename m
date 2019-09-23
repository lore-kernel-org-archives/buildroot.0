From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 15:56:23 +0200
Subject: [Buildroot] [PATCH] libhttpserver: new package
In-Reply-To: <20190923115237.4524-1-stephan.hoffmann@ext.grandcentrix.net>
References: <20190923115237.4524-1-stephan.hoffmann@ext.grandcentrix.net>
Message-ID: <20190923155623.711a3539@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephan,

Thanks for this contribution! It looks mostly good, but I have a few
comments below.

On Mon, 23 Sep 2019 13:52:37 +0200
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
> ---
>  package/Config.in                             |  1 +
>  ...-expectations-in-libhttpserver.pc.in.patch | 24 +++++++++++++++++++
>  package/libhttpserver/Config.in               | 14 +++++++++++
>  package/libhttpserver/libhttpserver.hash      |  2 ++
>  package/libhttpserver/libhttpserver.mk        | 16 +++++++++++++
>  5 files changed, 57 insertions(+)

Could you add an entry in the DEVELOPERS file for this package? This
way, you'll receive notifications about build issues of this package,
as well as when a new upstream release is available.

> diff --git a/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
> new file mode 100644
> index 0000000000..e0ca5575dc
> --- /dev/null
> +++ b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
> @@ -0,0 +1,24 @@
> +From 2bc7cf0beb6b8a124c1c7360c4fb5279e8763f07 Mon Sep 17 00:00:00 2001
> +From: Sebastiano Merlino <electrictwister2000@gmail.com>
> +Date: Sat, 8 Jun 2019 15:36:06 -0700
> +Subject: [PATCH] Fix lib expectations in libhttpserver.pc.in
> +

We need a Signed-off-by line (at least from you) in this patch. Also,
if it comes from upstream, a link to the upstream commit is good to
have.


> diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
> new file mode 100644
> index 0000000000..526ca7c41e
> --- /dev/null
> +++ b/package/libhttpserver/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBHTTPSERVER
> +	bool "libhttpserver"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBMICROHTTPD

Since you select BR2_PACKAGE_LIBMICROHTTPD, you need to replicate the
"depends on" of BR2_PACKAGE_LIBMICROHTTPD, i.e
BR2_TOOLCHAIN_HAS_THREADS.

> +	help
> +	  libhttpserver is a C++ library for building high performance
> +	  RESTfuls web servers. libhttpserver is built upon
> +	  libmicrohttpd to provide a simple API for developers to
> +	  create HTTP services in C++.
> +
> +	  https://github.com/etr/libhttpserver
> +
> +comment "libhttpserver needs a toolchain w/ c++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

.. and update this comment. Also we write "C++" and not "c++" in those
comments.

> diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
> new file mode 100644
> index 0000000000..5561c3d917
> --- /dev/null
> +++ b/package/libhttpserver/libhttpserver.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 778fa0aec199bf8737b2d540c2563a694c18957329f9885e372f7aaafb838351 libhttpserver-0.17.5.tar.gz

Please add the hash of the license file as well.

> diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
> new file mode 100644
> index 0000000000..e46271d7d9
> --- /dev/null
> +++ b/package/libhttpserver/libhttpserver.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libhttpserver
> +#
> +################################################################################
> +
> +LIBHTTPSERVER_VERSION = 0.17.5
> +LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
> +LIBHTTPSERVER_LICENSE = LGPL-2.1-or-later
> +LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
> +LIBHTTPSERVER_INSTALL_STAGING = YES
> +LIBHTTPSERVER_CONF_OPTS += --enable-same-directory-build

You can make the += just a = since it's unconditional.

> +LIBHTTPSERVER_AUTORECONF = YES
> +LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
> +
> +$(eval $(autotools-package))

Could you address those minor details and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
