From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Feb 2017 17:29:03 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/sdl2: enable opengl support
In-Reply-To: <20170226165452.26868669@free-electrons.com>
References: <20170225133600.15637-1-romain.naour@gmail.com>
 <20170226145732.00e59efb@free-electrons.com>
 <ad5c77a3-693f-49b6-6dfc-d4e4758cad68@gmail.com>
 <20170226165452.26868669@free-electrons.com>
Message-ID: <a0dbb0ce-cb8b-4d0e-b006-639cf0570fe3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 26/02/2017 ? 16:54, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 26 Feb 2017 16:32:40 +0100, Romain Naour wrote:
> 
>> So, SDL2 build fine even without BR2_PACKAGE_SDL2_X11.
>> However you're probably right since GLX mean OpenGL with X11 support and
>> selecting BR2_PACKAGE_SDL2_X11 allow to enable additional X11 libraries support.
>> I'll add a select BR2_PACKAGE_SDL2_X11 since it was enabled for my runtime test.
> 
> OK.
> 
>>> Also, is libgl sufficient here? What happens if you select
>>> nvidia-driver as the OpenGL provider for example? It doesn't depend on
>>> any X.org package, so are you sure by the time SDL2 runs its configure
>>> script, enough things have been built?  
>>
>> nvidia-driver is an libgl provider only if BR2_PACKAGE_NVIDIA_DRIVER_XORG=y,
>> so the libgl provider select a minimal set of X11 libraries that are already
>> build when sdl2 build start.
> 
> Selects yes, but it doesn't not have a <pkg>_DEPENDENCIES on them, so
> you are not guaranteed they are available before sdl2 is built.

Haa indeed...

For mesa3d case, we can this minimal set of x11 libraries ...

MESA3D_DEPENDENCIES += \
	xproto_xf86driproto \
	xproto_dri2proto \
	xproto_glproto \
	xlib_libX11 \
	xlib_libXext \
	xlib_libXdamage \
	xlib_libXfixes \
	libxcb

... but for nvidia there is none.
However, it doesn't seems to be a problem for sdl2 (at least at build time).

I'll resend the series.

Best regards,
Romain

> 
> Obvisouly, if BR2_PACKAGE_SDL2_X11 is now selected by
> BR2_PACKAGE_SDL2_OPENGL, then you're sure the X11 libs will be built
> before sdl2.
> 
> Thanks!
> 
> Thomas
> 
