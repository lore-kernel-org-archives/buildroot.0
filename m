From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 00:12:59 +0100
Subject: [Buildroot] [PATCH 00/91] Update mesa3d & xorg
In-Reply-To: <20140329235039.4bf4983e@skate>
References: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
 <20140329235039.4bf4983e@skate>
Message-ID: <20140329231259.GO3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Thomas, All,

On 2014-03-29 23:50 +0100, Thomas Petazzoni spake thusly:
> On Sat, 29 Mar 2014 21:56:04 +0100, Bernd Kuhls wrote:
> 
> > this is a follow-up patch to replace v8 of my last patch series which
> > updated only mesa3d and xserver_xorg-server.
> > 
> > This patch includes and replaces the forementioned patch series and
> > catches, hopefully, all version bumps for xorg packages. Some packages
> > had to be patched for compatability with xorg-server 1.15, these patches
> > were mostly taken from upstream.
> 
> Another problem: your patch series creates a circular dependency of
> kconfig options:
> 
> thomas at skate:~/projets/buildroot (master)$ make menuconfig
> package/xbmc/Config.in:10:error: recursive dependency detected!
> package/xbmc/Config.in:10:	symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_HAS_OPENGL_EGL
> package/opengl/libegl/Config.in:1:	symbol BR2_PACKAGE_HAS_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
> package/mesa3d/Config.in:92:	symbol BR2_PACKAGE_MESA3D_OPENGL_EGL depends on BR2_PACKAGE_MESA3D
> package/mesa3d/Config.in:1:	symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
> package/efl/libevas/Config.in:149:	symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
> package/efl/libevas/Config.in:144:	choice <choice> contains symbol <choice>
> package/efl/libevas/Config.in:144:	choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
> package/efl/libevas/Config.in:90:	symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_SDL_X11
> package/sdl/Config.in:24:	symbol BR2_PACKAGE_SDL_X11 depends on BR2_PACKAGE_SDL
> package/sdl/Config.in:1:	symbol BR2_PACKAGE_SDL is selected by BR2_PACKAGE_PYTHON_PYGAME
> package/python-pygame/Config.in:1:	symbol BR2_PACKAGE_PYTHON_PYGAME depends on BR2_PACKAGE_PYTHON
> package/python/Config.in:1:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_XBMC
> 
> It's not a trivial one :)

The problem seems related to libevas, where the dependency on openGL is
poorly handled.

I'm working on it, but you are free to investigate too. ;-)

So far, I managed to get rid of the circular hell, with this:

    diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
    index 2afa888..8eea23d 100644
    --- a/package/efl/libevas/Config.in
    +++ b/package/efl/libevas/Config.in
    @@ -148,7 +148,7 @@ choice
     config BR2_PACKAGE_LIBEVAS_GL
            bool "generic OpenGL"
    -       select BR2_PACKAGE_MESA3D
    +       depends on BR2_PACKAGE_MESA3D
            select BR2_PACKAGE_LIBEET
     
     config BR2_PACKAGE_LIBEVAS_GLES_SGX

(Indented in an attempt to have patchwork not catch it.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
