From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 20:00:01 +0200
Subject: [Buildroot] [PATCH RFC] libevas: Break circular dependency on
	mesa
In-Reply-To: <1396547480-9739-1-git-send-email-vincent.stehle@freescale.com>
References: <1396547480-9739-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20140403180001.GA17328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2014-04-03 19:51 +0200, Vincent Stehl? spake thusly:
> This fixes the following error, when doing e.g. `make qemu_arm_vexpress_defconfig`:
> 
>   package/xbmc/Config.in:10:error: recursive dependency detected!
>   package/xbmc/Config.in:10:      symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_HAS_OPENGL_EGL
>   package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
>   package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_OPENGL_EGL depends on BR2_PACKAGE_MESA3D
>   package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
>   package/efl/libevas/Config.in:149:      symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
>   package/efl/libevas/Config.in:144:      choice <choice> contains symbol <choice>
>   package/efl/libevas/Config.in:144:      choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
>   package/efl/libevas/Config.in:90:       symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_SDL_X11
>   package/sdl/Config.in:24:       symbol BR2_PACKAGE_SDL_X11 depends on BR2_PACKAGE_SDL
>   package/sdl/Config.in:1:        symbol BR2_PACKAGE_SDL is selected by BR2_PACKAGE_PYTHON_PYGAME
>   package/python-pygame/Config.in:1:      symbol BR2_PACKAGE_PYTHON_PYGAME depends on BR2_PACKAGE_PYTHON
>   package/python/Config.in:1:     symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_XBMC
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> 
> 
> Hi,
> 
> Here is a proposal for a temporary patch, which breaks one mesa related
> dependency loop. This loop appears in my case when using
> qemu_arm_vexpress_defconfig.

It appears for all configurations.

> It seems some circular dependencies related to mesa were introduced into
> buildroot recently (1). It is my understanding that "temporary" patches were
> applied recently to fix a number of those dependencies, and that a more robust
> solution in the form of virtual packages was being worked on by Yann [2].
> 
> This proposed patch is certainly temporary and would have to be reverted, when
> the virtual packages are ready.

Yes, this patch has already been posted to the list. We're waiting for
either the maintainer or his deputy to apply this workaround.

    http://lists.busybox.net/pipermail/buildroot/2014-March/093265.html

Which is part of the series you are pointing to in your [1].

And I'm working on a series that will eventually fix this in an elegant
manner, yes. But that series will take some time to be fully ready,
however.

> Is libevas a good candidate to break the dependency loop?

Yes, this is a correct quick workaround for now.

> Also, an idea: maybe it would make sense to enhance `make graph-depends` to be
> able to generate the full dependencies graph, as well as the `selects`? And,
> maybe even better, highlight the loops?

graph-depends does not use the info from the Config.in files, but uses
the _DEPENDENCIES of packages. So, it is not possible to graph the
'selects' as this are anyway handled in the _DEPENDENCIES variables.

As for the loops, there should be none.

> (1) by commit 3199fd4ef58ba33e7f8742491a0f081af4944a9f
> [1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/80799

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
