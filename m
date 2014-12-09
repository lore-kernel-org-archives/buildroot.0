From: Thierry Bultel <tbultel@free.fr>
Date: Tue, 09 Dec 2014 11:02:13 +0100
Subject: [Buildroot] questions about xdriver_xf86-video-imx-viv
In-Reply-To: <mailman.17.1417521604.17695.buildroot@busybox.net>
References: <mailman.17.1417521604.17695.buildroot@busybox.net>
Message-ID: <5486C8A5.3060006@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome,

I was also currently attempting to bring the work from yocto to 
buildroot. I do not have a working board, yet, since we are migrating 
our BSP from 3.0.35 to 3.10.17. Thus I am only preparing the 
integration, but cannot test at the moment.

There is something I do not understand.
With the previous version of xdriver_xf86-video-imx-viv ,
the build in the DRI directory was producing a libdri.so, which
was loaded by xserver.

For what I see, only $(@D)/EXA/src is built now.

libdri.so is not needed anymore ?


Also, when you say: " This driver should
+	  also be able to provide Desktop OpenGL implementation but, this
+	  feature seems broken for a while."

does that mean that windowed 3D does not work, but that only full screen 
does ?

Best regards
Thierry

>
>
> Today's Topics:
>
>     1. [PATCH v4 06/14] gpu-viv-bin-mx6q: change output	selection
>        mechanism (J?r?me Pouiller)
>     2. [PATCH v4 12/14] nitrogen6x_defconfig: bump kernel to
>        3.10.17_1.0.1_ga (J?r?me Pouiller)
>     3. [PATCH v4 11/14] Vivante drivers: bump to version
>        3.10.17-1.0.1 (J?r?me Pouiller)
>     4. [PATCH v4 13/14] freescale_imx6*_defconfig: bump kernel	to
>        3.10.17_1.0.1_ga (J?r?me Pouiller)
>     5. [PATCH v4 07/14] xdriver_xf86-video-imx-viv: new package
>        (J?r?me Pouiller)
>     6. [PATCH v4 10/14] qt5base: fix Vivante x11/EGL	configuration
>        (J?r?me Pouiller)
>     7. [PATCH v4 14/14] qmx6_defconfig: update (J?r?me Pouiller)
>     8. [PATCH] live555: fix test programs target installation
>        (Baruch Siach)
>     9. Re: [PATCH] live555: fix test programs target	installation
>        (Thomas Petazzoni)
>    10. [PATCH 1/2] dialog: bump to version 1.2-20140911
>        (Gustavo Zacarias)
>    11. [PATCH 2/2] sysstat: bump to version 11.0.2 (Gustavo Zacarias)
>    12. [PATCH] linux-headers: bump 3.4.x series (Gustavo Zacarias)
>    13. Crypto algorithms in buildroot (Ja Bi)
>    14. Re: [PATCH] exiv2: XMP support needs largefile (Nicolas Serafini)
>    15. Re: [PATCHv2 1/4] toolchain-external: split target
>        installation from staging installation (J?r?me Pouiller)
>    16. Re: [PATCHv2 2/4] pkg-generic: add step_pkg_size global
>        instrumentation hook (J?r?me Pouiller)
>    17. Re: [PATCHv2 3/4] support/scripts: add size-stats script
>        (J?r?me Pouiller)
>    18. [PATCH] tcpdump: add security fix patch (Baruch Siach)
>    19. Re: Crypto algorithms in buildroot (Gustavo Zacarias)
>    20. Re: [PATCH] live555: fix shared library build on x86
>        (Peter Korsgaard)
>    21. Re: [PATCH] live555: fix test programs target	installation
>        (Peter Korsgaard)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue,  2 Dec 2014 10:59:04 +0100
> From: J?r?me Pouiller <jezz@sysmic.org>
> To: buildroot at busybox.net
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Subject: [Buildroot] [PATCH v4 06/14] gpu-viv-bin-mx6q: change output
> 	selection mechanism
> Message-ID: <1417514352-8825-7-git-send-email-jezz@sysmic.org>
> Content-Type: text/plain; charset=UTF-8
>
>    - Move output selection to Config.in. It easier to add new
>      backends selection (wayland, directfb, ...).
>    - Remove useless build time dependencies xlib_libXdamage
>      and xlib_libXext (gpu-viv-bin-mx6q is provided as binary
>      package)
>    - Also create libraries symbolic links with version numbers.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>   package/freescale-imx/gpu-viv-bin-mx6q/Config.in    |  5 +++++
>   .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk            | 21 +++++++++------------
>   2 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 904b011..489e68e 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -45,6 +45,11 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
>
>   endchoice
>
> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT
> +	string
> +	default "x11" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> +	default "fb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
> +
>   config BR2_PACKAGE_PROVIDES_LIBEGL
>   	default "gpu-viv-bin-mx6q"
>
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 7895023..501b124 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -19,14 +19,7 @@ GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
>   GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
>
>   GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
> -
> -# DirectFB is not supported (wrong version)
> -ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
> -GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
> -GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
> -else
> -GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
> -endif
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
>
>   define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
>   	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
> @@ -37,13 +30,17 @@ endef
>   # Make sure these commands are idempotent.
>   define GPU_VIV_BIN_MX6Q_BUILD_CMDS
>   	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
> -	for lib in EGL GAL VIVANTE GLESv2; do \
> -		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
> -			$(@D)/usr/lib/lib$${lib}.so; \
> -	done
>   	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
>   	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
>   	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
> +	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so
> +	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1
> +	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1.0
> +	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so
> +	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2
> +	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2.0.0
> +	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libVIVANTE.so
> +	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGAL.so
>   endef
>
>   define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
>
