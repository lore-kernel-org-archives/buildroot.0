From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2014 19:05:01 -0800
Subject: [Buildroot] [PATCH v3 00/14] Add Xorg support for iMX6
In-Reply-To: <1417253726-14395-1-git-send-email-jezz@sysmic.org>
References: <1417253726-14395-1-git-send-email-jezz@sysmic.org>
Message-ID: <547D2C5D.8070006@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, All,

On 11/29/2014 01:35 AM, J?r?me Pouiller wrote:
> Hello,
>
> Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
> Xorg. This work is mainly adapted from Yocto.
>
> v3:
>    - Respin on next
>    - Add patch to use self-extractible helper function
>    - Remove 'See freescale-imx.mk' comment
>    - Reword patch "gpu-viv-bin-mx6q: change output selection mecanisms"
>    - libdrm: Apply new patch naming policy
>    - xdriver_xf86-video-imx-viv: Apply new patch naming policy
>    - xdriver_xf86-video-imx-viv: Does not depends directly on glibc
>    - qt5base: Apply new patch naming policy
>    - qmx6_defconfig: Use internal toochain
>
> v2:
>    - Rebase on new version of mesa3d
>    - Reorder some patches (in order to make examples I provide in commit message
>      functional)
>    - Do not bump version of all freescale packages
>    - Bump kernel version of imx6 boards
>
> J?r?me Pouiller (14):
>    mesa3d: Give possibility to external backends to enable DRI/Gallium
>    gpu-viv-bin-mx6q: use self-extractible helper
>    gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
>    gpu-viv-bin-mx6q: fix GLESv2 support
>    gpu-viv-bin-mx6q: make fb/x11 choice explicit
>    gpu-viv-bin-mx6q: change output selection mechanism
>    xdriver_xf86-video-imx-viv: new package
>    libdrm: fix support for xserver with Vivante drivers
>    qt5base: apply new patch naming policy
>    qt5base: fix Vivante x11/EGL configuration
>    Vivante drivers: bump to version 3.10.17-1.0.1
>    nitrogen6x_defconfig: bump kernel to 3.10.17_1.0.1_ga
>    freescale_imx6*_defconfig: bump kernel to 3.10.17_1.0.1_ga
>    qmx6_defconfig: update
First, I have been able to apply and build everything fine based on the 
next branch.
It is to be noted that I am using a SabreLite instead of the QMX6, 
therefore I've modified the kernel and bootloader versions.

X is working well just like the graphics. As a FYI, xorg.conf used 
during my testing is coming from Yocto:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
Then I've tried to start X, xterm and the Vivante example which are all 
running fine.

There is only one thing I am unclear on which is the Qt5 changes and how 
to test them.
Looking at the configuration it looks like we should have some examples 
installed but I can't seem to run them as I get the following error:
# qmlscene TestCase.qml
Could not initialize GLX
Aborted

I might do something wrong here but it looks like GL isn't configured 
properly. By looking at the configuration again I've realized that we 
have the following option by default:
BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP=y
# BR2_PACKAGE_QT5BASE_OPENGL_ES2 is not set
Where it might make sense to have:
# BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP is not set
BR2_PACKAGE_QT5BASE_OPENGL_ES2=y

Should we specify the QT5BASE_OPENGL_ES2 in the configuration provided 
in your patches or does it behave differently on your side?
Could you send you entire configuration file for comparison?

Thanks,
Gary
