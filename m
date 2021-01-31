From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:20:48 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/libcamera-apps: new package
In-Reply-To: <20210129230418.26359-3-ps.report@gmx.net>
References: <20210129230418.26359-1-ps.report@gmx.net>
 <20210129230418.26359-3-ps.report@gmx.net>
Message-ID: <20210131232048.1bfc2944@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sat, 30 Jan 2021 00:04:18 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...afe-host-include-path-for-libdrm-use.patch | 29 ++++++++++
>  ...unrecognized-gcc-command-line-option.patch | 32 ++++++++++
>  ...ra_vid-fix-getline-call-needs-size_t.patch | 37 ++++++++++++
>  ..._still-fix-getline-call-needs-size_t.patch | 35 +++++++++++
>  ...-libcamera_app-fix-int64_t-constants.patch | 38 ++++++++++++
>  ...006-cmake-fix-linking-with-exif-jpeg.patch | 47 +++++++++++++++
>  .../0007-cmake-add-install-target.patch       | 24 ++++++++
>  ...e-no-need-to-link-against-ipa_rpi.so.patch | 58 +++++++++++++++++++

Loooots of patches. I suppose you submitted them upstream already ?

> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> new file mode 100644
> index 0000000000..482e1186a0
> --- /dev/null
> +++ b/package/libcamera-apps/Config.in
> @@ -0,0 +1,33 @@
> +config BR2_PACKAGE_LIBCAMERA_APPS
> +	bool "libcamera-apps"
> +	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
> +	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
> +	depends on !BR2_STATIC_LIBS # gnutls/libcamera
> +	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy

To be honest, I am wondering if we shouldn't do a "depends on
BR2_PACKAGE_LIBCAMERA" to simplify this a bit. Indeed, if you want
libcamera-apps, most likely you know you should enable libcamera as
well.

> +	select BR2_PACKAGE_XLIB_LIBX11

It really only works with X11 ? A new project in 2021 is X11 only ?

> +	select BR2_PACKAGE_LIBEPOXY
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_BOOST
> +        select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS

Indentation issue.

> +	select BR2_PACKAGE_LIBEXIF
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_TIFF
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBCAMERA

Alphabetic ordering is not correct for this long list of selects.

> --- /dev/null
> +++ b/package/libcamera-apps/libcamera-apps.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  bf8589f560796327088e7172cf36942c668a3380f0bd6220238ea2b932e40faa  libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2-br1.tar.gz
> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> new file mode 100644
> index 0000000000..5ab2bf1bd6
> --- /dev/null
> +++ b/package/libcamera-apps/libcamera-apps.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libcamera-apps
> +#
> +################################################################################
> +
> +LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/libcamera-apps.git
> +LIBCAMERA_APPS_VERSION = b1ca8997530f1f0290b291a956de359f2d4ce3e2

Use the github macro ?

> +LIBCAMERA_APPS_SITE_METHOD = git
> +LIBCAMERA_APPS_LICENSE = BSD-2-Clause

No license file ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
