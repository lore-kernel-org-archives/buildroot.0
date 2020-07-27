From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 19:35:24 +0200
Subject: [Buildroot] [PATCH 2/2 v4] package/mesa3d: make it aware of
 libglvnd and support it when present
In-Reply-To: <20200727173844.2ac2945f@windsurf.home>
References: <cover.1595839612.git.yann.morin.1998@free.fr>
 <c48baa11cd0c06ec5af3fd4989306c3ec581d0e9.1595839612.git.yann.morin.1998@free.fr>
 <20200727173844.2ac2945f@windsurf.home>
Message-ID: <20200727173524.GG19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-27 17:38 +0200, Thomas Petazzoni spake thusly:
> On Mon, 27 Jul 2020 10:47:02 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
> > 
> > When libglvnd is enabled, mesa3d must be told so, so as it installs its
> > libraries with the vendor suffix (e.g. libEGL_mesa.so instead of
> > libEGL.so).
> > 
> > Additionally, the provider (in Buildroot parlance) is libglvnd, not mesa3d.
[--SNIP--]
> >  config BR2_PACKAGE_MESA3D_OPENGL_GLX
> >  	bool "OpenGL GLX"
> >  	depends on BR2_PACKAGE_XORG7
> > -	select BR2_PACKAGE_HAS_LIBGL
> > +	select BR2_PACKAGE_HAS_LIBGL if !BR2_PACKAGE_LIBGLVND
> > +	select BR2_PACKAGE_LIBGLVND_DISPATCH_GL if BR2_PACKAGE_LIBGLVND
> 
> I don't immediately see a good solution for this, but I find that
> solution to be quite annoying :-/

At first, I though so too, and I also looked for a better approach,
but...

> Indeed, I understand that once libglvnd is enabled, the GL-provider is
> libglvnd, which in the background is using mesa3d. The dance to handle
> libglvnd in mesa3d is already not nice, and we would have to have the
> same dance in other GL providers that support libglvnd.

Well, it is not _so_ bad. We could maybe make it a bit simpler, with:

    config BR2_PACKAGE_MESA3D_OPENGL_GLX
        bool "OpenGL GLX"
        select BR2_PACKAGE_HAS_LIBGL

We still need to declare emsa3d as providing libgl depending on whether
libglvnd is enabled, but we can make it a bit more "compact":

    if !BR2_PACKAGE_LIBGLVND

    config BR2_PACKAGE_PROVIDES_LIBGL
        default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX

    [EGL and GLES too here]

    endif

And in mesa3d.mk too:

    ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
    MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)
    [...]
    endif

But now, in libglvnd, we don't need any extra symbol, we can just re-use
BR2_PACKAGE_PROVIDES_LIBGL et al.:

    config BR2_PACKAGE_LIBGLVND
        bool "libglvnd"
        select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_PROVIDES_LIBGL
        select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_PROVIDES_LIBGL
        select BR2_PACKAGE_XLIB_XORGPROTO if BR2_PACKAGE_PROVIDES_LIBGL
        select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_PROVIDES_LIBGL

    if BR2_PACKAGE_LIBGLVND

    config BR2_PACKAGE_PROVIDES_LIBGL
        default "libglvnd" if BR2_PACKAGE_HAS_LIBGL

    endif

and in libglvnd.mk:

    ifeq ($(BR2_PACKAGE_PROVIDES_LIBGL),y)
    LIBGLVND_DEPENDENCIES += xlib_libXext xorgproto
    LIBGLVND_CONF_OPTS += -Dglx=enabled
    LIBGLVND_PROVIDES += libgl
    else
    LIBGLVND_CONF_OPTS += -Dglx=disabled
    endif

> OK, here is some vague idea for a possible solution:
>  - We introduce an intermediate "layer" between libgl and GL providers.
[--SNIP--]
> I *think* this would perhaps avoid that complexity in mesa3d...
> obviously for additional complexity in terms of how the virtual
> packages in GL world all work together.

You are reinventing libglvnd in between libglvnd and actual providers, no?

Also, remember that individual GL providers will still have to function
as providers without libglvnd, which is not required.

But I would like we progress on the topic, and when we have a second
candidate for libglvnd use, we can revisit the topic and see if we can
over-engineer the thing.

Usually, we wait for three or four cases before trying to solve the
problem in a generic fashion, and so I'd like to do here as well.
Because so far, only two providers are known to work with libglvnd:
mewsa3d and nvidia. ATI might be a third one, but I have no clue about
it. And in the SoC land, there is not much that is libglvnd compatible
so far, if at all.

So, in the short-to-medium term, we'd at best have three providers. Is
that enough to delve into a generic infra so far? Not sure...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
