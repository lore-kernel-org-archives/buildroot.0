From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Jan 2021 18:46:38 +0100
Subject: [Buildroot] [RFC: 3/4]
 package/x11r7/xdriver_xf86-video-imx-viv: bump to version
 rel_imx_5.4.24_2.1.0
In-Reply-To: <20210107110450.4031102-3-romain.naour@gmail.com>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
 <20210107110450.4031102-3-romain.naour@gmail.com>
Message-ID: <53e43012-7460-6954-2467-dea1ddcf0be7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 07/01/2021 ? 12:04, Romain Naour a ?crit?:
> This package needs to be updated to build with the NXP imx_5.4.x_2.1.0 release.
> 
> Don't override CFLAGS on the command line otherwise we loose some include paths
> (ex: -I./vivante_gal).
> CFLAGS is already provided by TARGET_CONFIGURE_OPTS in make environment.

What's the status of vivante gpu support for X11 ? especially for kernel >= 5.4.

Because it's currently broken with several issues:

0) glxinfo fail to report OpenGL informations

# glxinfo -B -display :0
name of display: :0
Error: glXMakeCurrent failed
X Error of failed request:  GLXBadContext
  Major opcode of failed request:  148 (GLX)
  Minor opcode of failed request:  4 (X_GLXDestroyContext)
  Serial number of failed request:  20
  Current serial number in output stream:  25
Perform final cleanup before process termination!

(I'm using a patch that replace glWindowPos2iARB calls with glWindowPos2i:
https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-graphics/mesa/mesa-demos/Replace-glWindowPos2iARB-calls-with-glWindowPos2i.patch)

1) vivante_fbdev is looking for a device with "platform:Vivante GCCore" using
drmOpen() [1]

 strcpy(pDRIInfo->busIdString,"platform:Vivante GCCore");
 fd = drmOpen(NULL,pDRIInfo->busIdString);

This string "platform:Vivante GCCore" is present in the linux-imx kernel up to
the version imx_4.19.35_1.1.0. The DRM_VIVANTE driver is missing in
imx_5.4.70_2.3.0.

2) I was able to workaround this issue by using "130000.gpu" instead of
"platform:Vivante GCCore" but the dri driver still fail to load.

drmOpenByBusid: Searching for BusID 130000.gpu
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenByBusid: drmOpenMinor returns 12
drmOpenByBusid: drmGetBusid reports 130000.gpu
(II) [drm] DRM interface version 1.4
(II) [drm] Could not create SAREA for DRM lock.
(EE) VIVANTE(0): [dri] DRIScreenInit failed.  Disabling DRI

3) I tried to enable X11_DRI3 but xdriver_xf86-video-imx-viv doesn't even build
due to recent change [2] (removing pScrPriv variable before using it along with
other issues).
See patch [3] that try to fix the issue.
(Note, X11_DRI3 needs libdrm-vivante fork to build)


To compare with a working system, I'm using the Debian (xfce) image provided by
Boundarydevices [4] but the kernel is 4.14.98-28-boundary-17b (DRM_VIVANTE is
still present). I noticed that the SWRAST DRI driver is used along with the
vivante driver:

[    21.503] (II) Initializing extension GLX
[    21.504] (II) AIGLX: Screen 0 is not DRI2 capable
[    22.142] (II) IGLX: Loaded and initialized swrast
[    22.143] (II) GLX: Initialized DRISWRAST GL provider for screen 0

It means that we really need two LIBGL providers enabled at the same time in the
Buildroot configuration.

I have the feeling that I need to switch to Yocto to use meta-freescale and all
the imx hacks and imx forks (libdrm-imx) to get vivante GPU working with X11
(maybe).

Best regards,
Romain

[1]
https://source.codeaurora.org/external/imx/xf86-video-imx-vivante/tree/EXA/src/vivante_fbdev/vivante_dri.c?h=imx_exa_viv6_g2d#n127

[2]
https://source.codeaurora.org/external/imx/xf86-video-imx-vivante/commit/?h=imx_exa_viv6_g2d&id=8ea614949fdefd4ab655d3944fc32d62cb48c3be

[3]
https://github.com/mxOBS/deb-pkg_xserver-xorg-video-imx-viv/commit/3c5abf59abb8d7283cd8c951776ca059a5791272

[4]
https://boundarydevices.com/debian-buster-10-2-for-i-mx6-7-boards-december-2019-kernel-4-14-x/

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> 
> Note: xdriinfo report a too old libGL library
>  # xdriinfo
>  libGL is too old.
> ---
>  .../xdriver_xf86-video-imx-viv.hash                           | 2 +-
>  .../xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
> index e5d46c86f3..7295061d36 100644
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
> +sha256  2f927114e8b888237f1a15830ff5dbde3990fc737227b7a2b94dc6fdbcd7fe19  xdriver_xf86-video-imx-viv-rel_imx_5.4.24_2.1.0.tar.gz
>  sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> index 0913427542..9aa2b50cad 100644
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_4.9.x_1.0.0_ga
> +XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_5.4.24_2.1.0
>  XDRIVER_XF86_VIDEO_IMX_VIV_SITE = https://source.codeaurora.org/external/imx/xf86-video-imx-vivante
>  XDRIVER_XF86_VIDEO_IMX_VIV_SITE_METHOD = git
>  XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv imx-gpu-g2d xserver_xorg-server \
> @@ -17,7 +17,7 @@ XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)
>  define XDRIVER_XF86_VIDEO_IMX_VIV_BUILD_CMDS
>  	$(XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD) sysroot=$(STAGING_DIR) \
>  		BUSID_HAS_NUMBER=1 BUILD_IN_YOCTO=1 XSERVER_GREATER_THAN_13=1 \
> -		CFLAGS="$(TARGET_CFLAGS)"
> +		SDKTARGETSYSROOT="$(STAGING_DIR)"
>  endef
>  
>  define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING_CMDS
> 
