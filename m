From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 19:10:09 +0100
Subject: [Buildroot] [PATCH v4 1/1] glmark2: new package
In-Reply-To: <20141028220048.68d80815@free-electrons.com>
References: <1413580298-6255-1-git-send-email-bernd.kuhls@t-online.de>
 <20141028193444.72b79a2d@free-electrons.com>
 <XnsA3D4D22AF6F3DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141028220048.68d80815@free-electrons.com>
Message-ID: <20141118181009.GD4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd,

On 2014-10-28 22:00 +0100, Thomas Petazzoni spake thusly:
> On Tue, 28 Oct 2014 20:39:37 +0100, Bernd Kuhls wrote:
> > [posted and mailed]
> > 
> > Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> > @public.gmane.org> wrote in news:20141028193444.72b79a2d at free-electrons.com:
> > 
> > > Checking for 'wayland-egl'               : not found 
> > 
> > Hi,
> > 
> > glmark2 searches for wayland-egl.pc. Afaics the only package providing this 
> > file is mesa3d:
> > https://packages.debian.org/search?searchon=contents&keywords=wayland-
> > egl.pc&mode=path&suite=stable&arch=any
> > 
> > According to this posting from 2012 the RPI does not provide wayland-egl:
> > http://lists.freedesktop.org/archives/wayland-devel/2012-November/006216.html
> > 
> > As I do not have access to a RPI I would like to ask if this is still 
> > correct. If yes, I need to change the dependencies.
> 
> Yann, maybe?

Indeed, the RPi EGL implementation does not provide the sepcific GL
extension required by Wayland, so we can't do native wayland on the RPi
(for now).

The weston compositor has support for the RPi, but using a specific
backend, that directly uses Broadcom's APIs.

So, the best course of actions for now is to simply depend on mesa3d.

However, I was thinking a bit further about that the other day:

  - having wayland stuff depend on _HAS_EGL is incorrect, because not
    all EGL providers has the required GL extension

  - on some platforms, an additional library exists, besides the EGL
    lib, that provides the GL extension.

So having Wayland stuff only depend on mesa3d is not correct either (it
is in Buildroot for now), because it might be possible to have an EGL
provider that has the required extension (I thing the NVidia driver has
it), or an additional library provides it.

The only solution I can see is to add a new virtual package (name to be
discussed) BR2_PACKAGE_HAS_WAYLAND_EGL that providers could select it is
they have that extension. It can even be a package different from the
one that provides EGL.

But, work for later. For now, packages that require the Wayland
extension can simply depend on mesa3d.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
