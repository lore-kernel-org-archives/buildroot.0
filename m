From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 14 Nov 2017 19:25:17 +0100
Subject: [Buildroot] [PATCH v3 1/1] sunxi-mali-mainline: new package
In-Reply-To: <3e05bdb1-c91a-a4c7-cc24-520614e05b7c@micronovasrl.com>
References: <1510598938-29999-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171114135619.4jslv5l36sobhznd@flea.lan>
 <3e05bdb1-c91a-a4c7-cc24-520614e05b7c@micronovasrl.com>
Message-ID: <20171114182517.odomwtffwl4unbru@flea.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 14, 2017 at 03:44:16PM +0100, Giulio Benetti wrote:
> Hi,
> 
> Il 14/11/2017 14:56, Maxime Ripard ha scritto:
> > Hi,
> > 
> > On Mon, Nov 13, 2017 at 07:48:58PM +0100, Giulio Benetti wrote:
> > > Add Allwinner Mali openGL userspace driver r6p2.
> > > Used combined with kernelspace Mali driver,
> > > it gives possibility to use 3D openGL SoC acceleration.
> > > It provides both fbdev and X11 libraries and headers.
> > > It is compatible with Linux >= 4.4 as sunxi-mali-driver-mainline.
> > > 
> > > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > > ---
> > > Changes v2 -> v3:
> > > * added package into package/Config.in
> > >   DEVELOPERS                                         |  1 +
> > >   package/Config.in                                  |  1 +
> > >   package/sunxi-mali-mainline/Config.in              | 43 +++++++++++++++
> > >   package/sunxi-mali-mainline/egl.pc                 | 12 +++++
> > >   package/sunxi-mali-mainline/glesv2.pc              | 12 +++++
> > >   package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 62 ++++++++++++++++++++++
> > >   6 files changed, 131 insertions(+)
> > >   create mode 100644 package/sunxi-mali-mainline/Config.in
> > >   create mode 100644 package/sunxi-mali-mainline/egl.pc
> > >   create mode 100644 package/sunxi-mali-mainline/glesv2.pc
> > >   create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> > > 
> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index 2fe95c8..1a751b8 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -697,6 +697,7 @@ F:	package/webp/
> > >   N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
> > >   F:	package/sunxi-mali-driver-mainline/
> > > +F:	package/sunxi-mali-mainline/
> > >   N:	Gregory Dymarek <gregd72002@gmail.com>
> > >   F:	package/ding-libs/
> > > diff --git a/package/Config.in b/package/Config.in
> > > index 8de2227..041c6f6 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -497,6 +497,7 @@ endmenu
> > >   	source "package/stm32flash/Config.in"
> > >   	source "package/sunxi-cedarx/Config.in"
> > >   	source "package/sunxi-mali-driver-mainline/Config.in"
> > > +	source "package/sunxi-mali-mainline/Config.in"
> > >   	source "package/sunxi-mali/Config.in"
> > >   	source "package/sysstat/Config.in"
> > >   	source "package/targetcli-fb/Config.in"
> > > diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
> > > new file mode 100644
> > > index 0000000..652cbc5
> > > --- /dev/null
> > > +++ b/package/sunxi-mali-mainline/Config.in
> > > @@ -0,0 +1,43 @@
> > > +config BR2_PACKAGE_SUNXI_MALI_MAINLINE
> > > +	bool "sunxi-mali-mainline"
> > > +	depends on BR2_arm
> > > +	depends on BR2_ARM_EABIHF
> > > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > > +	select BR2_PACKAGE_HAS_LIBEGL
> > > +	select BR2_PACKAGE_HAS_LIBGLES
> > > +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7
> > > +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> > > +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> > > +	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
> > > +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
> > 
> > Can't you make the selection of whether you want X11 vs fbdev
> > interfaces a choice rather than inferring it from the configuration?
> 
> As you told about X11 DMA_BUF Mali on "Re: xf86-video-armsoc":
> "There's no proper way available at the moment.",
> I think it doesn't make sense to add X11 support,
> what do you think?

That works for me.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171114/6de0955d/attachment.asc>
