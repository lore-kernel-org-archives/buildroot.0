From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 May 2020 14:49:34 +0200
Subject: [Buildroot] [PATCH/next/RFC 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.0-rc2
In-Reply-To: <20200511053855.120869-1-bernd.kuhls@t-online.de>
References: <20200511053855.120869-1-bernd.kuhls@t-online.de>
Message-ID: <e6a9e2bb-9203-2792-4f16-9338c2cc637e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 11/05/2020 ? 07:38, Bernd Kuhls a ?crit?:
> Gallium drivers lima and panfrost
> https://cgit.freedesktop.org/mesa/mesa/tree/src/meson.build?h=20.1#n83
> 
> both use shared panfrost code which now needs fromfp functions only
> present in glibc:
> https://mailman.uclibc-ng.org/pipermail/devel/2020-May/001968.html

Maybe it would be good to report on the mesa mailing list too.

> 
> Rebased 0006-pan_bo.h-add-time.h-include-for-time_t.patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> This patch is not intended to be committed but shall give advance notice
> that gallium lima and panfrost drivers will depend on glibc for the time
> being.

What about fromfp in musl libc ?

Best regards,
Romain

> 
>  package/mesa3d-headers/mesa3d-headers.mk           |  4 ++--
>  ...06-pan_bo.h-add-time.h-include-for-time_t.patch | 14 +++++++-------
>  package/mesa3d/Config.in                           |  8 ++++++++
>  package/mesa3d/mesa3d.hash                         |  6 +++---
>  package/mesa3d/mesa3d.mk                           |  4 ++--
>  5 files changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index c1686aa6fd..54452ad297 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,8 +12,8 @@ endif
>  
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 20.0.6
> -MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
> +MESA3D_HEADERS_VERSION = 20.1.0
> +MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION)-rc2.tar.xz
>  MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
>  MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
> diff --git a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> index 1586b26bba..01cc226815 100644
> --- a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> +++ b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> @@ -8,24 +8,24 @@ Content-Transfer-Encoding: 8bit
>  
>  Fixes:
>  
> -  ../src/gallium/drivers/panfrost/pan_bo.h:93:9: error: unknown type name ?time_t?
> +  ../src/panfrost/encoder/pan_bo.h:93:9: error: unknown type name ?time_t?
>  
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  ---
> - src/gallium/drivers/panfrost/pan_bo.h | 1 +
> + src/panfrost/encoder/pan_bo.h | 1 +
>   1 file changed, 1 insertion(+)
>  
> -diff --git a/src/gallium/drivers/panfrost/pan_bo.h b/src/gallium/drivers/panfrost/pan_bo.h
> +diff --git a/src/panfrost/encoder/pan_bo.h b/src/panfrost/encoder/pan_bo.h
>  index 414c356b95c..6dda393095d 100644
> ---- a/src/gallium/drivers/panfrost/pan_bo.h
> -+++ b/src/gallium/drivers/panfrost/pan_bo.h
> +--- a/src/panfrost/encoder/pan_bo.h
> ++++ b/src/panfrost/encoder/pan_bo.h
>  @@ -29,6 +29,7 @@
>   #include <panfrost-misc.h>
> - #include "pipe/p_state.h"
>   #include "util/list.h"
> + #include "pan_device.h"
>  +#include <time.h>
>   
> - struct panfrost_screen;
> + /* Flags for allocated memory */
>   
>  -- 
>  2.25.1
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index dd512d9b76..232e0b7387 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -149,11 +149,15 @@ comment "Gallium KMSRO needs one or more renderonly drivers"
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>  	bool "Gallium lima driver"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # fromfp
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>  	help
>  	  Mesa driver for ARM Mali Utgard GPUs.
>  
> +comment "lima driver needs a glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  	bool "Gallium nouveau driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> @@ -165,11 +169,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
>  	bool "Gallium panfrost driver"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # fromfp
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>  	help
>  	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
>  
> +comment "panfrost driver needs a glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
>  	bool "Gallium Radeon R300 driver"
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index dec022c1e9..ecc3b8db7b 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2020-April/000579.html
> -sha256  30b5d8e9201a01a0e88e18bb79850e67b1d28443b34c4c5cacad4bd10f668b96  mesa-20.0.6.tar.xz
> -sha512  a93dc3ed57ed7469b7c60cdbdcf4f29c5da4ec3986171c7b534e009e136ca21fec16207ffab38a6747437a9b1060e2e6c4b74c4e5cdc168b9aba0fc1940b5e90  mesa-20.0.6.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2020-May/000581.html
> +sha256  e8aac9f6a1b0cff6c453ae890f9e7bd7972df52be6f03e420dfa7a3adcfe5f1d  mesa-20.1.0-rc2.tar.xz
> +sha512  b912b1af69d9c33f1d0855887d4e5c1ea3dc10e7ed875d3285ca13b62314647b56470149484f270e8c8ff0ce4818fafd1537a71b59852957aab26f36e53edfbd  mesa-20.1.0-rc2.tar.xz
>  
>  # License
>  sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 531dcf5b81..fdec59e5e6 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 20.0.6
> -MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
> +MESA3D_VERSION = 20.1.0
> +MESA3D_SOURCE = mesa-$(MESA3D_VERSION)-rc2.tar.xz
>  MESA3D_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_LICENSE = MIT, SGI, Khronos
>  MESA3D_LICENSE_FILES = docs/license.html
> 
