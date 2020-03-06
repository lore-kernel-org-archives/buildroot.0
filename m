From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:33 +0100
Subject: [Buildroot] [PATCH 0/7] Rockchip Mali Bifrost GPU support
Message-ID: <20200306071440.30433-1-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As part of a wider work targeting a Rockchip SoC, here is an
attempt to ease the use of Mali Bifrost GPUs (at least on Rockchip
platforms) by providing the necessary packages to build and install
the necessary userspace and kernel components.

This series first renames the existing Mali-related packages targeting
Allwinner SoCs to clarify what they provide, then brings support for
Rockchip userspace (closed-source) libraries and (open-source) driver,
and finally updates the Qt5 make file to support this hardware.

Hope this will be useful!

Cheers,
Miqu?l

Maxime Chevallier (2):
  package/rockchip-mali-bifrost: new package with binary blobs
  package/qt5: allows using rockchip-mali-bifrost as OpenGL/KMS provider

Miquel Raynal (4):
  package/sunxi-mali-utgard: rename from sunxi-mali-mainline
  package/sunxi-mali-utgard-driver: rename from
    sunxi-mali-mainline-driver
  package/mali-bifrost-driver: new package
  package/qt5: generalize the condition on which EGLFS KMS gets
    supported

Thomas Petazzoni (1):
  package/qt5: make it possible to use rockchip-mali-bifrost as GBM
    provider

 Config.in.legacy                              |  30 ++++
 DEVELOPERS                                    |   4 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |   4 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |   4 +-
 docs/manual/adding-packages-virtual.txt       |   2 +-
 linux/linux.mk                                |   2 +-
 package/Config.in                             |   6 +-
 package/glslsandbox-player/Config.in          |   4 +-
 .../glslsandbox-player/glslsandbox-player.mk  |   2 +-
 package/mali-bifrost-driver/Config.in         |  17 ++
 .../mali-bifrost-driver.hash                  |   3 +
 .../mali-bifrost-driver.mk                    |  15 ++
 package/qt5/qt5base/qt5base.mk                |  10 +-
 ...4-binaries-and-only-install-the-bifr.patch | 169 ++++++++++++++++++
 package/rockchip-mali-bifrost/Config.in       |  20 +++
 .../rockchip-mali-bifrost.hash                |   2 +
 .../rockchip-mali-bifrost.mk                  |  85 +++++++++
 package/sunxi-mali-mainline-driver/Config.in  |  25 ---
 .../sunxi-mali-mainline-driver.mk             |  35 ----
 package/sunxi-mali-mainline/Config.in         |  42 -----
 .../sunxi-mali-mainline.mk                    |  49 -----
 package/sunxi-mali-utgard-driver/Config.in    |  25 +++
 .../sunxi-mali-utgard-driver.hash}            |   2 +-
 .../sunxi-mali-utgard-driver.mk               |  35 ++++
 package/sunxi-mali-utgard/Config.in           |  43 +++++
 .../egl.pc                                    |   0
 .../glesv2.pc                                 |   0
 .../sunxi-mali-utgard.hash}                   |   2 +-
 .../sunxi-mali-utgard/sunxi-mali-utgard.mk    |  49 +++++
 29 files changed, 518 insertions(+), 168 deletions(-)
 create mode 100644 package/mali-bifrost-driver/Config.in
 create mode 100644 package/mali-bifrost-driver/mali-bifrost-driver.hash
 create mode 100644 package/mali-bifrost-driver/mali-bifrost-driver.mk
 create mode 100644 package/rockchip-mali-bifrost/0001-cmake-Use-AArch64-binaries-and-only-install-the-bifr.patch
 create mode 100644 package/rockchip-mali-bifrost/Config.in
 create mode 100644 package/rockchip-mali-bifrost/rockchip-mali-bifrost.hash
 create mode 100644 package/rockchip-mali-bifrost/rockchip-mali-bifrost.mk
 delete mode 100644 package/sunxi-mali-mainline-driver/Config.in
 delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
 delete mode 100644 package/sunxi-mali-mainline/Config.in
 delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
 create mode 100644 package/sunxi-mali-utgard-driver/Config.in
 rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
 create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
 create mode 100644 package/sunxi-mali-utgard/Config.in
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
 rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
 create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk

-- 
2.20.1
