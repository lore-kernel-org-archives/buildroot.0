From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 19:01:25 +0200
Subject: [Buildroot] [PATCH 4/6] package/vlc: depends on the virtual
 package libgl
In-Reply-To: <533CFD41.50601@mind.be>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <44a8749bc3ef2c283fa679da79efd8764e482682.1396302677.git.yann.morin.1998@free.fr>
 <533BABEA.4030802@mind.be> <20140402162653.GB3509@free.fr>
 <533CFD41.50601@mind.be>
Message-ID: <20140403170125.GA3202@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-03 08:18 +0200, Arnout Vandecappelle spake thusly:
> On 02/04/14 18:26, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2014-04-02 08:19 +0200, Arnout Vandecappelle spake thusly:
> >> On 01/04/14 00:00, Yann E. MORIN wrote:
> >>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [snip]
> >>> -ifeq ($(BR2_PACKAGE_MESA3D),y)
> >>> +ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
> >>>  VLC_CONF_OPT += --enable-glx
> >>
> >>  Since the option is called enable-glx, it sounds as if it should depend
> >> on X as well (I don't think wayland has glx, right?)
> > 
> > Well, full-openGL is only possible with X11 anyway, so BR2_PACKAGE_HAS_OPENGL
> > will itself not be set when X.org is not selected as well.
> 
>  So wayland doesn't support full-GL? Or maybe wayland also supports glx?

It is my understanding that Wayland only "supports" EGL and GLES2.

But Wayland itself is but a protocol. What matter are the compositor
(the server) and the applications (the clients).

I am not that knowledgeable in the subject, but from what I understand:

  - a Wayland compositor only needs EGL (plus a wayland-specific
    extension that is slowly trickling-down to any known-so-far EGL
    implementations.)

  - as for what a Wayland application may use, I guess it is also limited
    to only doing EGL calls, not full OpenGL either.

Here is a nice, short and concise description of Wayland to which I
refer you:
    http://wayland.freedesktop.org/architecture.html

It is only speaking of EGL/GLES2:

    ---8<---
    Typically, hardware enabling includes modesetting/display and
    EGL/GLES2. On top of that, Wayland needs a way to share buffers
    efficiently between processes. There are two sides to that, the client
    side and the server side. 

    On the client side we've defined a Wayland EGL platform. In the EGL
    model, that consists of the native types (EGLNativeDisplayType,
    EGLNativeWindowType and EGLNativePixmapType) and a way to create those
    types. In other words, it's the glue code that binds the EGL stack and
    its buffer sharing mechanism to the generic Wayland API. The EGL stack
    is expected to provide an implementation of the Wayland EGL platform.
    [...]

    The server side of Wayland is the compositor and core UX for the
    vertical, typically integrating task switcher, app launcher, lock screen
    in one monolithic application. The server runs on top of a modesetting
    API (kernel modesetting, OpenWF Display or similar) and composites the
    final UI using a mix of EGL/GLES2 compositor and hardware overlays if
    available. Enabling modesetting, EGL/GLES2 and overlays is something
    that should be part of standard hardware bringup. The extra requirement
    for Wayland enabling is the EGL_WL_bind_wayland_display extension that
    lets the compositor create an EGLImage from a generic Wayland shared
    buffer. [...]
    ---8<---

So, no. No full OpenGL with Wayland.

Someone more knowledgeable than I will easily prove me wrong, however.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
