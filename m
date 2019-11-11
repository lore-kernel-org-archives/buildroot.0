From: Jens Kleintje <Scooby22@web.de>
Date: Mon, 11 Nov 2019 11:19:31 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcnano-binaries: new package
In-Reply-To: <trinity-e5303488-a97e-46bb-8738-520846b1c6db-1573110060239@3c-app-webde-bap18>
References: <20191106155611.31575-1-scooby22@web.de>
 <20191106155611.31575-2-scooby22@web.de> <20191106230831.0a4017c6@windsurf>
 <trinity-e5303488-a97e-46bb-8738-520846b1c6db-1573110060239@3c-app-webde-bap18>
Message-ID: <trinity-5b74f91d-c30f-42b7-9c54-1a49e1f58aee-1573467571744@3c-app-webde-bs25>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Gesendet:?Mittwoch, 06. November 2019 um 23:08 Uhr
> Von:?"Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> An:?"Jens Kleintje" <scooby22@web.de>
> Cc:?buildroot at busybox.net
> Betreff:?Re: [Buildroot] [PATCH 1/2] package/gcnano-binaries: new package
> Hello Jens,

> Thanks for your contribution! I suppose you're the person I met last
> week during the Embedded Linux Conference Europe in Lyon, who asked me
> about submitting this gcnano-binaries package ?
You are right.

> > In any case, glad to see this package being contributed.

> > On Wed, 6 Nov 2019 16:56:10 +0100
> > Jens Kleintje <scooby22@web.de> wrote:

> > New package which provides the driver and binary blob libraries for the
> > STM32MP157 vivante gcnano gpu.
> > The precompiled libaries depends on wayland and libdrm.
> > Since the github repo has no releases/tags we use the standard git method
> > with explicit SHA.

> We need your Signed-off-by line here.
OK

> > ---
> > package/Config.in | 1 +
> > package/gcnano-binaries/gcnano-binaries.hash | 2 +
> > package/gcnano-binaries/gcnano-binaries.mk | 87 ++++++++++++++++++++

> You forgot to include the package/gcnano-binaries/Config.in file in
> your patch, so we cannot review the full package.
Sorry

> Also, please add an entry in the DEVELOPERS file for this new package.
OK

> > diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
> > new file mode 100644
> > index 0000000000..fae7e56deb
> > --- /dev/null
> > +++ b/package/gcnano-binaries/gcnano-binaries.hash
> > @@ -0,0 +1,2 @@
> > +sha256 19f3fe4e83ec95fd2ecb70d5cb03c7b00a13357966a9b6e56b59e5788c550c88 gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
> > +sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57 EULA
> > diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
> > new file mode 100644
> > index 0000000000..806abd7840
> > --- /dev/null
> > +++ b/package/gcnano-binaries/gcnano-binaries.mk
> > @@ -0,0 +1,87 @@
> > +################################################################################
> > +#
> > +# VIVANTE GCNANO BINARIES
> > +#
> > +################################################################################
> > +
> > +
> > +GCNANO_BINARIES_FILE_VERSION = 6.2.4.p4
> > +GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
> > +GCNANO_BINARIES_SITE = https://github.com/STMicroelectronics/gcnano-binaries.git
> > +GCNANO_BINARIES_SITE_METHOD = git

> Please use the "github" helper macro:

> GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
> GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))

> and remove the _SITE_METHOD variable.
The page (https://github.com/STMicroelectronics/gcnano-binaries)
has no release and no tag. So I think there is no archive directory.

> > +
> > +GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
> > +GCNANO_BINARIES_LICENSE_FILES = EULA
> > +GCNANO_BINARIES_REDISTRIBUTE = NO
> > +
> > +GCNANO_BINARIES_DEPENDENCIES = linux wayland libdrm
> > +
> > +GCNANO_BINARIES_INSTALL_STAGING = YES
> > +
> > +GCNANO_BINARIES_PROVIDES = libegl libgles
> > +
> > +define GCNANO_BINARIES_EXTRACT_HELPER
> > + awk 'BEGIN { start = 0; } \
> > + /^EOEULA/ { start = 0; } \
> > + { if (start) print; } \
> > + /<<EOEULA/ { start = 1; }' \
> > + $(1) > $(@D)/EULA
> > + cd $(@D) && sh $(1) --auto-accept
> > + find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> > + rmdir $(@D)/$(basename $(notdir $(1)))
> > +endef
> > +
> > +
> > +define GCNANO_BINARIES_EXTRACT_CMDS
> > +gzip -d -c $(GCNANO_BINARIES_DL_DIR)/gcnano-binaries-$(GCNANO_BINARIES_VERSION).tar.gz | tar --strip-components=1 -C $(@D) -xf -
> > +tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_FILE_VERSION).tar.xz -C $(@D)

> These two lines look like the default extract commands, so why are you
> doing this ? Just because you need to call the
> GCNANO_BINARIES_EXTRACT_HELPER ?

> If so, then you don't need that, simply do:

> GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER

> and in GCNANO_BINARIES_EXTRACT_HELPER, instead of using $(1), just use
> $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626.bin
> directly.

> Also, could you add a comment on top of GCNANO_BINARIES_EXTRACT_HELPER
> to explain what it does, because it is not obvious.
OK

