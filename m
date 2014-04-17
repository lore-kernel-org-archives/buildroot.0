From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:36:47 +0200
Subject: [Buildroot] [PATCH v5 4/8] libva-intel-driver: new package
In-Reply-To: <1396588694-6377-5-git-send-email-bernd.kuhls@t-online.de>
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
 <1396588694-6377-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140417223647.47cdad60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  4 Apr 2014 07:18:10 +0200, Bernd Kuhls wrote:

> diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
> new file mode 100644
> index 0000000..343f45f
> --- /dev/null
> +++ b/package/libva-intel-driver/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LIBVA_INTEL_DRIVER
> +	bool "libva-intel-driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBVA
> +	depends on BR2_PACKAGE_XORG7

In fact, in the libva package, you should maybe use:

	select BR2_PACKAGE_XLIB_<foo> if BR2_PACKAGE_XORG7

Here, I'm not sure about the dependencies. Maybe we want to:

	select BR2_PACKAGE_LIBVA
	select BR2_PACKAGE_LIBDRM
	select BR2_PACKAGE_LIBDRM_INTEL

of course, don't forget to propagate the dependencies of libva and
libdrm.

X.org can remain a "depends on".

> +	select BR2_PACKAGE_LIBDRM_INTEL
> +	help
> +	  VA-API back-end driver for Intel graphics chips
> +
> +	  https://01.org/linuxgraphics/community/vaapi
> +
> +comment "libva intel driver depends on libva & X.org"
> +	depends on !BR2_PACKAGE_LIBVA || !BR2_PACKAGE_XORG7
> diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
> new file mode 100644
> index 0000000..86d2dcc
> --- /dev/null
> +++ b/package/libva-intel-driver/libva-intel-driver.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# libva-intel-driver
> +#
> +################################################################################
> +
> +LIBVA_INTEL_DRIVER_VERSION = 1.3.0
> +LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
> +LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
> +LIBVA_INTEL_DRIVER_LICENSE = MIT

LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING

> +LIBVA_INTEL_DRIVER_DEPENDENCIES = libva
> +
> +$(eval $(autotools-package))

A quick inspection of configure.ac reveals that:

 * There are --enable-drm, --enable-x11 and --enable-wayland options.
   Maybe you should use them, at least to explicitly give a
   --disable-<foo> for the features you don't support.

 * It needs host-pkgconf

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
