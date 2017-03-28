From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 28 Mar 2017 19:49:07 +0200
Subject: [Buildroot] [PATCH 1/5] package/mesa3d: allow to enable
 OpenGL	texture float support
References: <20170326162853.3022-1-romain.naour@gmail.com>
Message-ID: <j9kqqdxr2m.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 26 Mar 2017 18:28:49 +0200 schrieb Romain Naour:

> OpenGL version string: 2.1 Mesa 17.0.2
> It turn out that texture float support was missing...
> OpenGL version string: 3.0 Mesa 17.0.2
[...]
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT),y)
> +MESA3D_CONF_OPTS += --enable-texture-float
> +MESA3D_LICENSE_FILES += docs/patents.txt
> +else
> +MESA3D_CONF_OPTS += --disable-texture-float
> +endif

Hi,

wondering why Kodi already prints

NOTICE: GL_VERSION = 3.0 Mesa 17.0.2

during startup on my system without your patch and 
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y I investigated its changes and 
compiled this defconfig (snipped non-mesa3d options):

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OSMESA=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y

with
BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT=y

and without your patch.

The directory output/target/usr/lib/dri/ contains these files, I added a 
note when the filesize changed due to --enable-texture-float:

i915_dri.so
i965_dri.so
kms_swrast_dri.so	(changed)
nouveau_dri.so		(changed, same as kms_swrast_dri.so)
nouveau_vieux_dri.so
r600_dri.so		(changed, same as kms_swrast_dri.so)
radeon_dri.so
swrast_dri.so		(changed, same as kms_swrast_dri.so)
virtio_gpu_dri.so	(changed, same as kms_swrast_dri.so)
vmwgfx_dri.so		(changed, same as kms_swrast_dri.so)

libGL.so/libEGL.so/libGLES*.so stayed unchanged.

Afaics the reason why the Intel drivers are unaffected could be this line 
of code where texture float support is always enabled:

https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/i965/
intel_extensions.c?h=17.0#n83

Other parts of the mesa3d contain #ifdef, like this:
https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/main/extensions.c?
h=17.0#n134

I am not familiar with the internal structures of mesa3d beyond my 
observations, maybe you should add a note to Config.in that your 
configure option does not affect all drivers.

Regards, Bernd
