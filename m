From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 28 Apr 2021 10:42:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv:
 select libdrm
In-Reply-To: <20210428083415.29935-1-sebastien.szymanski@armadeus.com>
References: <20210428083415.29935-1-sebastien.szymanski@armadeus.com>
Message-ID: <YIkf3WKdY2v46bLO@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

On Wed, Apr 28, 2021 at 10:34:15AM +0200, S?bastien Szymanski wrote:
> Some libraries (libGL.so, vivante_dri.so, libEGL.so, libgbm_viv.so) are
> linked against libdrm so select libdrm package.
> 
> Fixes: 8283e838f040 ("package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p1.2")
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index cca2689905..82cae6c780 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_IMX_GPU_VIV
>  	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
>  	# Library binaries are linked against libc.so.6
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	# Library binaries are linked against libdrm.so.2
> +	select BR2_PACKAGE_LIBDRM

This feels wrong, are you sure this is true for the aarch32 package?
Doesn't look like it:
$ readelf -d fb/libEGL.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libGAL.so]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x00000001 (NEEDED)                     Shared library: [ld-linux-armhf.so.3]

>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_HAS_LIBOPENCL
> @@ -56,8 +58,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
>  
>  config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>  	bool "Wayland"
> -	# libdrm needed by gbm_viv.so
> -	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_WAYLAND
>  	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND

Also, you need to add the libdrm package as part of the dependencies,
otherwise it will create build issues.

Regards,
Gary
