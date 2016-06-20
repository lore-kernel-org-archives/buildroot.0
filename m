From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jun 2016 23:52:02 +0200
Subject: [Buildroot] [PATCH v2 1/1] libvdpau: new package
In-Reply-To: <1466434827-17088-1-git-send-email-damien@kal-host.com>
References: <1466434827-17088-1-git-send-email-damien@kal-host.com>
Message-ID: <20160620215202.GD22414@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damien, All,

On 2016-06-20 17:00 +0200, Damien Lanson spake thusly:
> Signed-off-by: Damien Lanson <damien@kal-host.com>
> ---
> @@ -0,0 +1,29 @@
> +From: Rico Tzschichholz <ricotz@ubuntu.com>
> +Date: Tue, 1 Sep 2015 10:45:11 +0200
> +Subject: mesa_dri2: Add missing include of config.h to define _GNU_SOURCE
> +
> +Fix build with -Wimplicit-function-declaration while secure_getenv() is
> +guarded by __USE_GNU.
> +
> +Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
> +Tested-by: Stefan Dirsch <sndirsch@suse.de>
> +(cherry picked from commit 1cda354bdfd0c9ca107293b84b52f4464fdbedcc)

I like that you specified the upstream cset hash here. :-)

> diff --git a/package/libvdpau/0002-link-with-libx11.patch b/package/libvdpau/0002-link-with-libx11.patch
> new file mode 100755
> index 0000000..4dd82e6
> --- /dev/null
> +++ b/package/libvdpau/0002-link-with-libx11.patch
> @@ -0,0 +1,30 @@
> +Subject: Link libvdpao with libX11 since it uses symbols from it
> +Author: Russ Allbery <rra@debian.org>
> +Forwarded: no
> +
> +libvdpau uses the symbols:
> +
> +    _XEatData
> +    _XReply
> +    _XFlush
> +    _XReadPad
> +    XFree
> +
> +which are provided by libX11, but wasn't linking with it directly, resulting
> +in warnings during the package build (and possibly errors later with better
> +linkers).
> +
> +Signed-off-by: Damien Lanson <damien@kal-host.com>

Similarly, here, it would be nice to have a pointer to that patch on the
upstream mailing list (or tracker or whatever). Not mandatory, though.

[--SNIP--]
> diff --git a/package/libvdpau/0003-vdpau-module-searchpath.patch b/package/libvdpau/0003-vdpau-module-searchpath.patch
> new file mode 100755
> index 0000000..aecda74
> --- /dev/null
> +++ b/package/libvdpau/0003-vdpau-module-searchpath.patch
> @@ -0,0 +1,45 @@
> +From: Andreas Beckmann <debian@abeckmann.de>
> +Subject: search the vdpau module in multiple directories
> + start searching the vdpau module in ${ORIGIN}/vdpau, then the MODULEDIR and
> + finally fall back to /usr/lib/vdpau
> +
> +Signed-off-by: Damien Lanson <damien@kal-host.com>

Ditto.

[--SNIP--]
> diff --git a/package/libvdpau/Config.in b/package/libvdpau/Config.in
> new file mode 100755
> index 0000000..288bd1f
> --- /dev/null
> +++ b/package/libvdpau/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBVDPAU
> +	bool "libvdpau"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT

If it selects X11 libs, it should maybe depend on BR2_PACKAGE_XORG7.

Maybe like libva-intel-driver:

    select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
    select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7

> +	help
> +          VDPAU is the Video Decode and Presentation API for UNIX.
> +          It provides an interface to video decode acceleration and
> +          presentation hardware present in modern GPUs.
> +
> +	  http://freedesktop.org/wiki/Software/VDPAU

Indentation of the help text iswrong: it should one TAB plus two spaces
(only the homepage is OK).

> +comment "libvdpau needs a toolchain w/ threads, C++"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> \ No newline at end of file

No newline at end of file... Please, configure your editor to always add
a newline at the end of files.

[--SNIP--]
> diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
> new file mode 100755
> index 0000000..917d153
> --- /dev/null
> +++ b/package/libvdpau/libvdpau.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# libvdpau
> +#
> +################################################################################
> +LIBVDPAU_VERSION = 1.1.1
> +LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
> +LIBVDPAU_SITE = http://people.freedesktop.org/~aplattner/vdpau
> +LIBVDPAU_LICENSE = MIT
> +LIBVDPAU_LICENSE_FILES = COPYING
> +LIBVDPAU_INSTALL_STAGING = YES
> +
> +#Autoreconf for patch 0002-link-with-libx11.patch
> +LIBVDPAU_AUTORECONF = YES
> +
> +LIBVDPAU_DEPENDENCIES = xlib_libX11 xlib_libXext
> +
> +LIBVDPAU_CONF_OPTS = --with-module-dir=/usr/lib/vdpau
> +
> +ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
> +LIBVDPAU_DEPENDENCIES += xproto_dri2proto
> +LIBVDPAU_CONF_OPTS += --enable-dri2
> +else
> +LIBVDPAU_CONF_OPTS += --disable-dri2
> +endif
> +
> +$(eval $(autotools-package))
> \ No newline at end of file

Ditto end-of-file. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
