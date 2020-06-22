From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:01:33 +0200
Subject: [Buildroot] [PATCH v2] package/cegui: select libglu when libgl
 is detected
In-Reply-To: <8023dcfc-b52e-0c9b-5221-c6f1c201c7cf@grinn-global.com>
References: <20200621131832.1036346-1-b.bilas@grinn-global.com>
 <20200622211010.64d5fb7f@windsurf.home>
 <8023dcfc-b52e-0c9b-5221-c6f1c201c7cf@grinn-global.com>
Message-ID: <20200622220133.0e142645@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 21:37:15 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> No, we wouldn't because libglu is selected only when we have 
> BR2_PACKAGE_HAS_LIBGL option set.

libepoxy is a library for handling the load of OpenGL library, and has:

        depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL

So basically, when you have HAS_LIBGL=y, you can have either libepoxy
*OR* libglew/libglu used by Irrlicht.

> Libepoxy doesn't provide it so even if 
> we use glew instead of libepoxy we have to select libglu because cegui 
> directly includes GL/glu.h here -> 
> https://github.com/cegui/cegui/blob/v0-8-7/cegui/include/CEGUI/RendererModules/OpenGL/GL.h#L45

That is exactly the code I have pasted below, please see my comments inline.

> > This is confirmed by ./cegui/include/CEGUI/RendererModules/OpenGL/GL.h,
> > which contains:
> >
> > #if defined CEGUI_USE_EPOXY

So if the OpenGL loader is libepoxy, we are here...

> >
> > #include <epoxy/gl.h>
> >
> > #elif defined CEGUI_USE_GLEW

*OR* if the OpenGL loader is glew, we are here, and we indeed include
GLU unconditionally.

So I stand to my position: according to the code, if you're using
libepoxy as the OpenGL loader, you don't need Glew, and you don't need
GLU.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
