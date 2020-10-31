From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:55:31 +0100
Subject: [Buildroot] [PATCH 1/1] sdbus-cpp: new package
In-Reply-To: <20201029142346.144261-1-bobrofon@gmail.com>
References: <20201029142346.144261-1-bobrofon@gmail.com>
Message-ID: <20201031235531.338830a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

Thanks for this contribution. First just to make sure: this is really a
different library than package/sdbusplus/ that we already have in
Buildroot ?

The commit title should be:

	package/sdbus-cpp: new package

On Thu, 29 Oct 2020 21:23:46 +0700
Sergey Bobrenok <bobrofon@gmail.com> wrote:

> sdbus-c++ is a high-level C++ D-Bus library for Linux.
> 
> The target build produces sdbus-c++ library itself. The host build
> produces helper tool sdbus-c++-xml2cpp. sdbus-c++-xml2cpp can be used
> to generate sdbus-c++ stub .h files from xml files.
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/sdbus-cpp/Config.in      | 18 ++++++++++++++++++
>  package/sdbus-cpp/sdbus-cpp.hash |  3 +++
>  package/sdbus-cpp/sdbus-cpp.mk   | 18 ++++++++++++++++++
>  4 files changed, 40 insertions(+)

Please add an entry in the DEVELOPERS file.

> diff --git a/package/sdbus-cpp/Config.in b/package/sdbus-cpp/Config.in
> new file mode 100644
> index 0000000000..7a952d78a5
> --- /dev/null
> +++ b/package/sdbus-cpp/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_SDBUS_CPP
> +	bool "sdbus-c++"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_SYSTEMD
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	select BR2_PACKAGE_EXPAT # host package

It's only the host package that needs host-expat. Selecting
BR2_PACKAGE_EXPAT means "I need the target expat", which is not the
case here.

> +	help
> +	  sdbus-c++ is a high-level C++ D-Bus library for Linux
> +	  designed to provide expressive, easy-to-use API in modern C++.
> +
> +	  This will build the target library and the host side native
> +	  stub generator tool (sdbus-c++-xml2cpp).

No, your package as it is written today will not build the host side.

> diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
> new file mode 100644
> index 0000000000..608919a050
> --- /dev/null
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# sdbus-c++
> +#
> +################################################################################
> +
> +SDBUS_CPP_VERSION = 0.8.3
> +SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
> +SDBUS_CPP_SITE = https://github.com/Kistler-Group/sdbus-cpp/archive

These are auto-generated archives. In this case, please use our $(call
github,...) macro instead.

> +SDBUS_CPP_INSTALL_STAGING = YES
> +SDBUS_CPP_DEPENDENCIES = systemd
> +SDBUS_CPP_LICENSE = LGPL-2.1-or-later

I know LGPL-2.1-or-later is the correct SPDX encoding, but we use
LGPL-2.1+ in Buildroot, for historical reasons.

> +SDBUS_CPP_LICENSE_FILES = COPYING
> +HOST_SDBUS_CPP_SUBDIR = tools
> +HOST_SDBUS_CPP_DEPENDENCIES = host-expat
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))

Could you rework your patch and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
