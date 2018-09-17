From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 17 Sep 2018 21:59:46 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/waffle: new package
In-Reply-To: <20180916233058.53cc7eec@windsurf>
References: <20180211162136.15605-1-romain.naour@gmail.com>
 <20180211162136.15605-2-romain.naour@gmail.com>
 <20180916233058.53cc7eec@windsurf>
Message-ID: <207cc677-6028-81a1-f338-22711d152bc1@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 16/09/2018 ? 23:30, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Sun, 11 Feb 2018 17:21:35 +0100, Romain Naour wrote:
>> Backport an upstream patch fixing a build issue with musl toolchains.
>> Add a new patch fixing build with Wayand without X11.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> I finally took some time to look at this package again, and I think the
> dependencies are not correctly handled.

Thank you :)

> 
>> +config BR2_PACKAGE_WAFFLE
>> +	bool "waffle"
>> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
> 
> Due to this dependency, you cannot do a build which has just mesa3d as
> a gbm/egl provider + udev, which is a valid configuration supported by
> waffle.
> 
> I.e, the following defconfig builds waffle properly:
> 
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_WAFFLE=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
>> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL
>> +	# OpenGL ES (1,2,3) libraries are loaded at runtime when needed
>> +	# in addition to LIBGL or LIBEGL.
>> +	depends on BR2_PACKAGE_HAS_LIBGLES
> 
> This dependency means that you cannot build waffle at all if there's no
> GLES support. Therefore a desktop configuration that provides GL will
> not allow building waffle. That's not good.
> 
> Looking more closely into the Waffle build system, it has four
> "backends", each having their own dependencies. At least one "backend"
> must be enabled, otherwise Waffle will refuse to build. The "backends"
> are:
> 
>  - glx, which needs full OpenGL + x11-xcb
>  - wayland, which needs wayland-client, wayland-egl and EGL
>  - x11-egl, which needs x11-xcb and EGL
>  - gbm, which needs gbm, libudev and EGL
> 
> So the easiest is perhaps to map this to hidden Config.in options,
> maybe something like:
> 
> config BR2_PACKAGE_WAFFLE_SUPPORTS_GLX
> 	bool
> 	default y if BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_XORG7
> 
> config BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
> 	bool
> 	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> 
> config BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
> 	bool
> 	default y if BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_XORG7
> 
> config BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> 	bool
> 	# mesa3d is for now the only GBM provider, and it is enabled
> 	# together with its EGL support
> 	default y if BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_MESA3D_OPENGL_EGL && BR2_PACKAGE_HAS_UDEV

I believe this comment will be not correct as soon as the libgbm virtual package
will be merged.

> 
> config BR2_PACKAGE_WAFFLE
> 	bool "waffle"
> 	depends on BR2_PACKAGE_WAFFLE_SUPPORTS_GLX || \
> 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
> 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
> 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_WAFFLE_SUPPORTS_GLX || BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
> 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_WAFFLE_SUPPORTS_GLX || BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
> 
> I don't think we need a Config.in comment to document those
> dependencies. They are anyway waaaay too complicated to be summarized
> in a Config.in comment.

agree

> 
>> diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
>> new file mode 100644
>> index 0000000000..5dfb976f2f
>> --- /dev/null
>> +++ b/package/waffle/waffle.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-v1.5.2.tar.gz
>> +sha256 630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
>> diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
>> new file mode 100644
>> index 0000000000..741bc8e349
>> --- /dev/null
>> +++ b/package/waffle/waffle.mk
>> @@ -0,0 +1,48 @@
>> +################################################################################
>> +#
>> +# waffle
>> +#
>> +################################################################################
>> +
>> +WAFFLE_VERSION = v1.5.2
>> +WAFFLE_SITE = $(call github,waffle-gl,waffle,$(WAFFLE_VERSION))
>> +WAFFLE_INSTALL_STAGING = YES
>> +WAFFLE_LICENSE = BSD-2-Clause
>> +WAFFLE_LICENSE_FILES = LICENSE.txt
>> +
>> +WAFFLE_DEPENDENCIES = host-pkgconf
>> +
>> +WAFFLE_CONF_OPTS = -Dwaffle_build_tests=OFF \
>> +	-Dwaffle_build_examples=OFF \
>> +	-Dwaffle_build_manpages=OFF \
>> +	-Dwaffle_build_htmldocs=OFF
>> +
>> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),yy)
> 
> You can replace this condition with BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND.
> 
>> +WAFFLE_DEPENDENCIES += libegl wayland
>> +WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=ON
>> +else
>> +WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_HAS_LIBEGL),yyy)
> 
> This one by BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
> 
>> +WAFFLE_DEPENDENCIES += libegl libxcb xlib_libX11
>> +WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=ON
>> +else
>> +WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_HAS_LIBGL),yyy)
> 
> This one by BR2_PACKAGE_WAFFLE_SUPPORTS_GLX
> 
>> +WAFFLE_DEPENDENCIES += libgl libxcb xlib_libX11
>> +WAFFLE_CONF_OPTS += -Dwaffle_has_glx=ON
>> +else
>> +WAFFLE_CONF_OPTS += -Dwaffle_has_glx=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_HAS_UDEV),yy)
> 
> And this one by BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
> 
>> +WAFFLE_DEPENDENCIES += libegl mesa3d udev
> 
> I would say adding mesa3d here in the dependencies is a bit useless,
> because libegl is provided by mesa3d anyway when
> BR2_PACKAGE_MESA3D_OPENGL_EGL.
> 
> You had a "depends on BR2_PACKAGE_HAS_LIBGLES" because waffle can use
> OpenGLES. But it seems like a runtime dependency, not a build time
> dependency. Could you check this ?

Sure, I'll respin these patches asap.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
