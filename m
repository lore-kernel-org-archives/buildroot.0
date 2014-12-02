From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 02 Dec 2014 10:08:02 +0100
Subject: [Buildroot] [PATCH v3 00/14] Add Xorg support for iMX6
In-Reply-To: <547D2C5D.8070006@gmail.com>
References: <1417253726-14395-1-git-send-email-jezz@sysmic.org>
 <547D2C5D.8070006@gmail.com>
Message-ID: <4928188.nBMXItx9yE@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 01 December 2014 19:05:01 Gary Bisson wrote:
> Jerome, All,
> 
> On 11/29/2014 01:35 AM, J?r?me Pouiller wrote:
> > Hello,
> >
> > Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
> > Xorg. This work is mainly adapted from Yocto.
> >
> > v3:
> >    - Respin on next
> >    - Add patch to use self-extractible helper function
> >    - Remove 'See freescale-imx.mk' comment
> >    - Reword patch "gpu-viv-bin-mx6q: change output selection mecanisms"
> >    - libdrm: Apply new patch naming policy
> >    - xdriver_xf86-video-imx-viv: Apply new patch naming policy
> >    - xdriver_xf86-video-imx-viv: Does not depends directly on glibc
> >    - qt5base: Apply new patch naming policy
> >    - qmx6_defconfig: Use internal toochain
> >
> > v2:
> >    - Rebase on new version of mesa3d
> >    - Reorder some patches (in order to make examples I provide in commit message
> >      functional)
> >    - Do not bump version of all freescale packages
> >    - Bump kernel version of imx6 boards
> >
> > J?r?me Pouiller (14):
> >    mesa3d: Give possibility to external backends to enable DRI/Gallium
> >    gpu-viv-bin-mx6q: use self-extractible helper
> >    gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
> >    gpu-viv-bin-mx6q: fix GLESv2 support
> >    gpu-viv-bin-mx6q: make fb/x11 choice explicit
> >    gpu-viv-bin-mx6q: change output selection mechanism
> >    xdriver_xf86-video-imx-viv: new package
> >    libdrm: fix support for xserver with Vivante drivers
> >    qt5base: apply new patch naming policy
> >    qt5base: fix Vivante x11/EGL configuration
> >    Vivante drivers: bump to version 3.10.17-1.0.1
> >    nitrogen6x_defconfig: bump kernel to 3.10.17_1.0.1_ga
> >    freescale_imx6*_defconfig: bump kernel to 3.10.17_1.0.1_ga
> >    qmx6_defconfig: update
> First, I have been able to apply and build everything fine based on the 
> next branch.
> It is to be noted that I am using a SabreLite instead of the QMX6, 
> therefore I've modified the kernel and bootloader versions.
> 
> X is working well just like the graphics. As a FYI, xorg.conf used 
> during my testing is coming from Yocto:
> https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
> Then I've tried to start X, xterm and the Vivante example which are all 
> running fine.
Cool.
 
> There is only one thing I am unclear on which is the Qt5 changes and how 
> to test them.
> Looking at the configuration it looks like we should have some examples 
> installed but I can't seem to run them as I get the following error:
> # qmlscene TestCase.qml
> Could not initialize GLX
> Aborted
As I wrote in commit log of patch 09/13, Desktop OpenGL seems broken for a
while. Yocto use Mesa3D/swraster to provide Desktop OpenGL API.

I will add a comment in help message about this issue.

> I might do something wrong here but it looks like GL isn't configured 
> properly. By looking at the configuration again I've realized that we 
> have the following option by default:
> BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP=y
> # BR2_PACKAGE_QT5BASE_OPENGL_ES2 is not set
> Where it might make sense to have:
> # BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP is not set
> BR2_PACKAGE_QT5BASE_OPENGL_ES2=y
> 
> Should we specify the QT5BASE_OPENGL_ES2 in the configuration provided 
> in your patches or does it behave differently on your side?
You are right, BR2_PACKAGE_QT5BASE_OPENGL_ES2 symbol is missing in 
defconfig I give as example (I think this symbol was automatically 
selected in v1 since BR2_PACKAGE_PROVIDES_LIBGL was not set).

Notice, it is complex to prevent user to select GL backend with iMX6
GPU driver. It is a bug from iMX6 GPU driver and it would be necessary
to rework mesa3d package to workaround it.

> Could you send you entire configuration file for comparison?
I have just regenerate a defconfig. As you can see, 
BR2_PACKAGE_QT5BASE_OPENGL_ES2 appears explicitly now.

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_EABIHF=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_JPEG=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG=y
BR2_PACKAGE_GST1_LIBAV=y
BR2_PACKAGE_QT_GSTREAMER=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_ES2=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XLIB_LIBXSHMFENCE=y
BR2_PACKAGE_XAPP_XEYES=y
BR2_PACKAGE_XAPP_XRANDR=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV=y
BR2_PACKAGE_XPROTO_DRI3PROTO=y
BR2_PACKAGE_MATCHBOX=y
BR2_PACKAGE_MATCHBOX_KEYBOARD=y
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES=y
BR2_PACKAGE_LIBGCRYPT=y
BR2_PACKAGE_LIBSHA1=y
BR2_PACKAGE_LIBJPEG=y
BR2_PACKAGE_LIBFSLCODEC=y
BR2_PACKAGE_LIBFSLPARSER=y
BR2_PACKAGE_LIBFSLVPUWRAP=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="cgt_qmx6_pn016103"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_uboot.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="6388c474189b42c07bb865dd604c74483da099f3"
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.pn016103.imx"

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
