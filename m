From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:10:10 +0200
Subject: [Buildroot] [PATCH v2] package/cegui: select libglu when libgl
 is detected
In-Reply-To: <20200621131832.1036346-1-b.bilas@grinn-global.com>
References: <20200621131832.1036346-1-b.bilas@grinn-global.com>
Message-ID: <20200622211010.64d5fb7f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Jun 2020 15:18:32 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> diff --git a/package/cegui/Config.in b/package/cegui/Config.in
> index f917be0cc5..0c7932098c 100644
> --- a/package/cegui/Config.in
> +++ b/package/cegui/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_CEGUI
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_GLM
> +	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL

This doesn't seem correct. According to the CMakeLists.txt, cegui can
use either libepoxy *or* glew as an "OpenGL loader" (whatever that
means). So with your patch, we would select libglu even if it is not
needed because we have libepoxy available.

See the CMakeLists.txt:

if (GLEW_FOUND OR EPOXY_FOUND)
    set (OPENGL_LOADER_FOUND TRUE)
else ()
    set (OPENGL_LOADER_FOUND FALSE)
endif ()

This is confirmed by ./cegui/include/CEGUI/RendererModules/OpenGL/GL.h,
which contains:

#if defined CEGUI_USE_EPOXY

#include <epoxy/gl.h>

#elif defined CEGUI_USE_GLEW

#include <GL/glew.h>

// When using GLEW, there's no need to "#include" the OpenGL headers.
#ifndef __APPLE__
[...]
#else
#   include <OpenGL/glu.h>
#endif

#else
#error Either "CEGUI_USE_EPOXY" or "CEGUI_USE_GLEW" must be defined. Defining both or none is invalid.
#endif

So, shouldn't we make things explicit:

ifeq ($(BR2_PACKAGE_GLEW)$(BR2_PACKAGE_GLU),yy)
CEGUI_CONF_OPTS += -DCEGUI_USE_GLEW=ON
else ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON
endif

or something like that ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
