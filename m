From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 11 Feb 2015 14:42:30 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
	new package
In-Reply-To: <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150211144230.4a750cde@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Ben, All,

Thanks for this new version of the patch. I was in holliday the two
previous week, so sorry I have not responded for the previous version
of the patch.

It's a good idea to use the mesa headers.

I have done some tests and there is only one small bug into the
.mk file. The correction is below into the patch.

Thanks,

On Tue, 10 Feb 2015 21:01:15 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Nicolas Serafini <nicolas.serafini@sensefly.com>
> 
> This patch adds a new package for all libraries and drivers
> provided by Nvidia Linux4Tegra release 16.4.0.
> 
> We have intermediate .mk and Config.in, because those values will be
> shared with the codecs package, to come in a follow-up patch, like we
> have for the Freescale stuff.
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> [yann.morin.1998 at free.fr:
>   - split jpeg into its own patch
>   - split codecs and gstreamer plugins out into their own packages
>   - do not patch for .pc files, just bundle them in $(@D)
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ben Ben <carmazen84@gmail.com>
> 
> ---
> Changes v6 -> v7:
>   - use mesa3d-headers instead of Khronos
> ---
>  package/Config.in                                  |  1 +
>  package/nvidia-tegra23/Config.in                   | 36 ++++++++
>  .../nvidia-tegra23-binaries/Config.in              | 92
> ++++++++++++++++++++ .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
> | 10 +++ .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc | 10 +++
>  .../nvidia-tegra23-binaries/glesv2.pc              | 10 +++
>  .../nvidia-tegra23-binaries.hash                   |  3 +
>  .../nvidia-tegra23-binaries.mk                     | 98
> ++++++++++++++++++++++
> package/nvidia-tegra23/nvidia-tegra23.mk           | 17 ++++ 9 files
> changed, 277 insertions(+) create mode 100644
> package/nvidia-tegra23/Config.in create mode 100644
> package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in create mode
> 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc create
> mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
> create mode 100644
> package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc create mode
> 100644
> package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
> create mode 100644
> package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
> create mode 100644 package/nvidia-tegra23/nvidia-tegra23.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a80cec6..ba28620 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -350,6 +350,7 @@ endif
>  	source "package/nanocom/Config.in"
>  	source "package/neard/Config.in"
>  	source "package/nvidia-driver/Config.in"
> +	source "package/nvidia-tegra23/Config.in"
>  	source "package/ofono/Config.in"
>  	source "package/ola/Config.in"
>  	source "package/on2-8170-modules/Config.in"
> diff --git a/package/nvidia-tegra23/Config.in
> b/package/nvidia-tegra23/Config.in new file mode 100644
> index 0000000..950f2f8
> --- /dev/null
> +++ b/package/nvidia-tegra23/Config.in
> @@ -0,0 +1,36 @@
> +menuconfig BR2_PACKAGE_NVIDIA_TEGRA23
> +	bool "nvidia-tegra23"
> +	depends on BR2_cortex_a9
> +	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_PACKAGE_XORG7
> +	help
> +	  Install NVidia proprietary blobs to drive Tegra2 or Tegra3
> +	  GPUs found in some mobile-targeted ARM SoCs.
> +
> +if BR2_PACKAGE_NVIDIA_TEGRA23
> +
> +choice
> +	prompt "Tegra platform"
> +	help
> +	  Select the SOC platform.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2
> +	bool "Tegra 2"
> +	help
> +	  NVIDIA Tegra 2 is a dual-core Cortex-A9 without NEON.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3
> +	bool "Tegra 3"
> +	depends on BR2_ARM_CPU_HAS_NEON
> +	help
> +	  NVIDIA Tegra 3 is a quad-core Cortex-A9 with NEON.
> +
> +endchoice
> +
> +source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
> +endif
> +
> +comment "nvidia-tegra23 needs Xorg and a (e)glibc toolchain w/
> EABIhf"
> +	depends on BR2_cortex_a9
> +	depends on !BR2_ARM_EABIHF || !BR2_TOOLCHAIN_USES_GLIBC \
> +		|| !BR2_PACKAGE_XORG7
> diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in new file
> mode 100644 index 0000000..1d213d0
> --- /dev/null
> +++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
> @@ -0,0 +1,92 @@
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
> +	bool "nvidia-tegra23 binaries"
> +	select BR2_PACKAGE_MESA3D_HEADERS
> +	select BR2_PACKAGE_XLIB_LIBXT
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXV
> +	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HAS_LIBOPENMAX
> +	help
> +	  Those packages provide libraries, drivers and firmware
> that comes from
> +	  NVIDIA Linux For Tegra.
> +
> +	  https://developer.nvidia.com/linux-tegra
> +
> +if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
> +
> +config BR2_PACKAGE_PROVIDES_LIBEGL
> +	default "nvidia-tegra23-binaries"
> +
> +config BR2_PACKAGE_PROVIDES_LIBGLES
> +	default "nvidia-tegra23-binaries"
> +
> +config BR2_PACKAGE_PROVIDES_LIBOPENMAX
> +	default "nvidia-tegra23-binaries"
> +
> +choice
> +	prompt "X11 ABI version"
> +	default BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
> +	help
> +	  Select Tegra X11 ABI version.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V5
> +	bool "X11 ABI 5"
> +	help
> +	  Tegra X11 ABI 5.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V6
> +	bool "X11 ABI 6"
> +	help
> +	  Tegra X11 ABI 6.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V7
> +	bool "X11 ABI 7"
> +	help
> +	  Tegra X11 ABI 7.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V8
> +	bool "X11 ABI 8"
> +	help
> +	  Tegra X11 ABI 8.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V10
> +	bool "X11 ABI 10"
> +	help
> +	  Tegra X11 ABI 10.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
> +	bool "X11 ABI 11"
> +	help
> +	  Tegra X11 ABI 11.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V12
> +	bool "X11 ABI 12"
> +	help
> +	  Tegra X11 ABI 12.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V13
> +	bool "X11 ABI 13"
> +	help
> +	  Tegra X11 ABI 13.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V14
> +	bool "X11 ABI 14"
> +	help
> +	  Tegra X11 ABI 14.
> +
> +endchoice
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI
> +	int
> +	default 5  if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V5
> +	default 6  if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V6
> +	default 7  if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V7
> +	default 8  if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V8
> +	default 10 if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V10
> +	default 11 if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
> +	default 12 if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V12
> +	default 13 if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V13
> +	default 14 if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V14
> +
> +endif
> diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc new file mode
> 100644 index 0000000..3af7eec
> --- /dev/null
> +++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=/usr/lib
> +includedir=/usr/include
> +
> +Name: egl
> +Description: EGL implementation
> +Version: 1
> +Cflags: -I${includedir}/EGL
> +Libs: -L${libdir} -lEGL
> diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc new file
> mode 100644 index 0000000..91387c9
> --- /dev/null
> +++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=/usr/lib
> +includedir=/usr/include
> +
> +Name: glesv2
> +Description: OpenGL ES 1.1 implementation
> +Version: 1.1
> +Cflags: -I${includedir}/GLES
> +Libs: -L${libdir} -lGLESv1_CM
> diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc new file
> mode 100644 index 0000000..356a1cb
> --- /dev/null
> +++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=/usr/lib
> +includedir=/usr/include
> +
> +Name: glesv2
> +Description: OpenGL ES 2 implementation
> +Version: 2
> +Cflags: -I${includedir}/GLESv2
> +Libs: -L${libdir} -lGLESv2
> diff --git
> a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
> new file mode 100644 index 0000000..8185593 --- /dev/null
> +++
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
> @@ -0,0 +1,3 @@ +# From
> https://developer.nvidia.com/linux-tegra-rel-16 +sha1
> 6b57b43f8f9c5b76fa3763144e57c0c16047b1a8
> Tegra20_Linux_R16.4.0_armhf.tbz2 +sha1
> 44e7f84dd6e3b80d37ecddf9cc133031b2653004
> Tegra30_Linux_R16.4.0_armhf.tbz2 diff --git
> a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
> new file mode 100644 index 0000000..792cc7c --- /dev/null +++
> b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
> @@ -0,0 +1,98 @@
> +################################################################################
> +# +# nvidia-tegra3-binaries +#
> +################################################################################
> +
> +NVIDIA_TEGRA23_BINARIES_VERSION	= $(NVIDIA_TEGRA23_VERSION)
> +NVIDIA_TEGRA23_BINARIES_SITE = $(NVIDIA_TEGRA23_SITE)
> +NVIDIA_TEGRA23_BINARIES_SOURCE =
> $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
> + +NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of
> NVIDIA Software +NVIDIA_TEGRA23_BINARIES_LICENSE_FILES =
> nv_tegra/LICENSE +
> +NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
> +NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES
> +
> +NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
> +	xlib_libX11 xlib_libXext xlib_libXv
> +
> +NVIDIA_TEGRA23_BINARIES_PROVIDES = libegl libgles libopenmax
> +
> +ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2),y)
must be replaced by
ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2),y)

