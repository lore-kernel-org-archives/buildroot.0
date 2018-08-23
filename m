From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Aug 2018 16:36:32 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: vulkan with x11 needs dri3
In-Reply-To: <20180823132357.1dd3a730@windsurf>
References: <20180823090827.4003-1-yann.morin.1998@free.fr>
 <20180823121152.30d51975@windsurf> <20180823102029.GE9365@scaer>
 <20180823132357.1dd3a730@windsurf>
Message-ID: <20180823143632.GF9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-23 13:23 +0200, Thomas Petazzoni spake thusly:
> On Thu, 23 Aug 2018 12:20:29 +0200, Yann E. MORIN wrote:
> > > Doesn't this requires a bit more rework to be clean ?  
> > 
> > Yes, I'll have a further look by the end of the day. I've marked it as
> > Changes Requested.
> > 
> > To be hnest, the whole of mesa3d may need a complete overhaul I think.
> > Theree dubious constructs here and there, like:
> > 
> >     config BR2_PACKAGE_MESA3D_DRI_DRIVER
> >         bool
> >         select BR2_PACKAGE_MESA3D_DRIVER
> >         select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
> >                 (BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
> > 
> > So now I wonder if we shouldn't have something akin to this for Vulkan.
> > 
> > Really, mesa3d has become quite a nest of snakes. It's hard to follow
> > and understand the dependencies between each config options...
> 
> Yes, the mesa3d package is quite complicated. But I believe this (at
> least partially) reflects that the mesa3d configuration itself is quite
> complicated. There are lots of drivers, all having special dependencies.

Yes, but ciurrently, I'm afraid we can end up with an inconsistent
.config.

That snippet:

    config BR2_PACKAGE_MESA3D_DRI_DRIVER
        bool
        select BR2_PACKAGE_MESA3D_DRIVER
        select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
                (BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)

    config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
        bool "DRI nouveau driver"
        select BR2_PACKAGE_MESA3D_DRI_DRIVER
        select BR2_PACKAGE_LIBDRM_NOUVEAU

Means that, if using Xorg and a toolchain that does not have sync-4, and
nouveau is enabled, then xlib-libxshnfence is not forcully selected.

So, in the .mk:

    ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
        [--SNIP--]
    else
    ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
    MESA3D_DEPENDENCIES += xlib_libxshmfence
    MESA3D_CONF_OPTS += --enable-dri3
    else
    MESA3D_CONF_OPTS += --disable-dri3
    endif
        [--SNIP--]
    endif

Which means we're going to actually disable dri3, even though at least
one DRI driver has been enabled...

It turns out that the only archs Buildroot knows of, that don't have
sync-4, also do not have sync-1. And mesa3d requires sync-1.

Still, the construct in the Config.in really looks suspicious. The sync4
dependency is from xlib-libxshmfence. I.e. we can select DRI drivers even
if dri3 is not available because xlib-libxshmfence is not availabel
because sync-4 is not. It really looks incorrect... :-/

Bernd, Romain, can you please comment on this?

Regards,
Yann E. MORIN.
> So, perhaps the Buildroot packaging can be improved (it would be
> nice!), but it will remain anyway a complex package.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
