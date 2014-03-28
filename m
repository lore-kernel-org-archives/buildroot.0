From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 28 Mar 2014 18:02:07 -0400
Subject: [Buildroot] select vs. depends on
Message-ID: <CA+-urNTi8ZEZc11fhiB0D5_oCchEdQ1=jD9wgV9M0Y8oyw=mWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to debug a circular dependency in the KConfig files after
applying Bernd Kuhls mesa3d patch series
(http://patchwork.ozlabs.org/patch/330141/, and related). I need many
changes in the patch series, but it generates a circular dependency
error when I apply it. After looking into this, I'm confused on the
use of "select" and "depends on" in the Config.in files.

Previously, I had thought of "select" as a friendly "depends on" that
would automatically pull in the package depended upon. This isn't the
case since the following generates a circular reference error:

config BR2_PACKAGE_A
        bool "a"
        select BR2_PACKAGE_B
        depends on BR2_PACKAGE_B

config BR2_PACKAGE_B
        bool "b"

My understanding now is that verification of "select" dependencies
works in the opposite direction of "depends on" dependencies. This
seems weird, but if it's the case, then I think that some packages
that are trying to be user friendly by using "select" are being the
opposite.

For the Bernd Kuhls patch set case, I get the following error:

package/xbmc/Config.in:10:error: recursive dependency detected!
package/xbmc/Config.in:10:    symbol BR2_PACKAGE_XBMC depends on
BR2_PACKAGE_HAS_OPENGL_EGL
package/opengl/libegl/Config.in:1:    symbol
BR2_PACKAGE_HAS_OPENGL_EGL is selected by
BR2_PACKAGE_MESA3D_OPENGL_EGL
package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_OPENGL_EGL
depends on BR2_PACKAGE_MESA3D
package/mesa3d/Config.in:1:    symbol BR2_PACKAGE_MESA3D is selected
by BR2_PACKAGE_LIBEVAS_GL
package/efl/libevas/Config.in:149:    symbol BR2_PACKAGE_LIBEVAS_GL is
part of choice <choice>
package/efl/libevas/Config.in:144:    choice <choice> contains symbol <choice>
package/efl/libevas/Config.in:144:    choice <choice> contains symbol
BR2_PACKAGE_LIBEVAS_SDL_GL
package/efl/libevas/Config.in:90:    symbol BR2_PACKAGE_LIBEVAS_SDL_GL
depends on BR2_PACKAGE_SDL_X11
package/sdl/Config.in:24:    symbol BR2_PACKAGE_SDL_X11 depends on
BR2_PACKAGE_SDL
package/sdl/Config.in:1:    symbol BR2_PACKAGE_SDL is selected by
BR2_PACKAGE_PYTHON_PYGAME
package/python-pygame/Config.in:1:    symbol BR2_PACKAGE_PYTHON_PYGAME
depends on BR2_PACKAGE_PYTHON
package/python/Config.in:1:    symbol BR2_PACKAGE_PYTHON is selected
by BR2_PACKAGE_XBMC

I think that I'd like to replace a few of the selects above with the
helpful "comment and depends on !BR2_..." text. I was going to try to
fix Bernd's patch, but some of the XBMC uses of "select" look more
problematic. For example, XBMC "selecting" Python seems easy to
generate a KConfig error since if XBMC depends on anything that
depends on Python, you'd get an error, and that seems easy to do. (I
hope that that makes sense)

What would people recommend doing? From my perspective, I'd like to do
whatever gets Bernd's patch merged in, since other than this KConfig
issue, his patch fixes problems that I'd been seeing.

Thanks,
Frank
