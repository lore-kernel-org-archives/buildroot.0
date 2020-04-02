From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 2 Apr 2020 17:10:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-gpu-viv: fix
 build issue with Wayland backend
In-Reply-To: <20200402162543.595ed9e7@windsurf.home>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-3-gary.bisson@boundarydevices.com>
 <20200402162543.595ed9e7@windsurf.home>
Message-ID: <20200402151026.GA934730@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Apr 02, 2020 at 04:25:43PM +0200, Thomas Petazzoni wrote:
> Hello Gary,
> 
> As usual, thanks for your work maintaining good support for i.MX
> platforms in Buildroot. One question below.

No problem.

> On Thu,  2 Apr 2020 15:08:42 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> >  ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
> > -define IMX_GPU_VIV_FIXUP_FB_HEADERS
> > +define IMX_GPU_VIV_FIXUP_HEADERS
> >  	$(SED) '39i\
> > -		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
> > +		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) && !defined(WL_EGL_PLATFORM) \n\
> >  		#define EGL_API_FB \n\
> >  		#endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
> >  endef
> > @@ -77,6 +77,12 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
> >  define IMX_GPU_VIV_FIXUP_PKGCONFIG
> >  	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
> >  endef
> > +define IMX_GPU_VIV_FIXUP_HEADERS
> > +	$(SED) '39i\
> > +		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) && !defined(WL_EGL_PLATFORM) \n\
> > +		#define WL_EGL_PLATFORM\n\
> > +		#endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
> > +endef
> >  endif
> 
> Can we use a proper patch instead of these horrible SED calls ?

I know it isn't an elegant solution and I am open to discussion.
However modifying eglplatform.h still seems like the less intrusive
solution.

Do you have anything in mind?

What Yocto does is to patch packages that break by appending CFLAGS
[1][2], I'd like to avoid such approach.

Especially since in my case it happened building standard Weston
package... It works in their case because they use a Weston fork (along
with a libdrm fork, and wayland-protocols fork).

Regards,
Gary

[1] https://github.com/Freescale/meta-freescale/blob/zeus/recipes-graphics/libsdl2/libsdl2_%25.bbappend
[2] https://github.com/Freescale/meta-freescale/blob/zeus/recipes-graphics/libepoxy/libepoxy_1.5.%25.bbappend
