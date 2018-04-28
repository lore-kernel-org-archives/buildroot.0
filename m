From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Apr 2018 17:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add Radeon SI support
In-Reply-To: <CAGbXN6J+YOpOFSYEYk2CzuwibNre4RJDOxVRwpj6rpMhLZ-2-A@mail.gmail.com>
References: <591797C1-62B3-4F20-8E68-1ABAE1E66218@gamecodehq.com>
 <2c8ac98c-ab4d-9e5a-5496-3265311bfcc2@gmail.com>
 <CAGbXN6J+YOpOFSYEYk2CzuwibNre4RJDOxVRwpj6rpMhLZ-2-A@mail.gmail.com>
Message-ID: <f2dae939-64b6-cedf-27b9-72d5a8404ade@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal,

Le 28/04/2018 ? 16:59, Micha? Kalbarczyk a ?crit?:
> I get it now. It works for me because I have selected LIB_RADEON and MESA3D_LLVM
> in my defconfig. I?ll create another patch. Should i post it in this thread or
> create another one? 

Simply post a new patch on the ml using git send-email command.

Best regards,
Romain

> 
> On Sat, 28 Apr 2018 at 15:55, Romain Naour <romain.naour@gmail.com
> <mailto:romain.naour@gmail.com>> wrote:
> 
>     Hi Michal,
> 
>     Le 27/04/2018 ? 16:07, Micha? Kalbarczyk a ?crit?:
>     > From adff41d0ec39d5e89ce713c88edb0ee6468c7236 Mon Sep 17 00:00:00 2001
>     > From: =?UTF-8?q?Micha=C5=82=20Kalbarczyk?= <fazibear@gmail.com
>     <mailto:fazibear@gmail.com>>
>     > Date: Fri, 27 Apr 2018 15:49:15 +0200
>     > Subject: [PATCH 1/1] package/mesa3d: add Radeon SI support
>     > MIME-Version: 1.0
>     > Content-Type: text/plain; charset=UTF-8
>     > Content-Transfer-Encoding: 8bit
> 
>     Thanks for this contribution!
>     I know it's too late since the patch is already applied but here is my review.
> 
>     > Signed-off-by: Micha? Kalbarczyk <fazibear@gmail.com
>     <mailto:fazibear@gmail.com>>
>     > ---
>     >? package/mesa3d/Config.in | 20 ++++++++++++++++++++
>     >? package/mesa3d/mesa3d.mk <http://mesa3d.mk> |? 1 +
>     >? 2 files changed, 21 insertions(+)
>     >
>     > diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
>     > index bd3d050e29..cbaa20370f 100644
>     > --- a/package/mesa3d/Config.in
>     > +++ b/package/mesa3d/Config.in
>     > @@ -108,6 +108,26 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>     >? ? ? ?help
>     >? ? ? ? ?Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>     >
>     > +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
>     > +? ? ?bool "Gallium Radeon SI driver"
>     > +? ? ?depends on BR2_i386 || BR2_x86_64
>     > +? ? ?depends on !BR2_PACKAGE_MESA3D_LLVM || \
> 
>     The RadeonSI support require LLVM.
> 
>     checking for AMDGPU... yes
>     configure: error: --enable-llvm is required when building radeonsi
> 
>     > +? ? ? ? ? ? ?(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
>     > +? ? ? ? ? ? ? ? ? ? ?BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
>     > +? ? ?select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>     > +? ? ?select BR2_PACKAGE_LIBDRM_AMDGPU
> 
>     In my previous review, mesa is checking for libdrm-amdgpu and libdrm-radeon [1]
> 
>     checking for EXPAT... yes
>     checking for RADEON... no
>     configure: error: Package requirements (libdrm >= 2.4.71 libdrm_radeon >=
>     2.4.71)
> 
>     > +? ? ?select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
>     > +? ? ?select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
>     > +? ? ?select BR2_PACKAGE_MESA3D_NEEDS_XA
>     > +? ? ?help
>     > +? ? ? ?Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
>     > +
>     > +# Radeon SI needs libelf when Mesa3D is built with LLVM support
>     > +# musl is not currently compatible with elfutils
>     > +comment "Radeon SI driver needs a uClibc or glibc toolchain when llvm is
>     enabled"
>     > +? ? ?depends on BR2_PACKAGE_MESA3D_LLVM
>     > +? ? ?depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> 
>     The comment should be updated accordingly since llvm is mandatory.
> 
>     Best regards,
>     Romain
> 
>     [1] http://lists.busybox.net/pipermail/buildroot/2018-April/219308.html
> 
>     > +
>     >? # R600 needs libelf when Mesa3D is built with LLVM support
>     >? # musl is not currently compatible with elfutils
>     >? comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"
>     > diff --git a/package/mesa3d/mesa3d.mk <http://mesa3d.mk>
>     b/package/mesa3d/mesa3d.mk <http://mesa3d.mk>
>     > index e93490c042..9857b597cf 100644
>     > --- a/package/mesa3d/mesa3d.mk <http://mesa3d.mk>
>     > +++ b/package/mesa3d/mesa3d.mk <http://mesa3d.mk>
>     > @@ -80,6 +80,7 @@ endif
>     >? MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)? +=
>     etnaviv imx
>     >? MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)? +=
>     nouveau
>     >? MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)? ? ?+= r600
>     > +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) +=
>     radeonsi
>     >? MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)? ? ?+= svga
>     >? MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)? ?+=
>     swrast
>     >? MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)? ? ? += vc4
>     > --
>     > 2.17.0
>     >
> 
