From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2015 16:57:40 +0100
Subject: [Buildroot] [PATCH v10 00/28] efl bump to 1.15.2
In-Reply-To: <56756A03.7050701@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <20151218001144.5a685de2@free-electrons.com>
 <56756A03.7050701@openwide.fr>
Message-ID: <20151219155740.GB3394@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-19 15:30 +0100, Romain Naour spake thusly:
> Le 18/12/2015 00:11, Thomas Petazzoni a ?crit :
> > On Tue, 15 Dec 2015 23:40:12 +0100, Romain Naour wrote:
[--SNIP--]
> >>   package/efl/libefl: add OpenGLES support
> > This one I wasn't sure about the "choice"; we had some discussion about
> > it with Yann on IRC.
> It's not clear to me when we can really use the full OpenGL support.
> I thought that the full OpenGL support was only needed by some specific hardware...

You don't care about the hardware in this case. If there is a full
OpenGL provider *and* Xorg is enabled, then you can do full OpenGL.
It is the responsibility of the libgl provider to provide hardware
access (e.g. mesa3d, nvidia-driver, rpi-userland...)

So, in case my previous comments were not clear, here we go:

  - full OpenGL currently requires Xorg and a libgl provider.

Or, put in other words:

  - if you have Xorg and you have a libgl provider, then you can do full
    OpenGL.

So, for EFL, I would add an new entry to the choice:

    config BR2_PACKAGE_EFL_GL
        bool "opengl"
        depends on BR2_PACKAGE_HAS_LIBGL
        depends on BR2_PACKAGE_LIBEFL_X_XLIB

    comment "opengl support needs X11 support and a libgl provider"
        depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_LIBEFL_X_XLIB


Alternatively, you can go with a select, like:

    config BR2_PACKAGE_EFL_GL
        bool "opengl"
        depends on BR2_PACKAGE_HAS_LIBGL
        depends on BR2_PACKAGE_XORG7  # X_XLIB
        select BR2_PACKAGE_LIBEFL_X_XLIB

    comment "opengl support needs Xorg and a libgl provider"
        depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7


I think I'd prefer the first solution, but either is OK for me.

But now, if you are not interested in full OpenGL, or you can't test it,
or really don't care, just leave it aside. Interested parties can submit
that support later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
