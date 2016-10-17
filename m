From: daggs <daggs@gmx.com>
Date: Mon, 17 Oct 2016 23:11:33 +0200
Subject: [Buildroot] [PATCH 1/2] X11/odroidc2-driver: New Package.
In-Reply-To: <9fe82330-7c8d-0f31-e777-db4e5014cf5f@mind.be>
References: <20161013174124.9639-1-daggs@gmx.com>,
 <9fe82330-7c8d-0f31-e777-db4e5014cf5f@mind.be>
Message-ID: <trinity-122b1f64-5a75-4714-b1e0-471c25487584-1476738693195@3capp-mailcom-bs01>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Arnout,
I've somehow missed the rest of this mail:

>  Hi Dagg,
> 
>  You subject line should be:
> 
> xdriver_xf86-video-odroidc2: new package
> 
>  I have a generic remark about this package and I'm not sure how to solve it.
> This is actually the source that comes from ARM:
> 
> http://malideveloper.arm.com/downloads/drivers/DX910/r7p0-00rel0/DX910-SW-99003-r7p0-00rel0.tgz
> 
> which has been lightly patched in unfathomable ways. The igloo community has a
> similar patches driver. There are probably others as well.
> 
>  The github repo is really a mess (well, the ARM tarball as well but slightly
> less so). It is full of build artefacts, like the .deps directory... It has just
> two commits. The changes w.r.t. the ARM tarball are not a separate commit.
> 
>  But I don't know what the options are here. We can have duplicates of this
> package for each board that hacks it in a different way. Or we could have a
> single xdriver_xf86-video-mali package based on the ARM tarball, but then a
> different patch would probably have to be applied to it depending on the board.
> Either by somehow detecting the board in the .mk file, or by putting the patch
> in the global patch dir of the odroid boards. Oh, and there is no upstream we
> can send this to (or do we expect ARM to be responsive to patches? Note that the
> bugurl they specify in the package is freedesktop...).
> 
>  All of that sounds a bit too complicated, so let's keep this package for the
> time being. I'd only like two major changes (+ comments below):
> 
> - rename the package to xdriver_xf86-video-mali-odroidc2
> 
> - in the help text refer to the real upstream, e.g.
> http://malideveloper.arm.com/resources/drivers/open-source-mali-gpus-linux-exadri2-and-x11-display-drivers/
> and explained that this is a hacked version of it.
> 
> 
> On 13-10-16 19:41, Dagg Stompler wrote:
> > add the X11 driver for odroid c2 boards.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  package/x11r7/Config.in                            |  1 +
> >  ...001-c2_mali_ddx-support-cross-compilation.patch | 40 ++++++++++++++++++++++
> >  .../x11r7/xdriver_xf86-video-odroidc2/Config.in    | 13 +++++++
> >  .../xdriver_xf86-video-odroidc2.hash               |  2 ++
> >  .../xdriver_xf86-video-odroidc2.mk                 | 24 +++++++++++++
> >  5 files changed, 80 insertions(+)
> >  create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
> >  create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/Config.in
> >  create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
> >  create mode 100644 package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk
> > 
> > diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> > index 40aa80c..1c5ff7e 100644
> > --- a/package/x11r7/Config.in
> > +++ b/package/x11r7/Config.in
> > @@ -174,6 +174,7 @@ if BR2_PACKAGE_XORG7
> >  		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
> >  		source package/x11r7/xdriver_xf86-video-nouveau/Config.in
> >  		source package/x11r7/xdriver_xf86-video-nv/Config.in
> > +		source package/x11r7/xdriver_xf86-video-odroidc2/Config.in
> >  		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
> >  		source package/x11r7/xdriver_xf86-video-qxl/Config.in
> >  		source package/x11r7/xdriver_xf86-video-r128/Config.in
> > diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch b/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
> > new file mode 100644
> > index 0000000..c85f38b
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-odroidc2/0001-c2_mali_ddx-support-cross-compilation.patch
> > @@ -0,0 +1,40 @@
> > +From 622c02622665c0cbb35433c8f9969d41b25e028a Mon Sep 17 00:00:00 2001
> > +From: Dagg Stompler <daggs@gmx.com>
> > +Date: Sat, 6 Aug 2016 09:19:08 +0300
> > +Subject: [PATCH] c2_mali_ddx: support cross compilation
> 
>  There are also scons scripts, do these work better?
never tried them, if automake works, does it matters if scons works?

> 
>  BTW explicitly mention that you patch both .am and .in to avoid autoreconf'ing.
will do.

