From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 16 Jul 2013 11:46:28 -0500
Subject: [Buildroot] [RFC 2/3] sunxi-mali: new package
In-Reply-To: <20130716105514.3a6bd85c@skate>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-3-git-send-email-spenser@gillilanding.com>
 <20130716105514.3a6bd85c@skate>
Message-ID: <CAEBucnCaQXD1Q__3bgx__3BPkNxGybGi5fQZecJ8nUo5zLVAgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


> It'd be great to have some explanations about what is this
> sunxi-mali-prop compared to sunxi-mali. At least in the commit log,
> maybe even somewhere in the source code (but I'm not sure where).

Basically, sunxi-mali-prop is a git submodule of sunxi-mali.  It is
copied into the lib/mali directory to emulate this configuration.
(doesn't work as a symlink unfortunately)

>> +config BR2_PACKAGE_SUNXI_MALI_PROP
>> +     bool
>
> Maybe you need to select this from sunxi-mali/Config.in ?

Will fix.

>> diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
>> new file mode 100644
>> index 0000000..f745731
>> --- /dev/null
>> +++ b/package/sunxi-mali-prop/sunxi-mali-prop.mk
>> @@ -0,0 +1,10 @@
>> +################################################################################
>> +#
>> +# sunxi-mali
>
> sunxi-mali-prop

Will fix.

>> +#
>> +################################################################################
>> +
>> +SUNXI_MALI_PROP_VERSION = e4ced47
>> +SUNXI_MALI_PROP_SITE = http://github.com/linux-sunxi/sunxi-mali-proprietary/tarball/$(SUNXI_MALI_PROP_VERSION)
>> +
>> +$(eval $(generic-package))
>> diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
>> new file mode 100644
>> index 0000000..d1ad173
>> --- /dev/null
>> +++ b/package/sunxi-mali/Config.in
>> @@ -0,0 +1,65 @@
>> +config BR2_PACKAGE_SUNXI_MALI
>> +     bool "sunxi-mali"
>> +     select BR2_PACKAGE_HAS_OPENGL_EGL
>> +     select BR2_PACKAGE_HAS_OPENGL_ES
>> +     depends on BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
>
> As suggested above: select BR2_PACKAGE_SUNXI_MALI_PROP.

Will fix.

> Just curious: there is no kernel modules?

Well, yes and no.  There is the possibility to build the external
module.  However, it is included by default in the sunxi-linux kernel.
 See https://github.com/linux-sunxi/mali-400-kernel-drivers for the
external module.

>> +     help
>> +       Install the ARM Mali drivers for sunxi based systems.
>> +
>> +       http://github.com/linux-sunxi/sunxi-mali
>> +
>> +if BR2_PACKAGE_SUNXI_MALI
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_DBG
>> +     bool "install malitest and maliver tools"
>> +     help
>> +       Install 3D triangle demo malitest application and the maliver application
>> +       which describes the kernel module version.
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_HARDFP
>> +     bool "use hard float binaries"
>> +     help
>> +       Install hard float binaries (required if using a hard float toolchain)
>
> Hopefully with my EABIhf series this can be refactored, but ok for now.

Will fix.

>> +
>> +choice
>> +     prompt "type of EGL binaries to install"
>> +     default BR2_PACKAGE_SUNXI_FB
>> +     help
>> +       Which EGL_TYPE binaries should be installed?
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_FB
>> +     bool "framebuffer"
>> +     help
>> +       Install framebuffer compatible binaries
>> +
>> +# TODO: Add X11 support
>> +#config BR2_PACKAGE_SUNXI_MALI_X11
>> +#    bool "X11"
>> +#    help
>> +#      Install X11 compatible binaries
>
> Does this requires a specific Mali X11 driver? Is it something you
> intend to package in this first version of sunxi-mali, or something you
> intend to do later (in which case you could remove this choice for now).

There is an x11 driver here
https://github.com/linux-sunxi/xf86-video-mali . However, I was
planning to add this in a later patch series. So, I'll just delete it
for now.

>> +endchoice
>> +
>> +choice
>> +     prompt "Version"
>> +     default BR2_PACKAGE_SUNXI_MALI_R3P1
>> +     help
>> +       Select the version of the Sunxi Mali binaries to install.
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_R2P4
>> +     bool "r2p4"
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_R3P0
>> +     bool "r3p0"
>> +
>> +config BR2_PACKAGE_SUNXI_MALI_R3P1
>> +     depends on BR2_PACKAGE_SUNXI_MALI_HARDFP
>> +     bool "r3p1"
>
> I wouldn't know how to chose between the three possibilities here, some
> more help would be nice. Also, maybe add a comment for the r3p1 being
> not available on !EABIhf systems.

I'm having trouble finding a description of what cores use which
version of the libs.  The best method is to install and use the
maliver application to determine the appropriate version.  I'll add
info about this to the help text.  Also, I will add the !EABIHF
comment.

>
>> +endchoice
>> +
>> +endif
>> +
>> +comment "sunxi-mali requires an eglibc/glibc based toolchain"
>> +     depends on !(BR2_TOOLCHAIN_USES_GLIBC) && BR2_arm
>
> Parenthesis unneeded.

Will fix.

>
>> diff --git a/package/sunxi-mali/S80mali b/package/sunxi-mali/S80mali
>> new file mode 100644
>> index 0000000..22976b6
>> --- /dev/null
>> +++ b/package/sunxi-mali/S80mali
>> @@ -0,0 +1,56 @@
>> +#!/bin/sh -e
>> +
>> +install_driver() {
>> +     DRIVER=$1
>> +     OPTS=$2
>> +
>> +     modprobe $DRIVER $OPTS
>> +     maj=$(awk "$$2==\"${DRIVER}\" { print $$1; }" /proc/devices)
>> +
>> +     if [ -e /dev/${DRIVER} ]; then
>> +             rm -f /dev/${DRIVER}
>> +     fi
>> +
>> +     mknod /dev/${DRIVER} c $maj 0
>> +     chmod 666 /dev/${DRIVER}
>
> 600.

Will fix.

>
>> +}
>> +
>> +start() {
>> +     echo "mali: starting driver"
>> +
>> +     BITSPERPIXEL="$(fbset | awk '/geom/ {print $6}')"
>> +     YRES="$(fbset | awk '/geom/ {print $3}')"
>> +     # Set RGBA ordering to something the drivers like
>> +     if [ "$BITSPERPIXEL" = "32" ] ; then
>> +             fbset -rgba 8/16,8/8,8/0,8/24
>> +     fi
>> +     # Try to enable triple buffering when there's enough VRAM
>> +     fbset -vyres $(( YRES*3 ))
>> +
>> +     install_driver mali
>> +     install_driver ump
>> +}
>> +
>> +stop() {
>> +     echo "mali: stopping driver"
>> +
>> +     rmmod ump
>> +     rmmod mali
>> +}
>> +
>> +case "$1" in
>> +start)
>> +     start
>> +;;
>> +stop)
>> +     stop
>> +;;
>> +restart)
>> +     stop
>> +     start
>> +;;
>> +*)
>> +     echo "mali: Please use start, stop, or restart."
>> +     exit 1
>> +;;
>> +esac
>> diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
>> new file mode 100644
>> index 0000000..56e3990
>> --- /dev/null
>> +++ b/package/sunxi-mali/egl.pc
>> @@ -0,0 +1,12 @@
>> +prefix=/usr/
>> +exec_prefix=${prefix}
>> +libdir=${exec_prefix}/lib
>> +includedir=${prefix}/include
>> +
>> +Name: egl
>> +Description: ARM Mali implementation of EGL
>> +Version: 1.4
>> +Requires:
>> +Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
>> +Cflags: -I{includedir}/EGL/ -I${includedir}
>> +
>> diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
>> new file mode 100644
>> index 0000000..4e112ee
>> --- /dev/null
>> +++ b/package/sunxi-mali/glesv2.pc
>> @@ -0,0 +1,12 @@
>> +prefix=/usr
>> +exec_prefix=${prefix}
>> +libdir=${exec_prefix}/lib
>> +includedir=${prefix}/include
>> +
>> +Name: glesv2
>> +Description: ARM Mali implementation of OpenGL ESv2
>> +Version: 2.0
>> +Requires:
>> +Libs: -L${libdir} -lGLESv2 -lGLES_CM -lUMP
>> +Cflags: -I${includedir}/GLES2
>> +
>> diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
>> new file mode 100644
>> index 0000000..693e454
>> --- /dev/null
>> +++ b/package/sunxi-mali/sunxi-mali.mk
>> @@ -0,0 +1,79 @@
>> +################################################################################
>> +#
>> +# sunxi-mali
>> +#
>> +################################################################################
>> +
>> +SUNXI_MALI_VERSION = c2491fe952
>> +SUNXI_MALI_SITE = http://github.com/linux-sunxi/sunxi-mali/tarball/$(SUNXI_MALI_VERSION)
>> +
>> +SUNXI_MALI_DEPENDENCIES = sunxi-mali-prop
>> +SUNXI_MALI_INSTALL_STAGING = YES
>> +
>> +define SUNXI_MALI_CONFIGURE_CMDS
>> +     rm -rf $(@D)/lib/mali
>> +     cp -rf $(SUNXI_MALI_PROP_DIR) $(@D)/lib/mali
>
> So you're replacing the original lib/mali directory with the data from
> the sunxi-mali-prop package. This is probably the good place to explain
> why this is needed.
>
> Also, I would put this in a post-extract hook rather than in the
> configure commands.