> +NVIDIA_TEGRA23_BINARIES_FIRMWARE = \
> +	nvrm_avp.bin nvavp_vid_ucode_alt.bin nvavp_os_0ff00000.bin \
> +	nvavp_os_eff00000.bin
> +endif
> +ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3),y)
must be replaced by
ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3),y)

> +NVIDIA_TEGRA23_BINARIES_FIRMWARE = \
> +	nvrm_avp_0ff00000.bin nvrm_avp_8e000000.bin
> nvrm_avp_9e000000.bin \
> +	nvrm_avp_be000000.bin nvrm_avp_eff00000.bin
> nvavp_vid_ucode_alt.bin \
> +	nvavp_os_0ff00000.bin nvavp_os_eff00000.bin
> +endif
> +
> +NVIDIA_TEGRA23_BINARIES_LIBRARIES = \
> +	libardrv_dynamic.so libcgdrv.so libEGL.so.1
> libGLESv1_CM.so.1 libGLESv2.so.2 \
> +	libKD.so libnvapputil.so libnvavp.so libnvcwm.so libnvdc.so \
> +	libnvddk_2d.so libnvddk_2d_v2.so libnvddk_disp.so
> libnvddk_kbc.so \
> +	libnvddk_mipihsi.so libnvddk_nand.so libnvddk_se.so
> libnvddk_snor.so \
> +	libnvddk_spif.so libnvddk_usbphy.so libnvdispatch_helper.so
> libnvglsi.so \
> +	libnvmedia_audio.so libnvmm_audio.so libnvmm_camera.so
> libnvmm_contentpipe.so \
> +	libnvmm_image.so libnvmmlite_audio.so libnvmmlite_image.so
> libnvmmlite.so \
> +	libnvmmlite_utils.so libnvmmlite_video.so libnvmm_manager.so
> libnvmm_parser.so \
> +	libnvmm_service.so libnvmm.so libnvmm_utils.so
> libnvmm_video.so libnvmm_writer.so \
> +	libnvodm_disp.so libnvodm_dtvtuner.so libnvodm_imager.so
> libnvodm_misc.so \
> +	libnvodm_query.so libnvomxilclient.so libnvomx.so libnvos.so
> libnvparser.so \
> +	libnvrm_graphics.so libnvrm.so libnvsm.so libnvtestio.so
> libnvtestresults.so \
> +	libnvtvmr.so libnvwinsys.so libnvwsi.so
> +
> +NVIDIA_TEGRA23_BINARIES_DRV = \
> +
> nv_tegra/nvidia_drivers/usr/lib/xorg/modules/drivers/tegra_drv.abi$(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI).so
> + +NVIDIA_TEGRA23_BINARIES_PKGCONFIG = egl.pc gles.pc glesv2.pc
> +
> +define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
> +	$(INSTALL) -d $(@D)/nv_tegra/nvidia_drivers
> +	$(call
> suitable-extractor,$(@D)/nv_tegra/nvidia_drivers.tbz2) \
> +		$(@D)/nv_tegra/nvidia_drivers.tbz2 | \
> +	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C
> $(@D)/nv_tegra/nvidia_drivers/ $(TAR_OPTIONS) -
> +	$(INSTALL) -d $(@D)/nv_tegra/nv_sample_apps/nvgstapps
> +	$(call
> suitable-extractor,$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2) \
> +		$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2 | \
> +	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C
> $(@D)/nv_tegra/nv_sample_apps/nvgstapps/ $(TAR_OPTIONS) - +endef
> +NVIDIA_TEGRA23_BINARIES_POST_EXTRACT_HOOKS +=
> NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER +
> +define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
> +	$(foreach lib,$(NVIDIA_TEGRA23_BINARIES_LIBRARIES),
> +		$(INSTALL) -D -m 0644
> $(@D)/nv_tegra/nvidia_drivers/usr/lib/$(lib) \
> +			$(1)/usr/lib/$(lib); \
> +	)
> +	(cd $(1)/usr/lib; \
> +		ln -sf libGLESv2.so.2 libGLESv2.so; \
> +		ln -sf libGLESv1_CM.so.1 libGLESv1_CM.so; \
> +		ln -sf libEGL.so.1 libEGL.so \
> +	)
> +endef
> +
> +define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
> +	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
> +	$(foreach pkgconfig,$(NVIDIA_TEGRA23_BINARIES_PKGCONFIG),
> +		$(INSTALL) -D -m 0644
> package/nvidia-tegra23/nvidia-tegra23-binaries/$(pkgconfig) \
> +
> $(STAGING_DIR)/usr/lib/pkgconfig/$(pkgconfig); \
> +	)
> +endef
> +
> +define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
> +	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(TARGET_DIR))
> +	$(foreach firmware,$(NVIDIA_TEGRA23_BINARIES_FIRMWARE),
> +		$(INSTALL) -D -m 0644
> $(@D)/nv_tegra/nvidia_drivers/lib/firmware/$(firmware) \
> +			$(TARGET_DIR)/lib/firmware/$(firmware); \
> +	)
> +	$(INSTALL) -D -m 0644
> $(@D)/nv_tegra/nvidia_drivers/etc/nv_tegra_release \
> +		$(TARGET_DIR)/etc/nv_tegra_release
> +	$(INSTALL) -D -m 0644 $(@D)/$(NVIDIA_TEGRA23_BINARIES_DRV) \
> +
> $(TARGET_DIR)/usr/lib/xorg/modules/drivers/tegra_drv.so +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/nvidia-tegra23/nvidia-tegra23.mk
> b/package/nvidia-tegra23/nvidia-tegra23.mk new file mode 100644
> index 0000000..46a7e04
> --- /dev/null
> +++ b/package/nvidia-tegra23/nvidia-tegra23.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# nvidia-tegra23
> +#
> +################################################################################
> +
> +NVIDIA_TEGRA23_SITE =
> https://developer.nvidia.com/sites/default/files/akamai/mobile/files/L4T
> +NVIDIA_TEGRA23_VERSION = 16.4.0 +
> +ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2),y)
> +NVIDIA_TEGRA23_BASE = Tegra20_Linux
> +endif
> +ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3),y)
> +NVIDIA_TEGRA23_BASE = Tegra30_Linux
> +endif
> +
> +include $(sort $(wildcard package/nvidia-tegra23/*/*.mk))



-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
