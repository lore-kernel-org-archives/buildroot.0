From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Aug 2019 12:02:37 +0200
Subject: [Buildroot] [PATCH v6 07/10] package/mesa3d: add a new option
 to enable GLX support
In-Reply-To: <3or42gxeq6.ln2@ID-313208.user.individual.net>
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
 <20190804185417.6562-7-bernd.kuhls@t-online.de>
 <CAK4VdL2Vw4stKEJA6Tyg4mGT=uBJxt00qitwh=JZcDQo=cFYhg@mail.gmail.com>
 <3or42gxeq6.ln2@ID-313208.user.individual.net>
Message-ID: <ff8c9c3b-6ddf-462c-51a8-c12270714c20@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico, Bernd, All,

Le 11/08/2019 ? 09:12, Bernd Kuhls a ?crit?:
> Am Sun, 11 Aug 2019 01:00:33 +0200 schrieb Erico Nunes:
> 
>> package/mesa3d/mesa3d.mk:250: *** Configuration error: both "mesa3d"
>> and  are selected as providers for virtual package "libgl". Only one
>> provider can be selected at a time. Please fix your configuration.
>> Stop.
>>
>> I can reproduce this with a simple config like:
>>
>> BR2_arm=y
>> BR2_cortex_a9=y
>> BR2_ARM_ENABLE_NEON=y
>> BR2_ARM_ENABLE_VFP=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_MESA3D=y
>> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
>> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>> BR2_PACKAGE_MESA3D_OPENGL_ES=y
>> BR2_PACKAGE_XORG7=y
> 
> Hi Enrico,
> 
> $ grep LIBGL .config
> BR2_PACKAGE_PROVIDES_LIBGLES="mesa3d"
> BR2_PACKAGE_HAS_LIBGLES=y
> # BR2_PACKAGE_LIBGLIB2 is not set
> # BR2_PACKAGE_LIBGLOB is not set
> 
> $ grep mesa3d .config
> BR2_PACKAGE_PROVIDES_LIBEGL="mesa3d"
> BR2_PACKAGE_PROVIDES_LIBGLES="mesa3d"
> 
> $ grep PROVIDES .config | grep -v _HOST_
> BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL="toolchain-external-arm-arm"
> BR2_PACKAGE_PROVIDES_SKELETON="skeleton-init-sysv"
> BR2_PACKAGE_PROVIDES_LIBEGL="mesa3d"
> BR2_PACKAGE_PROVIDES_LIBGLES="mesa3d"
> BR2_PACKAGE_PROVIDES_ZLIB="libzlib"
> 
> I do not understand why the error occurs, libgl was not selected by any 
> package. It seems some core component of buildroot is broken w.r.t. 
> detection of virtual packages...

Thanks for reporting the issue,

Indeed this patch trigger the issue, I think we need to replace
BR2_PACKAGE_XORG7 by BR2_PACKAGE_MESA3D_OPENGL_GLX before making mesa3d a libgl
provider:

https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n174

Before this series, enabling xorg package meant enabling the glx support in
mesa3d. So we probably want to replace all BR2_PACKAGE_XORG7 by
BR2_PACKAGE_MESA3D_OPENGL_GLX in mesa3d.mk.

I'm not sure if enabling x11 plateform (MESA3D_PLATFORMS += x11) without GLX
support can work.

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