> 
> > +
> > +Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > +---
> > + src/Makefile.am | 2 +-
> > + src/Makefile.in | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> > +index 7fec079..6b49a16 100755
> > +--- a/src/Makefile.am
> > ++++ b/src/Makefile.am
> > +@@ -27,7 +27,7 @@ mali_drv_la_LDFLAGS = -module -avoid-version -L$(MALI_DDK)/lib -lMali -lUMP -lpt
> > + mali_drv_ladir = @moduledir@/drivers
> > + 
> > + AM_CFLAGS = @XORG_CFLAGS@ \
> > +-	-I/usr/include/libdrm \
> > ++	-I$(SYSROOT)/usr/include/libdrm \
> > + 	-I$(MALI_DDK)/include \
> > + 	-I$(MALI_DDK)/internal/include/khronos \
> > + 	-I$(MALI_DDK)/src/ump/include \
> > +diff --git a/src/Makefile.in b/src/Makefile.in
> > +index b30194b..2952cdc 100755
> > +--- a/src/Makefile.in
> > ++++ b/src/Makefile.in
> > +@@ -350,7 +350,7 @@ mali_drv_la_LTLIBRARIES = mali_drv.la
> > + mali_drv_la_LDFLAGS = -module -avoid-version -L$(MALI_DDK)/lib -lMali -lUMP -lpthread
> > + mali_drv_ladir = @moduledir@/drivers
> > + AM_CFLAGS = @XORG_CFLAGS@ \
> > +-	-I/usr/include/libdrm \
> > ++	-I/$(SYSROOT)/usr/include/libdrm \
> > + 	-I$(MALI_DDK)/include \
> > + 	-I$(MALI_DDK)/internal/include/khronos \
> > + 	-I$(MALI_DDK)/src/ump/include \
> > +-- 
> > +2.9.2
> > +
> > diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/Config.in b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
> > new file mode 100644
> > index 0000000..b2088c8
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-odroidc2/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ODROIDC2
> > +	bool "xf86-video-odroidc2"
> > +	depends on BR2_aarch64
> 
>  There is nothing in this package directly that limits it to aarch64. So this
> dependency isn't appropriate.
that is correct but it won't compile on a arm system because of the X11 opengl limitation.

> 
>  You forgot to select or depend on ODROID_MALI. I think the appropriate approach
> is to select it in this case. Then of course you do have to add the reverse
> dependencies:
> 	depends on BR2_aarch64 || BR2_ARM_EABIHF # odroid-mali
> 	depends on BR2_TOOLCHAIN_USES_GLIBC # odroid-mali
will do.

> 
>  And you're missing the reverse dependencies of mesa3d:
> 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
> 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
> (the other ones are already covered by xserver).
same here.

> 
> 
> > +	select BR2_PACKAGE_XPROTO_FONTSPROTO
> > +	select BR2_PACKAGE_XPROTO_XPROTO
> > +	select BR2_PACKAGE_XPROTO_DRI2PROTO
> > +	select BR2_PACKAGE_MESA3D
> > +	select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
> 
>  Why is SWRAST needed?
from what I've understood from the devs, there is no 3D egl implementation. even the official ubuntu images use mesa swrast.

> 
>  Please keep the selects alphabetically ordered.
will do.

> 
> > +	help
> > +	 odroid c2 mali 450 GPU ddx video driver
> 
>  As I said, please add here a reference to the ARM upstream.
> 
> > +
> > +comment "xf86-video-odroidc2 needs egl support from odroid-mali and ARM64 arch"
> > +	depends on !BR2_PACKAGE_ODROID_MALI || !BR2_aarch64
> 
>  This should become a glibc + NPTL threads comment instead.
why? are we sure this won't work for uclibc or musl?

> 
> > diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
> > new file mode 100644
> > index 0000000..37cd236
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.hash
> > @@ -0,0 +1,2 @@
> > +# Computed Locally
> > +sha256 c442a06c1a528a64b444721ec91b903b84da36120a1b78b965196cc854c7acef  xdriver_xf86-video-odroidc2-2d8e1595da7231f152b78ef8a9b9583fb585883a.tar.gz
> > diff --git a/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk
> > new file mode 100644
> > index 0000000..cad2432
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-odroidc2/xdriver_xf86-video-odroidc2.mk
> > @@ -0,0 +1,24 @@
> > +################################################################################
> > +#
> > +# xdriver_xf86-video-odroidc2
> > +#
> > +################################################################################
> > +
> > +XDRIVER_XF86_VIDEO_ODROIDC2_VERSION = 2d8e1595da7231f152b78ef8a9b9583fb585883a
> > +XDRIVER_XF86_VIDEO_ODROIDC2_SITE = $(call github,mdrjr,c2_mali_ddx,$(XDRIVER_XF86_VIDEO_ODROIDC2_VERSION))
> > +XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE = ARM EULA
> 
>  Where did you get this? I only see MIT license in README.txt...
not sure, I don't remember, will change.

> 
> > +XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE_FILES = README.txt 
> > +XDRIVER_XF86_VIDEO_ODROIDC2_DEPENDENCIES = \
> > +	odroid-mali \
> > +	xproto_fontsproto \
> > +	xproto_xproto \
> 
>  You also select dri2proto, is that not needed? But actually, I don't see any
> inclusion of either of these three proto packages, only of xserver stuff (and a
> few that I can't place, like ump.h)
ump.h is part of the x11 egl pkg.
I've added the above deps based on compilation errors I've got.

> 
> > +	mesa3d \
> > +	xserver_xorg-server
> > +
> > +define XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
> > +        $(INSTALL) -m 0644 -D $(@D)/src/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
> 
>  Hm, not sure about this one. If all packages do that we get conflicts. For e.g.
> the Vivante X11 driver, we put in the help text what you have to add to
> xorg.conf to make it work.
alternatively one can us the turbofb X11 driver to X to work do I based the pkg on that. 
can I see the expected result in the Vivante X11 driver?

> 
> > +endef
> > +
> > +XDRIVER_XF86_VIDEO_ODROIDC2_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ODROIDC2_INSTALL_CONF_FILE
> > +
> > +$(eval $(autotools-package))
> > 
