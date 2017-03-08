From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 8 Mar 2017 21:10:59 +0100
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <1488980286-19036-1-git-send-email-kevin.joly@sensefly.com>
References: <1488980286-19036-1-git-send-email-kevin.joly@sensefly.com>
Message-ID: <e38526ae-2842-a64f-3ca9-1639ddb12cde@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kevin,

Thanks for this contribution.

I recently sent a patch adding libgphoto2 for Darktable [1].
There are small differences with your patch (mostly package dependencies), can
you comment on it ?

Thanks!

[1] http://patchwork.ozlabs.org/patch/735448/

Le 08/03/2017 ? 14:38, Kevin JOLY a ?crit :
> Add support for libgphoto2 core library designed to allow access to digital camera.
> 
> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
> ---

We recommend to add yourself as package maintainer in DEVELOPERS file, see:
http://nightly.buildroot.org/manual.html#DEVELOPERS

>  package/Config.in                  |  1 +
>  package/libgphoto2/Config.in       | 10 ++++++++++
>  package/libgphoto2/libgphoto2.hash |  3 +++
>  package/libgphoto2/libgphoto2.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/libgphoto2/Config.in
>  create mode 100644 package/libgphoto2/libgphoto2.hash
>  create mode 100644 package/libgphoto2/libgphoto2.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9eb6a22..69430c3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1073,6 +1073,7 @@ menu "Hardware handling"
>  	source "package/libfreefare/Config.in"
>  	source "package/libftdi/Config.in"
>  	source "package/libftdi1/Config.in"
> +	source "package/libgphoto2/Config.in"
>  	source "package/libgpiod/Config.in"
>  	source "package/libgudev/Config.in"
>  	source "package/libhid/Config.in"
> diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
> new file mode 100644
> index 0000000..ba1d535
> --- /dev/null
> +++ b/package/libgphoto2/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBGPHOTO2
> +	select BR2_PACKAGE_LIBTOOL
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_LIBUSB_COMPAT
> +	select BR2_PACKAGE_LIBXML2

I added gd, jpeg, libexif and lockev package as mandatory dependencies, They may
be optional... can you check ?

You can compare with archlinux packaging for exemple:

depends=(libexif libjpeg gd libltdl libusb libxml2)

https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/libgphoto2

> +	bool "libgphoto2"
> +	help
> +	  libgphoto2 is the core library designed to allow access to digital camera by external programs.

The help text should be wrapped within 72 characters (8 characters for one tab)

> +
> +	  http://gphoto.org/
> diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
> new file mode 100644
> index 0000000..25de0bf
> --- /dev/null
> +++ b/package/libgphoto2/libgphoto2.hash
> @@ -0,0 +1,3 @@
> +# Hashes from: https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.12/
> +sha1	4e1208a8a66d679b8b619b05915dbb0e684c5518	libgphoto2-2.5.12.tar.gz
> +md5	b3b5d36e583fc96eed0594dc414d70c9		libgphoto2-2.5.12.tar.gz

I used tar.bz2 archive here since the archive is smaller and used the
corresponding hashes.

I added a stronger hash calculated locally
sha256 b9bb28990fde45ac385e4851a07dbad2e1250404b535b0a3a3b898bb431e4e2e
libgphoto2-2.5.12.tar.bz2


> diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
> new file mode 100644
> index 0000000..fc5be1b
> --- /dev/null
> +++ b/package/libgphoto2/libgphoto2.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libgphoto2
> +#
> +################################################################################
> +
> +LIBGPHOTO2_VERSION = 2.5.12
> +LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.gz

The tar.bz2 archive should be used here.

> +LIBGPHOTO2_SITE = https://sourceforge.net/projects/gphoto/files/libgphoto/$(LIBGPHOTO2_VERSION)

Missing license information:

It's seems to be LGPLv2+ but...

 * \par License
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \par
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \par
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA

... Fedora tagged this package as GPLV2+ and GPLv2... it seems there is a
licensing issue...

# GPLV2+ for the main lib (due to exif.c) and most plugins, some plugins GPLv2
http://pkgs.fedoraproject.org/cgit/rpms/libgphoto2.git/tree/libgphoto2.spec

exif.c:
  \par License
  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  \par
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  \par
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the
  Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
  Boston, MA  02110-1301  USA

> +LIBGPHOTO2_INSTALL_STAGING = YES

Ok

> +LIBGPHOTO2_INSTALL_TARGET = YES
Not needed, this is the default behavior.

> +LIBGPHOTO2_DEPENDENCIES = libxml2 libusb libusb-compat libtool host-pkgconf

Ok but maybe gd jpeg libexif and lockdev dependencies may be missing.

Best regards,
Romain

> +
> +$(eval $(autotools-package))
> 
