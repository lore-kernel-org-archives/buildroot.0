From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  4 Jan 2018 12:39:32 +0100
Subject: [Buildroot] [PATCH v2 00/15] imx: update packages to 4.9.x_1.0.0_ga
 release
Message-ID: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here's some update on pretty much all the i.MX-related packages.

Mainly:
- Switch to 4.9-based kernel
- Graphics driver updated accordingly
  -> g2d and apitrace now in separate packages
  -> apitrace package not included in this series
- Switch freescale.com repositories to codeaurora
- Switch NXPMicro repositories to codeaurora

Changelog v2:
- Fix imx-codec dependency to add AARCH64 (Baruch)
- Fix imx-parser dependency to add AARCH64 (Thomas)
- Re-order packages to fix bisectability for g2d (Thomas)
- Add missing Config.in.legacy for imx-gpu-viv (Thomas)
- Squash gst1-imx update for g2d inside imx-gpu-viv patch (Thomas)
- Update comment for xdriver-video-imx-viv (Thomas)

Let me know if you have any question.

Regards,
Gary

Gary Bisson (15):
  freescale-imx: add config options for i.MX6SL/SX and i.MX7D/ULP
  imx-lib: bump to version imx_4.9.11_1.0.0_ga
  imx-gpu-g2d: new package
  imx-gpu-viv: bump to version 6.2.2.p0
  kernel-module-imx-gpu-viv: bump to version 6.2.2.p0
  xdriver_xf86-video-imx-viv: bump to version 6.2.2.p0
  firmware-imx: bump to version 6.0
  imx-codec: bump to version 4.2.1
  imx-parser: bump to version 4.2.1
  imx-vpu: bump to version 5.4.37
  imx-kobs: bump revision to a0e9adce
  imx-uuc: bump revision to 2ae63428
  configs: freescale_imx*: bump to version 4.9.x_1.0.0_ga
  configs: nitrogen*: bump kernel version to 4.9.x_1.0.0_ga
  configs: nitrogen*: bump u-boot version to 2017.07

 Config.in.legacy                                   |  14 ++
 board/boundarydevices/common/boot.cmd              | 155 +++++++++++++++++++++
 board/boundarydevices/common/post-build.sh         |   7 +-
 board/boundarydevices/common/upgrade.cmd           | 154 ++++++++++++++++++++
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch |   4 +-
 configs/freescale_imx31_3stack_defconfig           |   8 +-
 configs/freescale_imx6dlsabreauto_defconfig        |  12 +-
 configs/freescale_imx6dlsabresd_defconfig          |  12 +-
 configs/freescale_imx6qsabreauto_defconfig         |  12 +-
 configs/freescale_imx6qsabresd_defconfig           |  12 +-
 configs/freescale_imx6sololiteevk_defconfig        |  12 +-
 configs/freescale_imx6sxsabresd_defconfig          |  12 +-
 configs/freescale_imx6ulevk_defconfig              |  12 +-
 configs/freescale_imx7dsabresd_defconfig           |  12 +-
 configs/nitrogen6sx_defconfig                      |  19 +--
 configs/nitrogen6x_defconfig                       |  19 +--
 configs/nitrogen7_defconfig                        |  19 +--
 package/freescale-imx/Config.in                    |  24 +++-
 .../freescale-imx/firmware-imx/firmware-imx.hash   |   2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk |   2 +-
 package/freescale-imx/imx-codec/Config.in          |   4 +-
 package/freescale-imx/imx-codec/imx-codec.hash     |   2 +-
 package/freescale-imx/imx-codec/imx-codec.mk       |   6 +-
 package/freescale-imx/imx-gpu-g2d/Config.in        |  25 ++++
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash |   1 +
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   |  37 +++++
 package/freescale-imx/imx-gpu-viv/Config.in        |  16 ---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |   2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   |  36 +----
 package/freescale-imx/imx-kobs/imx-kobs.hash       |   2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk         |   4 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |   2 +-
 package/freescale-imx/imx-lib/imx-lib.mk           |   7 +-
 package/freescale-imx/imx-parser/Config.in         |   2 +-
 package/freescale-imx/imx-parser/imx-parser.hash   |   2 +-
 package/freescale-imx/imx-parser/imx-parser.mk     |   6 +-
 package/freescale-imx/imx-uuc/imx-uuc.hash         |   2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk           |   4 +-
 package/freescale-imx/imx-vpu/imx-vpu.hash         |   2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk           |   2 +-
 .../kernel-module-imx-gpu-viv.hash                 |   2 +-
 .../kernel-module-imx-gpu-viv.mk                   |   2 +-
 package/gstreamer1/gst1-imx/Config.in              |   6 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |   4 +
 ...001-Stop-using-Git-to-write-local-version.patch |  90 ------------
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in |   7 +
 .../xdriver_xf86-video-imx-viv.hash                |   2 +-
 .../xdriver_xf86-video-imx-viv.mk                  |  10 +-
 48 files changed, 554 insertions(+), 256 deletions(-)
 create mode 100644 board/boundarydevices/common/boot.cmd
 create mode 100644 board/boundarydevices/common/upgrade.cmd
 create mode 100644 package/freescale-imx/imx-gpu-g2d/Config.in
 create mode 100644 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
 create mode 100644 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch

-- 
2.15.1
