From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Dec 2014 19:47:40 +0100
Subject: [Buildroot] [PATCH 07/15 v6] package/mesa3d: depends on libudev,
 not udev
In-Reply-To: <20141027221502.787a23d7@free-electrons.com>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
 <337a1970f6cec5755ed0b7ed73f3e6b31b84c2ca.1414442699.git.yann.morin.1998@free.fr>
 <20141027221502.787a23d7@free-electrons.com>
Message-ID: <20141219184740.GA3980@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Reviving an old thread...

TL;DR:
  - using a non-virtual package is not trivial;
  - I'll stick to using a virtual package.

On 2014-10-27 22:15 +0100, Thomas Petazzoni spake thusly:
> On Mon, 27 Oct 2014 13:46:15 -0700, Yann E. MORIN wrote:
> > diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> > index 74ebbed..b55173d 100644
> > --- a/package/mesa3d/Config.in
> > +++ b/package/mesa3d/Config.in
> > @@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_MESA3D
> >  	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
> >  	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
> >  	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
> > -	depends on BR2_PACKAGE_HAS_UDEV
> > +	depends on BR2_PACKAGE_HAS_LIBUDEV
> 
> I thought the main conclusion from the meeting was that 'select' should
> be used instead of 'depends on' for libudev, no?
> 
> From the report at http://elinux.org/Buildroot:DeveloperDaysELCE2014:
> "We would also like to change the depends on libudev into select
> libudev.".
> 
> Am I missing something here?

No you're not, and I had completely forgotten about that when I
respinned the series at the time.

However, I've since tried to implement a libudev package.
It's just mind-boggling how difficult it is, in fact... :-(

On the surface, it seems pretty easy, and the bulk of the changes are
pretty trivial:

  - split eudev into 'eudev' on one side to just provide libudev, and
    a new option to provide the full 'udev daemon' on the other side;
    so 'eudev' is now just providing libudev;

  - have the new 'udev daemon' option select _HAS_UDEV;

  - introduce a dummy 'libudev' package that:
    - does nothing if systemd is enabled, except just build-depend on it,
    - select eudev if systemd is disabled, and build-depend on eudev;

  - change all packages that can be changed, to just select this new
    'libudev' dummy package, and propagate the dependencies of libudev
    to those packages.

But, not-so-curiously-enough, this causes a hell of recursive
dependencies throughout seemingly unrelated symbols, like for example:

    package/xbmc/Config.in:31:error: recursive dependency detected!
    package/xbmc/Config.in:31:      symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_XBMC_EGL_GLES
    package/xbmc/Config.in:10:      symbol BR2_PACKAGE_XBMC_EGL_GLES depends on BR2_PACKAGE_HAS_LIBEGL
    package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_LIBEGL is selected by BR2_PACKAGE_RPI_USERLAND
    package/rpi-userland/Config.in:1:       symbol BR2_PACKAGE_RPI_USERLAND is selected by BR2_PACKAGE_WESTON_RPI
    package/weston/Config.in:47:    symbol BR2_PACKAGE_WESTON_RPI depends on BR2_PACKAGE_WESTON
    package/weston/Config.in:7:     symbol BR2_PACKAGE_WESTON depends on BR2_PACKAGE_HAS_UDEV
    package/udev/Config.in:1:       symbol BR2_PACKAGE_HAS_UDEV is selected by BR2_PACKAGE_EUDEV_DAEMON
    package/eudev/Config.in:18:     symbol BR2_PACKAGE_EUDEV_DAEMON depends on BR2_PACKAGE_EUDEV
    package/eudev/Config.in:1:      symbol BR2_PACKAGE_EUDEV is selected by BR2_PACKAGE_LIBUDEV
    package/libudev/Config.in:5:    symbol BR2_PACKAGE_LIBUDEV is selected by BR2_PACKAGE_XBMC_LIBCEC
    package/xbmc/Config.in:156:     symbol BR2_PACKAGE_XBMC_LIBCEC depends on BR2_PACKAGE_XBMC

So, of course, we could go to great lengths at fixing those, sicne the
dependency chain is far from trivial to fix. In this case, it is as
simple as not selecting RPI_USERLAND from weston [0], but otherwise, the
dependency chain is totally valid in our case.

I am afraid there are other valid configurations that will also exhibit
recursive dependencies even though the configuration is perfectly valid.


On the other hand, we did introduce virtual packages for a reason: so
that packages that depend on a "feature" can safely and easily depend on
that feature, whatever the provider of that feature.

The virtual packages also help avoid to have to play tricks with conditional
'select', as well as simplify dependency inheritance.


In the end, I stand on my position to use a virtual package for libudev.

So, I'll refresh my patchset on top of master, re-test it with my
XBMC-based testbed, and respin this series, introducing libudev as a
virtual package.

If anyone is really motivated into making it a non-virtual package, he'd
be very welcome to adopt the series. ;-)

Regards,
Yann E. MORIN.


[0] which I think is the right thing to do anyway, since we explicitly
mention in the manual that providers should *not* be selected:

    http://nightly.buildroot.org/#_infrastructure_for_virtual_packages
    ---8<---
    If your package really requires a specific provider, then you?ll
    have to make your package depends on this provider; you can not select
    a provider.
    [...] you have to use +depends on BR2_PACKAGE_FOO+, which avoids any
    implicit configuration inconsistency.
    ---8<---

So I'll soon send a separate patch to fix that.

YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
