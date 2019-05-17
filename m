From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 May 2019 08:43:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
In-Reply-To: <20190517002828.GB29253@momiji>
References: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
 <20190517002828.GB29253@momiji>
Message-ID: <CAPi7W82R3eAuhgc4BO-LPTK62MGEBJRsbBdC-hpWrZdpj1r2-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adrian,

Le jeu. 16 mai 2019 ? 23:28, Adrian Perez de Castro
<aperez@igalia.com> a ?crit :
>
> Hello,
>
> On Thu, 16 May 2019 22:12:20 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Commit 5b3c7a3e7828107eaa9dad49ba2650466277d891 added a
> > BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency to wpebackend-fdo but forget
> > to add it to wpewebkit
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/49e04166de68358e69bce580b29ba3a25b313acf
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/wpewebkit/Config.in | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> > index 04ebe5452b..15db924829 100644
> > --- a/package/wpewebkit/Config.in
> > +++ b/package/wpewebkit/Config.in
> > @@ -35,10 +35,11 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
> >               || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> >               || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
> >
> > -comment "wpewebkit needs an OpenGL ES w/ EGL backend"
> > +comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
> >       depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> >       depends on !BR2_BINFMT_FLAT
> > -     depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
> > +     depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
> > +             || !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> >
> >  config BR2_PACKAGE_WPEWEBKIT
> >       bool "wpewebkit"
> > @@ -51,6 +52,7 @@ config BR2_PACKAGE_WPEWEBKIT
> >       depends on BR2_USE_WCHAR # icu, libsoup
> >       depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
> >       depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> > +     depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
> >       depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> >       select BR2_PACKAGE_CAIRO
> >       select BR2_PACKAGE_CAIRO_PNG
>
> This is not correct. The short version of the story is tat WPE WebKit
> itself does not require Wayland, only wpebackend-fdo uses Wayland.
>
> The long storey: WPE WebKit itself uses generic interfaces from libwpe,
> and the programs which use WPE WebKit are responsible for instructing
> libwpe to load a "WPE backend plug-in" which provides a concrete
> implementation of its interfaces. One such backend is provided by
> wpebackend-fdo. This "FDO backend" is what actually requires Wayland,
> but there are others which do not require Wayland. For example the
> RDK backend [1] can be configured to use dispmanx on the RaspberryPi
> directly, or the Vivante i.MX6 proprietary driver ? no Wayland
> involved!
Thanks for the feedback however what do you suggest to fix the build
failure raised by commit 5b3c7a3e7828107eaa9dad49ba2650466277d891
which allows wpewebkit to select wpebackend-fdo without complying with
its new libegl-wayland dependency?

I'm not an expert in wpewebkit but I assume that FDO backend is
selected because this is the only available backend in buildroot (I
didn't find RDK). So I also assume that we can't drop this select to
make FDO backend optional (at least until we have other available
backends).
>
> Regards,
> ?Adri?n
>
> ---
> [1] https://github.com/WebPlatformForEmbedded/WPEBackend-rdk
Best Regards,

Fabrice
