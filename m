From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 27 Jul 2017 19:45:13 +0300
Subject: [Buildroot] [PATCH 4/4] webkitgtk: Ensure that Mesa headers do
 not include X11 headers on Wayland builds
In-Reply-To: <20170721090947.2670fb7c@windsurf>
References: <20170712235531.20444-1-aperez@igalia.com>
 <20170712235531.20444-5-aperez@igalia.com>	<20170721090947.2670fb7c@windsurf>
Message-ID: <20170727194513.GB5762@momiji.helsinki.igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 09:09:47 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
> On Thu, 13 Jul 2017 02:55:31 +0300, Adrian Perez de Castro wrote:
> 
> > diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> > index ef20839f92..09781c2318 100644
> > --- a/package/webkitgtk/webkitgtk.mk
> > +++ b/package/webkitgtk/webkitgtk.mk
> > @@ -84,6 +84,9 @@ endif
> >  ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
> >  WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
> >  endif
> > +WEBKITGTK_CONF_OPTS += \
> > +	-DCMAKE_C_FLAGS='$(TARGET_CFLAGS) -DMESA_EGL_NO_X11_HEADERS' \
> > +	-DCMAKE_CXX_FLAGS='$(TARGET_CXXFLAGS) -DMESA_EGL_NO_X11_HEADERS'
> 
> I am not happy with this: such CFLAGS should be provided by the OpenGL
> provider, through its pkg-config file, and consumers of the OpenGL
> implementation should get those flags using pkg-config.
> 
> If we don't do this, then we need to add -DMESA_EGL_NO_X11_HEADERS
> everywhere in all OpenGL consumers, which isn't nice.
> 
> We already have a few OpenGL providers that define these flags in
> their .pc file:
> 
> package/mali-t76x/egl.pc:Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
> package/mali-t76x/glesv2.pc:Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
> package/nvidia-driver/gl.pc:Cflags: -I${includedir}  -DMESA_EGL_NO_X11_HEADERS
> package/odroid-mali/odroid-mali.mk:     $(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \

Good point. I will make instead a patch for having Mesa's ?egl.pc? include
the ?-DMESA_EGL_NO_X11_HEADERS? when X11 support is disabled.

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170727/8b32cbfb/attachment.asc>
