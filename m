From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 15:52:56 +0100
Subject: [Buildroot] [PATCHv3 01/15] directfb: bump to 1.7.7
In-Reply-To: <1441144876-2628-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441144876-2628-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55E9B048.8070704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/01/2015 11:01 PM, Thomas Petazzoni wrote:
> In addition to doing the bump, this commit changes the --enable-fusion
> option to --enable-multi-kernel, as was renamed upstream.
> 
> The patches were just refreshed, except
> 0003-remove-redefinition-of-__typeof__.patch, which was removed since
> it was a backport from upstream, and is therefore now part of DirectFB
> 1.7.7.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0003-remove-redefinition-of-__typeof__.patch   | 28 ----------------
>  ...region-lock.patch => 0003-setregion-lock.patch} | 39 +++++++++++++---------
>  ...-use-gcc-link.patch => 0004-use-gcc-link.patch} |  0
>  package/directfb/directfb.hash                     |  4 +--
>  package/directfb/directfb.mk                       |  8 +++--
>  5 files changed, 30 insertions(+), 49 deletions(-)
>  delete mode 100644 package/directfb/0003-remove-redefinition-of-__typeof__.patch
>  rename package/directfb/{0004-setregion-lock.patch => 0003-setregion-lock.patch} (79%)
>  rename package/directfb/{0005-use-gcc-link.patch => 0004-use-gcc-link.patch} (100%)
> 
> diff --git a/package/directfb/0003-remove-redefinition-of-__typeof__.patch b/package/directfb/0003-remove-redefinition-of-__typeof__.patch
> deleted file mode 100644
> index e3861af..0000000
> --- a/package/directfb/0003-remove-redefinition-of-__typeof__.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Remove definition to fix qt5 build.
> -
> -Fetch from: http://git.directfb.org/?p=core/DirectFB.git;a=patch;h=203f78a4193a8ff110dec3c860e0928af1a0a72f
> -
> -From 203f78a4193a8ff110dec3c860e0928af1a0a72f Mon Sep 17 00:00:00 2001
> -From: Denis Oliver Kropp <dok@directfb.org>
> -Date: Wed, 31 Jul 2013 21:56:05 +0200
> -Subject: [PATCH] libdirect: Remove redefinition of __typeof__!!!
> -
> ----
> - lib/direct/os/linux/glibc/types.h |    1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/lib/direct/os/linux/glibc/types.h b/lib/direct/os/linux/glibc/types.h
> -index 08e94b2..80cb350 100644
> ---- a/lib/direct/os/linux/glibc/types.h
> -+++ b/lib/direct/os/linux/glibc/types.h
> -@@ -81,7 +81,6 @@ typedef int64_t s64;
> - #define __dfb_no_instrument_function__  __attribute__((no_instrument_function))
> - #define __constructor__                 __attribute__((constructor))
> - #define __destructor__                  __attribute__((destructor))
> --#define __typeof__(x)                   __typeof__(x)
> - 
> - #ifndef __func__
> - #define __func__                        __FUNCTION__
> --- 
> -1.7.9.5
> -
> diff --git a/package/directfb/0004-setregion-lock.patch b/package/directfb/0003-setregion-lock.patch
> similarity index 79%
> rename from package/directfb/0004-setregion-lock.patch
> rename to package/directfb/0003-setregion-lock.patch
> index 8a246ea..bec4234 100644
> --- a/package/directfb/0004-setregion-lock.patch
> +++ b/package/directfb/0003-setregion-lock.patch
> @@ -6,9 +6,11 @@ http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/DirectFB/files/
>  
>  Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>  
> ---- directfb-1.6.3/gfxdrivers/cyber5k/cyber5k.c
> -+++ directfb-1.6.3/gfxdrivers/cyber5k/cyber5k.c
> -@@ -636,7 +636,8 @@ osdSetRegion( CoreLayer
> +Index: b/gfxdrivers/cyber5k/cyber5k.c
> +===================================================================
> +--- a/gfxdrivers/cyber5k/cyber5k.c
> ++++ b/gfxdrivers/cyber5k/cyber5k.c
> +@@ -640,7 +640,8 @@
>                 CoreLayerRegionConfigFlags  updated,
>                 CoreSurface                *surface,
>                 CorePalette                *palette,
> @@ -18,7 +20,7 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>   {
>        DFBResult ret;
>   
> -@@ -644,7 +645,7 @@ osdSetRegion( CoreLayer
> +@@ -648,7 +649,7 @@
>        ret = oldPrimaryFuncs.SetRegion( layer, oldPrimaryDriverData,
>                                         layer_data, region_data,
>                                         config, updated, surface,
> @@ -27,9 +29,11 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>        if (ret)
>             return ret;
>   
> ---- directfb-1.6.3/gfxdrivers/radeon/radeon_crtc1.c
> -+++ directfb-1.6.3/gfxdrivers/radeon/radeon_crtc1.c
> -@@ -147,14 +147,15 @@ crtc1SetRegion( CoreLayer
> +Index: b/gfxdrivers/radeon/radeon_crtc1.c
> +===================================================================
> +--- a/gfxdrivers/radeon/radeon_crtc1.c
> ++++ b/gfxdrivers/radeon/radeon_crtc1.c
> +@@ -147,14 +147,15 @@
>                   CoreLayerRegionConfigFlags  updated,
>                   CoreSurface                *surface,
>                   CorePalette                *palette,
> @@ -47,9 +51,11 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>        }
>   
>        return DFB_OK;
> ---- directfb-1.6.3/gfxdrivers/cle266/uc_primary.c
> -+++ directfb-1.6.3/gfxdrivers/cle266/uc_primary.c
> -@@ -138,7 +138,8 @@ osdSetRegion( CoreLayer
> +Index: b/gfxdrivers/cle266/uc_primary.c
> +===================================================================
> +--- a/gfxdrivers/cle266/uc_primary.c
> ++++ b/gfxdrivers/cle266/uc_primary.c
> +@@ -142,7 +142,8 @@
>                 CoreLayerRegionConfigFlags  updated,
>                 CoreSurface                *surface,
>                 CorePalette                *palette,
> @@ -59,7 +65,7 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>   {
>        DFBResult     ret;
>        UcDriverData *ucdrv = (UcDriverData*) driver_data;
> -@@ -147,7 +148,7 @@ osdSetRegion( CoreLayer
> +@@ -151,7 +152,7 @@
>        ret = ucOldPrimaryFuncs.SetRegion( layer, ucOldPrimaryDriverData,
>                                           layer_data, region_data,
>                                           config, updated, surface,
> @@ -68,9 +74,11 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>        if (ret)
>             return ret;
>   
> ---- directfb-1.6.3/gfxdrivers/unichrome/uc_primary.c
> -+++ directfb-1.6.3/gfxdrivers/unichrome/uc_primary.c
> -@@ -135,7 +135,8 @@ osdSetRegion( CoreLayer
> +Index: b/gfxdrivers/unichrome/uc_primary.c
> +===================================================================
> +--- a/gfxdrivers/unichrome/uc_primary.c
> ++++ b/gfxdrivers/unichrome/uc_primary.c
> +@@ -139,7 +139,8 @@
>                 CoreLayerRegionConfigFlags  updated,
>                 CoreSurface                *surface,
>                 CorePalette                *palette,
> @@ -80,7 +88,7 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>   {
>        DFBResult     ret;
>        UcDriverData *ucdrv = (UcDriverData*) driver_data;
> -@@ -144,7 +145,7 @@ osdSetRegion( CoreLayer
> +@@ -148,7 +149,7 @@
>        ret = ucOldPrimaryFuncs.SetRegion( layer, ucOldPrimaryDriverData,
>                                           layer_data, region_data,
>                                           config, updated, surface,
> @@ -89,4 +97,3 @@ Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
>        if (ret)
>             return ret;
>   
> -
> diff --git a/package/directfb/0005-use-gcc-link.patch b/package/directfb/0004-use-gcc-link.patch
> similarity index 100%
> rename from package/directfb/0005-use-gcc-link.patch
> rename to package/directfb/0004-use-gcc-link.patch
> diff --git a/package/directfb/directfb.hash b/package/directfb/directfb.hash
> index a577cba..069d8c3 100644
> --- a/package/directfb/directfb.hash
> +++ b/package/directfb/directfb.hash
> @@ -1,2 +1,2 @@
> -# locally computed hash
> -sha256 7a96aced0f69b2ec0810e9923068e61c21e6b19dd593e09394c872414df75e70 DirectFB-1.6.3.tar.gz
> +# Locally computed
> +sha256 b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3 DirectFB-1.7.7.tar.gz
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index ad1dd18..c27e982 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -DIRECTFB_VERSION_MAJOR = 1.6
> -DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
> +DIRECTFB_VERSION_MAJOR = 1.7
> +DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
>  DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
>  DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
>  DIRECTFB_LICENSE = LGPLv2.1+
> @@ -35,8 +35,10 @@ DIRECTFB_CONFIG_SCRIPTS = directfb-config
>  DIRECTFB_DEPENDENCIES = freetype zlib
>  
>  ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
> -DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
> +DIRECTFB_CONF_OPTS += --enable-multi --enable-multi-kernel
>  DIRECTFB_DEPENDENCIES += linux-fusion
> +else
> +DIRECTFB_CONF_OPTS += --disable-multi --disable-multi-kernel
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^DIRECTFB_VERSION package/directfb/directfb.mk
DIRECTFB_VERSION_MAJOR = 1.7
DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7

$ file
output/target/usr/lib/directfb-1.7-7-pure/systems/libdirectfb_fbdev.so
output/target/usr/lib/directfb-1.7-7-pure/systems/libdirectfb_fbdev.so:
ELF 32-bit MSB shared object, MIPS, MIPS32 rel2 version 1 (SYSV),
dynamically linked, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.
