From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 16:24:07 +0100
Subject: [Buildroot] [PATCH] dbus-cpp: new package
In-Reply-To: <1388070026-4256-1-git-send-email-gustavo@zacarias.com.ar>
References: <1388070026-4256-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131226162407.2debd602@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 26 Dec 2013 12:00:26 -0300, Gustavo Zacarias wrote:
> D-Bus C++ bindings, closes bug #65.

Wow, impressive, you even go to improvement bugs, and fix them!

> diff --git a/package/dbus-cpp/Config.in b/package/dbus-cpp/Config.in
> new file mode 100644
> index 0000000..f631ece
> --- /dev/null
> +++ b/package/dbus-cpp/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_DBUS_CPP
> +	bool "dbus-c++"
> +	depends on BR2_PACKAGE_DBUS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> +	depends on BR2_USE_MMU # dbus
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_EXPAT
> +	help
> +	  dbus-c++ attempts to provide a C++ API for D-BUS.
> +	  The library has a glib/gtk and an Ecore mainloop integration.
> +	  It also offers an optional own main loop.
> +
> +	  http://sourceforge.net/projects/dbus-cplusplus/
> +
> +comment "dbus-c++ needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_DBUS
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch b/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch
> new file mode 100644
> index 0000000..ad3046c
> --- /dev/null
> +++ b/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch
> @@ -0,0 +1,17 @@
> +Fix build failure with gcc 4.7+
> +From bugtracker: http://sourceforge.net/p/dbus-cplusplus/patches/13/
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
> +index 1b0302e..3e44304 100644
> +--- a/include/dbus-c++/eventloop-integration.h
> ++++ b/include/dbus-c++/eventloop-integration.h
> +@@ -26,6 +26,7 @@
> + #define __DBUSXX_EVENTLOOP_INTEGRATION_H
> + 
> + #include <errno.h>
> ++#include <unistd.h>
> + #include "api.h"
> + #include "dispatcher.h"
> + #include "util.h"
> diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
> new file mode 100644
> index 0000000..7936abd
> --- /dev/null
> +++ b/package/dbus-cpp/dbus-cpp.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# dbus-c++
> +#
> +################################################################################
> +
> +DBUS_CPP_VERSION = 0.9.0
> +DBUS_CPP_SITE = http://downloads.sourceforge.net/project/dbus-cplusplus/dbus-c++/$(DBUS_CPP_VERSION)
> +DBUS_CPP_SOURCE = libdbus-c++-$(DBUS_CPP_VERSION).tar.gz
> +DBUS_CPP_INSTALL_STAGING = YES
> +# expat is required for the tools irrespective of dbus xml backend
> +DBUS_CPP_DEPENDENCIES = host-dbus-cpp host-pkgconf dbus expat
> +HOST_DBUS_CPP_DEPENDENCIES = host-pkgconf host-dbus host-expat
> +DBUS_CPP_CONF_OPT = --disable-examples --disable-tests --disable-doxygen-docs \
> +	--with-build-libdbus-cxx=$(HOST_DBUS_CPP_BUILDDIR)

I'm not a big fan when building one package requires poking into the
source/build tree of another package (even if it's the host variant of
the same package). Installing the host dbus-cpp into $(HOST_DIR) isn't
sufficient to build the target dbus-cpp?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
