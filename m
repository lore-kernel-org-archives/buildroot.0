From: Gary Bisson <bisson.gary@gmail.com>
Date: Sun, 16 Nov 2014 00:37:53 -0800
Subject: [Buildroot] [PATCH v2 00/13] Add Xorg support for imx6
In-Reply-To: <20141116083345.GA8150@n411z>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
 <20141116083345.GA8150@n411z>
Message-ID: <CADCpmyNT+VH8==NvuJm8wOZ3xSa4Xjm6QJaRFm_TZduihhA05g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding Jerome...

On Sun, Nov 16, 2014 at 12:33 AM, Gary Bisson <bisson.gary@gmail.com> wrote:
> Jerome,
>
> I've been able to build and test this set of patches on my i.MX6Q
> SabreLite board (nitrogen6x defconfig).
> Everything is running fine although I only tried:
> - Starting X server
> - Launching xterm
> - Launching Vivante 3D examples
>
> Regarding X, I've used the following configuration:
> https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf
>
> However I have a few questions regarding the patches:
> - 05/13: gpu-viv-bin-mx6q: make fb/x11 choice explicit
>   - Not sure to get the use case here. Are people interested in having
>   fb libs on a X system?
> - 06/13: gpu-viv-bin-mx6q: change output selection mecanism
>   - s/mecanism/mechanism
>   - Are the symbolic links changes related to the output selection? I would
>   have seen this as part of the "04/13: gpu-viv-bin-mx6q: fix GLESv2 support"
>   patch
>
> Other than that it looks good. There's one test I haven't done yet: rebuild a
> system without X making sure 3D is still working.
>
> Thanks,
> Gary
>
> On Mon, Oct 13, 2014 at 01:10:10PM +0200, J?r?me Pouiller wrote:
>> Hello,
>>
>> Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
>> Xorg. This work is mainly adapted from Yocto.
>>
>> v2:
>>   - Rebase on new version of mesa3d
>>   - Reorder some patches (in order to make examples I provide in commit message
>>     functional)
>>   - Do not bump version of all freescale packages
>>   - Bump kernel version of imx6 boards
>>
>> J?r?me Pouiller (13):
>>   mesa3d: Give possibility to external backends to enable DRI/Gallium
>>   gpu-viv-bin-mx6q: provide libopenvg
>>   gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
>>   gpu-viv-bin-mx6q: fix GLESv2 support
>>   gpu-viv-bin-mx6q: make fb/x11 choice explicit
>>   gpu-viv-bin-mx6q: change output selection mecanism
>>   libdrm: fix support for xserver with Vivante drivers
>>   qt5base: fix Vivante x11/EGL configuration
>>   xdriver_xf86-video-imx-viv: new package
>>   Vivante drivers: bump to version 3.10.17-1.0.1
>>   nitrogen6x_defconfig: bump kernel to 3.10.17_1.0.1_ga
>>   freescale_imx6*_defconfig: bump kernel to 3.10.17_1.0.1_ga
>>   qmx6_defconfig: update
>>
>>  board/congatec/qmx6/6q_bootscript.txt              |  2 -
>>  board/congatec/qmx6/post-build.sh                  |  7 ---
>>  configs/freescale_imx6dlsabresd_defconfig          |  3 +-
>>  configs/freescale_imx6qsabresd_defconfig           |  3 +-
>>  configs/freescale_imx6sololiteevk_defconfig        |  3 +-
>>  configs/nitrogen6x_defconfig                       |  3 +-
>>  configs/qmx6_defconfig                             | 49 +++++++++++++++--
>>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 33 +++++++++++-
>>  package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |  2 +-
>>  package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |  2 +-
>>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 43 +++++++--------
>>  package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |  2 +-
>>  package/libdrm/libdrm-0001-update-arm.patch        | 37 +++++++++++++
>>  package/mesa3d/mesa3d.mk                           |  4 +-
>>  .../qt5base-0001-Force_egl_visual_ID_33.patch      | 23 ++++++++
>>  .../qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch   | 63 ++++++++++++++++++++++
>>  package/x11r7/Config.in                            |  1 +
>>  package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 32 +++++++++++
>>  ...xf86-video-imx-viv-0001-Fix-LoadExtenions.patch | 15 ++++++
>>  .../xdriver_xf86-video-imx-viv.mk                  | 32 +++++++++++
>>  20 files changed, 313 insertions(+), 46 deletions(-)
>>  delete mode 100644 board/congatec/qmx6/6q_bootscript.txt
>>  delete mode 100755 board/congatec/qmx6/post-build.sh
>>  create mode 100644 package/libdrm/libdrm-0001-update-arm.patch
>>  create mode 100644 package/qt5/qt5base/qt5base-0001-Force_egl_visual_ID_33.patch
>>  create mode 100644 package/qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch
>>  create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
>>  create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-0001-Fix-LoadExtenions.patch
>>  create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
>>
>> --
>> 1.9.1
>>
