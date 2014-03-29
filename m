From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:50:39 +0100
Subject: [Buildroot] [PATCH 00/91] Update mesa3d & xorg
In-Reply-To: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
References: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
Message-ID: <20140329235039.4bf4983e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 29 Mar 2014 21:56:04 +0100, Bernd Kuhls wrote:

> this is a follow-up patch to replace v8 of my last patch series which
> updated only mesa3d and xserver_xorg-server.
> 
> This patch includes and replaces the forementioned patch series and
> catches, hopefully, all version bumps for xorg packages. Some packages
> had to be patched for compatability with xorg-server 1.15, these patches
> were mostly taken from upstream.

Another problem: your patch series creates a circular dependency of
kconfig options:

thomas at skate:~/projets/buildroot (master)$ make menuconfig
package/xbmc/Config.in:10:error: recursive dependency detected!
package/xbmc/Config.in:10:	symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_HAS_OPENGL_EGL
package/opengl/libegl/Config.in:1:	symbol BR2_PACKAGE_HAS_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
package/mesa3d/Config.in:92:	symbol BR2_PACKAGE_MESA3D_OPENGL_EGL depends on BR2_PACKAGE_MESA3D
package/mesa3d/Config.in:1:	symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
package/efl/libevas/Config.in:149:	symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
package/efl/libevas/Config.in:144:	choice <choice> contains symbol <choice>
package/efl/libevas/Config.in:144:	choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
package/efl/libevas/Config.in:90:	symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_SDL_X11
package/sdl/Config.in:24:	symbol BR2_PACKAGE_SDL_X11 depends on BR2_PACKAGE_SDL
package/sdl/Config.in:1:	symbol BR2_PACKAGE_SDL is selected by BR2_PACKAGE_PYTHON_PYGAME
package/python-pygame/Config.in:1:	symbol BR2_PACKAGE_PYTHON_PYGAME depends on BR2_PACKAGE_PYTHON
package/python/Config.in:1:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_XBMC

It's not a trivial one :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
