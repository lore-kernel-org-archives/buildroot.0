From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Apr 2014 18:25:00 +0200
Subject: [Buildroot] [PATCH 1/6] package/libevas: quick fix to get rid
 of circular deps
In-Reply-To: <533BAA71.4050104@mind.be>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <eb47cebc21e1bc07000dd375c77a28b362e281e0.1396302677.git.yann.morin.1998@free.fr>
 <533BAA71.4050104@mind.be>
Message-ID: <20140402162500.GA3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-04-02 08:13 +0200, Arnout Vandecappelle spake thusly:
> On 31/03/14 23:59, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > This is a quick workaround against the recently-introduced circular
> > dependencies hell:
> > 
> >     package/xbmc/Config.in:10:error: recursive dependency detected!
> >     package/xbmc/Config.in:10:      symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_HAS_OPENGL_EGL
> >     package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
> >     package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_OPENGL_EGL depends on BR2_PACKAGE_MESA3D
> >     package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
> >     package/efl/libevas/Config.in:149:      symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
> >     package/efl/libevas/Config.in:144:      choice <choice> contains symbol <choice>
> >     package/efl/libevas/Config.in:144:      choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
> >     package/efl/libevas/Config.in:90:       symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_SDL_X11
> >     package/sdl/Config.in:24:       symbol BR2_PACKAGE_SDL_X11 depends on BR2_PACKAGE_SDL
> >     package/sdl/Config.in:1:        symbol BR2_PACKAGE_SDL is selected by BR2_PACKAGE_PYTHON_PYGAME
> >     package/python-pygame/Config.in:1:      symbol BR2_PACKAGE_PYTHON_PYGAME depends on BR2_PACKAGE_PYTHON
> >     package/python/Config.in:1:     symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_XBMC
> > 
> > Until this is properly fixed with the addition of a virtual package for
> > full-openGL providers, just depend on mesa3d instead of selecting it.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  This should indeed go in quickly!

So I think. Let's wait for Thomas to land in TLS tonight, then we'll
poke him on IRC! ;-)

>  But shouldn't your series also include a patch that undoes this change?

Yes, of course. I realised that after sending. But as I said in the
cover-letter, this first patch is important, and the rest was merely to
start discusion on the topic.

This series is now entirely deprecated, since we have a better plan (or
so I hope) to fix all of this mess. I already have some important
patches here, but the series is far from being complete.

Thanks for the review. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
