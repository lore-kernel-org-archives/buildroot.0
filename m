From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sat, 28 Mar 2020 10:34:28 +0530
Subject: [Buildroot] [PATCH v5 0/3] Fix ATF v2.2 build for rk3399,
 add roc-rk3399-pc board
Message-ID: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

This patch set does the following:
Fix ATF v2.2 build for rk3399 SoC's.
Add arm-gnu-a-toolchain package, which acts as a secondary bare metal toolchain
to build ATF for Rockchip rk3399 platform (has a cortex-m0 core). The required
pre-built toolchain is taken from ARM developers site and installed in host filesystem only.
Add config options for building ATF, targets must enable these configs based on their
requirements in board defconfig.
Add new defconfig file for roc-rk3399-pc.
Update DEVELOPERS file.

The patch set is tested on roc-rk3399-pc, a rk3399 based target. Compile tested on orangepi.
---
Changes for v5:
- Dropped patch #1(Disable bin copy for rk3399), as it is no longer needed.
- Based on suggestions from thomas pettazzoni and Sergey, instead of encoding
  platform-specific stuff in config files, introduced new config options which
  need to be enabled in board defconfig as per requirement.
- patch #2(new package) is now patch #1
- patch #3(add support for rockchip rk3399), title and description is changed and
  is now patch #2
- patch #4(new defconfig) is now patch #3

Changes for v4:
- As per suggestions from Heiko Thiery and Thomas Pettazoni, changed DEVELOPERS file accordingly.
- Updated Developers file accordingly whenever a new package(patch #2) or target is added(patch #4).
- dropped patch #5, as it is no longer needed.
- Its a four patch series like earlier v2 and v1.

Changes for v3:
Added one patch to this series. Split one changeset from patch #4 and made
it patch #5
patch #1 (Disable bin copy for rk3399)
- Based on suggestions from sergey and thomas, instead of encoding
platform-specific stuff in config files, made changes in .mk files
based on the build flow.
patch #2 (new package)
- no change
patch #3 (add support for rockchip rk3399)
- no change
patch #4 (new defconfig)
- dropped DEVELOPERS file
patch #5 (Add me as a co-maintainer)
- seperated this changeset

Changes for v2:
Changed cover letter description to add more meaning.
patch #1 (Disable bin copy for rk3399)
- Added Cc tag
patch #2 (new package)
- More Description added to justify why a secondary bare metal toolchain is required 
patch #3 (add support for rockchip rk3399)
- no change
patch #4 (new defconfig)
- updated readme.txt to help with the build/boot process 
- modified file permissions of post-build.sh to 'x'

Suniel Mahesh (3):
  package/arm-gnu-a-toolchain: new package
  boot/arm-trusted-firmware: add optional host-arm-gnu-a-toolchain
    dependency
  configs/roc-rk3399-pc: new defconfig

 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  5 ++
 board/firefly/roc-rk3399-pc/extlinux.conf          |  4 ++
 board/firefly/roc-rk3399-pc/genimage.cfg           | 22 +++++++++
 board/firefly/roc-rk3399-pc/post-build.sh          |  5 ++
 board/firefly/roc-rk3399-pc/readme.txt             | 48 +++++++++++++++++++
 boot/arm-trusted-firmware/Config.in                |  6 +++
 configs/roc_pc_rk3399_defconfig                    | 56 ++++++++++++++++++++++
 package/Config.in.host                             |  1 +
 package/arm-gnu-a-toolchain/Config.in.host         |  9 ++++
 .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  2 +
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 27 +++++++++++
 12 files changed, 186 insertions(+)
 create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
 create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
 create mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
 create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
 create mode 100644 configs/roc_pc_rk3399_defconfig
 create mode 100644 package/arm-gnu-a-toolchain/Config.in.host
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk

-- 
2.7.4
