From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:24:46 +0200
Subject: [Buildroot] [PATCH 4/4] package/irrlicht: disable bundled
 libpng NEON support
In-Reply-To: <20200503230754.3071098-4-romain.naour@gmail.com>
References: <20200503230754.3071098-1-romain.naour@gmail.com>
 <20200503230754.3071098-4-romain.naour@gmail.com>
Message-ID: <20200509222446.17f01a0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 01:07:54 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
> While linking an application with libIrrlicht.so, we get an undefined reference to
> png_init_filter_functions_neon.
> Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c [1],
> so disable NEON support completely.
> 
> This can be reproduced by building minetest using this defconfig for aarch64:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_MINETEST=y
> BR2_PACKAGE_MINETEST_CLIENT=y
> BR2_PACKAGE_MINETEST_SERVER=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_XORG7=y
> 
> Or for ARM with NEON FPU support:
> BR2_arm=y
> BR2_cortex_a15=y
> BR2_ARM_FPU_NEON=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_MINETEST=y
> BR2_PACKAGE_MINETEST_CLIENT=y
> BR2_PACKAGE_MINETEST_SERVER=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_XORG7=y
> 
> [1] https://github.com/glennrp/libpng/tree/v1.6.37/arm
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> This issue is not related to the minetest version bump (5.2.0).
> ---
>  package/irrlicht/irrlicht.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Since this is apparently a bug fix, I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
