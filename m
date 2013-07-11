From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 11 Jul 2013 11:07:07 -0500
Subject: [Buildroot] [PATCH v4 1/2] ti-gfx: add new package
In-Reply-To: <20130711114129.346bc011@skate>
References: <1373479755-8086-1-git-send-email-spenser@gillilanding.com>
 <20130711114129.346bc011@skate>
Message-ID: <CAEBucnAmh-ihLbEvCV+P81kcRYkC7EacYz+HQ6NkUg+tidMtGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> When a comment like this a shown, the package option is not visible, so
> you must mention the package name in the comment, otherwise it's
> impossible for the user to understand what the comment is about. So it
> should be:
>
> comment "ti-gfx requires ..."

Will fix.

>> +define TI_GFX_CONFIGURE_CMDS
>> +     $(if $(BR2_PACKAGE_TI_GFX_EGLIMAGE),
>> +             mv -f $(@D)/$(TI_GFX_BIN_PATH)/libEGL_eglimage.so \
>> +                     $(@D)/$(TI_GFX_BIN_PATH)/libEGL.so; \
>> +             mv -f $(@D)/$(TI_GFX_BIN_PATH)/libGLES_CM_eglimage.so \
>> +                     $(@D)/$(TI_GFX_BIN_PATH)/libGLES_CM.so; \
>> +             mv -f $(@D)/$(TI_GFX_BIN_PATH)/libGLESv2_eglimage.so \
>> +                $(@D)/$(TI_GFX_BIN_PATH)/libGLESv2.so; \
>> +             mv -f $(@D)/$(TI_GFX_BIN_PATH)/libglslcompiler_eglimage.so \
>> +                     $(@D)/$(TI_GFX_BIN_PATH)/libglslcompiler.so; \
>> +             mv -f $(@D)/$(TI_GFX_BIN_PATH)/libIMGegl_eglimage.so \
>> +                     $(@D)/$(TI_GFX_BIN_PATH)/libIMGegl.so;
>> +     )
>
> This seems not really nice to do, it should be handled at install time.

Will fix.

>> +endef
>> +
>> +define TI_GFX_BUILD_KM_CMDS
>> +     $(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
>> +endef
>> +
>> +define TI_GFX_BUILD_DEMO_CMDS
>> +     $(foreach demo, $(TI_GFX_DEMOS), \
>> +             cd $(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_MAKE_LOC); \
>> +             $(TARGET_MAKE_ENV) $(MAKE1) $(TI_GFX_DEMO_MAKE_OPTS) all
>
>         $(MAKE1) -C $(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_MAKE_LOC)
>
> will avoid the need for the cd.

Will fix.

>> +     )
>> +endef
>> +
>> +define TI_GFX_BUILD_CMDS
>> +     $(TI_GFX_BUILD_KM_CMDS)
>> +     $(if $(BR2_PACKAGE_TI_GFX_DEMOS),
>> +             $(TI_GFX_BUILD_DEMO_CMDS)
>> +     )
>> +endef
>
> I think I've said it before, but we generally do:
>
> ifeq ($(BR2_PACKAGE_TI_GFX_DEMOS),y)
> define TI_GFX_BUILD_DEMO_CMDS
>         ...
> endef
> endif
>
> define TI_GFX_BUILD_CMDS
>         ...
>         $(TI_GFX_BUILD_DEMO_CMDS)
> endef

Ok I think I understand this better now.  Will fix.

>> +
>> +define TI_GFX_INSTALL_STAGING_CMDS
>> +     $(foreach incdir,$(TI_GFX_HDR_DIRS),
>> +             $(INSTALL) -d $(STAGING_DIR)/usr/include/$(notdir $(incdir)); \
>> +             $(INSTALL) -D -m 0644 $(@D)/include/$(incdir)/*.h \
>> +                     $(STAGING_DIR)/usr/include/$(notdir $(incdir))/
>> +     )
>> +     $(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/*.so $(STAGING_DIR)/usr/lib/
>> +     $(INSTALL) -D -m 0644 package/ti-gfx/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/
>> +     $(INSTALL) -D -m 0644 package/ti-gfx/glesv2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
>> +endef
>> +
>> +define TI_GFX_INSTALL_KM_CMDS
>> +     $(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM install
>> +endef
>> +
>> +define TI_GFX_INSTALL_BINS_CMDS
>> +     $(foreach bin,$(TI_GFX_BIN),
>> +             $(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$(bin) \
>> +                     $(TARGET_DIR)/usr/bin/$(bin)
>> +     )
>> +     $(if $(BR2_PACKAGE_TI_GFX_DEBUG),
>> +             $(INSTALL) -D -m 0755 package/ti-gfx/esrev.sh \
>> +                     $(TARGET_DIR)/usr/bin/esrev)
>> +endef
>> +
>> +define TI_GFX_INSTALL_LIBS_CMDS
>> +     # create symlinks and install libraries.  these libraries do not have a
>> +     # SONAME defined; therefore, they will not be automatically renamed and
>> +     # must be renamed manually.
>
> I still don't understand this "automatically renamed" comment here.

i remember hearing that in some rootfs fixup, the libraries are
renamed with symlinks according to the SONAME.  However, I can't find
it in the code so maybe this was just bad information.  I'll remove
the comment.

>> +     $(foreach lib,$(TI_GFX_LIBS),
>> +             $(INSTALL) -D -m 0755 $(@D)/$(TI_GFX_BIN_PATH)/$(lib).so \
>> +                     $(TARGET_DIR)/usr/lib/$(lib).so.$(TI_GFX_SO_VERSION); \
>> +             ln -sf $(lib).so.$(TI_GFX_SO_VERSION) \
>> +                     $(TARGET_DIR)/usr/lib/$(lib).so
>> +     )
>> +     # libs use the following file for configuration.
>> +     $(INSTALL) -D -m 0644 package/ti-gfx/powervr.ini \
>> +             $(TARGET_DIR)/etc/powervr.ini
>> +endef
>> +
>> +ifeq ($(BR2_PACKAGE_TI_GFX_DEMOS),y)
>> +define TI_GFX_INSTALL_DEMOS_CMDS
>> +     $(foreach demo,$(TI_GFX_DEMOS),
>> +             $(INSTALL) -D -m 0755 \
>> +             $(@D)/$(TI_GFX_DEMOS_LOC)/$(demo)/$(TI_GFX_DEMOS_BIN_LOC)/OGLES2$(demo) \
>> +             $(TARGET_DIR)/usr/bin/OGLES2$(demo)
>> +     )
>> +endef
>> +endif
>> +
>> +define TI_GFX_INSTALL_INIT_SYSV
>> +     $(INSTALL) -D -m 0755 package/ti-gfx/S80ti-gfx \
>> +             $(TARGET_DIR)/etc/init.d/S80ti-gfx
>> +endef
>> +
>> +define TI_GFX_INSTALL_TARGET_CMDS
>> +     $(TI_GFX_INSTALL_KM_CMDS)
>> +     $(TI_GFX_INSTALL_BINS_CMDS)
>> +     $(TI_GFX_INSTALL_LIBS_CMDS)
>> +     $(if $(BR2_PACKAGE_TI_GFX_DEMOS),
>> +             $(TI_GFX_INSTALL_DEMOS_CMDS)
>> +     )
>
> Same comment as above for demo build, especially since
> TI_GFX_INSTALL_DEMOS_CMDS is not defined when BR2_PACKAGE_TI_GFX_DEMOS
> is not enabled.

Wil fix.

>> +endef
>> +
>> +$(eval $(generic-package))
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
