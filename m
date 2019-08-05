From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Aug 2019 13:40:32 -0400
Subject: [Buildroot] [PATCH v2 1/1] package/weston: replace autotools
 with meson
In-Reply-To: <20190804003605.2bafd9f5@windsurf.home>
References: <20190624181145.107293-1-james.hilliard1@gmail.com>
 <20190804003605.2bafd9f5@windsurf.home>
Message-ID: <CADvTj4o-J9pe-WovVr-w=+-pmFDN-Ax6G9oDogSoWAodyk+nRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 3, 2019 at 6:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Mon, 24 Jun 2019 12:11:45 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> >  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
> >       bool "demo clients"
> > +     depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
>
> Why is this option added as a dependency. I understand about the other
> depends on and the select on pango, but I don't understand this
> BR2_PACKAGE_MESA3D_OPENGL_EGL dependency.
I think that was due to this:
https://gitlab.freedesktop.org/wayland/weston/blob/6.0.1/clients/meson.build#L271
>
> > +     depends on BR2_USE_WCHAR # pango
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # pango
> > +     depends on BR2_USE_MMU # pango
> > +     depends on BR2_INSTALL_LIBSTDCPP # pango
> > +     depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
> > +     select BR2_PACKAGE_PANGO
> >       help
> >         This enables the installation of Weston's demo clients.
> > +# Uses VIDIOC_EXPBUF, only available from 3.8+
> > +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
>
> If you want to say "build this when headers >= 3.8", then it should be:
>
> ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
will fix
>
> > +WESTON_CONF_OPTS +=  -Dsimple-clients=dmabuf-v4l
> > +else
> > +WESTON_CONF_OPTS +=  -Dsimple-clients=
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
> >  WESTON_CONF_OPTS += \
> > -     --enable-fbdev-compositor \
> > -     WESTON_NATIVE_BACKEND=fbdev-backend.so
> > +     -Dbackend-fbdev=true \
> > +     -Dbackend-default=fbdev
>
> I'm still not happy with the -Dbackend-default handling. Indeed, if you
> enable fbdev, and drm and x11, and xwayland, you are going to pass 4
> -Dbackend-default options.
Yeah, I agree, I've been trying to think of a better way to handle this.
>
> Is this backend-default option mandatory ? Perhaps we can leave it
> undefined, and simply have the user select the backend at runtime ? I
> suppose if there is only backend, weston is smart enough at runtime to
> use that one ?
I'm not sure, maybe a kconfig choice menu is needed for selecting a default?
>
> Could you test with this -Dbackend-default option, making a runtime
> test ?
I'll try and experiment.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
