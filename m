From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 23:23:31 +0100
Subject: [Buildroot] [PATCH v4] remmina: new package
In-Reply-To: <1441118174-9899-1-git-send-email-fancp2007@gmail.com>
References: <1441118174-9899-1-git-send-email-fancp2007@gmail.com>
Message-ID: <20151229232331.30c477a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

On Tue,  1 Sep 2015 22:36:14 +0800, Scott Fan wrote:
> Remmina is a remote desktop client written in GTK+.
> Currently RDP, VNC, NX, XDMCP and SSH are supported.
> 
> http://remmina.sourceforge.net/
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

It's been a long while, so I wanted to get back to your patch.
Unfortunately, it doesn't build properly:

-- Checking for module 'freerdp>=1.0'
--   Found freerdp, version 1.2.5-dev
CMake Error at /home/test/buildroot/output/host/usr/share/cmake-3.4/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
  Could NOT find FREERDP (missing: FREERDP_LIBRARY)
Call Stack (most recent call first):
  /home/test/buildroot/output/host/usr/share/cmake-3.4/Modules/FindPackageHandleStandardArgs.cmake:388 (_FPHSA_FAILURE_MESSAGE)
  cmake/FindFREERDP.cmake:47 (find_package_handle_standard_args)
  cmake/FindOptionalPackage.cmake:37 (find_package)
  remmina-plugins/CMakeLists.txt:59 (find_suggested_package)

It might be due to the fact that we updated freerdp in the mean time,
I'm not sure. You can reproduce this failure by building the following
configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_REMMINA=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LIBGTK3=y
# BR2_TARGET_ROOTFS_TAR is not set

> diff --git a/package/remmina/Config.in b/package/remmina/Config.in
> new file mode 100644
> index 0000000..e82f31b
> --- /dev/null
> +++ b/package/remmina/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_REMMINA
> +	bool "remmina"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_LIBGTK3

Since you also select some X11 library, I guess this package will only
work with the X11 backend of GTK3, so presumably, you need:

	depends on BR2_PACKAGE_LIBGTK3_X11

> +	depends on BR2_USE_MMU # libvncserver depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR # freerdp
> +	depends on !BR2_STATIC_LIBS # freerdp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # freerdp
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXKBFILE
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBSSH

Is LIBSSH really mandatory? CMake says:

-- Finding suggested package LIBSSH.
--   Disable this using "-DWITH_LIBSSH=OFF".

> +	select BR2_PACKAGE_LIBVNCSERVER
> +	select BR2_PACKAGE_FREERDP
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT

Is gettext really mandatory ? CMake says:

-- Finding suggested package Gettext.
--   Disable this using "-DWITH_GETTEXT=OFF".
-- Found Gettext: /home/test/buildroot/output/host/usr/bin/msgmerge (found version "0.19.7") 

> diff --git a/package/remmina/remmina.mk b/package/remmina/remmina.mk
> new file mode 100644
> index 0000000..0ac5fd0
> --- /dev/null
> +++ b/package/remmina/remmina.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# remmina
> +#
> +################################################################################
> +
> +REMMINA_VERSION = v1.1.2
> +REMMINA_SITE = $(call github,FreeRDP,Remmina,$(REMMINA_VERSION))

We now would like to have hash files even for github sourced packages.
So if you could add a hash file, it would be good.

> +REMMINA_LICENSE = GPLv2+ with OpenSSL exception
> +REMMINA_LICENSE_FILES = COPYING LICENSE LICENSE.OpenSSL
> +
> +REMMINA_CONF_OPTS = \
> +	-DWITH_AVAHI=OFF \
> +	-DWITH_APPINDICATOR=OFF \
> +	-DWITH_GNOMEKEYRING=OFF \
> +	-DWITH_TELEPATHY=OFF \
> +	-DWITH_VTE=OFF
> +
> +REMMINA_DEPENDENCIES = \
> +	libgtk3 libgcrypt libssh libvncserver freerdp \
> +	xlib_libX11 xlib_libXext xlib_libxkbfile
> +
> +ifeq ($(BR2_NEEDS_GETTEXT),y)
> +REMMINA_DEPENDENCIES += gettext
> +
> +define REMMINA_POST_PATCH_FIXINTL
> +	$(SED) 's/$${GTK_LIBRARIES}/$${GTK_LIBRARIES} -lintl/' \
> +		$(@D)/remmina/CMakeLists.txt

I think the package should rather use the FindIntl() function provided
by CMake, see https://cmake.org/cmake/help/v3.3/module/FindIntl.html,
by doing:

find_package(Intl)

This is probably something you can bring upstream to the Remmina
developers. In the mean time, we can live with the $(SED) hack you
proposed.

Could you rework the patch to address the various comments, and send an
updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