> > +$(call GCNANO_BINARIES_EXTRACT_HELPER,$(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626.bin)
> > +endef
> > +
> > +GCNANO_BINARIES_MODULE_MAKE_OPTS = \
> > + KERNEL_DIR=$(LINUX_DIR) \
> > + SOC_PLATFORM=st-st\

> Space before \

> > + AQROOT=$(@D)\

> Ditto.

> > + DEBUG=0
> > +
> > +define GCNANO_BINARIES_INSTALL_STAGING_CMDS
> > + cp $(@D)/usr/lib/pkgconfig/* $(STAGING_DIR)/usr/lib/pkgconfig/
> > + cp -r $(@D)/usr/lib/* $(STAGING_DIR)/usr/lib/
> > + cd $(STAGING_DIR)/usr/lib; \
> > + ln -sf gbm_viv.6.2.4.multi.release.so gbm_viv.so; \
> > + ln -sf libEGL.6.2.4.multi.release.so libEGL.so; \
> > + ln -sf libEGL.so libEGL.so.1; \
> > + ln -sf libGAL.6.2.4.multi.release.so libGAL.so; \
> > + ln -sf libgbm.6.2.4.multi.release.so libgbm.so; \
> > + ln -sf libgbm.so libgbm.so.1; \
> > + ln -sf libGLESv1_CM.6.2.4.multi.release.so libGLESv1_CM.so; \
> > + ln -sf libGLESv2.6.2.4.multi.release.so libGLESv2.so; \
> > + ln -sf libGLESv2.so libGLESv2.so.2; \
> > + ln -sf libGLSLC.6.2.4.multi.release.so libGLSLC.so; \
> > + ln -sf libOpenVG.6.2.4.multi.release.so libOpenVG.so; \
> > + ln -sf libVSC.6.2.4.multi.release.so libVSC.so
> > + rm -f $(STAGING_DIR)/usr/lib/pkgconfig/wayland-egl.pc

> Why are you removing this .pc file ?
The file is already provided by wayland package.
I saw it from in the yocto package  
https://github.com/STMicroelectronics/meta-st-stm32mp/blob/thud/recipes-graphics/gcnano-userland/gcnano-userland-binary.inc

> > + cp -r $(@D)/usr/include/* $(STAGING_DIR)/usr/include/
> > +endef
> > +
> > +GCNANO_BINARIES_POST_INSTALL_TARGET_HOOKS += GCNANO_BINARIES_COPY_LIBS

> I am not sure why you are using a
> GCNANO_BINARIES_POST_INSTALL_TARGET_HOOKS. Why not simply rename
> GCNANO_BINARIES_COPY_LIBS to GCNANO_BINARIES_INSTALL_TARGET_CMDS.
I need to accept the EULA. But some parts I will move.

> > +define GCNANO_BINARIES_COPY_LIBS
> > + cp -r $(@D)/usr/lib/* $(TARGET_DIR)/usr/lib/
> > + cd $(TARGET_DIR)/usr/lib; \
> > + ln -sf gbm_viv.6.2.4.multi.release.so gbm_viv.so; \
> > + ln -sf libEGL.6.2.4.multi.release.so libEGL.so; \
> > + ln -sf libEGL.so libEGL.so.1; \
> > + ln -sf libGAL.6.2.4.multi.release.so libGAL.so; \
> > + ln -sf libgbm.6.2.4.multi.release.so libgbm.so; \
> > + ln -sf libgbm.so libgbm.so.1; \
> > + ln -sf libGLESv1_CM.6.2.4.multi.release.so libGLESv1_CM.so; \
> > + ln -sf libGLESv2.6.2.4.multi.release.so libGLESv2.so; \
> > + ln -sf libGLESv2.so libGLESv2.so.2; \
> > + ln -sf libGLSLC.6.2.4.multi.release.so libGLSLC.so; \
> > + ln -sf libOpenVG.6.2.4.multi.release.so libOpenVG.so; \
> > + ln -sf libVSC.6.2.4.multi.release.so libVSC.so;
> > +endef

> The long list of symlinks to be created is not nice, but I don't really
> see a nicer solution to achieve the same. Perhaps one thing that could
> be done is to factorize stuff a bit:

> define GCNANO_BINARIES_INSTALL
> cp $(@D)/usr/lib/pkgconfig/* $(1)/usr/lib/pkgconfig/
> cp -r $(@D)/usr/lib/* $(1)/usr/lib/
> cd $(1)/usr/lib; \
> ln -sf gbm_viv.6.2.4.multi.release.so gbm_viv.so; \
> ln -sf libEGL.6.2.4.multi.release.so libEGL.so; \
> ln -sf libEGL.so libEGL.so.1; \
> ln -sf libGAL.6.2.4.multi.release.so libGAL.so; \
> ln -sf libgbm.6.2.4.multi.release.so libgbm.so; \
> ln -sf libgbm.so libgbm.so.1; \
> ln -sf libGLESv1_CM.6.2.4.multi.release.so libGLESv1_CM.so; \
> ln -sf libGLESv2.6.2.4.multi.release.so libGLESv2.so; \
> ln -sf libGLESv2.so libGLESv2.so.2; \
> ln -sf libGLSLC.6.2.4.multi.release.so libGLSLC.so; \
> ln -sf libOpenVG.6.2.4.multi.release.so libOpenVG.so; \
> ln -sf libVSC.6.2.4.multi.release.so libVSC.so
> rm -f $(1)/usr/lib/pkgconfig/wayland-egl.pc
> cp -r $(@D)/usr/include/* $(1)/usr/include/
> endef

> And then:

> define GCNANO_BINARIES_INSTALL_STAGING_CMDS
> $(call GCNANO_BINARIES_INSTALL,$(STAGING_DIR))
> endef

> define GCNANO_BINARIES_INSTALL_TARGET_CMDS
> $(call GCNANO_BINARIES_INSTALL,$(TARGET_DIR))
> endef

> Note: it is perfectly fine to install header files and .pc files to
> $(TARGET_DIR), they anyway get cleaned up later in the build.
OK

> Could you rework your patch to take into account those comments ?
Will come soon.
> Thanks!

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com[https://bootlin.com]
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot[http://lists.busybox.net/mailman/listinfo/buildroot]
Regards

Jens Kleintje
