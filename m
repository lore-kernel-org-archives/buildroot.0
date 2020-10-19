From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 19 Oct 2020 14:44:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-gpu-viv: fix
 build issue with Wayland backend
In-Reply-To: <20200402162543.595ed9e7@windsurf.home>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-3-gary.bisson@boundarydevices.com>
 <20200402162543.595ed9e7@windsurf.home>
Message-ID: <CAEyMn7Yc=u3CPxeSABY3dPPK1eAMM6Jn_wxz3K=pr7ZQgNmf+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Do., 2. Apr. 2020 um 16:25 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Gary,
>
> As usual, thanks for your work maintaining good support for i.MX
> platforms in Buildroot. One question below.
>
> On Thu,  2 Apr 2020 15:08:42 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
>
> >  ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
> > -define IMX_GPU_VIV_FIXUP_FB_HEADERS
> > +define IMX_GPU_VIV_FIXUP_HEADERS
> >       $(SED) '39i\
> > -             #if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
> > +             #if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) && !defined(WL_EGL_PLATFORM) \n\
> >               #define EGL_API_FB \n\
> >               #endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
> >  endef
> > @@ -77,6 +77,12 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
> >  define IMX_GPU_VIV_FIXUP_PKGCONFIG
> >       ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
> >  endef
> > +define IMX_GPU_VIV_FIXUP_HEADERS
> > +     $(SED) '39i\
> > +             #if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) && !defined(WL_EGL_PLATFORM) \n\
> > +             #define WL_EGL_PLATFORM\n\
> > +             #endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
> > +endef
> >  endif
>
> Can we use a proper patch instead of these horrible SED calls ?

What do you mean with a proper patch? These fixups will modify a
header file of weston. How could we do a patch of weston here?

-- 
Heiko
