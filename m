From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 11 Aug 2019 01:00:33 +0200
Subject: [Buildroot] [PATCH v6 07/10] package/mesa3d: add a new option
 to enable GLX support
In-Reply-To: <20190804185417.6562-7-bernd.kuhls@t-online.de>
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
 <20190804185417.6562-7-bernd.kuhls@t-online.de>
Message-ID: <CAK4VdL2Vw4stKEJA6Tyg4mGT=uBJxt00qitwh=JZcDQo=cFYhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Aug 4, 2019 at 8:55 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> From: Romain Naour <romain.naour@smile.fr>
>
> When switching to meson build system, enabling GLX support
> require at least one DRI or Gallium dirver.
>
> So add a dependency on BR2_PACKAGE_MESA3D_DRIVER for
> BR2_PACKAGE_MESA3D_OPENGL_GLX option.
>
> quoting the meson build system:
> "dri based GLX requires at least one DRI driver." [1]
> "Even when building just gallium drivers the user probably wants dri." [2]
>
> [1] https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.0#n340
> [2] https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.0#n266
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> [Bernd: moved x11 dependencies from glx condition to xorg7 condition to
>  fix build error with enabled egl without glx
>  BR2_PACKAGE_HAS_LIBGL needs to depend on BR2_PACKAGE_MESA3D_OPENGL_GLX]
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
I think there is an issue with this patch on v6. If I enable mesa and
xorg, I hit:

package/mesa3d/mesa3d.mk:250: *** Configuration error: both "mesa3d"
and  are selected as providers for virtual package "libgl". Only one
provider can be selected at a time. Please fix your configuration.
Stop.

I can reproduce this with a simple config like:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y

Erico
