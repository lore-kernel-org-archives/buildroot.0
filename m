From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 21:43:39 +0100
Subject: [Buildroot] [PATCH 2/2] sunxi-mali-mainline: new package
In-Reply-To: <1511648569-18855-2-git-send-email-giulio.benetti@micronovasrl.com>
 (Giulio Benetti's message of "Sat, 25 Nov 2017 23:22:49 +0100")
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1511648569-18855-2-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <87po56m1ac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Add Allwinner Mali openGL userspace driver r6p2.
 > Used combined with kernelspace Mali driver,
 > it gives possibility to use 3D openGL SoC acceleration.
 > It provides fbdev libraries and headers.
 > It is compatible with Linux >= 4.4 as sunxi-mali-driver-mainline.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > ---
 >  DEVELOPERS                                         |  1 +
 >  package/Config.in                                  |  1 +
 >  package/sunxi-mali-mainline/Config.in              | 36 ++++++++++++++++++++++
 >  package/sunxi-mali-mainline/egl.pc                 | 12 ++++++++
 >  package/sunxi-mali-mainline/glesv2.pc              | 12 ++++++++
 >  package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 33 ++++++++++++++++++++
 >  6 files changed, 95 insertions(+)
 >  create mode 100644 package/sunxi-mali-mainline/Config.in
 >  create mode 100644 package/sunxi-mali-mainline/egl.pc
 >  create mode 100644 package/sunxi-mali-mainline/glesv2.pc
 >  create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 60a934e..b26706b 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -700,6 +700,7 @@ F:	package/webp/
 
 >  N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 >  F:	package/sunxi-mali-driver-mainline/
 > +F:	package/sunxi-mali-mainline/

In Buildroot we "always" build user space and optionally build a Linux
kernel, so I've swapped these two packages around.


 > +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
 > @@ -0,0 +1,33 @@
 > +################################################################################
 > +#
 > +# sunxi-mali-mainline
 > +#
 > +################################################################################
 > +
 > +SUNXI_MALI_MAINLINE_VERSION = cb3e8ece9b2c3a70cbeb3204cd6f30eceaa32023
 > +SUNXI_MALI_MAINLINE_SITE = $(call github,free-electrons,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
 > +SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
 > +SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
 > +
 > +ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2),y)
 > +SUNXI_MALI_LIB_VER=r6p2
 > +endif

Variables should be prefixed with the package name. You have all the
other version logic in the Config.in, so I've changed it to use a
BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION symbol in Config.in and then
assign that to SUNXI_MALI_MAINLINE_REV similar to E.G. how it is done
for linux-headers.


 > +
 > +define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
 > +	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
 > +		$(STAGING_DIR)/usr/lib/
 > +	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/include/* \
 > +		$(STAGING_DIR)/usr/include/
 > +
 > +	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
 > +		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 > +	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
 > +		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
 > +endef
 > +
 > +define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
 > +	cp -rf $(@D)/$(SUNXI_MALI_LIB_VER)/fbdev/lib/lib_fb_dev/* \
 > +		$(TARGET_DIR)/usr/lib/
 > +endef

You need to ensure that the destination directories already exist, so
I've added the needed mkdir -p calls before.

Committed to next with these fixes, thanks.

-- 
Bye, Peter Korsgaard
