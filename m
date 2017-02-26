From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Feb 2017 16:32:40 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/sdl2: enable opengl support
In-Reply-To: <20170226145732.00e59efb@free-electrons.com>
References: <20170225133600.15637-1-romain.naour@gmail.com>
 <20170226145732.00e59efb@free-electrons.com>
Message-ID: <ad5c77a3-693f-49b6-6dfc-d4e4758cad68@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 26/02/2017 ? 14:57, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 25 Feb 2017 14:35:58 +0100, Romain Naour wrote:
> 
>> +config BR2_PACKAGE_SDL2_OPENGL
>> +	bool "OpenGL (GLX)"
>> +	depends on BR2_PACKAGE_HAS_LIBGL
>> +	depends on BR2_PACKAGE_XORG7
> 
> Are you sure this doesn't need BR2_PACKAGE_SDL2_X11 ? I.e what happens
> if you build SDL2 with BR2_PACKAGE_SDL2_OPENGL=y but
> BR2_PACKAGE_SDL2_X11 disabled ?

OpenGL (GLX) option only check for the following headers:
#include <GL/gl.h>
#include <GL/glx.h>

So, SDL2 build fine even without BR2_PACKAGE_SDL2_X11.
However you're probably right since GLX mean OpenGL with X11 support and
selecting BR2_PACKAGE_SDL2_X11 allow to enable additional X11 libraries support.
I'll add a select BR2_PACKAGE_SDL2_X11 since it was enabled for my runtime test.

> 
>> +ifeq ($(BR2_PACKAGE_SDL2_OPENGL),y)
>> +SDL2_CONF_OPTS += --enable-video-opengl
>> +SDL2_DEPENDENCIES += libgl
> 
> Also, is libgl sufficient here? What happens if you select
> nvidia-driver as the OpenGL provider for example? It doesn't depend on
> any X.org package, so are you sure by the time SDL2 runs its configure
> script, enough things have been built?

nvidia-driver is an libgl provider only if BR2_PACKAGE_NVIDIA_DRIVER_XORG=y,
so the libgl provider select a minimal set of X11 libraries that are already
build when sdl2 build start.
This is also the case when mesa3d is used as libgl provider.

> 
> Can you verify by enabling nvidia-driver, and then running "make sdl2" ?

I tried with this deconfig fragment a sdl2 build fine.

BR2_PACKAGE_SDL2=y
BR2_PACKAGE_SDL2_OPENGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_NVIDIA_DRIVER=y

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
