From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 2 Feb 2020 18:08:20 -0700
Subject: [Buildroot] [PATCH v10 2/2] package/weston: bump to version
 8.0.0
In-Reply-To: <20200202192053.GB14722@scaer>
References: <20200202123856.94585-1-james.hilliard1@gmail.com>
 <20200202123856.94585-2-james.hilliard1@gmail.com>
 <20200202192053.GB14722@scaer>
Message-ID: <CADvTj4pQFcaBoYY_x30ETk3QFeZiWMvmc61JZsfAt3atH9Jw_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 2, 2020 at 12:21 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2020-02-02 05:38 -0700, James Hilliard spake thusly:
> > The autotools build system is deprecated and replaced with meson for weston.
> [--SNIP--]
> > Replaced WESTON_NATIVE_BACKEND with backend-default in meson.
>
> So, as I asked in the previous review, this should be a preliminary
> patch, that just does that: introduce the selection menu for a default
> backend.
>
> I know you argued that WESTON_NATIVE_BACKEND and backend-default do not
> have exactly the same meaning, but the way WESTON_NATIVE_BACKEND is
> handled in Buildroot makes it look very much like it actually is the
> default backend.
>
> So, please, split that off the bump into a separate, preliminary patch.
>
> A very good reason for doing so, is that I have comments to provide
> about it, and it would be much easier to do a review and reworks of it
> if it were split.
>
> [--SNIP--]
> > diff --git a/package/weston/Config.in b/package/weston/Config.in
> > index f874b0cc6a..ec9cd072b8 100644
> > --- a/package/weston/Config.in
> > +++ b/package/weston/Config.in
> > @@ -21,8 +21,6 @@ config BR2_PACKAGE_WESTON
> >       select BR2_PACKAGE_LIBDRM
> >       # Runtime dependency
> >       select BR2_PACKAGE_XKEYBOARD_CONFIG
> > -     # Make sure at least one compositor is selected.
> > -     select BR2_PACKAGE_WESTON_FBDEV if !BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> >       help
> >         Weston is the reference implementation of a Wayland
> >         compositor, and a useful compositor in its own right.
> > @@ -33,10 +31,44 @@ config BR2_PACKAGE_WESTON
> >
> >  if BR2_PACKAGE_WESTON
> >
> > +choice
> > +     prompt "default compositor"
> > +
> > +config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FB
>
> FBDEV, not FB (my code snippet was just to illustrate the topic). Please
> keep the existing naming scheme. Also, it is a compositor, not a
> backend.
>
> > +     bool "fb"
>
> fbdev
>
> > +     select BR2_PACKAGE_WESTON_FB
> > +
> > +config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM
> > +     bool "drm"
> > +     depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> > +     select BR2_PACKAGE_WESTON_DRM
> > +
> > +comment "drm backend needs mesa3d w/ EGL driver"
> > +     depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> > +
> > +config BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11
> > +     bool "X11"
> > +     depends on BR2_PACKAGE_XORG7
> > +     select BR2_PACKAGE_WESTON_X11
> > +
> > +comment "X11 backend needs X.org"
> > +     depends on !BR2_PACKAGE_XORG7
>
> And what about the RDP compositor?
It's not a valid option
https://github.com/wayland-project/weston/blob/8.0.0/meson_options.txt#L56
>
> > +endchoice
> > +
> > +config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
> > +     string
> > +     default "fbdev" if BR2_PACKAGE_WESTON_DEFAULT_BACKEND_FB
> > +     default "drm"   if BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM
> > +     default "x11"   if BR2_PACKAGE_WESTON_DEFAULT_BACKEND_X11
> > +
> >  # Helper to make sure at least one compositor is selected.
> >  config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> >       bool
>
> This is not longer needed, since we have a choice to that effect...
Ok, will remove
>
> > +config BR2_PACKAGE_WESTON_FB
> > +     bool "fb compositor"
>
> Don't gratuitously rename and move options.
>
> >  config BR2_PACKAGE_WESTON_DRM
> >       bool "DRM compositor"
> >       depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> > @@ -46,8 +78,15 @@ config BR2_PACKAGE_WESTON_DRM
> >  comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
> >       depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> >
> > -config BR2_PACKAGE_WESTON_FBDEV
> > -     bool "fbdev compositor"
> > +config BR2_PACKAGE_WESTON_X11
> > +     bool "X11 compositor"
> > +     depends on BR2_PACKAGE_XORG7
> > +     select BR2_PACKAGE_LIBXCB
> > +     select BR2_PACKAGE_XLIB_LIBX11
> > +     select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> > +
> > +comment "X11 compositor needs X.org enabled"
> > +     depends on !BR2_PACKAGE_XORG7
> >
> >  # FreeRDP needs threads and !static, already the case for weston
> >  config BR2_PACKAGE_WESTON_RDP
> > @@ -76,16 +115,6 @@ comment "RDP compositor needs a toolchain w/ wchar, C++"
> >       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >       depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> >
> > -config BR2_PACKAGE_WESTON_X11
> > -     bool "X11 compositor"
> > -     depends on BR2_PACKAGE_XORG7
> > -     select BR2_PACKAGE_LIBXCB
> > -     select BR2_PACKAGE_XLIB_LIBX11
> > -     select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> > -
> > -comment "X11 compositor needs X.org enabled"
> > -     depends on !BR2_PACKAGE_XORG7
>
> Ditto, don't move around.
>
> [--SNIP--]
> > diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> > index 154ae38b83..b1c8f97e07 100644
> > --- a/package/weston/weston.mk
> > +++ b/package/weston/weston.mk
> > @@ -4,37 +4,34 @@
> >  #
> >  ################################################################################
> >
> > -WESTON_VERSION = 6.0.1
> > +WESTON_VERSION = 8.0.0
> >  WESTON_SITE = http://wayland.freedesktop.org/releases
> >  WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
> >  WESTON_LICENSE = MIT
> >  WESTON_LICENSE_FILES = COPYING
> >
> >  WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
> > -     libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
> > -     $(if $(BR2_PACKAGE_WEBP),webp)
> > +     libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
> >
> >  WESTON_CONF_OPTS = \
> > -     --with-dtddir=$(STAGING_DIR)/usr/share/wayland \
> > -     --disable-headless-compositor \
> > -     --disable-colord \
> > -     --disable-devdocs \
> > -     --disable-setuid-install \
> > -     --enable-autotools
> > -
> > -WESTON_MAKE_OPTS = \
> > -     WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
> > -
> > -# Uses VIDIOC_EXPBUF, only available from 3.8+
> > -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
> > -WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
>
> As I already commented in my previous review, you moved the VIDIOC
> conditional later in the file, which makes for a more complicated
> review. Please avoid gratuitous move (or do that in a follow-up or
> preparatory patch).
Ok, will leave that where it was.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
