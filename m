From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 17 Feb 2016 10:26:05 +0100
Subject: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
In-Reply-To: <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
References: <1454363759-23349-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
 <20160216215313.15f228fe@gmx.net>,
 <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
Message-ID: <trinity-f34aaf6c-100d-4336-9dbf-030d951133dd-1455701165352@3capp-gmx-bs46>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

> Gesendet: Dienstag, 16. Februar 2016 um 23:57 Uhr
> Von: "Gary Bisson" <gary.bisson@boundarydevices.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Betreff: Re: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package

[snip]

> 
> > But I had problems using the imxeglvivsink element and
> > with qt5 eglfs, suspecting your 'Update most Freescale packages' patch series
> > (using buildroot-2016.02-rc1 with your '[PATCH v3 0/2] gst1-imx: bump version to 0.12.0'
> > patches on top), but did not find time yet to investigate further...
> 
> Does a basic gstreamer pipeline work?
> # gst-launch-1.0 videotestsrc ! imxeglvivsink
>

No:

$ GST_DEBUG=*:3 gst-launch-1.0 videotestsrc ! imxeglvivsink
Setting pipeline to PAUSED ...
mxc_sdc_fb fb.20: 1920x1080 h_sync,r,l: 44,88,148  v_sync,l,u: 5,4,36 pixclock=148500000 Hz
imx-ipuv3 2800000.ipu: try ipu internal clk
imx-ipuv3 2800000.ipu: disp=0, pixel_clk=148500000 148500000 parent=148500000 div=1
0:00:00.229253000   245   0x9d1ee0 ERROR      imxeglplatform_fb egl_platform_fb.c:72:gst_imx_egl_viv_sink_egl_platform_create: eglGetDisplay failed: bad alloc
ERROR: Pipeline doesn't want to pause.
Setting pipeline to NULL ...
Freeing pipeline ...
mxc_sdc_fb fb.20: 1920x1080 h_sync,r,l: 44,88,148  v_sync,l,u: 5,4,36 pixclock=148500000 Hz
imx-ipuv3 2800000.ipu: try ipu internal clk
imx-ipuv3 2800000.ipu: disp=0, pixel_clk=148500000 148500000 parent=148500000 div=1

Using Buildroot-2016-02-rc1 with
https://patchwork.ozlabs.org/patch/577011/mbox/
https://patchwork.ozlabs.org/patch/577012/mbox/
and 'qt5tools: new package' patches on top with the following defconfig (based on
the original nitrogen6x_defconfig config):

BR2_arm=y
BR2_cortex_a9=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GLIBC_VERSION_2_22=y
BR2_BINUTILS_VERSION_2_25_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/f4c8395/linux-imx6-f4c8395.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="boundary"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6q-sabrelite"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2=y
BR2_PACKAGE_GST1_PLUGINS_BAD=y
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
BR2_PACKAGE_GST1_PLUGINS_UGLY=y
BR2_PACKAGE_GST1_IMX=y
BR2_PACKAGE_BINUTILS=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5SERIALPORT=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS=y
BR2_PACKAGE_QT5WEBSOCKETS=y
BR2_PACKAGE_QT5SCRIPT=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_LIB=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y
BR2_PACKAGE_LIBIMXVPUAPI=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/a4070a8/u-boot-a4070a8.tar.gz"
BR2_TARGET_UBOOT_FORMAT_IMX=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

> If not there's no wonder qt5 doesn't like it. I haven't tried qt5 but
> I'm sure the gstreamer imxeglvivsink does work.
> 

My last working version was based on buildroot-2015.11.1 plus 'qt5: bump version to 5.5.1' and
'qt5tools: new package' on top...

> In case you've enabled BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV, you
> might need to load the Galcore module manually in case you don't have
> eudev for instance:
> # insmod /lib/modules/3.14.28/extra/galcore.ko

No, working with boundarydevices linux-imx6-f4c8395 and original boundary config
and there is a '/dev/galcore' entry on the target...

Regards,
Peter

> 
> Regards,
> Gary
> 
