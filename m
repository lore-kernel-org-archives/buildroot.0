From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 22:42:05 +0200
Subject: [Buildroot] [PATCH 1/6] libdrm: bump and add experimental ARM
 framebuffer support
In-Reply-To: <CAEBucnBL47PkMSgQhq+jT6QbE_rOqk3LzMPBcomK4j6yh5h3-Q@mail.gmail.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-2-git-send-email-spenser@gillilanding.com>
 <20130827093833.603e00a5@skate>
 <CAEBucnBL47PkMSgQhq+jT6QbE_rOqk3LzMPBcomK4j6yh5h3-Q@mail.gmail.com>
Message-ID: <20130827224205.4017fa17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 27 Aug 2013 14:24:08 -0500, Spenser Gilliland wrote:

> > libatomic_ops is not available on all architectures. In the prevous
> > libdrm code, it was only selected on i386 and x86-64, so it was ok, but
> > if libatomic_ops is now needed in all cases for libdrm, then you need
> > to propagate the libatomic_ops dependencies into libdrm, i.e:
> >
> >         depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
> 
> It is only needed for x86/x86_64, so we can select the option only
> when BR2_i386 or BR2_x86_64.

Fine.

> >> +     select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_i386 || BR2_x86_64
> >>       depends on BR2_PACKAGE_XORG7
> >
> > If libdrm is needed by Wayland, then it sounds strange to require
> > enabling BR2_PACKAGE_XORG7. When I did the Wayland packaging, there are
> > a few X.org packages that I moved out of the BR2_PACKAGE_XORG7
> > condition, maybe we should do the same for libpciaccess and
> > libpthread-stubs. But ok, this is probably something we can tackle at a
> > later point, I don't want to require you to solve all problems right
> > now :)
> 
> I agree these packages should probably be moved out of xorg, but the
> BR2_PACKAGE_XORG7 doesn't really do much other than allow access to
> the libraries.

That's true, but it means that the user needs to know that the global
BR2_PACKAGE_XORG7 option has to be enabled if he wants to build
something completely unrelated (say Wayland).

But ok, as I said, let's do this later on.

> >> -ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
> >> -LIBDRM_CONF_OPT += --disable-radeon
> >
> > So those --enable-intel / --disable-radeon things are no longer needed?
> 
> I'll do some more testing to make sure but I don't believe so.

Ok.

> >> +ifeq ($(BR2_arm),y)
> >> +LIBDRM_CONF_OPT += \
> >> +     --enable-omap-experimental-api \
> >> +     --enable-exynos-experimental-api \
> >> +     --enable-freedreno-experimental-api
> >>  endif
> >
> > It seems strange to me to enable those options as soon as we're on ARM.
> > I think we probably need Config.in sub-options for these.
> 
> I'll add config options for each driver.  I initially tried to avoid
> this, but more and more I think it's a better solution.

Excellent, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
