From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  2 Dec 2014 10:58:58 +0100
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
Message-ID: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
Xorg. This work is mainly adapted from Yocto.

v4:
  - Fix example config in commit log of xdriver_xf86-video-imx-viv
  - Add a note about OpenGL API in xdriver_xf86-video-imx-viv help

v3:
  - Respin on next
  - Add patch to use self-extractible helper function
  - Remove 'See freescale-imx.mk' comment
  - Reword patch "gpu-viv-bin-mx6q: change output selection mecanisms"
  - libdrm: Apply new patch naming policy
  - xdriver_xf86-video-imx-viv: Apply new patch naming policy
  - xdriver_xf86-video-imx-viv: Does not depends directly on glibc
  - qt5base: Apply new patch naming policy
  - qmx6_defconfig: Use internal toochain

v2:
  - Rebase on new version of mesa3d
  - Reorder some patches (in order to make examples I provide in commit message 
    functional)
  - Do not bump version of all freescale packages
  - Bump kernel version of imx6 boards

J?r?me Pouiller (14):
  mesa3d: Give possibility to external backends to enable DRI/Gallium
  gpu-viv-bin-mx6q: use self-extractible helper
  gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
  gpu-viv-bin-mx6q: fix GLESv2 support
  gpu-viv-bin-mx6q: make fb/x11 choice explicit
  gpu-viv-bin-mx6q: change output selection mechanism
  xdriver_xf86-video-imx-viv: new package
  libdrm: fix support for xserver with Vivante drivers
  qt5base: apply new patch naming policy
  qt5base: fix Vivante x11/EGL configuration
  Vivante drivers: bump to version 3.10.17-1.0.1
  nitrogen6x_defconfig: bump kernel to 3.10.17_1.0.1_ga
  freescale_imx6*_defconfig: bump kernel to 3.10.17_1.0.1_ga
  qmx6_defconfig: update

 board/congatec/qmx6/6q_bootscript.txt              |  2 -
 board/congatec/qmx6/post-build.sh                  |  7 ---
 configs/freescale_imx6dlsabresd_defconfig          |  3 +-
 configs/freescale_imx6qsabresd_defconfig           |  3 +-
 configs/freescale_imx6sololiteevk_defconfig        |  3 +-
 configs/nitrogen6x_defconfig                       |  3 +-
 configs/qmx6_defconfig                             | 49 +++++++++++++++--
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 29 +++++++++-
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |  2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |  2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 56 ++++++++-----------
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |  2 +-
 package/libdrm/0001-update-arm.patch               | 37 +++++++++++++
 package/mesa3d/mesa3d.mk                           |  4 +-
 .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  | 23 ++++++++
 ...kspecs-files.patch => 0002-mkspecs-files.patch} |  0
 ...clibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} |  0
 package/qt5/qt5base/0004-xcb-egl-fixes.patch       | 63 ++++++++++++++++++++++
 package/x11r7/Config.in                            |  1 +
 .../0001-Fix-LoadExtenions.patch                   | 15 ++++++
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 31 +++++++++++
 .../xdriver_xf86-video-imx-viv.mk                  | 32 +++++++++++
 22 files changed, 310 insertions(+), 57 deletions(-)
 delete mode 100644 board/congatec/qmx6/6q_bootscript.txt
 delete mode 100755 board/congatec/qmx6/post-build.sh
 create mode 100644 package/libdrm/0001-update-arm.patch
 create mode 100644 package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
 rename package/qt5/qt5base/{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
 rename package/qt5/qt5base/{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} (100%)
 create mode 100644 package/qt5/qt5base/0004-xcb-egl-fixes.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk

-- 
1.9.1
