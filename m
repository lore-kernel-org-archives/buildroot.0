From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 15 Jul 2016 08:10:32 -0600
Subject: [Buildroot] [PATCH 1/3] sdl2_gfx: new package
In-Reply-To: <20160715154918.6850b194@free-electrons.com>
References: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
 <20160715154918.6850b194@free-electrons.com>
Message-ID: <CAGrGpJDFOCc0n9oknVK9SJG9VeLhKOyuez29_u2hW27k85QgRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks very very much!   Sorry that it took you so much effort to get it
working.   Your added work is appreciated.   It had seemed to work for me -
not sure where I went wrong.  Hopefully my future contributions improve as
my knowledge improves.

Peter


On Fri, Jul 15, 2016 at 7:49 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 12 Jul 2016 08:53:03 -0600, Peter Thompson wrote:
> > sdl2_gfx created from sdl_gfx with minor changes for sdl2
> >
> > Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
>
> Thanks, I've applied, but many, many things had to be changed. It did
> not even build for me. I think you re-used too much of the sdl_gfx
> package without checking.
>
>
> > +++ b/package/sdl2_gfx/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_SDL2_GFX
> > +     bool "SDL2_gfx"
> > +     depends on BR2_PACKAGE_SDL2
> > +     help
> > +       The SDL2_gfx library is an extension to the SDL2 library which
> > +       provides basic antialiased drawing routines such as lines,
> > +       circles or polygons, an interpolating rotozoomer for SDL
> > +       surfaces, framerate control and MMX image filters.
>
> I have rewrapped the Config.in help text.
>
> > +SDL2_GFX_VERSION_MAJOR = 2.0
>
> This variable is not used anywhere.
>
> > +SDL2_GFX_VERSION = 1.0.1
> > +SDL2_GFX_SOURCE = SDL2_gfx-$(SDL2_GFX_VERSION).tar.gz
> > +SDL2_GFX_SITE = http://www.ferzkopp.net/Software/SDL2_gfx
> > +SDL2_GFX_LICENSE = zlib
> > +SDL2_GFX_LICENSE_FILES = COPYING LICENSE
>
> There is no file named "LICENSE" in the source tree, so I've replaced
> that with a source file that contains the license text.
>
> > +SDL2_GFX_INSTALL_STAGING = YES
> > +SDL2_GFX_DEPENDENCIES = sdl2
>
> I've added host-pkgconf in the dependencies since sdl2_gfx configure
> script tries to use pkg-config.
>
> > +SDL2_GFX_CONF_OPTS = \
> > +     --with-sdl2-prefix=$(STAGING_DIR)/usr \
>
> This option doesn't exist, it is called --with-sdl-prefix. But once
> pkg-config is available, passing --with-sdl-prefix is useless.
>
> > +     --disable-sdl2test \
>
> This option doesn't exist, it is called --disable-sdltest.
>
> > +     --enable-static
>
> This option shouldn't be passed by packages, the autotools package
> infrastructure takes care of passing --{enable,disable}-{static,shared}
> as needed.
>
> Also, the configure/Makefile.in files need to be regenerated, otherwise
> it tries to use aclocal at build time. So I've added SDL2_AUTORECONF =
> YES.
>
> Summary of the changes:
>
>     [Thomas:
>      - Rewrap Config.in help text.
>      - Remove unused SDL2_GFX_VERSION_MAJOR variable
>      - Add host-pkgconf to the dependencies, since pkg-config is used to
>        find sdl2. This fixes the build, otherwise -I/usr/include/sdl2 was
>        added to the CFLAGS when sdl2-config was found on the host machine.
>      - Remove --with-sdl2-prefix, since this option doesn't exist, and
>        using pkg-config is a better solution (--with-sdl-prefix exists,
>        but is not useful when pkg-config is available).
>      - Remove --enable-static, packages are not supposed to pass such an
>        option, it's not automatically by the autotools package
>        infrastructure.
>      - Pass --disable-sdltest instead of --disable-sdl2test since the
>        latter doesn't exist, while the former does.
>      - Pass SDL2_GFX_AUTORECONF = YES since the configure/Makefile.in are
>        not up-to-date and therefore it tries to use aclocal at build time.
>      - Adjust _LICENSE_FILES, since there is no file named 'LICENSE', use
>        the smallest source file instead, since it contains the license
>        text.]
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160715/2bb39757/attachment.html>
