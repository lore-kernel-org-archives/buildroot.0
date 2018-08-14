From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:13:29 +0200
Subject: [Buildroot] [PATCH 0/8] various improvements to package/mender
Message-ID: <20180814231337.19114-1-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series brings some improvements to the Mender package. So
far the Mender client binary was compiled properly but it was lacking some
configuration files to function properly, which this series hope to adress.

This also includes an update to the package legal-info.

The Mender client is only part one part of integrating Mender and the other
parts (in short) are (generic & board specific):

Generic:
- eMMC disk image with correct partition layout (A & B rootfs + data part)
    - But this is board specific in Buildroot?
- Mender artifact images (mender-artifact host tool)

Board specific:
- U-boot patches
    - bootcmd, altbootcmd, BOOTCOUNT_LIMIT, BOOTCOUNT_ENV
    - persistante storage of ENV
    - redundant ENV
- fw_printenv/fw_setenv configuration file

But above are not covered in this series and will be handled seperatily.

This series has been tested on a custom ATSAMA5D27 based board.

Mirza Krak (8):
  package/mender: update legal info
  package/mender: update install of config files
  package/mender: add dep on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
  package/mender: add BR2_PACKAGE_MENDER_ARTIFACT_NAME option
  package/mender: add BR2_PACKAGE_MENDER_DEVICE_TYPE option
  package/mender: populate the mender.conf template
  package/mender: select BR2_PACKAGE_CA_CERTIFICATES
  package/mender: set version in go linker

 package/mender/Config.in                 | 95 ++++++++++++++++++++++++
 package/mender/mender-device-identity    | 52 -------------
 package/mender/mender-inventory-hostinfo | 21 ------
 package/mender/mender-inventory-network  | 47 ------------
 package/mender/mender.conf               | 14 ++--
 package/mender/mender.hash               |  4 +
 package/mender/mender.mk                 | 52 ++++++++++---
 package/mender/mender.service            |  1 -
 package/mender/tenant.conf               |  0
 9 files changed, 146 insertions(+), 140 deletions(-)
 delete mode 100644 package/mender/mender-device-identity
 delete mode 100644 package/mender/mender-inventory-hostinfo
 delete mode 100644 package/mender/mender-inventory-network
 delete mode 100644 package/mender/tenant.conf

--
2.18.0
