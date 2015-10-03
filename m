From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:10 +0100
Subject: [Buildroot] [PATCH 0/7] configs: fix build of many defconfigs
Message-ID: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches fix the build of many defconfigs that currently do
not build properly:

 * gnublin_defconfig: does not build because needs gitorious.org
   sources, so this defconfig is removed.

 * zedboard_defconfig, olimex_a20_olinuxino_lime_defconfig: don't
   build because a host DTC compiler is needed by U-Boot. So a patch
   is added to allow to build DTC for the host, and then a patch for
   U-Boot to make it optionally depend on host-dtc.

 * calao_usb_a9g20_lpw_defconfig and calao_qil_a9260_defconfig: don't
   build due to a change in the logic of how patches are applied. To
   fix this, patches are moved around and BR2_GLOBAL_PATCH_DIR is
   used.

 * at91rm9200df_defconfig: refers to a 2.6.38 kernel with a huge
   non-mainline patch, while I know the board is much better supported
   in mainline now. Defconfig removed.

 * at91sam9260dfc_defconfig, at91sam9261ek_defconfig,
   at91sam9263ek_defconfig: refer to non-existing kernel defconfigs,
   so they don't build. Defconfigs removed.

Best regards,

Thomas

Peter Seiderer (1):
  dtc: add host build

Thomas Petazzoni (6):
  configs: remove gnublin_defconfig
  u-boot: add an option to indicate that DTC is needed
  configs: fix configurations that need host-dtc
  configs: fix build of calao_usb_a9g20_lpw_defconfig
  configs: fix build of calao_qil_a9260_defconfig
  configs: remove old/broken Atmel configurations

 .../at91bootstrap/0001-qil-a9260.patch}            |  0
 .../barebox/0001-qil-a9260.patch}                  |  0
 .../linux/0001-qil-a9260.patch}                    |  0
 .../at91bootstrap/0001-usb-a9g20-lpw.patch}        |  0
 .../barebox/0001-usb-a9g20-lpw.patch}              |  0
 boot/uboot/Config.in                               |  7 +++++
 boot/uboot/uboot.mk                                |  4 +++
 configs/at91rm9200df_defconfig                     | 30 ----------------------
 configs/at91sam9260dfc_defconfig                   | 19 --------------
 configs/at91sam9261ek_defconfig                    | 19 --------------
 configs/at91sam9263ek_defconfig                    | 19 --------------
 configs/calao_qil_a9260_defconfig                  |  6 ++---
 configs/calao_usb_a9g20_lpw_defconfig              |  3 +--
 configs/gnublin_defconfig                          | 28 --------------------
 configs/olimex_a20_olinuxino_lime_defconfig        |  1 +
 configs/zedboard_defconfig                         |  1 +
 linux/linux.mk                                     | 10 --------
 package/Config.in.host                             |  1 +
 package/dtc/Config.in.host                         |  9 +++++++
 package/dtc/dtc.mk                                 | 10 ++++++++
 20 files changed, 37 insertions(+), 130 deletions(-)
 rename board/calao/qil-a9260/{at91bootstrap-1.16-qil-a9260.patch => patches/at91bootstrap/0001-qil-a9260.patch} (100%)
 rename board/calao/qil-a9260/{barebox-2012.07.0-qil-a9260.patch => patches/barebox/0001-qil-a9260.patch} (100%)
 rename board/calao/qil-a9260/{linux-3.4.7.patch => patches/linux/0001-qil-a9260.patch} (100%)
 rename board/calao/usb-a9g20-lpw/{at91bootstrap-1.16-usb-a9g20-lpw.patch => patches/at91bootstrap/0001-usb-a9g20-lpw.patch} (100%)
 rename board/calao/usb-a9g20-lpw/{barebox-2012.07.0-usb-a9g20-lpw.patch => patches/barebox/0001-usb-a9g20-lpw.patch} (100%)
 delete mode 100644 configs/at91rm9200df_defconfig
 delete mode 100644 configs/at91sam9260dfc_defconfig
 delete mode 100644 configs/at91sam9261ek_defconfig
 delete mode 100644 configs/at91sam9263ek_defconfig
 delete mode 100644 configs/gnublin_defconfig
 create mode 100644 package/dtc/Config.in.host

-- 
2.6.0