Will fix.

>> +endef
>> +
>> +SUNXI_MALI_MAKE_ENV = \
>> +     CC=$(TARGET_CC) \
>> +     CFLAGS="$(TARGET_CFLAGS)" \
>
> These are generally passed as arguments of make rather than in the
> environment. It doesn't work in your case?

No it doesn't.  The makefiles use the CFLAGS variable to add various
options and setting them as arguments overrides all of this.  When
placed in the environment, the CFLAGS variable is able to be appended.

>> +     $(TARGET_MAKE_ENV)
>> +
>> +
>> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_HARDFP),y)
>> +SUNXI_MALI_MAKE_OPTS += ABI=armhf
>> +else
>> +SUNXI_MALI_MAKE_OPTS += ABI=armel
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_FB),y)
>> +SUNXI_MALI_MAKE_OPTS += EGL_TYPE=framebuffer
>> +else
>> +SUNXI_MALI_MAKE_OPTS += EGL_TYPE=x11
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_R2P4),y)
>> +SUNXI_MALI_MAKE_OPTS += VERSION=r2p4
>> +endif
>> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P0),y)
>> +SUNXI_MALI_MAKE_OPTS += VERISON=r3p0
>> +endif
>> +ifeq ($(BR2_PACKAGE_SUNXI_MALI_R3P1),y)
>> +SUNXI_MALI_MAKE_OPTS += VERSION=r3p1
>> +endif
>> +
>> +define SUNXI_MALI_BUILD_CMDS
>> +     $(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
>> +     $(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
>> +             cd $(@D)/version && \
>> +                     $(TARGET_CC) $(SUNXI_MALI_CFLAGS) -o version version.c; \
>
> SUNXI_MALI_CFLAGS isn't defined anywhere from what I can see. Also, I
> believe that you could build this C file unconditionally, it's not
> going to take a huge amount of time:

Will fix.

>         $(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/version/version $(@D)/version/version.c
>
>> +     )
>> +endef
>> +
>> +define SUNXI_MALI_INSTALL_STAGING_CMDS
>> +     $(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) \
>> +             $(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>> +     $(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
>> +             # test must be built after install because it depends on headers that are
>> +             # generated during the install above.
>
> Yurk :-(

Agreed!

>
>> +             $(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) test
>> +     )
>> +     $(INSTALL) -D -m 0644 package/sunxi-mali/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/
>> +     $(INSTALL) -D -m 0644 package/sunxi-mali/glesv2.pc $(STAGING_DIR)/usr/lib/pkgconfig/
>
> The destination path must indicate the complete filename when using -D.

Will fix.

>> +endef
>> +
>> +define SUNXI_MALI_INSTALL_TARGET_CMDS
>> +     $(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
>> +             $(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>> +     $(if $(BR2_PACKAGE_SUNXI_MALI_DBG),
>> +             $(INSTALL) -m 755 $(@D)/version/version $(TARGET_DIR)/usr/bin/maliver; \
>> +             $(INSTALL) -m 755 $(@D)/test/test       $(TARGET_DIR)/usr/bin/malitest
>> +     )
>> +endef
>> +
>> +define SUNXI_MALI_INSTALL_INIT_SYSV
>> +     $(INSTALL) -D -m 0755 package/sunxi-mali/S80mali $(TARGET_DIR)/etc/init.d/
>> +endef
>> +
>> +$(eval $(generic-package))
>
> Otherwise looks good. Seems like the sunxi-mali stuff is a little bit
> less horrible than the ti-gfx thing :-)

A lot less horrible.

Thanks,
Spenser
