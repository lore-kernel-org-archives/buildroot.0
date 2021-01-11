From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 11 Jan 2021 14:12:08 +0100
Subject: [Buildroot] [RFC: 3/4]
 package/x11r7/xdriver_xf86-video-imx-viv: bump to version
 rel_imx_5.4.24_2.1.0
In-Reply-To: <53e43012-7460-6954-2467-dea1ddcf0be7@gmail.com>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
 <20210107110450.4031102-3-romain.naour@gmail.com>
 <53e43012-7460-6954-2467-dea1ddcf0be7@gmail.com>
Message-ID: <X/xOqBw1AkEKB3SP@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, Jan 10, 2021 at 06:46:38PM +0100, Romain Naour wrote:
> Hello,
> 
> Le 07/01/2021 ? 12:04, Romain Naour a ?crit?:
> > This package needs to be updated to build with the NXP imx_5.4.x_2.1.0 release.
> > 
> > Don't override CFLAGS on the command line otherwise we loose some include paths
> > (ex: -I./vivante_gal).
> > CFLAGS is already provided by TARGET_CONFIGURE_OPTS in make environment.
> 
> What's the status of vivante gpu support for X11 ? especially for kernel >= 5.4.

Don't know. To be honest, i.MX6 will soon be a legacy product for NXP
releases so I strongly suggest moving to mainline + Etnaviv.

> Because it's currently broken with several issues:
> 
> 0) glxinfo fail to report OpenGL informations
> 
> # glxinfo -B -display :0
> name of display: :0
> Error: glXMakeCurrent failed
> X Error of failed request:  GLXBadContext
>   Major opcode of failed request:  148 (GLX)
>   Minor opcode of failed request:  4 (X_GLXDestroyContext)
>   Serial number of failed request:  20
>   Current serial number in output stream:  25
> Perform final cleanup before process termination!
> 
> (I'm using a patch that replace glWindowPos2iARB calls with glWindowPos2i:
> https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-graphics/mesa/mesa-demos/Replace-glWindowPos2iARB-calls-with-glWindowPos2i.patch)

Have you tried NXP pre-built image from latest release? Although it
seems they now use Wayland/XWayland. Yet it'd be surprising they'd
release a broken X11 package.

> 1) vivante_fbdev is looking for a device with "platform:Vivante GCCore" using
> drmOpen() [1]
> 
>  strcpy(pDRIInfo->busIdString,"platform:Vivante GCCore");
>  fd = drmOpen(NULL,pDRIInfo->busIdString);
> 
> This string "platform:Vivante GCCore" is present in the linux-imx kernel up to
> the version imx_4.19.35_1.1.0. The DRM_VIVANTE driver is missing in
> imx_5.4.70_2.3.0.
> 
> 2) I was able to workaround this issue by using "130000.gpu" instead of
> "platform:Vivante GCCore" but the dri driver still fail to load.
> 
> drmOpenByBusid: Searching for BusID 130000.gpu
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 12, (OK)
> drmOpenByBusid: drmOpenMinor returns 12
> drmOpenByBusid: drmGetBusid reports 130000.gpu
> (II) [drm] DRM interface version 1.4
> (II) [drm] Could not create SAREA for DRM lock.
> (EE) VIVANTE(0): [dri] DRIScreenInit failed.  Disabling DRI
> 
> 3) I tried to enable X11_DRI3 but xdriver_xf86-video-imx-viv doesn't even build
> due to recent change [2] (removing pScrPriv variable before using it along with
> other issues).
> See patch [3] that try to fix the issue.
> (Note, X11_DRI3 needs libdrm-vivante fork to build)
> 
> 
> To compare with a working system, I'm using the Debian (xfce) image provided by
> Boundarydevices [4] but the kernel is 4.14.98-28-boundary-17b (DRM_VIVANTE is
> still present). I noticed that the SWRAST DRI driver is used along with the
> vivante driver:
> 
> [    21.503] (II) Initializing extension GLX
> [    21.504] (II) AIGLX: Screen 0 is not DRI2 capable
> [    22.142] (II) IGLX: Loaded and initialized swrast
> [    22.143] (II) GLX: Initialized DRISWRAST GL provider for screen 0

FYI, we haven't updated to 5.4 for i.MX6 and don't plan to.

> It means that we really need two LIBGL providers enabled at the same time in the
> Buildroot configuration.

OpenGL is another issue though, you can get X11 working without it. But
yes the implementation on libGL from imx-gpu-viv is messy. Thomas did
implement it once but never submitted it as the change was pretty
intrusive & hacky.

> I have the feeling that I need to switch to Yocto to use meta-freescale and all
> the imx hacks and imx forks (libdrm-imx) to get vivante GPU working with X11
> (maybe).

Please let us know how that goes. Once again it feels like it would be
better to move to Etnaviv at this point.

Regards,
Gary
