From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 29 Dec 2018 10:15:41 +0100
Subject: [Buildroot] [RFC 2/3] wpebackend-fdo: new package
In-Reply-To: <20181228015802.GF19602@momiji>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
 <20181223154845.23556-3-francois.perrad@gadz.org>
 <20181228015802.GF19602@momiji>
Message-ID: <CAB0FRsvF_3nJV2uA9se26Gji0RrS5KrpDZxnAH8MXZJ=EDPkxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 28 d?c. 2018 ? 01:58, Adrian Perez de Castro <aperez@igalia.com> a
?crit :

> Hello,
>
> Quick review here...
>
> On Sun, 23 Dec 2018 16:48:44 +0100, Francois Perrad <fperrad@gmail.com>
> wrote:
>
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  DEVELOPERS                                 |  1 +
> >  package/Config.in                          |  1 +
> >  package/wpebackend-fdo/Config.in           | 17 +++++++++++++++++
> >  package/wpebackend-fdo/wpebackend-fdo.hash |  7 +++++++
> >  package/wpebackend-fdo/wpebackend-fdo.mk   | 15 +++++++++++++++
> >  5 files changed, 41 insertions(+)
> >  create mode 100644 package/wpebackend-fdo/Config.in
> >  create mode 100644 package/wpebackend-fdo/wpebackend-fdo.hash
> >  create mode 100644 package/wpebackend-fdo/wpebackend-fdo.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 705842310..93a2bf5ad 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -828,6 +828,7 @@ F:        package/qemu/
> >  F:   package/sdl2_mixer/
> >  F:   package/sdl2_net/
> >  F:   package/tekui/
> > +F:   package/wpebackend-fdo/
> >  F:   package/wsapi-fcgi/
> >  F:   package/wsapi-xavante/
> >  F:   utils/scancpan
> > diff --git a/package/Config.in b/package/Config.in
> > index 7615c5853..e8a676ab0 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1302,6 +1302,7 @@ menu "Graphics"
> >       source "package/webkitgtk/Config.in"
> >       source "package/webp/Config.in"
> >       source "package/woff2/Config.in"
> > +     source "package/wpebackend-fdo/Config.in"
> >       source "package/zbar/Config.in"
> >       source "package/zxing-cpp/Config.in"
> >  endmenu
> > diff --git a/package/wpebackend-fdo/Config.in
> b/package/wpebackend-fdo/Config.in
> > new file mode 100644
> > index 000000000..9025834e1
> > --- /dev/null
> > +++ b/package/wpebackend-fdo/Config.in
> > @@ -0,0 +1,17 @@
> > +comment "wpebackend-fdo needs an OpenEGL-capable backend"
> > +     depends on !BR2_PACKAGE_HAS_LIBEGL
> > +
>
> The dependency line for the comment needs to be updated to be the reverse
> of the list of dependencies for the BR2_PACKAGE_WPEBACKEND_FDO symbol
> below.
>
> Also, the comment text should follow the Buildroot style:
>
>     foo needs a toolchain w/ featA, featB, featC
>
> (There's more details about this in the Buildroot manual, which you can
> find
> at https://buildroot.org/downloads/manual/manual.html)
>
> > +config BR2_PACKAGE_WPEBACKEND_FDO
> > +     bool "wpebackend-fdo"
> > +     depends on !BR2_STATIC_LIBS # dlfcn.h
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> > +     depends on BR2_USE_WCHAR # gettext
> > +     depends on BR2_USE_MMU # fork()
>
> The BR2_USE_MMU belongs in the ?wpewebkit? package (the backend itself does
> no forking), and should not be needed here.
>
> The BR2_USE_WCHAR dependency should not be needed here, as gettext is not
> required nor used by this package, neither it is needed by ?wayland? nor
> ?libxkbcommon?.
>
>
These two dependencies comes from LIBGLIB2

> +     depends on BR2_PACKAGE_HAS_LIBEGL
> > +     select BR2_PACKAGE_LIBGLIB2
> > +     select BR2_PACKAGE_LIBWPE
> > +     select BR2_PACKAGE_WAYLAND
> > +     help
> > +       WPE's backend based on a freedesktop.org stack.
> > +
> > +       https://wpewebkit.org/
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash
> b/package/wpebackend-fdo/wpebackend-fdo.hash
> > new file mode 100644
> > index 000000000..6ebfcf335
> > --- /dev/null
> > +++ b/package/wpebackend-fdo/wpebackend-fdo.hash
> > @@ -0,0 +1,7 @@
> > +# From https://wpewebkit.org/releases/wpebackend-fdo-1.1.0.tar.xz.sums
> > +md5 dc852a6cafaf4b6392dcb91e36cd7abb wpebackend-fdo-1.1.0.tar.xz
> > +sha1 688377f441e19273fe2b44c0a2ea9da149f97fa4
> wpebackend-fdo-1.1.0.tar.xz
> > +sha256 f6c72130d16e50860cb83eb0f6e109c76f1826d2c6bee39025fb3651941761e7
> wpebackend-fdo-1.1.0.tar.xz
> > +
> > +# Hashes for license files:
> > +sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825
> COPYING
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk
> b/package/wpebackend-fdo/wpebackend-fdo.mk
> > new file mode 100644
> > index 000000000..b62e710a9
> > --- /dev/null
> > +++ b/package/wpebackend-fdo/wpebackend-fdo.mk
> > @@ -0,0 +1,15 @@
> >
> +################################################################################
> > +#
> > +# wpebackend-fdo
> > +#
> >
> +################################################################################
> > +
> > +WPEBACKEND_FDO_VERSION = 1.1.0
>
> As with libwpe, please use version 1.0.0 here.
>
> > +WPEBACKEND_FDO_SITE = http://wpewebkit.org/releases
> > +WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
> > +WPEBACKEND_FDO_INSTALL_STAGING = YES
> > +WPEBACKEND_FDO_LICENSE = BSD-2-Clause
> > +WPEBACKEND_FDO_LICENSE_FILES = COPYING
> > +WPEBACKEND_FDO_DEPENDENCIES = libglib2 libwpe wayland
>
> This is missing ?libegl? here.
>
>
libegl is not needed here, libegl is already a dependency of libwpe.

Fran?ois

> +$(eval $(cmake-package))
> > --
> > 2.17.1
>
>
> -Adri?n
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181229/3791b95c/attachment.html>
