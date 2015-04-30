From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 30 Apr 2015 17:12:15 +0200
Subject: [Buildroot] [PATCH v7 00/13] Add Xorg support for iMX6
Message-ID: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
Xorg. This work is mainly adapted from Yocto.


v7:
  - Rebase on master
  - Drop already applied 'qt5base: apply new patch naming policy'
  - Drop 'qmx6_qt5_demo_defconfig: new defconfig' since there is no other
    "demo configs" in buildroot.
  - Add Tested-by and Reviewed-by from Garry (Thanks you Garry for all tests you
    did)
  - Reword some commits
  - Use Makefile tests instead of shell test [Thomas P.]
  - Reorder 'bool' before 'select' and 'depends' [Thomas P.]
  - Notice xdriver_xf86-video-imx-viv continue to select 'mesa3d' in order to
    compile Xorg with DRI support. This is far to be optimal since
    xdriver_xf86-video-imx-viv does not use mesa3d at runtime. The correct way
    would be to compile Xorg using mesa3d-headers. However it is a really
    intrusive change and all tests were done without this change. Therefore I
    finally didn't make this change.

v6:
  - Rebase on master
  - Add license for xdriver_xf86-video-imx-viv. Notice this package does not
    provide any license file.
  - Fix typos suggested by Thomas P.
  - Fix dependency on libdrm (gpu-viv-bin-mx6q does not depends on libdrm, but
    xdriver_xf86-video-imx-viv does depend)
  - Add a note about runtime dependencies in gpu-viv-bin-mx6q
  - Splited patch 6/15 in 3 parts
  - Splited patch 10/15 in 2 parts
  - Make 0001-Force_egl_visual_ID_33.patch contionnal

v5:
  - Add references in commit log of xdriver_xf86-video-imx-viv
  - Split qmx6_defconfig in two defconfig: a minimal one and a demo one

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


J?r?me Pouiller (13):
  mesa3d: Give possibility to external backends to enable DRI/Gallium
  gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
  gpu-viv-bin-mx6q: make fb/x11 choice explicit
  gpu-viv-bin-mx6q: remove useless build time deps
  gpu-viv-bin-mx6q: add version in libraries symlinks
  gpu-viv-bin-mx6q: change output selection mechanism
  xdriver_xf86-video-imx-viv: new package
  qt5base: fix compilation with Vivante headers.
  qt5base: fix "Unable to find an X11 visual" error
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
 configs/qmx6_defconfig                             | 25 +++++++--
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 28 +++++++++-
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |  2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |  2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 40 +++++++-------
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |  2 +-
 package/mesa3d/mesa3d.mk                           |  4 +-
 .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  | 26 +++++++++
 package/qt5/qt5base/0004-xcb-egl-fixes.patch       | 63 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     |  6 ++-
 package/x11r7/Config.in                            |  1 +
 .../0001-Fix-LoadExtenions.patch                   | 15 ++++++
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 31 +++++++++++
 .../xdriver_xf86-video-imx-viv.mk                  | 33 ++++++++++++
 20 files changed, 255 insertions(+), 44 deletions(-)
 delete mode 100644 board/congatec/qmx6/6q_bootscript.txt
 delete mode 100755 board/congatec/qmx6/post-build.sh
 create mode 100644 package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
 create mode 100644 package/qt5/qt5base/0004-xcb-egl-fixes.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk

-- 
1.9.1
